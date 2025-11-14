extends Button
class_name EquipmentSlot

@export var slot_name: StringName = &"weapon"   # "weapon", "armor", "helmet", "ring1" vb.
var inventory_panel: Node = null

var current_item: Dictionary = {}

@onready var bg_panel: Panel        = get_node_or_null("Background")
@onready var icon_rect: TextureRect = $Icon


func _ready() -> void:
	focus_mode = Control.FOCUS_NONE
	toggle_mode = false
	flat = true
	clip_text = false
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

	custom_minimum_size = Vector2(48, 48)

	# Icon'u slot içine oturt
	if icon_rect:
		icon_rect.set_anchors_preset(Control.PRESET_FULL_RECT)
		icon_rect.offset_left = 4
		icon_rect.offset_top = 4
		icon_rect.offset_right = -4
		icon_rect.offset_bottom = -4
		icon_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		icon_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH
		icon_rect.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		icon_rect.size_flags_vertical = Control.SIZE_EXPAND_FILL

	_setup_background_style()
	_apply_empty_visual()


func _setup_background_style() -> void:
	if bg_panel == null:
		return

	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0.05, 0.05, 0.05, 0.95)
	sb.set_corner_radius_all(2)
	sb.set_border_width_all(1)
	sb.border_color = Color(0.9, 0.8, 0.35, 1.0)
	sb.shadow_size = 1
	sb.shadow_color = Color(0, 0, 0, 0.8)
	sb.set_content_margin_all(3)

	bg_panel.add_theme_stylebox_override("panel", sb)


func _apply_empty_visual() -> void:
	current_item.clear()
	if icon_rect:
		icon_rect.texture = null
	tooltip_text = ""


func refresh_with_item(item: Dictionary) -> void:
	current_item = item.duplicate(true)

	if current_item.is_empty():
		_apply_empty_visual()
		return

	# --- ICON SEÇ ---
	var tex: Texture2D = null

	if current_item.has("icon_path"):
		var path_str := str(current_item["icon_path"])
		if ResourceLoader.exists(path_str):
			tex = load(path_str)
	elif current_item.has("icon"):
		var icon_name := str(current_item["icon"]).to_lower()
		var path2 := "res://assets/icons/%s.png" % icon_name
		if ResourceLoader.exists(path2):
			tex = load(path2)
	elif current_item.has("id"):
		var id_str := str(current_item["id"])
		var parts := id_str.split("_")
		if parts.size() >= 2:
			var code := parts[1]
			var icon_name2 := ""
			match code:
				"W":
					icon_name2 = "weapon"
				"A":
					icon_name2 = "armor"
				"H":
					icon_name2 = "helmet"
				"G":
					icon_name2 = "gloves"
				"B":
					icon_name2 = "boots"
				"N":
					icon_name2 = "necklace"
				"R":
					icon_name2 = "ring"
				"O":
					icon_name2 = "offhand"
				_:
					icon_name2 = ""
			if icon_name2 != "":
				var path3 := "res://assets/icons/%s.png" % icon_name2
				if ResourceLoader.exists(path3):
					tex = load(path3)

	if icon_rect:
		icon_rect.texture = tex

	# --- TOOLTIP (InventorySlot ile aynı mantık) ---
	var lines: Array = []

	var name_str := str(current_item.get("name", "")).strip_edges()
	if name_str != "":
		lines.append(name_str)

	var desc_str := str(current_item.get("tooltip", "")).strip_edges()
	if desc_str != "":
		lines.append(desc_str)

	var stats = current_item.get("stats", {})
	if stats is Dictionary and stats.size() > 0:
		if lines.size() > 0:
			lines.append("")

		if Engine.has_singleton("ItemDB"):
			var db = ItemDB
			if db.STAT_ORDER.size() > 0:
				for key in db.STAT_ORDER:
					if stats.has(key):
						lines.append(db.format_stat_line(key, stats[key]))
			for key in stats.keys():
				if key in db.STAT_ORDER:
					continue
				lines.append(db.format_stat_line(key, stats[key]))
		else:
			for key in stats.keys():
				lines.append("%s: %s" % [str(key), str(stats[key])])

	tooltip_text = "\n".join(lines)


# ======================================================
#  DRAG & DROP
# ======================================================

func _get_drag_data(at_position: Vector2) -> Variant:
	# İleride buradan envantere geri sürükleyip bırakmayı da açabiliriz.
	return null


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if typeof(data) != TYPE_DICTIONARY:
		return false
	var dict: Dictionary = data
	if not dict.has("type") or dict["type"] != "inventory_item":
		return false
	if inventory_panel == null:
		return false

	var item: Dictionary = dict.get("item", {})
	if item.is_empty():
		return false

	return inventory_panel.can_item_go_to_slot(item, str(slot_name))


func _drop_data(at_position: Vector2, data: Variant) -> void:
	if inventory_panel == null:
		return
	if typeof(data) != TYPE_DICTIONARY:
		return

	var dict: Dictionary = data
	if not dict.has("type") or dict["type"] != "inventory_item":
		return

	if not dict.has("from_global_index"):
		return

	var from_index: int = int(dict["from_global_index"])
	inventory_panel.equip_from_inventory(from_index, str(slot_name))
