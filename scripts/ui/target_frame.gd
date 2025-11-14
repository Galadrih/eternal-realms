extends Panel
class_name TargetFrame

@onready var name_label: Label  = $MarginContainer/VBoxContainer/TopRow/NameLabel
@onready var level_label: Label = $MarginContainer/VBoxContainer/TopRow/LevelLabel
@onready var hp_bar: ProgressBar = $MarginContainer/VBoxContainer/HPBar

var has_target: bool = false

func _ready() -> void:
	# Başlangıçta gizli
	hide()


func set_target(name: String, level: int, current_hp: float, max_hp: float) -> void:
	has_target = true

	if name_label:
		name_label.text = name

	if level_label:
		level_label.text = "Lv. %d" % level

	if hp_bar:
		hp_bar.max_value = max_hp
		hp_bar.value = clamp(current_hp, 0.0, max_hp)

	show()


func update_hp(current_hp: float, max_hp: float) -> void:
	if not has_target or hp_bar == null:
		return

	hp_bar.max_value = max_hp
	hp_bar.value = clamp(current_hp, 0.0, max_hp)


func clear_target() -> void:
	has_target = false
	hide()
