extends Control
class_name BlacksmithPanel

@onready var item_name_label: Label = $MainPanel/VBox/ItemNameLabel
@onready var stats_label: Label = $MainPanel/VBox/StatsLabel
@onready var upgrade_button: Button = $MainPanel/VBox/UpgradeButton
@onready var result_label: Label = $MainPanel/VBox/ResultLabel
@onready var close_button: Button = $MainPanel/CloseButton
@onready var target_slot: BlacksmithTargetSlot = $MainPanel/VBox/TargetSlot


const MAX_UPGRADE: int = 15

var current_item: Dictionary = {}      # Üzerinde çalıştığımız item
var inventory_panel: Node = null       # Geldiği envanter paneli
var target_global_index: int = -1      # Envanterdeki index
var player: Node = null
var hud_node: Node = null


func _ready() -> void:
	randomize()
	upgrade_button.pressed.connect(_on_upgrade_button_pressed)
	close_button.pressed.connect(_on_close_button_pressed)

	hud_node = get_tree().get_first_node_in_group("hud")

	_refresh_ui()

func open_panel() -> void:
	visible = true
	result_label.text = ""
	_refresh_ui()

func close_panel() -> void:
	_reset_state()
	visible = false
	
	
	


func _on_close_button_pressed() -> void:
	_reset_state()
	visible = false
	
func _ensure_player() -> bool:
	if player != null and is_instance_valid(player):
		return true

	player = get_tree().get_first_node_in_group("player_character")
	return player != null
	
	
func _get_next_upgrade_preview(item: Dictionary) -> Dictionary:
	var preview: Dictionary = item.duplicate(true)

	# Şu anki upgrade
	var upgrade: int = 0
	if item.has("upgrade"):
		upgrade = int(item["upgrade"])
	if upgrade >= MAX_UPGRADE:
		return preview  # Zaten max, preview = current

	var next_upgrade: int = upgrade + 1
	preview["upgrade"] = next_upgrade

	# Statları basitçe +1 arttıralım (her stat için)
	var stats_val = item.get("stats", {})
	if stats_val is Dictionary:
		var src_stats: Dictionary = stats_val
		var dst_stats: Dictionary = {}
		for key in src_stats.keys():
			var v = src_stats[key]
			if typeof(v) == TYPE_INT or typeof(v) == TYPE_FLOAT:
				dst_stats[key] = int(v) + 1
			else:
				dst_stats[key] = v
		preview["stats"] = dst_stats

	return preview

# DIŞARIDAN ÇAĞIRILACAK FONKSİYON
# InventoryPanel şunu diyecek: set_target_item(global_index, item_data, self)
func set_target_item(global_index: int, item_data: Dictionary, inv_panel: Node) -> void:
	target_global_index = global_index
	inventory_panel = inv_panel
	current_item = item_data.duplicate(true)
	result_label.text = ""
	_refresh_ui()
	
func _reset_state() -> void:
	current_item.clear()
	target_global_index = -1
	inventory_panel = null

	if result_label:
		result_label.text = ""

	if target_slot and target_slot.has_method("_clear_icon"):
		target_slot._clear_icon()

	_refresh_ui()


func _refresh_ui() -> void:
	if current_item.is_empty():
		if item_name_label:
			item_name_label.text = "Eşya yok"
		if stats_label:
			stats_label.text = ""
		if upgrade_button:
			upgrade_button.disabled = true
		if target_slot and target_slot.has_method("_clear_icon"):
			target_slot._clear_icon()
		return

	if upgrade_button:
		upgrade_button.disabled = false

	# --- ŞU ANKİ + VE İSİM ---
	var base_name: String = str(current_item.get("name", "")).strip_edges()

	var upgrade: int = 0
	if current_item.has("upgrade"):
		upgrade = int(current_item["upgrade"])
		if upgrade < 0:
			upgrade = 0

	var current_name: String = base_name
	if upgrade > 0 and base_name != "":
		current_name = "+%d %s" % [upgrade, base_name]

	# --- SONRAKİ + İÇİN PREVIEW ITEM ---
	var preview_item: Dictionary = _get_next_upgrade_preview(current_item)

	var next_upgrade: int = int(preview_item.get("upgrade", upgrade))
	var next_name: String = base_name
	if next_upgrade > 0 and base_name != "":
		next_name = "+%d %s" % [next_upgrade, base_name]

	if item_name_label:
		# Üstte sadece mevcut adı yazsın
		if current_name == "":
			item_name_label.text = "İsimsiz Eşya"
		else:
			item_name_label.text = current_name

	# --- STAT + PREVIEW METNİ ---
	if stats_label:
		var lines: Array[String] = []

		# İsim satırı:  "+1 Sargı Bezi > +2 Sargı Bezi" gibi
		if upgrade < MAX_UPGRADE:
			lines.append("%s  >  %s" % [current_name, next_name])
		else:
			lines.append(current_name)
			lines.append("Maks seviye (+" + str(MAX_UPGRADE) + ")")

		# STATLAR
		var stats_curr_val = current_item.get("stats", {})
		var stats_next_val = preview_item.get("stats", stats_curr_val)

		if stats_curr_val is Dictionary:
			var stats_curr: Dictionary = stats_curr_val
			var stats_next: Dictionary = stats_next_val

			var db = ItemDB

			# Önce STAT_ORDER’dakiler
			if db.STAT_ORDER.size() > 0:
				for key in db.STAT_ORDER:
					if stats_curr.has(key):
						var curr_stat_val = stats_curr[key]
						var next_stat_val = stats_next.get(key, curr_stat_val)

						var line_curr: String = db.format_stat_line(key, curr_stat_val)
						var line_next: String = db.format_stat_line(key, next_stat_val)

						if upgrade < MAX_UPGRADE:
							lines.append("%s  >  %s" % [line_curr, line_next])
						else:
							lines.append(line_curr)

			# Sonra geri kalan statlar
			for key in stats_curr.keys():
				if ItemDB.STAT_ORDER.has(key):
					continue
				var curr_stat_val2 = stats_curr[key]
				var next_stat_val2 = stats_next.get(key, curr_stat_val2)

				var line_curr2: String = db.format_stat_line(key, curr_stat_val2)
				var line_next2: String = db.format_stat_line(key, next_stat_val2)

				if upgrade < MAX_UPGRADE:
					lines.append("%s  >  %s" % [line_curr2, line_next2])
				else:
					lines.append(line_curr2)

		# Boş satır ve maliyet
		lines.append("")
		var cost: int = _get_upgrade_cost(current_item)
		lines.append("Yükseltme Maliyeti: %d Altın" % cost)

		stats_label.text = "\n".join(lines)

	# --- SLOTTAKİ İKON ---
	if target_slot and target_slot.has_method("_set_icon_from_item"):
		target_slot._set_icon_from_item(current_item)




func _on_upgrade_button_pressed() -> void:
	if current_item.is_empty():
		result_label.text = "Önce bir eşya seç."
		return

	# Player bul
	if not _ensure_player():
		result_label.text = "Oyuncu bulunamadı."
		return

	if not player.has_method("spend_gold"):
		result_label.text = "HATA: player.spend_gold yok."
		return

	# Maliyet
	var cost: int = _get_upgrade_cost(current_item)

	# Yeterli altın?
	if not player.spend_gold(cost):
		result_label.text = "Yetersiz altın! Gerekli: %d" % cost
		if hud_node and hud_node.has_method("show_loot_alert_text"):
			hud_node.show_loot_alert_text("Yetersiz altın! Gerekli: %d" % cost)
		return

	# Buraya geldiysek para gitti, roll zamanı
	var result: Dictionary = Blacksmith.roll_upgrade(current_item)
	var outcome: String = str(result.get("result", ""))

	if outcome == "success":
		current_item = result["item"]
		result_label.text = "BAŞARILI! (-%d altın)" % cost

		# Envanterde itemi GÜNCELLE
		if inventory_panel and target_global_index >= 0 and inventory_panel.has_method("set_item_at"):
			inventory_panel.set_item_at(target_global_index, current_item)

		_refresh_ui()

	elif outcome == "destroy":
		result_label.text = "EŞYA KIRILDI 💥 (-%d altın)" % cost

		# Envanterdeki slotu TEMİZLE
		if inventory_panel and target_global_index >= 0 and inventory_panel.has_method("clear_item_at"):
			inventory_panel.clear_item_at(target_global_index)

		current_item.clear()
		_refresh_ui()
		upgrade_button.disabled = true

	elif outcome == "max":
		result_label.text = "ZATEN MAX SEVİYE"

	else:
		result_label.text = "Bilinmeyen sonuç?"
			
			
func set_target_from_drag(data: Dictionary) -> void:
	if not data.has("from_global_index") or not data.has("item") or not data.has("inventory_panel"):
		print("BlacksmithPanel: geçersiz drag datası.")
		return

	var global_index: int = int(data["from_global_index"])
	var item_data: Dictionary = data["item"]
	var inv_panel: Node = data["inventory_panel"]

	if item_data.is_empty():
		print("BlacksmithPanel: boş item drag edildi.")
		return

	target_global_index = global_index
	inventory_panel = inv_panel
	current_item = item_data.duplicate(true)
	result_label.text = ""

	open_panel()
	_refresh_ui()
	
	
func _get_upgrade_cost(item: Dictionary) -> int:
	if item.is_empty():
		return 0

	var base_price: int = 0
	if ItemDB.has_method("get_item_price"):
		base_price = ItemDB.get_item_price(item)

	if base_price <= 5000:
		base_price = 5000  # En düşük maliyet

	var up: int = 0
	if item.has("upgrade"):
		up = int(item["upgrade"])

	# Metin2 vibe: seviye arttıkça katlanarak artsın
	# Örnek: +0 -> 1x, +1 -> 1.5x, +2 -> 2x, +3 -> 2.5x ...
	var multiplier := 1.0 + float(up) * 0.5
	var cost: int = int(round(base_price * multiplier))

	return max(cost, 1)
