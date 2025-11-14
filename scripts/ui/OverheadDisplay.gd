extends VBoxContainer # DİKKAT: Artık Node2D değil, VBoxContainer

@onready var health_bar: ProgressBar = $HealthBar
@onready var name_label: Label = $NameLabel
@onready var level_label: Label = $LevelLabel

# Can Barı Stilleri
var health_bar_bg_style = StyleBoxFlat.new()
var health_bar_fill_style = StyleBoxFlat.new()

func _ready():
	# --- Can Barı Stillerini Kod ile Ayarla (Görünmezlik sorununu çözer) ---
	health_bar_bg_style.bg_color = Color(0.1, 0.1, 0.1, 0.7) # Koyu gri arka plan
	health_bar_bg_style.corner_radius_bottom_left = 2
	health_bar_bg_style.corner_radius_bottom_right = 2
	health_bar_bg_style.corner_radius_top_left = 2
	health_bar_bg_style.corner_radius_top_right = 2
	
	health_bar_fill_style.corner_radius_bottom_left = 2
	health_bar_fill_style.corner_radius_bottom_right = 2
	health_bar_fill_style.corner_radius_top_left = 2
	health_bar_fill_style.corner_radius_top_right = 2
	
	health_bar.add_theme_stylebox_override("background", health_bar_bg_style)
	health_bar.add_theme_stylebox_override("fill", health_bar_fill_style)
	
	# Başlangıçta gizle
	health_bar.visible = false
	health_bar.value = 0
	# ------------------------------------------------------------------

# Düşman veya Oyuncu tarafından bir kez çağrılır
func set_data(entity_name: String, entity_level: int, name_color: Color, level_color: Color):
	# 1. İsim ve Rengi Ayarla
	name_label.text = entity_name
	name_label.add_theme_color_override("font_color", name_color)
	
	# 2. Level ve Rengi Ayarla
	level_label.text = "Lv." + str(entity_level)
	level_label.add_theme_color_override("font_color", level_color)
	
	# Can barı rengini ayarla
	if name_color == Color.RED: # Düşman ise
		health_bar_fill_style.bg_color = Color("e03a3e") # Canlı Kırmızı
	else: # Oyuncu ise (Mavi isim)
		health_bar_fill_style.bg_color = Color("4caf50") # Canlı Yeşil

# health_updated sinyaline bağlanacak fonksiyon
func update_health(current_hp: float, max_hp: float):
	health_bar.max_value = max_hp
	health_bar.value = current_hp
	
	if current_hp >= max_hp:
		health_bar.visible = false
	else:
		health_bar.visible = true
