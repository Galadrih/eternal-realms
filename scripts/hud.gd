extends CanvasLayer
# İstersen: class_name HUD

# --- UI Referansları ---
@onready var level_label: Label      = $MarginContainer/VBoxContainer/LevelLabel
@onready var health_bar: ProgressBar = $MarginContainer/VBoxContainer/HealthBar
@onready var xp_bar: ProgressBar     = $MarginContainer/VBoxContainer/XPBar
@onready var mana_bar: ProgressBar   = $MarginContainer/VBoxContainer/ManaBar

# --- Dinamik bulunacak düğümler ---
var _skillbar: Node = null          # SkillBar.tscn
var _skill_panel: Control = null    # SkillPanel.tscn
var _player_class_name: String = ""

func _ready() -> void:
    set_process_input(true)
    _ensure_skillbar()
    _ensure_skill_panel()

    # Panel başlangıçta kapalı
    if _skill_panel:
        _skill_panel.hide()

    # SkillBar başlangıçta boş olsun
    if _skillbar and _skillbar.has_method("clear_all_slots"):
        _skillbar.clear_all_slots()

# --- K tuşu: SkillPanel aç/kapat ---
func _input(event: InputEvent) -> void:
    if event.is_action_pressed("open_skills"): # Input Map'te 'open_skills' = K
        _ensure_skill_panel()
        if _skill_panel == null:
            push_error("SkillPanel bulunamadı. HUD altında SkillPanel'i instance ettiğinden emin ol.")
            return

        if _skill_panel.visible:
            _skill_panel.hide()
        else:
            # Paneli açmadan önce aktif sınıfın skill’lerini yükle
            var cname := _get_player_class()
            if cname != "" and _skill_panel.has_method("refresh_for_class"):
                _skill_panel.refresh_for_class(cname)

            _skill_panel.show()
            _center_panel(_skill_panel)

# --- SkillBar sinyali: cooldown başlatma ---
func _on_skill_bar_skill_input(skill, slot_index):
    # Debug: gerçekten tetikleniyor mu görelim
    if skill:
        print("Skill kullanıldı:", skill.display_name, "slot:", slot_index)

    # Oyuncuya haber ver (ileride combat sistemine bağlayacağız)
    var player = get_tree().get_first_node_in_group("player")
    if player and player.has_method("on_skill_input"):
        player.on_skill_input(skill, slot_index)

    # Cooldown başlat
    if _skillbar and skill and "cooldown" in skill:
        _skillbar.start_cooldown(slot_index, skill.cooldown)

# =====================================
# Yardımcılar
# =====================================

func _ensure_skillbar() -> void:
    if _skillbar and is_instance_valid(_skillbar):
        return

    # 1) HUD altında doğrudan ara
    _skillbar = get_node_or_null("SkillBar")
    if _skillbar == null:
        # 2) Mizanpaj içinde olabilir
        _skillbar = get_node_or_null("MarginContainer/SkillBar")
    if _skillbar == null:
        # 3) Grup ile (istersen SkillBar sahnesine add_to_group("skillbar") yazarsın)
        _skillbar = get_tree().get_first_node_in_group("skillbar")

    # Sinyali bağla
    if _skillbar and not _skillbar.is_connected("skill_input", Callable(self, "_on_skill_bar_skill_input")):
        _skillbar.connect("skill_input", Callable(self, "_on_skill_bar_skill_input"))

func _ensure_skill_panel() -> void:
    if _skill_panel and is_instance_valid(_skill_panel):
        return

    # 1) HUD altında doğrudan
    _skill_panel = get_node_or_null("SkillPanel")
    if _skill_panel == null:
        # 2) Mizanpaj içinde olabilir
        _skill_panel = get_node_or_null("MarginContainer/SkillPanel")
    if _skill_panel == null:
        # 3) Grup ile (SkillPanel scriptinde add_to_group("skill_panel") varsa)
        _skill_panel = get_tree().get_first_node_in_group("skill_panel")

func _center_panel(p: Control) -> void:
    var vp: Vector2 = get_viewport().get_visible_rect().size
    if p.custom_minimum_size == Vector2.ZERO:
        p.custom_minimum_size = Vector2(620, 440)
    p.size = p.custom_minimum_size
    p.position = (vp - p.size) * 0.5
func set_player_class_name(name: String) -> void:
    _player_class_name = name
# Aktif oyuncunun sınıfını güvenli şekilde bulur
func _get_player_class() -> String:
    # Eğer dışarıdan set edildiyse onu kullan
    if _player_class_name != "":
        return _player_class_name

    # Yine de fallback kalsın (ileride kullanırsın diye)
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
        }
        var cid = int(p.get("class_id"))
        if id_to_name.has(cid):
            return id_to_name[cid]

    return ""

# =====================================
# HUD güncelleme fonksiyonları
# (World.gd'nin bağladığı imzalarla UYUMLU)
# =====================================

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

# Eski isimle çağrılar varsa diye
func update_xp(current_xp: float, next_level_xp: float) -> void:
    update_experience(current_xp, next_level_xp)

func update_level(level: int) -> void:
    if level_label:
        level_label.text = str(level)
