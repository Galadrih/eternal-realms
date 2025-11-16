extends Control
class_name CharacterCreator

# --------------------------------------------------------------------
#  UI NODE BAĞLANTILARI
# --------------------------------------------------------------------

# --- SOL PANEL ---
@onready var class_list: VBoxContainer = $MarginContainer/MainHBox/LeftPanel/ClassVBox/ClassList

# --- ORTA PANEL ---
@onready var preview_sprite: Sprite2D = $MarginContainer/MainHBox/CenterPanel/CenterVBox/PreviewFrame/PreviewCenter/PreviewSprite
@onready var current_class_label: Label = $MarginContainer/MainHBox/CenterPanel/CenterVBox/ClassSwitchHBox/CurrentClassLabel
@onready var next_class_button: Button = $MarginContainer/MainHBox/CenterPanel/CenterVBox/ClassSwitchHBox/NextClassButton
@onready var previous_class_button: Button = $MarginContainer/MainHBox/CenterPanel/CenterVBox/ClassSwitchHBox/PrevClassButton
@onready var name_input: LineEdit = $MarginContainer/MainHBox/CenterPanel/CenterVBox/NameHBox/NameInput

# --- SAĞ PANEL ---
@onready var class_name_label: Label = $MarginContainer/MainHBox/RightPanel/RightVBox/ClassNameLabel
@onready var lore_text: RichTextLabel = $MarginContainer/MainHBox/RightPanel/RightVBox/LoreText
@onready var role_label: Label = $MarginContainer/MainHBox/RightPanel/RightVBox/InfoVBox/RoleLabel
@onready var recommended_stats_label: Label = $MarginContainer/MainHBox/RightPanel/RightVBox/InfoVBox/RecommendedStatsLabel
@onready var difficulty_label: Label = $MarginContainer/MainHBox/RightPanel/RightVBox/InfoVBox/DifficultyLabel
@onready var create_button: Button = $MarginContainer/MainHBox/RightPanel/RightVBox/BottomButtonsHBox/CreateButton
@onready var back_button: Button = $MarginContainer/MainHBox/RightPanel/RightVBox/BottomButtonsHBox/BackButton

# --------------------------------------------------------------------
#  SINIF VERİLERİ
# --------------------------------------------------------------------

var class_data: Array[Dictionary] = [
	{
		"id": 0,
		"name": "Druid",
		"lore": "Eski ağaçların köklerinde yankılanan dualarla yetişen Druidler, yaşam ve çürüme döngüsünü gözetir. Ormanın nefesiyle iyileştirir, toprağın gazabıyla düşmanı boğar.",
		"sprite_path": "res://assets/sprites/classes/druid.png",
		"role": "Hibrit Destek/DPS",
		"stats": "INT, WIS, FOC",
		"difficulty": "★★"
	},
	{
		"id": 1,
		"name": "Berserker",
		"lore": "Savaşın çığlığıyla büyüyen, acıyı öfkeye dönüştüren savaşçılar. Onlar için yara izleri bir onur madalyasıdır.",
		"sprite_path": "res://assets/sprites/classes/berserker.png",
		"role": "Saf Melee DPS",
		"stats": "STR, VIT",
		"difficulty": "★★★"
	},
	{
		"id": 2,
		"name": "Elementalist",
		"lore": "Ateşin öfkesi, buzun sabrı ve yıldırımın kaprisiyle büyüyen bilge. Elementleri sırayla konuşturur.",
		"sprite_path": "res://assets/sprites/classes/elementalist.png",
		"role": "Ranged Burst AoE",
		"stats": "INT, FOC, WIS",
		"difficulty": "★★★"
	},
	{
		"id": 3,
		"name": "Monk",
		"lore": "Nefes ve yumruk bir olur. Denge bozulduğunda Monk, tek vuruşla fırtınayı dindirir.",
		"sprite_path": "res://assets/sprites/classes/monk.png",
		"role": "Yakın Hibrit",
		"stats": "DEX, FOC, VIT",
		"difficulty": "★★"
	},
	{
		"id": 4,
		"name": "Crusader",
		"lore": "İnançları kalkan, duaları kılıçtır. Karanlığın ortasında bir fener.",
		"sprite_path": "res://assets/sprites/classes/crusader.png",
		"role": "Tank / Destek",
		"stats": "VIT, STR, WIS",
		"difficulty": "★★★"
	},
	{
		"id": 5,
		"name": "Warden",
		"lore": "Ormanın bekçileri. Kurtların dili, kartalın gözü onlara sırrını fısıldar.",
		"sprite_path": "res://assets/sprites/classes/warden.png",
		"role": "Pet'li Hibrit",
		"stats": "DEX, STR, VIT",
		"difficulty": "★★★"
	},
	{
		"id": 6,
		"name": "Dragon Knight",
		"lore": "Ejderha kanı ile mühürlenen savaşçılar. Alev, damarlarında şarkı söyler.",
		"sprite_path": "res://assets/sprites/classes/dragon_knight.png",
		"role": "Tank / DPS",
		"stats": "STR, VIT, FOC",
		"difficulty": "★★★"
	},
	{
		"id": 7,
		"name": "Warlock",
		"lore": "Yasak anlaşmalar, kayıp ruhların tılsımları. Warlock gölgenin içinden güç devşirir.",
		"sprite_path": "res://assets/sprites/classes/warlock.png",
		"role": "Ranged DoT/Control",
		"stats": "INT, FOC, WIS",
		"difficulty": "★★★"
	},
	{
		"id": 8,
		"name": "Cleric",
		"lore": "Savaş meydanında umut ilahi bir şarkıdır; Cleric bunu kalplere işler.",
		"sprite_path": "res://assets/sprites/classes/cleric.png",
		"role": "Ana Şifacı",
		"stats": "WIS, FOC, VIT",
		"difficulty": "★★"
	},
	{
		"id": 9,
		"name": "Bard",
		"lore": "Savaşın ritmini Bard belirler. Bir ezgi, bir ordunun kaderini değiştirir.",
		"sprite_path": "res://assets/sprites/classes/bard.png",
		"role": "Saf Destek",
		"stats": "FOC, WIS, DEX",
		"difficulty": "★★"
	},
	{
		"id": 10,
		"name": "Necromancer",
		"lore": "Mezar sessizliği onların kütüphanesidir. Kemiklerden ordular kurar, ruhlardan mühürler yazdırırlar.",
		"sprite_path": "res://assets/sprites/classes/necromancer.png",
		"role": "Summoner / DoT",
		"stats": "INT, FOC, WIS",
		"difficulty": "★★★"
	},
	{
		"id": 11,
		"name": "Ranger",
		"lore": "Rüzgârın fısıltısını oklarının tüylerinde taşır. Av, daha adını duymadan düşer.",
		"sprite_path": "res://assets/sprites/classes/ranger.png",
		"role": "Ranged Physical",
		"stats": "DEX, FOC, VIT",
		"difficulty": "★★"
	}
]

var current_class_index: int = 0

# --------------------------------------------------------------------
#  READY
# --------------------------------------------------------------------

func _ready() -> void:
	_build_class_list()

	next_class_button.pressed.connect(_on_next_class)
	previous_class_button.pressed.connect(_on_previous_class)
	create_button.pressed.connect(_on_create_pressed)
	back_button.pressed.connect(_on_back_pressed)

	# Lore kutusu
	lore_text.autowrap_mode = TextServer.AUTOWRAP_WORD
	lore_text.fit_content = true

	_update_ui()

# --------------------------------------------------------------------
#  SOL PANEL – CLASS LİSTESİ
# --------------------------------------------------------------------

func _build_class_list() -> void:
	if class_list == null:
		push_error("CharacterCreator: class_list node'u bulunamadı.")
		return

	for child in class_list.get_children():
		child.queue_free()

	for i in range(class_data.size()):
		var data: Dictionary = class_data[i]
		var btn := Button.new()
		btn.text = String(data["name"])
		btn.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		btn.pressed.connect(_on_class_button.bind(i))
		class_list.add_child(btn)

func _on_class_button(index: int) -> void:
	current_class_index = clamp(index, 0, class_data.size() - 1)
	_update_ui()

# --------------------------------------------------------------------
#  CLASS GEÇİŞ BUTONLARI
# --------------------------------------------------------------------

func _on_next_class() -> void:
	current_class_index += 1
	if current_class_index >= class_data.size():
		current_class_index = 0
	_update_ui()

func _on_previous_class() -> void:
	current_class_index -= 1
	if current_class_index < 0:
		current_class_index = class_data.size() - 1
	_update_ui()

# --------------------------------------------------------------------
#  UI’YI GÜNCELLEYEN ANA FONKSİYON
# --------------------------------------------------------------------

func _update_ui() -> void:
	if class_data.is_empty():
		return

	var data: Dictionary = class_data[current_class_index]

	var class_name_str := String(data["name"])
	var lore := String(data["lore"])
	var role := String(data["role"])
	var stats := String(data["stats"])
	var diff := String(data.get("difficulty", ""))

	current_class_label.text = class_name_str

	if preview_sprite:
		var tex: Texture2D = load(String(data["sprite_path"]))
		if tex:
			preview_sprite.texture = tex
		else:
			push_warning("Sprite bulunamadı: %s" % [data["sprite_path"]])
	else:
		push_warning("preview_sprite node'u bulunamadı, texture atanamadı.")

	class_name_label.text = class_name_str

	lore_text.clear()
	lore_text.append_text(lore)
	lore_text.scroll_to_line(0)

	role_label.text = "Rol: %s" % role
	recommended_stats_label.text = "Önerilen Statlar: %s" % stats
	difficulty_label.text = "Zorluk: %s" % diff

# --------------------------------------------------------------------
#  CREATE BUTTON
# --------------------------------------------------------------------

func _on_create_pressed() -> void:
	var name_text := name_input.text.strip_edges()
	if name_text.is_empty():
		print("HATA: İsim boş olamaz!")
		return

	var data: Dictionary = class_data[current_class_index]

	PlayerData.character_name = name_text
	PlayerData.character_class_name = String(data["name"])
	PlayerData.character_class_id = int(data["id"])

	print("Karakter verisi kaydedildi. İsim: %s | Sınıf: %s (id=%d)"
		% [PlayerData.character_name, PlayerData.character_class_name, PlayerData.character_class_id])

	get_tree().change_scene_to_file("res://scenes/world.tscn")

# --------------------------------------------------------------------
#  BACK BUTTON
# --------------------------------------------------------------------

func _on_back_pressed() -> void:
	print("Geri butonu: Buradan main menü sahnesine dönebilirsin.")
	# get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
