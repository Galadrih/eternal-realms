extends Control
class_name InventoryPanel

const COLUMNS: int = 5
const ROWS: int = 8
const SLOTS_PER_PAGE: int = COLUMNS * ROWS     # 40
const TOTAL_SLOTS: int = SLOTS_PER_PAGE * 2  # 80 (2 sayfa)

const SLOT_SCENE := preload("res://scenes/ui/InventorySlot.tscn")
const EQUIP_SLOT_SCENE := preload("res://scenes/ui/EquipmentSlot.tscn")

# ------------------------------------------------------------------
#  REFERANSLAR
# ------------------------------------------------------------------

# Ekipman grid'i
@onready var equip_grid: GridContainer = $PanelBG/MarginContainer/VBoxContainer/EquipmentWindow/MarginContainer/VBoxContainer/EquipGridWrap/EquipGrid

# Envanter grid'i
@onready var grid: GridContainer      = $PanelBG/MarginContainer/VBoxContainer/InventoryWindow/MarginContainer/VBoxContainer/Grid
@onready var page_label: Label        = $PanelBG/MarginContainer/VBoxContainer/InventoryWindow/MarginContainer/VBoxContainer/TopBar/PageLabel
@onready var prev_button: Button      = $PanelBG/MarginContainer/VBoxContainer/InventoryWindow/MarginContainer/VBoxContainer/TopBar/PrevButton
@onready var next_button: Button      = $PanelBG/MarginContainer/VBoxContainer/InventoryWindow/MarginContainer/VBoxContainer/TopBar/NextButton
@onready var gold_label: Label = $PanelBG/MarginContainer/VBoxContainer/InventoryWindow/MarginContainer/VBoxContainer/GoldLabel

# Player referansı (stat ve req check için)
var player: Node = null

var current_page: int = 0            # 0 veya 1
var items: Array = []                # 80 elemanlık array (Dictionary veya boş dict)
var slots: Array = []                # 40 InventorySlot referansı

var equip_slots: Array = []          # EquipmentSlot referansları
var equipped: Dictionary = {}        # slot_name -> item Dictionary

# --- YENİ EKLENTİ: DÜKKAN MODU ---
var is_in_shop_mode: bool = false
var shop_force_sell_mode: bool = false # YENİ
var hud_node = null # Loot alert/mesajları için
# ---------------------------------


# Ekipman slot isimleri (grid sırasına göre)
const EQUIP_SLOT_TYPES: Array[StringName] = [
    &"weapon",    # 0
    &"armor",     # 1
    &"helmet",    # 2
    &"pants",     # 3
    &"gloves",    # 4
    &"boots",     # 5
    &"bracelet", # 6 (Bileklik)
    &"necklace", # 7 (Kolye)
    &"cloak",     # 8 (Pelerin)
    &"belt"       # 9 (Kemer)
]

# ------------------------------------------------------
#  INIT
# ------------------------------------------------------

func _ready() -> void:
    if grid:
        grid.columns = COLUMNS

    # Envanter dizisini hazırla
    items.resize(TOTAL_SLOTS)
    var i: int = 0
    while i < TOTAL_SLOTS:
        items[i] = {}
        i += 1

    _create_slots()
    _create_equip_slots()

    if prev_button:
        prev_button.pressed.connect(_on_prev_page_pressed)
    if next_button:
        next_button.pressed.connect(_on_next_page_pressed)

    # --- YENİ EKLENTİ ---
    # HUD referansını al (LootAlert için)
    hud_node = get_tree().get_first_node_in_group("hud")
    # -------------------

    _update_page_label()
    _refresh_all_slots()
    _refresh_equip_slots()

    # DEBUG – envanteri doldur (ItemDB yoksa kendi içinde iptal ediyor)
    #_debug_fill_inventory() # Test bittiyse bu satırı yorumla


# Player’ı HUD/World’den buraya set edeceğiz
func set_player(p: Node) -> void:
    player = p
    _notify_player_equipment_changed()


# Player’a “equip değişti” diye haber veren yardımcı
func _notify_player_equipment_changed() -> void:
    if player == null:
        return
    if player.has_method("set_equipment_from_inventory"):
        player.set_equipment_from_inventory(equipped)


# ------------------------------------------------------
#  ENVANTER SLOTLARI
# ------------------------------------------------------

func _create_slots() -> void:
    slots.clear()
    if grid == null:
        return

    for child in grid.get_children():
        child.queue_free()

    var i: int = 0
    while i < SLOTS_PER_PAGE:
        var slot: InventorySlot = SLOT_SCENE.instantiate()
        slot.local_index = i
        slot.inventory_panel = self
        
        # Slot'tan gelen sağ tık/sürükleme gibi inputları yakalamak için
        slot.slot_gui_input_event.connect(_on_inventory_slot_gui_input)

        
        grid.add_child(slot)
        slots.append(slot)
        i += 1


func _update_page_label() -> void:
    if page_label == null:
        return
    var human_page: int = current_page + 1
    page_label.text = "Page %d / 2" % human_page


func _refresh_all_slots() -> void:
    var base_index: int = current_page * SLOTS_PER_PAGE

    var i: int = 0
    while i < SLOTS_PER_PAGE and i < slots.size():
        var slot: InventorySlot = slots[i]
        var global_index: int = base_index + i

        var item: Dictionary = {}
        if global_index >= 0 and global_index < items.size():
            var candidate = items[global_index]
            if candidate is Dictionary:
                 item = candidate

        slot.refresh_with_item(item)
        i += 1


func get_global_index(local_index: int) -> int:
    return current_page * SLOTS_PER_PAGE + local_index


func get_item_at(global_index: int) -> Dictionary:
    if global_index < 0 or global_index >= items.size():
        return {}
    var itm = items[global_index]
    if itm is Dictionary:
        return itm
    return {}
    
func get_local_index(global_index: int) -> int:
    # Geçersiz index ise
    if global_index < 0 or global_index >= items.size():
        return -1

    # Bu item HANGİ sayfada?
    var page: int = global_index / SLOTS_PER_PAGE  # 0 ya da 1 çıkar

    # Şu anda açık olan sayfa değilse bu slotu yenilemeye gerek yok
    if page != current_page:
        return -1

    # Sayfa içindeki index (0–39)
    return global_index % SLOTS_PER_PAGE



func set_item_at(global_index: int, item: Dictionary) -> void:
    if global_index < 0 or global_index >= items.size():
        return
    items[global_index] = item.duplicate(true)
    # Blacksmith, loot, drag-drop vs her değişiklikten sonra UI’yi güncelle
    _refresh_all_slots()


func clear_item_at(global_index: int) -> void:
    if global_index < 0 or global_index >= items.size():
        return
    items[global_index] = {}
    # Slot boşaltılınca da UI’yi yenile
    _refresh_all_slots()
    

func _refresh_single_slot(global_index: int) -> void:
    var local_index: int = get_local_index(global_index)
    if local_index == -1:
        # Bu item şu an açık olan sayfada değil, yenilemeye gerek yok
        return

    if local_index < 0 or local_index >= slots.size():
        return

    var slot: InventorySlot = slots[local_index]
    var item: Dictionary = get_item_at(global_index)
    slot.refresh_with_item(item)




func add_item_first_free(item: Dictionary) -> bool:
    var i: int = 0
    while i < items.size():
        var existing = items[i]
        if not (existing is Dictionary) or existing.is_empty():
            items[i] = item.duplicate(true)
            _refresh_all_slots()
            return true
        i += 1
    return false


func _on_prev_page_pressed() -> void:
    current_page -= 1
    if current_page < 0:
        current_page = 0
    _update_page_label()
    _refresh_all_slots()


func _on_next_page_pressed() -> void:
    current_page += 1
    if current_page > 1:
        current_page = 1
    _update_page_label()
    _refresh_all_slots()


# ENVANTER İÇİ SÜRÜKLEME (Inventory -> Inventory)
func handle_drop(data: Dictionary, local_index: int) -> void:
    if not data.has("from_global_index"):
        return
    var from_index: int = int(data["from_global_index"])
    var to_index: int = get_global_index(local_index)

    if from_index == to_index:
        return

    var from_item: Dictionary = get_item_at(from_index)
    var to_item: Dictionary = get_item_at(to_index)

    # İki slotun item'larını değiştir (biri boş olsa bile çalışır)
    set_item_at(from_index, to_item)
    set_item_at(to_index, from_item)

    _refresh_all_slots()


# ------------------------------------------------------
#  EQUIPMENT SLOTLARI
# ------------------------------------------------------

func _create_equip_slots() -> void:
    equip_slots.clear()
    if equip_grid == null:
        return

    for child in equip_grid.get_children():
        child.queue_free()

    var i: int = 0
    while i < EQUIP_SLOT_TYPES.size():
        var slot: EquipmentSlot = EQUIP_SLOT_SCENE.instantiate()
        slot.slot_name = EQUIP_SLOT_TYPES[i]
        slot.inventory_panel = self
        equip_grid.add_child(slot)
        equip_slots.append(slot)
        i += 1


func get_equipped_item(slot_name: String) -> Dictionary:
    if equipped.has(slot_name):
        var itm = equipped[slot_name]
        if itm is Dictionary:
            return itm
    return {}


func set_equipped_item(slot_name: String, item: Dictionary) -> void:
    equipped[slot_name] = item.duplicate(true)
    _refresh_equip_slots()
    _notify_player_equipment_changed()


func clear_equipped_item(slot_name: String) -> void:
    if equipped.has(slot_name):
        equipped.erase(slot_name)
    _refresh_equip_slots()
    _notify_player_equipment_changed()


func _refresh_equip_slots() -> void:
    for slot in equip_slots:
        if slot == null:
            continue
        var name_str := str(slot.slot_name)
        var itm := get_equipped_item(name_str)
        slot.refresh_with_item(itm)


# ------------------------------------------------------
#  ITEM → SLOT UYUMLULUK + CLASS / LEVEL REQ
# ------------------------------------------------------

func _find_slot_type_for_item(item: Dictionary) -> StringName:
    var stype := ""
    if item.is_empty():
        return &""
        
    if item.has("slot_type"): # Gelecek için
        stype = str(item["slot_type"]).to_lower()
    elif item.has("id"):
        var id_str := str(item["id"])
        
        if id_str.begins_with("P_"):
            return &""

        var parts: Array = id_str.split("_")
        if parts.size() >= 2:
            var code := str(parts[1]) # "B_W_1" -> "W"
            match code:
                "W": stype = "weapon"
                "A": stype = "armor"
                "H": stype = "helmet"
                "P": stype = "pants"
                "G": stype = "gloves"
                "WR": stype = "bracelet"
                "N": stype = "necklace"
                "C": stype = "cloak"
                "O": stype = "offhand" 
                _: stype = ""
    
    if EQUIP_SLOT_TYPES.has(stype):
        return StringName(stype)
    
    return &""


func can_item_go_to_slot(item: Dictionary, slot_name: String) -> bool:
    var item_slot_type = _find_slot_type_for_item(item)
    
    if item_slot_type == &"":
        return false
    
    if item_slot_type != StringName(slot_name):
        return false

    if player == null:
        return true

    # LEVEL REQ
    if item.has("req_level"):
        var req_level: int = int(item["req_level"])
        var player_level: int = 1
        if "level" in player:
            player_level = int(player.level)
        if player_level < req_level:
            return false

    # CLASS REQ
    if item.has("req_class"):
        var req_class_str: String = str(item["req_class"]).to_upper()
        
        if req_class_str.is_empty() or req_class_str == "POTIONS":
            return true
            
        var player_class_code: String = ""

        if "class_id" in player:
            var cid: int = int(player.class_id)
            var id_to_code := {
                0: "DRUID", 1: "BERSERKER", 2: "ELEMENTALIST", 3: "MONK", 4: "CRUSADER",
                5: "WARDEN", 6: "DRAGON_KNIGHT", 7: "WARLOCK", 8: "CLERIC", 9: "BARD",
                10: "NECROMANCER", 11: "RANGER",
            }
            if id_to_code.has(cid):
                player_class_code = id_to_code[cid]

        if player_class_code != "" and req_class_str != "" and player_class_code != req_class_str:
            return false

    return true


# ------------------------------------------------------
#  ENVANTERDEN EQUIPMENT'A GİYME (Sürükleyince)
# ------------------------------------------------------

func equip_from_inventory(from_global_index: int, slot_name: String) -> void:
    var item := get_item_at(from_global_index)
    if item.is_empty():
        return

    if not can_item_go_to_slot(item, slot_name):
        return

    var previous := get_equipped_item(slot_name)
    set_equipped_item(slot_name, item)

    if previous.is_empty():
        clear_item_at(from_global_index)
    else:
        set_item_at(from_global_index, previous)

    _refresh_all_slots()


# --- (EKSİK FONKSİYON EKLENDİ) ---
# EKİPMANDAN ENVANTERE BIRAKMA (Equipment -> Inventory)
func handle_equip_drop(data: Dictionary, to_local_index: int) -> void:
    if not data.has("from_slot_name") or not data.has("item"):
        print("Hata: handle_equip_drop yetersiz veri aldı.")
        return
        
    var from_slot_name: String = str(data["from_slot_name"])
    var item_to_unequip: Dictionary = data["item"]
    if item_to_unequip.is_empty():
        return
        
    var to_global_index: int = get_global_index(to_local_index)
    var item_at_drop_location: Dictionary = get_item_at(to_global_index)
    
    # 1. Bırakılan yer boşsa:
    if item_at_drop_location.is_empty():
        clear_equipped_item(from_slot_name)
        set_item_at(to_global_index, item_to_unequip)
        _refresh_all_slots()
        
    # 2. Bırakılan yer doluysa (SWAP denemesi):
    else:
        # Envanterdeki item'ı giymeyi dene
        if can_item_go_to_slot(item_at_drop_location, from_slot_name):
            set_equipped_item(from_slot_name, item_at_drop_location)
            set_item_at(to_global_index, item_to_unequip)
            _refresh_all_slots()
        else:
            # Swap başarısız, hiçbir şey yapma
            if hud_node and hud_node.has_method("show_loot_alert_text"):
                hud_node.show_loot_alert_text("Bu eşyalar değiştirilemez.")
            return
# -----------------------------------------


# ------------------------------------------------------
#  DEBUG: ENVANTERE RANDOM ITEM BASMA
# ------------------------------------------------------

func _debug_fill_inventory() -> void:
    var db := get_tree().root.get_node_or_null("ItemDB")
    if db == null:
        push_warning("InventoryPanel: ItemDB autoload yok, debug fill iptal.")
        return

    if not db.has_method("get_random_item_for_class"):
        push_warning("InventoryPanel: ItemDB.get_random_item_for_class yok, debug fill iptal.")
        return

    var p_class_name := "Druid"
    var p_level := 10

    if typeof(PlayerData) != TYPE_NIL:
        p_class_name = str(PlayerData.character_class_name)

    print("InventoryPanel: DEBUG – random item spawn başlıyor. class=%s, lvl=%d"
        % [p_class_name, p_level])

    for i in range(30):
        var dbg_item: Dictionary = db.get_random_item_for_class(p_class_name, p_level)
        if not dbg_item.is_empty():
            add_item_first_free(dbg_item)

    _refresh_all_slots()
    print("InventoryPanel: DEBUG – random item spawn bitti.")


# =======================================================
#  YENİ FONKSİYONLAR (EKONOMİ & SAĞ TIK)
# =======================================================

func _on_inventory_slot_gui_input(event: InputEvent, local_index: int) -> void:
    # Sadece sağ tıka cevap ver (sol tık sürükleme/drag için)
    if not (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed):
        return

    get_viewport().set_input_as_handled()
    
    var global_index: int = get_global_index(local_index)
    var item_data: Dictionary = get_item_at(global_index)
    if item_data.is_empty():
        return

    # -------------------------------------------------
    # 1) SHOP FORCE MODE: Shop açıkken HER ZAMAN SAT
    # -------------------------------------------------
    if shop_force_sell_mode:
        sell_item_in_slot(global_index)
        return

    # -------------------------------------------------
    # 2) POTION mı?
    # -------------------------------------------------
    var is_potion := false

    var req_class_val := str(item_data.get("req_class", "")).to_upper()
    var id_str := str(item_data.get("id", ""))

    if req_class_val == "POTIONS":
        is_potion = true
    elif id_str.begins_with("P_"):
        is_potion = true

    if is_potion:
        if _try_use_potion(global_index, item_data):
            return

    # -------------------------------------------------
    # 3) Geri kalanı: auto-equip
    # -------------------------------------------------
    _try_auto_equip_item(global_index)




func _try_auto_equip_item(global_index: int):
    var item_to_equip = get_item_at(global_index)
    if item_to_equip.is_empty():
        return
        
    var target_slot_name: StringName = _find_slot_type_for_item(item_to_equip)
    
    if target_slot_name == &"":
        if hud_node and hud_node.has_method("show_loot_alert_text"):
            hud_node.show_loot_alert_text("Bu eşya giyilemez.")
        return
        
    if not can_item_go_to_slot(item_to_equip, target_slot_name):
        if hud_node and hud_node.has_method("show_loot_alert_text"):
            hud_node.show_loot_alert_text("Gereksinimler karşılanmıyor.")
        return

    var currently_equipped_item: Dictionary = get_equipped_item(target_slot_name)
    set_equipped_item(target_slot_name, item_to_equip)
    set_item_at(global_index, currently_equipped_item)
    _refresh_all_slots()


func unequip_slot_to_inventory(slot_name: String) -> void:
    # 1) Önce o slottaki itemı al
    var item: Dictionary = get_equipped_item(slot_name)
    if item.is_empty():
        return

    # 2) Envantere eklemeyi dene
    var added: bool = add_item_first_free(item)
    if not added:
        if hud_node and hud_node.has_method("show_loot_alert_text"):
            hud_node.show_loot_alert_text("Envanter dolu, eşya çıkarılamıyor.")
        return

    # 3) Ekipmandan temizle
    clear_equipped_item(slot_name)

    # 4) Envanter slotlarını da tazele (görsel taraf)
    _refresh_all_slots()

# --- DÜKKAN MODU (Satma) ---

func set_shop_mode(is_shopping: bool) -> void:
    is_in_shop_mode = is_shopping
    print("DEBUG (InventoryPanel): set_shop_mode -> ", is_shopping)
    
func set_shop_sell_mode(enabled: bool) -> void:
    shop_force_sell_mode = enabled
    # debug istersen:
    # print("DEBUG (InventoryPanel): shop_force_sell_mode -> ", enabled)



func sell_item_in_slot(global_index: int):
    if player == null:
        player = get_tree().get_first_node_in_group("player_character")
        if player == null: return
        
    var item_data: Dictionary = get_item_at(global_index)
    if item_data.is_empty():
        return
        
    var base_price: int = ItemDB.get_item_price(item_data)
    var sell_price: int = max(1, int(base_price * 0.25))
    
    player.add_gold(sell_price)
    
    clear_item_at(global_index)
    _refresh_all_slots()
    
    if hud_node and hud_node.has_method("show_loot_alert_text"):
        var alert_text = "%s satıldı! (+%d Altın)" % [item_data.get("name", "Eşya"), sell_price]
        hud_node.show_loot_alert_text(alert_text)


# =======================================================
#  MEVCUT FONKSİYONLARINIZ (Loot & Altın)
# =======================================================

func add_item_to_inventory(item: Dictionary) -> bool:
    if item.is_empty():
        return false
        
    var success: bool = add_item_first_free(item)
    
    if not success:
        print("Envanter dolu, eşya eklenemedi: ", item.get("name", "Bilinmeyen Eşya"))
        if hud_node and hud_node.has_method("show_loot_alert_text"):
            hud_node.show_loot_alert_text("Envanter Dolu!")
            
    return success
    
func update_gold_display(new_amount: int):
    if is_instance_valid(gold_label):
        gold_label.text = "Altın: %d" % new_amount
        
func _try_use_potion(global_index: int, item_data: Dictionary) -> bool:
    if item_data.is_empty():
        return false

    if player == null:
        player = get_tree().get_first_node_in_group("player_character")
        if player == null:
            return false

    # DEBUG:
    # print("DEBUG _try_use_potion:", item_data.get("name", "İksir"))

    if player.has_method("use_potion_item"):
        var result: bool = player.use_potion_item(item_data)

        # DEBUG:
        # print("DEBUG use_potion_item result:", result)

        if result:
            # Başarılıysa envanterden 1 adet eksilt
            var amount: int = int(item_data.get("amount", 1))
            amount -= 1

            if amount > 0:
                item_data["amount"] = amount
                set_item_at(global_index, item_data)
            else:
                clear_item_at(global_index)

            _refresh_all_slots()

            if hud_node and hud_node.has_method("show_loot_alert_text"):
                var name = item_data.get("name", "İksir")
                hud_node.show_loot_alert_text("%s kullanıldı." % name)

            return true

    return false
    
    
    
