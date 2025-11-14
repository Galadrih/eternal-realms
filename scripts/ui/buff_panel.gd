extends Control
class_name BuffPanel

@export var icon_scene: PackedScene = preload("res://scenes/ui/BuffIcon.tscn")

@onready var icon_flow: FlowContainer = $IconFlow

# Önceki frame'de görünen buff’ların ID listesi
var _last_keys: Array = []
var _buff_nodes: Dictionary = {} # skill_id -> BuffIcon

# Class id -> klasör ismi (ikon dosyaları için)
const CLASS_DIRS: Dictionary = {
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
	11: "Ranger",
}

func _ready() -> void:
	visible = false
	mouse_filter = MOUSE_FILTER_IGNORE

# PlayerBase'den çağrılacak ana fonksiyon  
# statuses: PlayerBase.active_statuses
# skill_db: PlayerBase.SKILL_DATABASE
# class_id: o anki class_id
func sync_from_statuses(statuses: Dictionary, skill_db: Dictionary, class_id: int) -> void:
	var keys: Array = statuses.keys()
	keys.sort()

	var changed: bool = _have_keys_changed(keys)
	if changed:
		_rebuild_icons(statuses, skill_db, class_id)
		_last_keys = keys.duplicate()
	else:
		_update_durations(statuses)

	# Hiç buff/debuff yoksa panel tamamen kaybolsun
	visible = _buff_nodes.size() > 0

func _have_keys_changed(keys: Array) -> bool:
	if keys.size() != _last_keys.size():
		return true
	for i in keys.size():
		if keys[i] != _last_keys[i]:
			return true
	return false

func _rebuild_icons(statuses: Dictionary, skill_db: Dictionary, class_id: int) -> void:
	# Eski ikonları sil
	for child in icon_flow.get_children():
		child.queue_free()
	_buff_nodes.clear()

	for skill_id in statuses.keys():
		var status: Dictionary = statuses[skill_id]

		# Sadece gerçekten "üstümüzde var olan" şeyleri göster
		var show_this: bool = false
		var is_debuff: bool = false

		if status.has("is_buff") and status["is_buff"]:
			show_this = true
			if status.has("effect_type"):
				var eff: String = str(status["effect_type"]).to_lower()
				is_debuff = eff.contains("debuff")
		elif status.has("is_dot_hot"):
			# HoT ve DoT'ları da gösterelim (heal ise buff, değilse debuff)
			show_this = true
			is_debuff = status.has("is_heal") and not status["is_heal"]

		if not show_this:
			continue

		if icon_scene == null:
			continue

		var icon_node: BuffIcon = icon_scene.instantiate()
		icon_flow.add_child(icon_node)
		_buff_nodes[skill_id] = icon_node

		icon_node.buff_id = str(skill_id)
		icon_node.set_style(is_debuff)

		# İkonu yükle
		var tex: Texture2D = _get_icon_for_skill(str(skill_id), skill_db, class_id)
		if tex:
			icon_node.set_icon(tex)

		# Süre varsa yaz
		if status.has("time_left"):
			var time_left: float = float(status["time_left"])
			icon_node.set_timer(time_left, time_left)

func _update_durations(statuses: Dictionary) -> void:
	for skill_id in _buff_nodes.keys():
		if not statuses.has(skill_id):
			continue
		var status: Dictionary = statuses[skill_id]
		if status.has("time_left"):
			var time_left: float = float(status["time_left"])
			var node: BuffIcon = _buff_nodes[skill_id]
			node.set_timer(time_left, time_left)

func _get_icon_for_skill(skill_id: String, skill_db: Dictionary, class_id: int) -> Texture2D:
	# Şimdilik class_id + skill_id üzerinden ikon dosyasını çözüyoruz
	if not CLASS_DIRS.has(class_id):
		return null

	var class_dir: String = CLASS_DIRS[class_id]
	var icon_path: String = "res://assets/skill_icons/%s/%s.png" % [class_dir, skill_id]

	if ResourceLoader.exists(icon_path):
		var tex: Texture2D = load(icon_path)
		if tex is Texture2D:
			return tex

	return null
