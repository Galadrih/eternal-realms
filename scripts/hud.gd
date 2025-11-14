extends CanvasLayer
# İstersen: class_name HUD

const LOOT_ALERT_SCENE = preload("res://scenes/ui/LootAlert.tscn")

# --- UI Referansları (YENİ LAYOUT’A GÖRE) ---
@onready var level_label: Label        = $Root/PlayerFrame/Content/InfoAndBars/NameLabel
@onready var health_bar: ProgressBar   = $Root/PlayerFrame/Content/InfoAndBars/HealthBar
@onready var mana_bar: ProgressBar     = $Root/PlayerFrame/Content/InfoAndBars/ManaBar
@onready var xp_bar: ProgressBar       = $Root/PlayerFrame/Content/InfoAndBars/ExpBar
@onready var class_icon: TextureRect   = $Root/PlayerFrame/Content/ClassIcon
@onready var buff_panel: BuffPanel     = $BuffPanel
@onready var target_frame: Panel = null
@onready var inventory_panel: InventoryPanel = $InventoryPanel
@onready var loot_alert_container: VBoxContainer = $LootAlertContainer # <-- YENİ EKLENDİ

# --- Dinamik bulunacak düğümler ---
var _skillbar: Node = null          # SkillBar.tscn
var _skill_panel: Control = null    # SkillPanel.tscn
var _player_class_name: String = ""
var _player_name: String = ""
var _current_level: int = 1
# --- YENİ DEĞİŞKEN ---
# Sinyal bağlantısını yönetmek için mevcut hedefi sakla
var current_target_node = null
# --------------------



func _ready() -> void:
    add_to_group("hud")
    set_process_input(true)

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
        _center_panel(inventory_panel)





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
# INPUT – SkillPanel aç/kapat (K)
# =====================================================
func _input(event: InputEvent) -> void:
    # K → Skill Panel
    if event.is_action_pressed("open_skills"):
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

     # I → Envanter
    if event.is_action_pressed("open_inventory"):
        if inventory_panel:
            inventory_panel.visible = not inventory_panel.visible
            if inventory_panel.visible:
                _center_panel(inventory_panel)



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
    var vp: Vector2 = get_viewport().get_visible_rect().size
    if p.custom_minimum_size == Vector2.ZERO:
        p.custom_minimum_size = Vector2(620, 440)
    p.size = p.custom_minimum_size
    p.position = (vp - p.size) * 0.5


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
            # DİKKAT: Senin kodunda 11 (Ranger) eksikti, ekledim.
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
        # target_frame.gd'nin 'set_target' fonksiyonunu çağırdığını varsayıyoruz
        if target_frame.has_method("set_target"):
            target_frame.set_target(name, level, current_hp, max_hp)
        else:
            print("HUD HATA: target_frame'de 'set_target' metodu bulunamadı.")


func update_target_hp(current_hp: float, max_hp: float) -> void:
    if target_frame:
        # target_frame.gd'nin 'update_hp' fonksiyonunu çağırdığını varsayıyoruz
        if target_frame.has_method("update_hp"):
            target_frame.update_hp(current_hp, max_hp)
        # VEYA target_frame'de 'update_health' varsa onu kullan
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
    # print("HUD: set_target_from_node çağrıldı, target =", target) # (Çok fazla log üretebilir, kapattım)

    if target_frame == null:
        push_error("HUD: TargetFrame referansı yok, set_target_from_node çalışamıyor.")
        return

    # --- 1. ESKİ HEDEFİN BAĞLANTISINI KES ---
    # 'current_target_node' geçerliyse (null değilse ve silinmemişse)
    # VE 'health_updated' sinyali varsa
    if is_instance_valid(current_target_node) and current_target_node.has_signal("health_updated"):
        # 'update_target_hp' fonksiyonumuza bağlı mı diye kontrol et
        if current_target_node.health_updated.is_connected(self.update_target_hp):
            current_target_node.health_updated.disconnect(self.update_target_hp)
            # print("HUD: Eski hedefin (", current_target_node.name, ") bağlantısı kesildi.")

    # --- 2. YENİ HEDEFİ ATA ---
    current_target_node = target

    # --- 3. YENİ HEDEFİ İŞLE ---
    if is_instance_valid(current_target_node):
        
        # ---- İSİM ----
        var name: String = ""
        if "enemy_name" in current_target_node:
            name = str(current_target_node.get("enemy_name"))
        elif "display_name" in current_target_node:
            name = str(current_target_node.get("display_name"))
        else:
            name = current_target_node.name

        # ---- LEVEL ----
        var level: int = 1
        if "level" in current_target_node:
            level = int(current_target_node.get("level"))
        elif "lvl" in current_target_node:
            level = int(current_target_node.get("lvl"))

        # ---- HP / MAX HP ----
        var current_hp: float = 0.0
        var max_hp: float = 1.0

        if "current_health" in current_target_node:
            current_hp = float(current_target_node.get("current_health"))
            if "max_health" in current_target_node: # enemy.gd'deki @export
                max_hp = float(current_target_node.get("max_health"))
            elif "computed_max_health" in current_target_node: # player.gd'deki gibi
                max_hp = float(current_target_node.get("computed_max_health"))
        elif "hp" in current_target_node:
            current_hp = float(current_target_node.get("hp"))
            if "max_hp" in current_target_node:
                max_hp = float(current_target_node.get("max_hp"))
        
        # 'set_target' helper fonksiyonunu kullanarak bilgileri BİR KEZ ayarla
        set_target(name, level, current_hp, max_hp)

        # --- 3b. YENİ SİNYAL BAĞLANTISI ---
        if current_target_node.has_signal("health_updated"):
            # Düşmanın sinyalini, bu script'teki 'update_target_hp' fonksiyonuna bağla
            current_target_node.health_updated.connect(self.update_target_hp)
            # print("HUD: Yeni hedefe (", current_target_node.name, ") 'update_target_hp' sinyaline bağlanıldı.")
        else:
            print("HUD HATA: Hedef (", current_target_node.name, ") 'health_updated' sinyaline sahip değil.")

        target_frame.visible = true
    
    else:
        # --- 4. HEDEF NULL (BOŞ) İSE ---
        # print("HUD: target null, TargetFrame temizleniyor.")
        clear_target() # Helper fonksiyonunu kullan
        target_frame.visible = false


# =====================================================
#  YENİ EKLENDİ: LOOT BİLDİRİM SİSTEMİ
# =====================================================
func show_loot_alert(item_data: Dictionary):
    if not is_instance_valid(loot_alert_container):
        print("HATA: HUD, LootAlertContainer'ı bulamadı!")
        return
        
    var alert = LOOT_ALERT_SCENE.instantiate()
    loot_alert_container.add_child(alert)
    alert.show_alert(item_data)
