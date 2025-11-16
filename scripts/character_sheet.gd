extends CanvasLayer

# --- TEMEL DEĞERLER ---
var player_node: Node = null

# --- ARAYÜZ REFERANSLARI ---

# Ana Paneller
@onready var main_layout = $MainPanel/MarginContainer/MainLayout
@onready var base_stats_grid = main_layout.get_node("StatsLayout/BaseStatsLayout/BaseStatsGrid")
@onready var derived_stats_grid = main_layout.get_node("StatsLayout/ScrollContainer/DerivedStatsLayout/DerivedStatsGrid")

# Temel Bilgiler
@onready var level_label: Label = main_layout.get_node("LevelLabel")
@onready var points_label: Label = main_layout.get_node("PointsLabel")

# Temel Stat Labelları
@onready var str_value_label: Label = base_stats_grid.get_node("str_value_label")
@onready var dex_value_label: Label = base_stats_grid.get_node("dex_value_label")
@onready var vit_value_label: Label = base_stats_grid.get_node("vit_value_label")
@onready var int_value_label: Label = base_stats_grid.get_node("int_value_label")
@onready var wis_value_label: Label = base_stats_grid.get_node("wis_value_label")
@onready var foc_value_label: Label = base_stats_grid.get_node("foc_value_label")

# Temel Stat Butonları
@onready var str_plus_button: Button = base_stats_grid.get_node("str_plus_button")
@onready var dex_plus_button: Button = base_stats_grid.get_node("dex_plus_button")
@onready var vit_plus_button: Button = base_stats_grid.get_node("vit_plus_button")
@onready var int_plus_button: Button = base_stats_grid.get_node("int_plus_button")
@onready var wis_plus_button: Button = base_stats_grid.get_node("wis_plus_button")
@onready var foc_plus_button: Button = base_stats_grid.get_node("foc_plus_button")

@onready var plus_buttons: Array = [
	str_plus_button, dex_plus_button, vit_plus_button,
	int_plus_button, wis_plus_button, foc_plus_button
]

# Yan Stat Labelları (Mevcut)
@onready var pap_value_label: Label = derived_stats_grid.get_node("pap_value_label")
@onready var map_value_label: Label = derived_stats_grid.get_node("map_value_label")
@onready var healp_value_label: Label = derived_stats_grid.get_node("healp_value_label")
@onready var pcrit_value_label: Label = derived_stats_grid.get_node("pcrit_value_label")
@onready var mcrit_value_label: Label = derived_stats_grid.get_node("mcrit_value_label")
@onready var max_hp_value_label: Label = derived_stats_grid.get_node("max_hp_value_label")
@onready var max_mp_value_label: Label = derived_stats_grid.get_node("max_mp_value_label")
@onready var pdef_value_label: Label = derived_stats_grid.get_node("pdef_value_label")
@onready var mdef_value_label: Label = derived_stats_grid.get_node("mdef_value_label")
@onready var evasion_value_label: Label = derived_stats_grid.get_node("evasion_value_label")
@onready var aspd_value_label: Label = derived_stats_grid.get_node("aspd_value_label")
@onready var cspd_value_label: Label = derived_stats_grid.get_node("cspd_value_label")
@onready var hp_regen_value_label: Label = derived_stats_grid.get_node("hp_regen_value_label")
@onready var mp_regen_value_label: Label = derived_stats_grid.get_node("mp_regen_value_label")
@onready var debuff_resist_value_label: Label = derived_stats_grid.get_node("debuff_resist_value_label")
@onready var debuff_success_value_label: Label = derived_stats_grid.get_node("debuff_success_value_label")

# --- YENİ EKLENEN YAN STAT LABELLARI ---
@onready var pcrit_dmg_value_label: Label = derived_stats_grid.get_node("pcrit_dmg_value_label")
@onready var mcrit_dmg_value_label: Label = derived_stats_grid.get_node("mcrit_dmg_value_label")
@onready var heal_crit_value_label: Label = derived_stats_grid.get_node("heal_crit_value_label")
@onready var block_value_label: Label = derived_stats_grid.get_node("block_value_label")
@onready var mana_reduc_value_label: Label = derived_stats_grid.get_node("mana_reduc_value_label")
@onready var cdr_value_label: Label = derived_stats_grid.get_node("cdr_value_label")
@onready var buff_dur_value_label: Label = derived_stats_grid.get_node("buff_dur_value_label")
@onready var p_pierce_value_label: Label = derived_stats_grid.get_node("p_pierce_value_label")

# Kapatma Butonu
@onready var close_button: Button = main_layout.get_node("CloseButton")


func _ready() -> void:
	# Panel varsayılan olarak kapalı
	visible = false

	# Kapatma butonu
	close_button.pressed.connect(_on_close_button_pressed)

	# '+' butonlarını bağla
	str_plus_button.pressed.connect(_on_stat_plus_pressed.bind("STR"))
	dex_plus_button.pressed.connect(_on_stat_plus_pressed.bind("DEX"))
	vit_plus_button.pressed.connect(_on_stat_plus_pressed.bind("VIT"))
	int_plus_button.pressed.connect(_on_stat_plus_pressed.bind("INT"))
	wis_plus_button.pressed.connect(_on_stat_plus_pressed.bind("WIS"))
	foc_plus_button.pressed.connect(_on_stat_plus_pressed.bind("FOC"))


# =====================================================
# PLAYER BAĞLAMA / AÇ KAPA
# =====================================================

func set_player(player: Node) -> void:
	# Eski player varsa sinyali kopar
	if player_node != null:
		if player_node.is_connected("stats_updated", Callable(self, "update_stats")):
			player_node.disconnect("stats_updated", Callable(self, "update_stats"))

	player_node = player

	if player_node == null:
		return

	# Yeni player'ın sinyaline bağlan
	if not player_node.is_connected("stats_updated", Callable(self, "update_stats")):
		player_node.stats_updated.connect(update_stats)

	# Hemen ilk stat paketini almak için zorla hesaplat
	if player_node.has_method("recalculate_derived_stats"):
		player_node.recalculate_derived_stats()


# Paneli aç/kapa (World/Main sahnesi burayı çağırıyor)
func toggle() -> void:
	visible = not visible


func _on_close_button_pressed() -> void:
	visible = false


# =====================================================
#  STAT GÜNCELLEME (GÜNCELLENDİ)
# =====================================================

func update_stats(stats_payload: Dictionary) -> void:
	# --- Temel Bilgiler ---
	var level: int = int(stats_payload.get("level", 1))
	var points: int = int(stats_payload.get("points_available", 0))

	level_label.text = "Seviye: %d" % level
	points_label.text = "Kalan Puan: %d" % points

	# --- Temel Statlar ---
	var str_val: int = int(stats_payload.get("str", 0))
	var dex_val: int = int(stats_payload.get("dex", 0))
	var vit_val: int = int(stats_payload.get("vit", 0))
	var int_val: int = int(stats_payload.get("int", 0))
	var wis_val: int = int(stats_payload.get("wis", 0))
	var foc_val: int = int(stats_payload.get("foc", 0))

	str_value_label.text = str(str_val)
	dex_value_label.text = str(dex_val)
	vit_value_label.text = str(vit_val)
	int_value_label.text = str(int_val)
	wis_value_label.text = str(wis_val)
	foc_value_label.text = str(foc_val)

	# --- '+' Butonları ---
	var has_points: bool = points > 0
	for button in plus_buttons:
		button.disabled = not has_points

	# --- Yan Statlar (Mevcut) ---
	var pap: int = int(stats_payload.get("pap", 0))
	var map: int = int(stats_payload.get("map", 0))
	var healp: int = int(stats_payload.get("healp", 0))
	var max_hp: int = int(stats_payload.get("max_hp", 0))
	var max_mp: int = int(stats_payload.get("max_mp", 0))

	var pcrit: float = float(stats_payload.get("pcrit", 0.0))
	var mcrit: float = float(stats_payload.get("mcrit", 0.0))
	var pdef: float = float(stats_payload.get("pdef", 0.0))
	var mdef: float = float(stats_payload.get("mdef", 0.0))
	var evasion: float = float(stats_payload.get("evasion", 0.0))
	var aspd: float = float(stats_payload.get("aspd", 0.0))
	var cspd: float = float(stats_payload.get("cspd", 0.0))

	var debuff_resist: float = float(stats_payload.get("debuff_resist", 0.0))
	var debuff_success: float = float(stats_payload.get("debuff_success", 0.0))

	var hp_regen: float = float(stats_payload.get("hp_regen", 0.0))
	var mp_regen: float = float(stats_payload.get("mp_regen", 0.0))
	
	# --- Yan Statlar (YENİ EKLENENLER) ---
	var pcrit_dmg: float = float(stats_payload.get("pcrit_dmg", 150.0))
	var mcrit_dmg: float = float(stats_payload.get("mcrit_dmg", 150.0))
	var heal_crit: float = float(stats_payload.get("heal_crit", 0.0))
	var block: float = float(stats_payload.get("block", 0.0))
	var mana_reduc: float = float(stats_payload.get("mana_reduc", 0.0))
	var cdr: float = float(stats_payload.get("cdr", 0.0))
	var buff_dur: float = float(stats_payload.get("buff_dur", 0.0))
	var p_pierce: float = float(stats_payload.get("p_pierce", 0.0))


	# --- UI'ya yansıt (Mevcut) ---
	pap_value_label.text = "%d" % pap
	map_value_label.text = "%d" % map
	healp_value_label.text = "%d" % healp
	max_hp_value_label.text = "%d" % max_hp
	max_mp_value_label.text = "%d" % max_mp

	pcrit_value_label.text = "%.1f%%" % pcrit
	mcrit_value_label.text = "%.1f%%" % mcrit
	pdef_value_label.text = "%.1f%%" % pdef
	mdef_value_label.text = "%.1f%%" % mdef
	evasion_value_label.text = "%.1f%%" % evasion
	aspd_value_label.text = "%.1f%%" % aspd
	cspd_value_label.text = "%.1f%%" % cspd
	debuff_resist_value_label.text = "%.1f%%" % debuff_resist
	debuff_success_value_label.text = "%.1f%%" % debuff_success

	hp_regen_value_label.text = "%.1f" % hp_regen
	mp_regen_value_label.text = "%.1f" % mp_regen
	
	# --- UI'ya yansıt (YENİ EKLENENLER) ---
	pcrit_dmg_value_label.text = "%.1f%%" % pcrit_dmg
	mcrit_dmg_value_label.text = "%.1f%%" % mcrit_dmg
	heal_crit_value_label.text = "%.1f%%" % heal_crit
	block_value_label.text = "%.1f%%" % block
	mana_reduc_value_label.text = "%.1f%%" % mana_reduc
	cdr_value_label.text = "%.1f%%" % cdr
	buff_dur_value_label.text = "%.1f%%" % buff_dur
	p_pierce_value_label.text = "%.1f%%" % p_pierce

	print("CharacterSheet → statlar güncellendi. Puan:", points)



# '+' Butonlarından herhangi birine basıldığında çalışır
func _on_stat_plus_pressed(stat_name: String) -> void:
	if player_node:
		if player_node.has_method("increase_stat"):
			player_node.increase_stat(stat_name)
	else:
		print("HATA: CharacterSheet, player_node'a bağlı değil!")
