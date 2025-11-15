extends CanvasLayer
# İstersen: class_name HUD

const LOOT_ALERT_SCENE = preload("res://scenes/ui/LootAlert.tscn")

# --- UI Referansları (YENİ LAYOUT’A GÖRE) ---
@onready var level_label: Label         = $Root/PlayerFrame/Content/InfoAndBars/NameLabel
@onready var health_bar: ProgressBar    = $Root/PlayerFrame/Content/InfoAndBars/HealthBar
@onready var mana_bar: ProgressBar      = $Root/PlayerFrame/Content/InfoAndBars/ManaBar
@onready var xp_bar: ProgressBar        = $Root/PlayerFrame/Content/InfoAndBars/ExpBar
@onready var class_icon: TextureRect    = $Root/PlayerFrame/Content/ClassIcon
@onready var buff_panel: BuffPanel      = $BuffPanel
@onready var target_frame: Panel = null
@onready var inventory_panel: InventoryPanel = $InventoryPanel
@onready var loot_alert_container: VBoxContainer = $LootAlertContainer # <-- YENİ EKLENDİ
@onready var shop_panel = $ShopPanel # ShopPanel'in hud.tscn içindeki yolunu yazın

# --- Dinamik bulunacak düğümler ---
var _skillbar: Node = null        # SkillBar.tscn
var _skill_panel: Control = null  # SkillPanel.tscn
var _player_class_name: String = ""
var _player_name: String = ""
var _current_level: int = 1
# --- YENİ DEĞİŞKEN ---
# Sinyal bağlantısını yönetmek için mevcut hedefi sakla
var current_target_node = null
# --------------------



func _ready() -> void:
    add_to_group("hud")
    
    # _input yerine _unhandled_input kullanacağız
    set_process_unhandled_input(true)

    # TargetFrame’i güvenli şekilde bul
    target_frame = get_node_or_null("Root/TargetFrame")
    if target_frame == null:
        target_frame = get_node_or_null("TargetFrame")

    if target_frame == null:
        push_error("HUD: TargetFrame node'u bulunamadı, path'i kontrol et!")
    else:
        # Başlangıçta hedef çerçevesini gizle (GÜVENLİK)
        target_frame.visible = false

    _ensure_skillbar()
    _ensure_skill_panel()

    if _skill_panel:
        _skill_panel.hide()

    if _skillbar and _skillbar.has_method("clear_all_slots"):
        _skillbar.clear_all_slots()
        
    if inventory_panel:
        inventory_panel.hide()

    if shop_panel:
        shop_panel.hide()


# =====================================================
# BUFF PANEL
# =====================================================
func update_buffs(buff_list: Array) -> void:
    if buff_panel:
        buff_panel.set_buffs(buff_list)

func update_buff_panel(statuses: Dictionary, skill_db: Dictionary, class_id: int) -> void:
    if buff_panel:
        buff_panel.sync_from_statuses(statuses, skill_db, class_id)


# =====================================================
# INPUT – Panelleri aç/kapat
# =====================================================
func _unhandled_input(event: InputEvent) -> void:
    # K → Skill Panel
    if event.is_action_pressed("open_skills"):
        # Dükkan açıksa, beceri panelini açma
        if is_instance_valid(shop_panel) and shop_panel.visible:
            return

        _ensure_skill_panel()
        if _skill_panel == null:
            push_error("SkillPanel bulunamadı. HUD altında Root/SkillPanel'i instance ettiğinden emin ol.")
            return

        if _skill_panel.visible:
            _skill_panel.hide()
        else:
            var cname := _get_player_class()
            if cname != "" and _skill_panel.has_method("refresh_for_class"):
                _skill_panel.refresh_for_class(cname)

            _skill_panel.show()
            _center_panel(_skill_panel)
            
        get_viewport().set_input_as_handled()


    # I → Envanter
    if event.is_action_pressed("open_inventory"):
        
        # Dükkan açıksa, "I" tuşu her şeyi kapatır
        if is_instance_valid(shop_panel) and shop_panel.visible:
            close_shop() # Bu zaten envanteri de kapatır
        else:
            # Dükkan kapalıysa, envanteri normal aç/kapat
            if inventory_panel:
                inventory_panel.visible = not inventory_panel.visible
                if inventory_panel.visible:
                    # Normal açılışta dükkan modunun KAPALI olduğundan emin ol
                    inventory_panel.set_shop_mode(false)
                    _center_panel(inventory_panel) # Paneli ortala
        
        get_viewport().set_input_as_handled()


# =====================================================
# SkillBar sinyali
# =====================================================
func _on_skill_bar_skill_input(skill, slot_index):
    if skill:
        print("Skill kullanıldı:", skill.display_name, "slot:", slot_index)

    var player = get_tree().get_first_node_in_group("player")
    if player and player.has_method("on_skill_input"):
        player.on_skill_input(skill, slot_index)

    if _skillbar and skill and "cooldown" in skill:
        _skillbar.start_cooldown(slot_index, skill.cooldown)


# =====================================================
# Yardımcılar – Class Icon / Header
# =====================================================
func _update_class_icon() -> void:
    if class_icon == null:
        return
    if _player_class_name == "":
        class_icon.texture = null
        return

    var file_name = _player_class_name.to_lower()
    var path = "res://assets/sprites/classes/%s.png" % file_name

    if ResourceLoader.exists(path):
        class_icon.texture = load(path)
    else:
        push_warning("Class icon not found: %s" % path)
        class_icon.texture = null


func _update_player_header() -> void:
    if level_label == null:
        return

    var name_text := ""
    if _player_name != "":
        name_text = _player_name
    elif _player_class_name != "":
        name_text = _player_class_name

    if name_text == "":
        level_label.text = str(_current_level)
    else:
        level_label.text = "Lv. %d - %s" % [_current_level, name_text]


func _ensure_skillbar() -> void:
    if _skillbar and is_instance_valid(_skillbar):
        return

    _skillbar = get_node_or_null("Root/SkillBar")
    if _skillbar == null:
        _skillbar = get_node_or_null("Root/PanelContainer/SkillBar")
    if _skillbar == null:
        _skillbar = get_tree().get_first_node_in_group("skillbar")

    if _skillbar and not _skillbar.is_connected("skill_input", Callable(self, "_on_skill_bar_skill_input")):
        _skillbar.connect("skill_input", Callable(self, "_on_skill_bar_skill_input"))


func _ensure_skill_panel() -> void:
    if _skill_panel and is_instance_valid(_skill_panel):
        return

    _skill_panel = get_node_or_null("Root/SkillPanel")
    if _skill_panel == null:
        _skill_panel = get_tree().get_first_node_in_group("skill_panel")


func _center_panel(p: Control) -> void:
    var vp_size: Vector2 = get_viewport().get_visible_rect().size
    var p_size = p.size
    
    # Eğer panelin boyutu yoksa (ilk açılışta olabilir), minimum boyutunu kullan
    if p_size == Vector2.ZERO:
        p_size = p.custom_minimum_size
    
    # Eğer hala boyutu yoksa, hata ver
    if p_size == Vector2.ZERO:
         push_warning("Panel '%s' boyutu sıfır, ortalanamıyor." % p.name)
         p.position = vp_size * 0.25 # Ekranda kalsın diye
         return
         
    p.position = (vp_size - p_size) * 0.5


# =====================================================
# Dışarıdan çağrılan setter’lar
# =====================================================
func set_player_class_name(name: String) -> void:
    _player_class_name = name
    _update_player_header()
    _update_class_icon()


func set_player_name(name: String) -> void:
    _player_name = name
    _update_player_header()


# World.gd bunu çağırıyor:
func set_character_name(name: String) -> void:
    set_player_name(name)


func update_level(level: int) -> void:
    _current_level = level
    _update_player_header()


# Aktif oyuncunun sınıfını güvenli şekilde bulur
func _get_player_class() -> String:
    if _player_class_name != "":
        return _player_class_name

    var p = get_tree().get_first_node_in_group("player")
    if p == null:
        return ""

    if p.has_method("get_class_name"):
        return str(p.call("get_class_name"))

    if "class_name" in p:
        return str(p.get("class_name"))

    if "class" in p:
        return str(p.get("class"))

    if "current_class" in p:
        return str(p.get("current_class"))

    if "selected_class" in p:
        return str(p.get("selected_class"))

    if "class_id" in p:
        var id_to_name = {
            0: "Druid",
            1: "Berserker",
            2: "Elementalist",
            3: "Monk",
            4: "Crusader",
            5: "Warden",
            6: "Dragon_Knight",
            7: "Warlock",
            8: "Cleric",
            9: "Bard",
            10: "Necromancer",
            11: "Ranger"
        }
        var cid = int(p.get("class_id"))
        if id_to_name.has(cid):
            return id_to_name[cid]

    return ""


# =====================================================
# HUD güncelleme fonksiyonları
# =====================================================
func update_health(current_hp: float, max_hp: float) -> void:
    if health_bar:
        health_bar.max_value = max_hp
        health_bar.value = current_hp


func update_mana(current_mp: float, max_mp: float) -> void:
    if mana_bar:
        mana_bar.max_value = max_mp
        mana_bar.value = current_mp


func update_experience(current_xp: float, next_level_xp: float) -> void:
    if xp_bar:
        xp_bar.max_value = next_level_xp
        xp_bar.value = current_xp


func update_xp(current_xp: float, next_level_xp: float) -> void:
    update_experience(current_xp, next_level_xp)


# =====================================================
# TargetFrame helper’ları (manuel çağrı için)
# =====================================================
func set_target(name: String, level: int, current_hp: float, max_hp: float) -> void:
    if target_frame:
        if target_frame.has_method("set_target"):
            target_frame.set_target(name, level, current_hp, max_hp)
        else:
            print("HUD HATA: target_frame'de 'set_target' metodu bulunamadı.")


func update_target_hp(current_hp: float, max_hp: float) -> void:
    if target_frame:
        if target_frame.has_method("update_hp"):
            target_frame.update_hp(current_hp, max_hp)
        elif target_frame.has_method("update_health"):
            target_frame.update_health(current_hp, max_hp)
        else:
            print("HUD HATA: target_frame'de 'update_hp' veya 'update_health' metodu bulunamadı.")


func clear_target() -> void:
    if target_frame:
        if target_frame.has_method("clear_target"):
            target_frame.clear_target()
        else:
            print("HUD HATA: target_frame'de 'clear_target' metodu bulunamadı.")


# =====================================================
# TargetFrame – düşman Node’dan doldurma (GÜNCELLENDİ)
# =====================================================

# world.gd veya player tarafından çağrılır
func set_target_from_node(target: Node) -> void:
    if target_frame == null:
        push_error("HUD: TargetFrame referansı yok, set_target_from_node çalışamıyor.")
        return

    # --- 1. ESKİ HEDEFİN BAĞLANTISINI KES ---
    if is_instance_valid(current_target_node) and current_target_node.has_signal("health_updated"):
        if current_target_node.health_updated.is_connected(self.update_target_hp):
            current_target_node.health_updated.disconnect(self.update_target_hp)

    # --- 2. YENİ HEDEFİ ATA ---
    current_target_node = target

    # --- 3. YENİ HEDEFİ İŞLE ---
    if is_instance_valid(current_target_node):
        
        var name: String = ""
        if "enemy_name" in current_target_node:
            name = str(current_target_node.get("enemy_name"))
        else:
            name = current_target_node.name

        var level: int = 1
        if "level" in current_target_node:
            level = int(current_target_node.get("level"))

        var current_hp: float = 0.0
        var max_hp: float = 1.0
        if "current_health" in current_target_node:
            current_hp = float(current_target_node.get("current_health"))
            if "max_health" in current_target_node:
                max_hp = float(current_target_node.get("max_health"))
            elif "computed_max_health" in current_target_node:
                max_hp = float(current_target_node.get("computed_max_health"))
        
        set_target(name, level, current_hp, max_hp)

        # --- 3b. YENİ SİNYAL BAĞLANTISI ---
        if current_target_node.has_signal("health_updated"):
            current_target_node.health_updated.connect(self.update_target_hp)
        else:
            print("HUD HATA: Hedef (", current_target_node.name, ") 'health_updated' sinyaline sahip değil.")

        target_frame.visible = true
        
    else:
        # --- 4. HEDEF NULL (BOŞ) İSE ---
        clear_target() # Helper fonksiyonunu kullan
        target_frame.visible = false


# =====================================================
#  YENİ EKLENDİ: LOOT BİLDİRİM SİSTEMİ
# =====================================================

# Sadece metin tabanlı bir uyarı gösterir (örn: "Eşya Satıldı")
func show_loot_alert_text(message: String):
    if not is_instance_valid(loot_alert_container):
        print("HATA: HUD, LootAlertContainer'ı bulamadı!")
        return
        
    var alert = LOOT_ALERT_SCENE.instantiate()
    loot_alert_container.add_child(alert)
    # LootAlert.gd'de bu fonksiyonu oluşturduğunu varsayıyoruz
    if alert.has_method("show_alert_text"):
        alert.show_alert_text(message) 
    else:
        # Yedek olarak, normal fonksiyonu metinle çağır
        alert.show_alert({"name": message})


# Eşya verisine göre bir uyarı gösterir
func show_loot_alert(item_data: Dictionary):
    if not is_instance_valid(loot_alert_container):
        print("HATA: HUD, LootAlertContainer'ı bulamadı!")
        return
        
    var alert = LOOT_ALERT_SCENE.instantiate()
    loot_alert_container.add_child(alert)
    alert.show_alert(item_data)


# =====================================================
#  GÜNCELLENMİŞ DÜKKAN FONKSİYONLARI
# =====================================================
func open_shop(item_list: Array):
    if not (is_instance_valid(shop_panel) and is_instance_valid(inventory_panel)):
        return
        
    shop_panel.open_shop(item_list)
    inventory_panel.show()
    inventory_panel.set_shop_mode(true)
    
    # --- YENİ POZİSYONLAMA MANTIĞI ---
    _position_panels_for_shop(true)
    # -------------------------------

func close_shop():
    if is_instance_valid(shop_panel) and shop_panel.visible:
        shop_panel.close_shop()
        
    if is_instance_valid(inventory_panel):
        if inventory_panel.visible:
            inventory_panel.hide()
        # Dükkan kapansa bile envanterin modunu sıfırla
        inventory_panel.set_shop_mode(false)
    
    _position_panels_for_shop(false) # Pozisyonları sıfırla


# Panelleri dükkan modu için (yan yana) veya normal (ortalı) pozisyonlar
func _position_panels_for_shop(is_shopping: bool):
    var vp_size: Vector2 = get_viewport().get_visible_rect().size
    var margin: float = 20.0 # Kenarlardan boşluk
    
    if is_shopping:
        if not (is_instance_valid(inventory_panel) and is_instance_valid(shop_panel)):
            return
            
        var inv_size: Vector2 = inventory_panel.size
        var shop_size: Vector2 = shop_panel.size
        
        # Boyutlar sıfırsa (ilk açılışta olabilir), minimum boyutlarını kullan
        if inv_size == Vector2.ZERO: inv_size = inventory_panel.custom_minimum_size
        if shop_size == Vector2.ZERO: shop_size = shop_panel.custom_minimum_size

        # --- DÜZELTİLMİŞ POZİSYONLAMA ---
        # Panellerin dikeyde ortalanmasını sağla
        var y_inv = (vp_size.y - inv_size.y) / 2.0
        var y_shop = (vp_size.y - shop_size.y) / 2.0
        
        # Envanteri sola yasla
        inventory_panel.position = Vector2(margin, y_inv)
        
        # Dükkanı sağa yasla
        shop_panel.position = Vector2(vp_size.x - shop_size.x - margin, y_shop)
        # --- DÜZELTME SONU ---
        
    else:
        # Dükkan kapandığında panelleri sıfırla (zaten gizliler)
        if is_instance_valid(inventory_panel):
            inventory_panel.position = Vector2.ZERO
        if is_instance_valid(shop_panel):
            shop_panel.position = Vector2.ZERO
