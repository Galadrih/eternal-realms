extends Control
class_name CharacterCreator

# --------------------------------------------------------------------
#  UI NODE BAĞLANTILARI
# --------------------------------------------------------------------

# --- SOL PANEL ---
@onready var class_list: VBoxContainer = $MarginContainer/MainHBox/LeftPanel/ClassVBox/ClassScroll/ClassList

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
		"name": "Druid",
		"lore": "Eski ağaçların köklerinde yankılanan dualarla yetişen Druidler, yaşam ve çürüme döngüsünü gözetir. Ormanın nefesiyle iyileştirir, toprağın gazabıyla düşmanı boğar.",
		"sprite_path": "res://assets/sprites/classes/druid.png",
		"role": "Hibrit Destek / DPS",
		"stats": "INT, WIS, FOC",
		"difficulty": "★☆☆"
	},
	{
		"name": "Berserker",
		"lore": "Savaşın çığlığıyla büyüyen, acıyı öfkeye dönüştüren savaşçılar. Onlar için yara izleri bir onur madalyasıdır.",
		"sprite_path": "res://assets/sprites/classes/berserker.png",
		"role": "Saf Melee DPS",
		"stats": "STR, VIT",
		"difficulty": "★★☆"
	},
	{
		"name": "Elementalist",
		"lore": "Ateşin öfkesi, buzun sabrı ve yıldırımın kaprisiyle büyüyen bilge. Elementleri sırayla konuşturur.",
		"sprite_path": "res://assets/sprites/classes/elementalist.png",
		"role": "Ranged Burst AoE",
		"stats": "INT, FOC, WIS",
		"difficulty": "★★★"
	},
	# Diğer class’ları aynı formatta buraya ekleyebilirsin
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
	lore_text.text = lore
	role_label.text = "Rol: %s" % role
	recommended_stats_label.text = "Önerilen Statlar: %s" % stats
	difficulty_label.text = "Zorluk: %s" % diff

# --------------------------------------------------------------------
#  CREATE BUTTON
# --------------------------------------------------------------------

func _on_create_pressed() -> void:
	var character_name := name_input.text.strip_edges()
	if character_name.is_empty():
		print("HATA: İsim boş olamaz!")
		return

	var data: Dictionary = class_data[current_class_index]

	if typeof(PlayerData) != TYPE_NIL:
		PlayerData.character_name = character_name
		PlayerData.character_class_name = String(data["name"])
		PlayerData.character_class_id = current_class_index

	print("Karakter verisi kaydedildi. İsim: %s | Sınıf: %s"
		% [character_name, PlayerData.character_class_name])

	get_tree().change_scene_to_file("res://scenes/world.tscn")

# --------------------------------------------------------------------
#  BACK BUTTON
# --------------------------------------------------------------------

func _on_back_pressed() -> void:
	print("Geri butonu: Buradan main menü sahnesine dönebilirsin.")
	# get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
