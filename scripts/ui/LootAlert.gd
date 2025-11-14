extends HBoxContainer

@onready var icon: TextureRect = $Icon
@onready var name_label: Label = $NameLabel

# Eşya türüne göre varsayılan icon yolları (loot.gd'den alındı)
const TYPE_ICONS = {
	"weapon": "res://assets/icons/weapon.png",
	"armor": "res://assets/icons/armor.png",
	"helmet": "res://assets/icons/helmet.png",
	"pants": "res://assets/icons/armor.png",
	"gloves": "res://assets/icons/gloves.png",
	"boots": "res://assets/icons/boots.png",
	"bracelet": "res://assets/icons/ring.png",
	"necklace": "res://assets/icons/necklace.png",
	"cloak": "res://assets/icons/cloak.png",
	"belt": "res://assets/icons/armor.png",
	"offhand": "res://assets/icons/offhand.png"
}

# --- YENİ EKLENDİ: _ready fonksiyonu ---
func _ready():
	# 1. ZORUNLU BOYUT: Icon'u 32x32 boyuta zorla
	icon.custom_minimum_size = Vector2(32, 32)
	
	# 2. GENİŞLEME MODU: TextureRect'e resmin boyutunu görmezden gelmesini söyle
	icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	
	# 3. ESNETME MODU: Resmi bu 32x32'lik alana sığdır (en/boy oranını koruyarak)
	icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
# --- DÜZELTME SONU ---

# hud.gd bu fonksiyonu çağıracak
func show_alert(item_data: Dictionary):
	# 1. Eşya adını ayarla
	name_label.text = item_data.get("name", "Bilinmeyen Eşya")
	
	# 2. Eşya icon'unu ayarla
	var icon_path = _get_icon_path_from_item(item_data)
	if ResourceLoader.exists(icon_path):
		icon.texture = load(icon_path)
	else:
		icon.texture = load("res://icon.svg") # Bulamazsa varsayılan
	
	# 3. Solma (Fade-out) animasyonunu başlat
	_start_fade_out()

func _start_fade_out():
	# 3 saniye bekle
	await get_tree().create_timer(3.0).timeout
	
	# 1 saniye içinde kaybol
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1.0)
	
	# Animasyon bitince sahneden sil
	await tween.finished
	queue_free()


# Eşya ID'sinden icon yolunu tahmin etme
func _get_icon_path_from_item(item: Dictionary) -> String:
	if item.has("icon_path") and item.icon_path != "":
		if ResourceLoader.exists(item.icon_path):
			return item.icon_path
		
	if item.has("slot_type"):
		var stype = str(item["slot_type"]).to_lower()
		if TYPE_ICONS.has(stype):
			return TYPE_ICONS[stype]

	if item.has("id"):
		var id_str := str(item["id"])
		var parts: Array = id_str.split("_")
		if parts.size() >= 2:
			var code := str(parts[1])
			var slot_type_from_code = ""
			match code:
				"W": slot_type_from_code = "weapon"
				"A": slot_type_from_code = "armor"
				"H": slot_type_from_code = "helmet"
				"P": slot_type_from_code = "pants"
				"G": slot_type_from_code = "gloves"
				"B": slot_type_from_code = "boots"
				"WR": slot_type_from_code = "bracelet"
				"N": slot_type_from_code = "necklace"
				"C": slot_type_from_code = "cloak"
				"BT": slot_type_from_code = "belt"
				"O": slot_type_from_code = "offhand"
			
			if TYPE_ICONS.has(slot_type_from_code):
				return TYPE_ICONS[slot_type_from_code]

	return "res://icon.svg"
