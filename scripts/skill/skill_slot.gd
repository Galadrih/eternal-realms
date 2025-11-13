extends Control

signal triggered(skill: SkillData, slot_index: int)
signal cooldown_started(skill_id: StringName, duration: float)
signal cooldown_finished(skill_id: StringName)

@export var slot_index: int = 0
@export var skill: SkillData
@export var hotkey_text: String = "1"

var _on_cooldown: bool = false
var _cooldown_time: float = 0.0
var _cooldown_left: float = 0.0

@onready var btn: Button            = %SlotButton
@onready var icon_rect: TextureRect = %Icon

# İSİMLER SENDEKİ SAHNEYE GÖRE AYARLANDI 👇
@onready var hotkey_label: Label       = %Hotkey          # Label node’un
@onready var cooldown_overlay: Control = %CooldownCover   # Üstteki siyah cover
@onready var cooldown_label: Label     = %CooldownText    # Sayı yazan label


func _ready() -> void:
	# Emin olmak için sinyali koddan da bağlıyoruz
	if btn and not btn.pressed.is_connected(_on_SlotButton_pressed):
		btn.pressed.connect(_on_SlotButton_pressed)

	_apply_skill_visuals()
	_update_hotkey()
	_update_cooldown_visual()
	set_process(false)


# -----------------------------
# HOTKEY
# -----------------------------
func set_hotkey_text(t: String) -> void:
	hotkey_text = t
	_update_hotkey()

func _update_hotkey() -> void:
	if hotkey_label:
		hotkey_label.text = hotkey_text


# -----------------------------
# SKILL ATA / GÖRSEL GÜNCELLE
# -----------------------------
func set_skill(sd: SkillData) -> void:
	skill = sd
	_apply_skill_visuals()

func _apply_skill_visuals() -> void:
	if skill == null:
		if icon_rect:
			icon_rect.texture = null
		if btn:
			btn.disabled = true
			btn.tooltip_text = ""
		return

	if icon_rect and skill.icon:
		icon_rect.texture = skill.icon

	if btn:
		btn.disabled = false
		btn.tooltip_text = "%s\n%s" % [skill.display_name, skill.description]


# -----------------------------
# SKILL ÇALIŞTIRMA
# -----------------------------
func try_trigger() -> void:
	if skill == null:
		return
	if _on_cooldown:
		return

	# World/Player tarafına haber ver
	triggered.emit(skill, slot_index)

	# UI’de cooldown’ı başlat
	if skill.cooldown > 0.0:
		start_cooldown(skill.cooldown)


func _on_SlotButton_pressed() -> void:
	try_trigger()


# -----------------------------
# COOLDOWN MANTIĞI
# -----------------------------
func start_cooldown(seconds: float) -> void:
	if seconds <= 0.0:
		_on_cooldown = false
		_cooldown_left = 0.0
		_cooldown_time = 0.0
		_update_cooldown_visual()
		return

	_on_cooldown = true
	_cooldown_time = seconds
	_cooldown_left = seconds

	if skill != null:
		cooldown_started.emit(skill.id, seconds)

	set_process(true)
	_update_cooldown_visual()


func _process(delta: float) -> void:
	if not _on_cooldown:
		set_process(false)
		return

	_cooldown_left -= delta

	if _cooldown_left <= 0.0:
		_cooldown_left = 0.0
		_on_cooldown = false
		if skill != null:
			cooldown_finished.emit(skill.id)
		_update_cooldown_visual()
		set_process(false)
	else:
		_update_cooldown_visual()


func _update_cooldown_visual() -> void:
	# Üstteki kararma / maske
	if cooldown_overlay:
		if _on_cooldown and _cooldown_time > 0.0:
			cooldown_overlay.visible = true
			var ratio: float = clamp(_cooldown_left / _cooldown_time, 0.0, 1.0)
			var col: Color = cooldown_overlay.modulate
			col.a = 0.3 + 0.7 * ratio # başta koyu, sona doğru açılıyor
			cooldown_overlay.modulate = col
		else:
			cooldown_overlay.visible = false

	# Ortadaki geri sayım sayısı
	if cooldown_label:
		if _on_cooldown:
			cooldown_label.visible = true
			cooldown_label.text = str(ceil(_cooldown_left))
		else:
			cooldown_label.visible = false


# -----------------------------
# DRAG & DROP (SkillPanel'den)
# -----------------------------
func _can_drop_data(_pos: Vector2, data: Variant) -> bool:
	if typeof(data) != TYPE_DICTIONARY:
		return false

	var d: Dictionary = data
	if not d.has("type"):
		return false

	var t: String = str(d["type"])
	return t == "SkillData"


func _drop_data(_pos: Vector2, data: Variant) -> void:
	if typeof(data) != TYPE_DICTIONARY:
		return

	var d: Dictionary = data
	var sd: SkillData = null

	if d.has("resource") and d["resource"] is SkillData:
		sd = d["resource"]
	elif d.has("res_path") and typeof(d["res_path"]) == TYPE_STRING:
		var path: String = d["res_path"]
		var res := load(path)
		if res is SkillData:
			sd = res

	if sd != null:
		set_skill(sd)


func _drag_entered() -> void:
	modulate = Color(1, 1, 1, 0.85)

func _drag_exited() -> void:
	modulate = Color(1, 1, 1, 1)
