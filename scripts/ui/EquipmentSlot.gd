extends Button
class_name EquipmentSlot

@export var slot_name: StringName = &""

var inventory_panel: Node = null
var current_item: Dictionary = {}

@onready var icon_rect: TextureRect = $Icon
@onready var bg_panel: Panel = $Background


func _ready() -> void:
	focus_mode = Control.FOCUS_NONE
	toggle_mode = false
	clip_text = false
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	custom_minimum_size = Vector2(56, 56)

	_setup_background_style()

	if icon_rect:
		icon_rect.stretch_mode = TextureRect.STRETCH_SCALE
		icon_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH
		icon_rect.custom_minimum_size = Vector2(48, 48)

	_apply_empty_visual()


# -------------------------------------------------------------------
#   GÖRSEL / ÇERÇEVE
# -------------------------------------------------------------------
func _setup_background_style() -> void:
	if bg_panel == null:
		return

	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0.05, 0.05, 0.05, 0.95)
	sb.set_corner_radius_all(2)
	sb.set_border_width_all(1)
	sb.border_color = Color(0.9, 0.8, 0.35, 1.0) # InventorySlot ile aynı sarı çerçeve
	sb.shadow_size = 1
	sb.shadow_color = Color(0, 0, 0, 0.8)
	sb.set_content_margin_all(3)

	bg_panel.add_theme_stylebox_override("panel", sb)


func _apply_empty_visual() -> void:
	current_item.clear()
	if icon_rect:
		icon_rect.texture = null
	tooltip_text = ""


# -------------------------------------------------------------------
#   INVENTORYPANEL → BURADAN ÇAĞIRIR
# -------------------------------------------------------------------
func refresh_with_item(item: Dictionary) -> void:
	current_item = item.duplicate(true)

	if current_item.is_empty():
		_apply_empty_visual()
		return

	# --------------------------
	# 1) ICON (InventorySlot ile aynı mantık)
	# --------------------------
	var tex: Texture2D = null

	if current_item.has("icon_path"):
		var path_str := str(current_item["icon_path"])
		if ResourceLoader.exists(path_str):
			tex = load(path_str)

	if tex == null and current_item.has("icon"):
		var icon_name := str(current_item["icon"]).to_lower()
		var path2 := "res://assets/icons/%s.png" % icon_name
		if ResourceLoader.exists(path2):
			tex = load(path2)

	if tex == null and current_item.has("id"):
		var id_fallback_path := "res://assets/icons/%s.png" % str(current_item["id"])
		if ResourceLoader.exists(id_fallback_path):
			tex = load(id_fallback_path)

	if tex == null and current_item.has("id"):
		var id_str := str(current_item["id"])
		if not id_str.begins_with("P_"):
			var parts := id_str.split("_")
			if parts.size() >= 2:
				var code := parts[1]
				var icon_name2 := ""
				match code:
					"W": icon_name2 = "weapon"
					"A": icon_name2 = "armor"
					"H": icon_name2 = "helmet"
					"P": icon_name2 = "pants"
					"G": icon_name2 = "gloves"
					"B": icon_name2 = "boots"
					"N": icon_name2 = "necklace"
					"WR": icon_name2 = "bracelet"
					"C": icon_name2 = "cloak"
					"O": icon_name2 = "offhand"
					_: icon_name2 = ""
				if icon_name2 != "":
					var path3 := "res://assets/icons/%s.png" % icon_name2
					if ResourceLoader.exists(path3):
						tex = load(path3)

	if icon_rect:
		icon_rect.texture = tex
		if tex == null and not current_item.is_empty():
			print("UYARI (EquipmentSlot): '%s' için ikon bulunamadı." % current_item.get("name", "BİLİNMEYEN EŞYA"))

	# --------------------------
	# 2) TOOLTIP – InventorySlot ile aynı Türkçe yapı
	# --------------------------
	var lines: Array = []

	# İSİM + UPGRADE
	var base_name: String = str(current_item.get("name", "")).strip_edges()

	var upgrade: int = 0
	if current_item.has("upgrade"):
		var raw_up = current_item["upgrade"]
		match typeof(raw_up):
			TYPE_INT:
				upgrade = raw_up
			TYPE_FLOAT:
				upgrade = int(raw_up)
			TYPE_STRING:
				var s_up: String = raw_up
				if s_up.begins_with("+"):
					s_up = s_up.substr(1, s_up.length() - 1)
				if s_up.is_valid_int():
					upgrade = int(s_up)

	if base_name != "":
		if upgrade > 0:
			lines.append("+%d %s" % [upgrade, base_name])
		else:
			lines.append(base_name)

	# LEVEL / CLASS REQ
	var req_level: int = -1
	if current_item.has("req_level"):
		req_level = int(current_item["req_level"])

	var req_class_str: String = ""
	if current_item.has("req_class"):
		req_class_str = str(current_item["req_class"]).strip_edges()

	if req_level > 0 or (req_class_str != "" and req_class_str != "POTIONS"):
		var req_line := ""
		if req_level > 0:
			req_line += "Seviye %d" % req_level
		if req_class_str != "":
			if req_line != "":
				req_line += " | "
			req_line += req_class_str.capitalize()
		if req_line != "":
			lines.append(req_line)

	# AÇIKLAMA
	var desc_str := str(current_item.get("tooltip", "")).strip_edges()
	if desc_str != "":
		lines.append(desc_str)

	# STATLAR
	var stats = current_item.get("stats", {})
	if stats is Dictionary and stats.size() > 0:
		if lines.size() > 0:
			lines.append("")
		var db = ItemDB
		if db.STAT_ORDER.size() > 0:
			for key in db.STAT_ORDER:
				if stats.has(key):
					lines.append(db.format_stat_line(key, stats[key]))
		for key in stats.keys():
			if key in db.STAT_ORDER:
				continue
			lines.append(db.format_stat_line(key, stats[key]))

	# SATIŞ FİYATI BİLGİSİ (opsiyonel)
	if ItemDB.has_method("get_item_price"):
		var price: int = ItemDB.get_item_price(current_item)
		if price > 0:
			var sell_price: int = max(1, int(price * 0.25))
			lines.append("")
			lines.append("Tahmini Satış Fiyatı: %d Altın" % sell_price)

	tooltip_text = "\n".join(lines)


# -------------------------------------------------------------------
#   SAĞ TIKLA ÇIKAR (EQUIP → ENVANTER)
# -------------------------------------------------------------------
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		get_viewport().set_input_as_handled()
		if inventory_panel and inventory_panel.has_method("unequip_slot_to_inventory"):
			inventory_panel.unequip_slot_to_inventory(String(slot_name))


func _on_pressed() -> void:
	# Şimdilik sol tık bir şey yapmıyor; istersen ileride panel falan açarsın.
	pass


# -------------------------------------------------------------------
#   DRAG & DROP (EQUIP <-> ENVANTER)
# -------------------------------------------------------------------
func _get_drag_data(at_position: Vector2) -> Variant:
	if current_item.is_empty():
		return null

	var data: Dictionary = {
		"type": "equipment_item",
		"from_slot_name": String(slot_name),
		"item": current_item
	}

	var preview_root := Control.new()
	preview_root.custom_minimum_size = Vector2(48, 48)
	var tex_rect := TextureRect.new()
	tex_rect.stretch_mode = TextureRect.STRETCH_SCALE
	tex_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH
	tex_rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	if icon_rect and icon_rect.texture:
		tex_rect.texture = icon_rect.texture
	preview_root.add_child(tex_rect)
	set_drag_preview(preview_root)

	tooltip_text = ""

	return data


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if typeof(data) != TYPE_DICTIONARY:
		return false

	var dict: Dictionary = data
	if not dict.has("type"):
		return false

	var dtype: String = str(dict["type"])
	return dtype == "inventory_item"


func _drop_data(at_position: Vector2, data: Variant) -> void:
	if inventory_panel == null:
		return
	if typeof(data) != TYPE_DICTIONARY:
		return

	var dict: Dictionary = data
	if not dict.has("type") or not dict.has("from_global_index"):
		return

	var dtype: String = str(dict["type"])
	if dtype != "inventory_item":
		return

	var from_index: int = int(dict["from_global_index"])

	if inventory_panel.has_method("equip_from_inventory"):
		inventory_panel.equip_from_inventory(from_index, String(slot_name))
