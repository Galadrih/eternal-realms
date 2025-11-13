extends CanvasLayer

# --- TEMEL DEĞERLER ---
var player_node = null

# --- ARAYÜZ REFERANSLARI (DÜZELTİLDİ: % yerine $ kullanıldı) ---
# Bu yollar 'CharacterSheet.tscn' sahnesindeki node yapına göre ayarlandı

# Ana Paneller
@onready var main_layout = $MainPanel/MarginContainer/MainLayout
@onready var base_stats_grid = main_layout.get_node("StatsLayout/BaseStatsLayout/BaseStatsGrid")
@onready var derived_stats_grid = main_layout.get_node("StatsLayout/ScrollContainer/DerivedStatsLayout/DerivedStatsGrid")

# Temel Bilgiler
@onready var level_label = main_layout.get_node("LevelLabel")
@onready var points_label = main_layout.get_node("PointsLabel")

# Temel Stat Labelları
@onready var str_value_label = base_stats_grid.get_node("str_value_label")
@onready var dex_value_label = base_stats_grid.get_node("dex_value_label")
@onready var vit_value_label = base_stats_grid.get_node("vit_value_label")
@onready var int_value_label = base_stats_grid.get_node("int_value_label")
@onready var wis_value_label = base_stats_grid.get_node("wis_value_label")
@onready var foc_value_label = base_stats_grid.get_node("foc_value_label")

# Temel Stat Butonları
@onready var str_plus_button = base_stats_grid.get_node("str_plus_button")
@onready var dex_plus_button = base_stats_grid.get_node("dex_plus_button")
@onready var vit_plus_button = base_stats_grid.get_node("vit_plus_button")
@onready var int_plus_button = base_stats_grid.get_node("int_plus_button")
@onready var wis_plus_button = base_stats_grid.get_node("wis_plus_button")
@onready var foc_plus_button = base_stats_grid.get_node("foc_plus_button")

@onready var plus_buttons = [
	str_plus_button, dex_plus_button, vit_plus_button, 
	int_plus_button, wis_plus_button, foc_plus_button
]

# Yan Stat Labelları
@onready var pap_value_label = derived_stats_grid.get_node("pap_value_label")
@onready var map_value_label = derived_stats_grid.get_node("map_value_label")
@onready var healp_value_label = derived_stats_grid.get_node("healp_value_label")
@onready var pcrit_value_label = derived_stats_grid.get_node("pcrit_value_label")
@onready var mcrit_value_label = derived_stats_grid.get_node("mcrit_value_label")
@onready var max_hp_value_label = derived_stats_grid.get_node("max_hp_value_label")
@onready var max_mp_value_label = derived_stats_grid.get_node("max_mp_value_label")
@onready var pdef_value_label = derived_stats_grid.get_node("pdef_value_label")
@onready var mdef_value_label = derived_stats_grid.get_node("mdef_value_label")
@onready var evasion_value_label = derived_stats_grid.get_node("evasion_value_label")
@onready var aspd_value_label = derived_stats_grid.get_node("aspd_value_label")
@onready var cspd_value_label = derived_stats_grid.get_node("cspd_value_label")
@onready var hp_regen_value_label = derived_stats_grid.get_node("hp_regen_value_label")
@onready var mp_regen_value_label = derived_stats_grid.get_node("mp_regen_value_label")
@onready var debuff_resist_value_label = derived_stats_grid.get_node("debuff_resist_value_label")
@onready var debuff_success_value_label = derived_stats_grid.get_node("debuff_success_value_label")

# Kapatma Butonu
@onready var close_button = main_layout.get_node("CloseButton")

# --- GODOT FONKSİYONLARI ---
func _ready():
	# 1. Panel varsayılan olarak gizli başlasın
	self.visible = false
	
	# 2. Kapatma butonunu bağla
	close_button.pressed.connect(_on_close_button_pressed)
	
	# 3. Tüm '+' butonlarını tek bir fonksiyona bağla
	str_plus_button.pressed.connect(_on_stat_plus_pressed.bind("STR"))
	dex_plus_button.pressed.connect(_on_stat_plus_pressed.bind("DEX"))
	vit_plus_button.pressed.connect(_on_stat_plus_pressed.bind("VIT"))
	int_plus_button.pressed.connect(_on_stat_plus_pressed.bind("INT"))
	wis_plus_button.pressed.connect(_on_stat_plus_pressed.bind("WIS"))
	foc_plus_button.pressed.connect(_on_stat_plus_pressed.bind("FOC"))

# --- ARAYÜZ KONTROL FONKSİYONLARI ---

func set_player(player):
	player_node = player

# Paneli aç/kapa
func toggle():
	self.visible = not self.visible

func _on_close_button_pressed():
	self.visible = false

# DÜZELTME: Bu fonksiyon artık TÜM statları güncelliyor
func update_stats(stats_payload: Dictionary):
	# Temel Bilgiler
	level_label.text = "Seviye: " + str(stats_payload.level)
	points_label.text = "Kalan Puan: " + str(stats_payload.points_available)
	
	# Temel Statlar 
	str_value_label.text = str(stats_payload.str)
	dex_value_label.text = str(stats_payload.dex)
	vit_value_label.text = str(stats_payload.vit)
	int_value_label.text = str(stats_payload.int)
	wis_value_label.text = str(stats_payload.wis)
	foc_value_label.text = str(stats_payload.foc)
	
	# '+' Butonlarının Tıklanabilirliği
	# Eğer harcanacak puan (points_available) YOKSA (0 veya daha azsa), butonları devre dışı bırak
	var has_points = (stats_payload.points_available > 0)
	for button in plus_buttons:
		button.disabled = not has_points # 'has_points' true ise, 'disabled' false olur.
	
	# --- Yan Statlar (Formüllerden gelen) ---
	# %.1f (float'ı bir ondalık basamakla göster)
	# %d (integer/tam sayı)
	pap_value_label.text = "%d" % stats_payload.pap
	map_value_label.text = "%d" % stats_payload.map
	healp_value_label.text = "%d" % stats_payload.healp
	max_hp_value_label.text = "%d" % stats_payload.max_hp
	max_mp_value_label.text = "%d" % stats_payload.max_mp
	
	pcrit_value_label.text = "%.1f%%" % stats_payload.pcrit
	mcrit_value_label.text = "%.1f%%" % stats_payload.mcrit
	pdef_value_label.text = "%.1f%%" % stats_payload.pdef
	mdef_value_label.text = "%.1f%%" % stats_payload.mdef
	evasion_value_label.text = "%.1f%%" % stats_payload.evasion
	aspd_value_label.text = "%.1f%%" % stats_payload.aspd
	cspd_value_label.text = "%.1f%%" % stats_payload.cspd
	debuff_resist_value_label.text = "%.1f%%" % stats_payload.debuff_resist
	debuff_success_value_label.text = "%.1f%%" % stats_payload.debuff_success
	
	hp_regen_value_label.text = "%.1f" % stats_payload.hp_regen
	mp_regen_value_label.text = "%.1f" % stats_payload.mp_regen
	
	print("Karakter Penceresi güncellendi. Kalan Puan: ", stats_payload.points_available)


# '+' Butonlarından herhangi birine basıldığında çalışır
func _on_stat_plus_pressed(stat_name: String):
	if player_node:
		# PlayerBase.gd'deki 'increase_stat' fonksiyonunu çağır
		player_node.increase_stat(stat_name)
	else:
		print("HATA: CharacterSheet, player_node'a bağlı değil!")
