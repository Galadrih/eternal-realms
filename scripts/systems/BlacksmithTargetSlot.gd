extends Panel
class_name BlacksmithTargetSlot

@onready var icon_rect: TextureRect = $Icon

func _ready() -> void:
	mouse_filter = MOUSE_FILTER_STOP
	_setup_icon()
	_clear_icon()


func _setup_icon() -> void:
	if icon_rect == null:
		return

	icon_rect.set_anchors_preset(Control.PRESET_CENTER)

	icon_rect.custom_minimum_size = Vector2(32, 32)
	icon_rect.size = Vector2(32, 32)

	icon_rect.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	icon_rect.size_flags_vertical   = Control.SIZE_SHRINK_CENTER

	icon_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	icon_rect.expand_mode  = TextureRect.EXPAND_KEEP_SIZE


# --------------------------
#   DRAG & DROP
# --------------------------

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if typeof(data) != TYPE_DICTIONARY:
		return false

	var dict: Dictionary = data
	var dtype: String = str(dict.get("type", ""))

	return dtype == "inventory_item"



func _drop_data(at_position: Vector2, data: Variant) -> void:
	if typeof(data) != TYPE_DICTIONARY:
		return

	var dict: Dictionary = data

	var dtype: String = str(dict.get("type", ""))
	if dtype != "inventory_item":
		return


	var item: Dictionary = dict.get("item", {})
	_set_icon_from_item(item)

	var panel = get_tree().get_first_node_in_group("blacksmith_panel")
	if panel and panel.has_method("set_target_from_drag"):
		panel.set_target_from_drag(dict)


func _set_icon_from_item(item: Dictionary) -> void:
	if icon_rect == null:
		return

	if item.is_empty():
		_clear_icon()
		return

	var tex: Texture2D = null
	var path := ""

	if item.has("icon_path"):
		path = String(item["icon_path"])
	elif item.has("icon"):
		path = "res://assets/icons/%s.png" % String(item["icon"]).to_lower()
	elif item.has("id"):
		path = "res://assets/icons/%s.png" % String(item["id"])

	if path != "" and ResourceLoader.exists(path):
		tex = load(path)

	icon_rect.texture = tex


func _clear_icon() -> void:
	if icon_rect:
		icon_rect.texture = null
