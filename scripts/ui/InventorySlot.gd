extends Button
class_name InventorySlot

@export var local_index: int = 0      # 0–39, sayfa içindeki index
var inventory_panel: Node = null      # InventoryPanel referansı

var current_item: Dictionary = {}     # Bu slottaki item (kopya)

@onready var icon_rect: TextureRect = $Icon
@onready var quantity_label: Label   = $Quantity

# --- YENİ EKLENTİ: SAĞ TIK SİNYALİ ---
signal slot_gui_input_event(event, local_index)
# -----------------------------------


func _ready() -> void:
	focus_mode = Control.FOCUS_NONE
	toggle_mode = false
	flat = true
	clip_text = false
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	custom_minimum_size = Vector2(56, 56)

	if icon_rect:
		icon_rect.stretch_mode = TextureRect.STRETCH_SCALE
		icon_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH
		icon_rect.custom_minimum_size = Vector2(48, 48)

	_apply_empty_visual()

# --- YENİ FONKSİYON: TIKLAMALARI YAKALA ---
func _gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		# Tıklama eventini panele ilet (sağ tık satışı/giyme için)
		slot_gui_input_event.emit(event, local_index)
		
		# Sağ tık ise, olayı tüket (Button'un "pressed" sinyalini tetiklemesin)
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			get_viewport().set_input_as_handled()
# -----------------------------------------


func _apply_empty_visual() -> void:
	current_item.clear()
	if icon_rect:
		icon_rect.texture = null
	if quantity_label:
		quantity_label.text = ""
	tooltip_text = ""


func refresh_with_item(item: Dictionary) -> void:
	current_item = item.duplicate(true)

	if current_item.is_empty():
		_apply_empty_visual()
		return

	# --------------------------
	# 1) ICON (Senin kodun - dokunulmadı)
	# --------------------------
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

	# --------------------------
	# 2) STACK MİKTARI (Senin kodun - dokunulmadı)
	# --------------------------
	var amount: int = 1
	if current_item.has("amount"):
		amount = int(current_item["amount"])
	if quantity_label:
		if amount > 1:
			quantity_label.text = str(amount)
		else:
			quantity_label.text = ""

	# --------------------------
	# 3) TOOLTIP (FİYAT İÇİN GÜNCELLENDİ)
	# --------------------------
	var lines: Array = []

	# İSİM
	var name_str := str(current_item.get("name", "")).strip_edges()
	if name_str != "":
		lines.append(name_str) # BBCode (örn: [b]) kaldırıldı, düz metin olmalı

	# REQUIREMENTS (Lv / Class)
	var req_level := -1
	if current_item.has("req_level"):
		req_level = int(current_item["req_level"])
	var req_class_str := ""
	if current_item.has("req_class"):
		req_class_str = str(current_item["req_class"]).strip_edges()
	if req_level > 0 or (req_class_str != "" and req_class_str != "POTIONS"):
		var req_line := ""
		if req_level > 0:
			req_line += "Lv %d" % req_level
		if req_class_str != "":
			if req_line != "":
				req_line += " | "
			req_line += req_class_str.capitalize()
		if req_line != "":
			lines.append(req_line)

	# AÇIKLAMA / BASE TOOLTIP
	var desc_str := str(current_item.get("tooltip", "")).strip_edges()
	if desc_str != "":
		lines.append(desc_str)

	# STATLAR
	var stats = current_item.get("stats", {})
	if stats is Dictionary and stats.size() > 0:
		if lines.size() > 0:
			lines.append("")  # boş satır

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

	# --- FİYAT BİLGİSİ EKLENDİ ---
	if Engine.has_singleton("ItemDB"):
		if ItemDB.has_method("get_item_price"):
			var price: int = ItemDB.get_item_price(current_item)
			if price > 0:
				var sell_price: int = max(1, int(price * 0.25))
				lines.append("") # Boşluk
				lines.append("Satış Fiyatı: %d Altın" % sell_price) # Düz metin olarak eklendi
		else:
			print("HATA: ItemDB'de get_item_price fonksiyonu bulunamadı.")
	# -------------------------------

	tooltip_text = "\n".join(lines)


# ======================================================
#  DRAG & DROP
# ======================================================

func _get_drag_data(at_position: Vector2) -> Variant:
	if inventory_panel == null:
		return null
	var global_index: int = inventory_panel.get_global_index(local_index)
	var item: Dictionary = inventory_panel.get_item_at(global_index)
	if item.is_empty():
		return null

	var data := {
		"type": "inventory_item",
		"from_global_index": global_index,
		"item": item,
	}

	# Drag preview
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
	
	# Sürüklerken tooltip'i gizle
	tooltip_text = ""

	return data


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if typeof(data) != TYPE_DICTIONARY:
		return false
	var dict: Dictionary = data
	if not dict.has("type"):
		return false
	
	# Hem envanterden hem de ekipmandan gelenleri kabul et
	return (dict["type"] == "inventory_item" or dict["type"] == "equipment_item")


func _drop_data(at_position: Vector2, data: Variant) -> void:
	if inventory_panel == null:
		return
	if typeof(data) != TYPE_DICTIONARY:
		return

	var dict: Dictionary = data
	
	# Gelen verinin tipini kontrol et
	if dict.has("type") and dict["type"] == "inventory_item":
		if inventory_panel.has_method("handle_drop"):
			inventory_panel.handle_drop(dict, local_index)
	elif dict.has("type") and dict["type"] == "equipment_item":
		# Ekipmandan envantere sürüklemeyi işle
		if inventory_panel.has_method("handle_equip_drop"):
			inventory_panel.handle_equip_drop(dict, local_index)
