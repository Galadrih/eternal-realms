extends Control

# --- Arayüz Düğüm Bağlantıları ---
# Godot 4'te node'lara kolayca erişmek için @onready var kullanırız.
@onready var class_name_label = $MainLayout/ClassNameLabel
@onready var class_sprite = $MainLayout/ClassDisplayLayout/ClassSprite
@onready var lore_text = $MainLayout/LoreText
@onready var name_input = $MainLayout/InputLayout/NameInput

@onready var next_button = $MainLayout/ClassDisplayLayout/NextButton
@onready var previous_button = $MainLayout/ClassDisplayLayout/PreviousButton
@onready var create_button = $MainLayout/ConfirmationLayout/CreateButton

# --- Sınıf Veritabanı ---
# 12 sınıfın tüm bilgileri bu dizide (Array) tutulacak.
var class_data = [
	{
		"name": "Druid",
		"lore": "Eski ağaçların köklerinde yankılanan dualarla yetişen Druidler, yaşam ve çürüme döngüsünü gözetir. Ormanın nefesiyle iyileştirir, toprağın gazabıyla düşmanı boğar.",
		"sprite_path": "res://assets/sprites/classes/druid.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Hibrit Destek/DPS",
		"stats": "INT, WIS, FOC"
	},
	{
		"name": "Berserker",
		"lore": "Savaşın çığlığıyla büyüyen, acıyı öfkeye dönüştüren savaşçılar. Onlar için yara izleri bir onur madalyasıdır.",
		"sprite_path": "res://assets/sprites/classes/berserker.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Saf Melee DPS",
		"stats": "STR, VIT"
	},
	{
		"name": "Elementalist",
		"lore": "Ateşin öfkesi, buzun sabrı ve yıldırımın kaprisiyle büyüyen bilge. Elementleri sırayla konuşturur.",
		"sprite_path": "res://assets/sprites/classes/elementalist.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Ranged Burst AoE",
		"stats": "INT, FOC, WIS"
	},
	{
		"name": "Monk",
		"lore": "Nefes ve yumruk bir olur. Denge bozulduğunda Monk, tek vuruşla fırtınayı dindirir.",
		"sprite_path": "res://assets/sprites/classes/monk.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Yakın Hibrit",
		"stats": "DEX, FOC, VIT"
	},
	{
		"name": "Crusader",
		"lore": "İnançları kalkan, duaları kılıçtır. Karanlığın ortasında bir fener.",
		"sprite_path": "res://assets/sprites/classes/crusader.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Tank / Destek",
		"stats": "VIT, STR, WIS"
	},
	{
		"name": "Warden",
		"lore": "Ormanın bekçileri. Kurtların dili, kartalın gözü onlara sırrını fısıldar.",
		"sprite_path": "res://assets/sprites/classes/warden.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Pet'li Hibrit",
		"stats": "DEX, STR, VIT"
	},
	{
		"name": "Dragon Knight",
		"lore": "Ejderha kanı ile mühürlenen savaşçılar. Alev, damarlarında şarkı söyler.",
		"sprite_path": "res://assets/sprites/classes/dragon_knight.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Tank / DPS",
		"stats": "STR, VIT, FOC"
	},
	{
		"name": "Warlock",
		"lore": "Yasak anlaşmalar, kayıp ruhların tılsımları. Warlock gölgenin içinden güç devşirir.",
		"sprite_path": "res://assets/sprites/classes/warlock.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Ranged DoT/Control",
		"stats": "INT, FOC, WIS"
	},
	{
		"name": "Cleric",
		"lore": "Savaş meydanında umut ilahi bir şarkıdır; Cleric bunu kalplere işler.",
		"sprite_path": "res://assets/sprites/classes/cleric.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Ana Şifacı",
		"stats": "WIS, FOC, VIT"
	},
	{
		"name": "Bard",
		"lore": "Savaşın ritmini Bard belirler. Bir ezgi, bir ordunun kaderini değiştirir.",
		"sprite_path": "res://assets/sprites/classes/bard.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Saf Destek",
		"stats": "FOC, WIS, DEX"
	},
	{
		"name": "Necromancer",
		"lore": "Mezar sessizliği onların kütüphanesidir. Kemiklerden ordular kurar, ruhlardan mühürler yazdırırlar.",
		"sprite_path": "res://assets/sprites/classes/necromancer.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Summoner / DoT",
		"stats": "INT, FOC, WIS"
	},
	{
		"name": "Ranger",
		"lore": "Rüzgârın fısıltısını oklarının tüylerinde taşır. Av, daha adını duymadan düşer.",
		"sprite_path": "res://assets/sprites/classes/ranger.png", # BU YOLU KENDİNE GÖRE DÜZELT
		"role": "Ranged Physical",
		"stats": "DEX, FOC, VIT"
	}
]

var current_class_index = 0

# --- Godot Fonksiyonları ---

# Sahne ilk yüklendiğinde çalışır
func _ready():
	# Butonların sinyallerini bu scripte bağla
	# (Bunu bir sonraki adımda manuel yapacağız ama kodla da olur)
	next_button.pressed.connect(_on_NextButton_pressed)
	previous_button.pressed.connect(_on_PreviousButton_pressed)
	create_button.pressed.connect(_on_CreateButton_pressed)
	
	# Arayüzü ilk sınıf (Druid) ile güncelle
	update_ui(current_class_index)


# Arayüzü güncelleyen ana fonksiyon
func update_ui(index):
	# Veriyi al
	var data = class_data[index]
	
	# Arayüzü güncelle
	class_name_label.text = data.name
	lore_text.text = data.lore + "\n\nRol: " + data.role + "\nÖnerilen Statlar: " + data.stats
	
	# Sprite'ı yükle
	# NOT: Eğer sprite'ı bulamazsa oyun çöker. Dosya yollarını kontrol et!
	var sprite_texture = load(data.sprite_path)
	if sprite_texture:
		class_sprite.texture = sprite_texture
	else:
		print("HATA: Sprite bulunamadı! Yol: ", data.sprite_path)


# --- Sinyal Fonksiyonları ---

func _on_NextButton_pressed():
	current_class_index += 1
	# Eğer son sınıfa geldiysek başa dön (index 11'i geçerse 0 yap)
	if current_class_index >= class_data.size():
		current_class_index = 0
	
	update_ui(current_class_index)


func _on_PreviousButton_pressed():
	current_class_index -= 1
	# Eğer ilk sınıftan geriye gittiysek sona dön (0'dan küçükse son index yap)
	if current_class_index < 0:
		current_class_index = class_data.size() - 1
	
	update_ui(current_class_index)


func _on_CreateButton_pressed():
	var character_name = name_input.text
	
	# İsim kontrolü
	if character_name.strip_edges().is_empty():
		print("HATA: İsim boş olamaz!")
		# (İleride buraya bir hata mesajı pop-up'ı ekleriz)
		return

	# --- YENİ KISIM ---
	
	# 1. Veriyi global PlayerData'ya kaydet
	PlayerData.character_name = character_name
	PlayerData.character_class_name = class_data[current_class_index].name
	PlayerData.character_class_id = current_class_index # ID olarak index'i kullanmak en kolayı

	print("Karakter verisi kaydedildi. İsim: ", PlayerData.character_name, " | Sınıf: ", PlayerData.character_class_name)
	
	# 2. Ana oyun sahnesine geçiş yap
	# ÖNEMLİ: "res://world.tscn" yolunu kendi ana oyun sahnenin yoluyla değiştir!
	var world_scene_path = "res://scenes/world.tscn" 
	
	# Sahneye geçişi başlat
	get_tree().change_scene_to_file(world_scene_path)
