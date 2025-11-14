extends Control
class_name InventoryPanel

const COLUMNS: int = 5
const ROWS: int = 8
const SLOTS_PER_PAGE: int = COLUMNS * ROWS    # 40
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

# Player referansı (stat ve req check için)
var player: Node = null

var current_page: int = 0            # 0 veya 1
var items: Array = []                # 80 elemanlık array (Dictionary veya boş dict)
var slots: Array = []                # 40 InventorySlot referansı

var equip_slots: Array = []          # EquipmentSlot referansları
var equipped: Dictionary = {}        # slot_name -> item Dictionary

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

    _update_page_label()
    _refresh_all_slots()
    _refresh_equip_slots()

    # DEBUG – envanteri doldur (ItemDB yoksa kendi içinde iptal ediyor)
    _debug_fill_inventory()


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


func set_item_at(global_index: int, item: Dictionary) -> void:
    if global_index < 0 or global_index >= items.size():
        return
    items[global_index] = item.duplicate(true)


func clear_item_at(global_index: int) -> void:
    if global_index < 0 or global_index >= items.size():
        return
    items[global_index] = {}


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


func handle_drop(data: Dictionary, local_index: int) -> void:
    if not data.has("from_global_index"):
        return
    var from_index: int = int(data["from_global_index"])
    var to_index: int = get_global_index(local_index)

    if from_index == to_index:
        return

    var from_item: Dictionary = get_item_at(from_index)
    var to_item: Dictionary = get_item_at(to_index)

    set_item_at(from_index, to_item)
    set_item_at(to_index, from_item)

    _refresh_all_slots()
    _notify_player_equipment_changed()


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

func can_item_go_to_slot(item: Dictionary, slot_name: String) -> bool:
    # Önce slot tipini belirle
    var stype := ""

    if item.has("slot_type"):
        stype = str(item["slot_type"]).to_lower()
    elif item.has("id"):
        var id_str := str(item["id"])
        var parts: Array = id_str.split("_")
        if parts.size() >= 2:
            var code := str(parts[1])
            match code:
                "W":
                    stype = "weapon"
                "A":
                    stype = "armor"
                "H":
                    stype = "helmet"
                "P":
                    stype = "pants"
                "G":
                    stype = "gloves"
                "B":
                    stype = "boots"
                "WR":
                    stype = "bracelet"
                "N":
                    stype = "necklace"
                "C":
                    stype = "cloak"
                "BT":
                    stype = "belt"
                _:
                    stype = ""

    if stype == "":
        return false

    # slot_name ile eşleşme
    if slot_name.begins_with("ring"):
        # Artık ring yok dedin ama yine de guard kalsın
        if stype != "ring":
            return false
    else:
        if stype != slot_name:
            return false

    # Player yoksa (örneğin debug) class/level req kontrol etme
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

    # CLASS REQ – ItemDatabase’de "req_class": "BERSERKER" gibi
    if item.has("req_class"):
        var req_class_str: String = str(item["req_class"]).to_upper()
        var player_class_code: String = ""

        # PlayerBase’de class_id varsa
        if "class_id" in player:
            var cid: int = int(player.class_id)
            var id_to_code := {
                0: "DRUID",
                1: "BERSERKER",
                2: "ELEMENTALIST",
                3: "MONK",
                4: "CRUSADER",
                5: "WARDEN",
                6: "DRAGON_KNIGHT",
                7: "WARLOCK",
                8: "CLERIC",
                9: "BARD",
                10: "NECROMANCER",
                11: "RANGER",
            }
            if id_to_code.has(cid):
                player_class_code = id_to_code[cid]

        # Yedek: player.class_name string ise
        if player_class_code == "" and "class_name" in player:
            player_class_code = str(player.class_name).to_upper()

        if player_class_code != "" and req_class_str != "" and player_class_code != req_class_str:
            return false

    return true


# ------------------------------------------------------
#  ENVANTERDEN EQUIPMENT'A GİYME
# ------------------------------------------------------

func equip_from_inventory(from_global_index: int, slot_name: String) -> void:
    var item := get_item_at(from_global_index)
    if item.is_empty():
        return

    # Slot + class + level kontrolü
    if not can_item_go_to_slot(item, slot_name):
        return

    var previous := get_equipped_item(slot_name)

    # Yeni item’ı slot’a koy
    set_equipped_item(slot_name, item)

    # Eski item varsa envantere geri koy; yoksa slotu temizle
    if previous.is_empty():
        clear_item_at(from_global_index)
    else:
        set_item_at(from_global_index, previous)

    _refresh_all_slots()
    _refresh_equip_slots()
    _notify_player_equipment_changed()


# ------------------------------------------------------
#  DEBUG: ENVANTERE RANDOM ITEM BASMA
# ------------------------------------------------------

func _debug_fill_inventory() -> void:
    # Autoload'u root'tan al
    var db := get_tree().root.get_node_or_null("ItemDB")
    if db == null:
        push_warning("InventoryPanel: ItemDB autoload yok (root'ta node bulunamadı), debug fill iptal.")
        return

    if not db.has_method("get_random_item_for_class"):
        push_warning("InventoryPanel: ItemDB.get_random_item_for_class yok, debug fill iptal.")
        return

    # ---- Sınıf & seviye tespiti ----
    var p_class_name := "Druid"
    var p_level := 10

    # PlayerData autoload varsa, seçilen class'ı oradan çek
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
#  YENİ EKLENTİ: DÜNYADAN EŞYA TOPLAMA (LOOT)
# =======================================================

# Bu fonksiyon 'player.gd' tarafından çağrılır.
# Senin mevcut 'add_item_first_free' fonksiyonunu kullanır.
func add_item_to_inventory(item: Dictionary) -> bool:
    if item.is_empty():
        return false
        
    # 'add_item_first_free' fonksiyonu, 'items' (80'lik) dizisinde
    # ilk boş yeri bulur, eşyayı oraya koyar, UI'ı yeniler
    # ve başarılıysa 'true' döner.
    var success: bool = add_item_first_free(item)
    
    if success:
        print("Eşya envantere eklendi: ", item.get("name", "Bilinmeyen Eşya"))
    else:
        print("Envanter dolu, eşya eklenemedi: ", item.get("name", "Bilinmeyen Eşya"))
        
    return success
