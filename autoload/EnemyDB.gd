extends Node

const ENEMIES := {
	# LV 1 – Zayıf Kurt (başlangıç, agresif değil)
	"wolf_lv1": {
		"name": "Zayıf Kurt",
		"level": 1,
		"max_hp": 120,
		"damage": 15,
		"move_speed": 60.0,
		"exp": 25,
		"loot_table_id": "wolf_low",
		"sprite_path": "res://assets/enemies/wolf_lv1.png",

		# --- AI ---
		# Oyuncuyu kendi başına kovalamaz, sadece saldırı alınca agro olsun istersen enemy.gd'de kontrol ederiz.
		"is_aggressive": false,
		# Yine de agresifleştiğinde (vurulduğunda vs.) kullanabileceğimiz menzil
		"aggro_range": 220.0,
		# Doğduğu noktadan ne kadar uzağa kadar kovalar
		"leash_radius": 400.0,
		# Kendi etrafında ne kadar alanda dolaşabilir
		"wander_radius": 120.0,
	},

	# LV 3 – Aç Kurt (hafif agresif)
	"wolf_lv3": {
		"name": "Aç Kurt",
		"level": 3,
		"max_hp": 180,
		"damage": 24,
		"move_speed": 65.0,
		"exp": 50,
		"loot_table_id": "wolf_low",
		"sprite_path": "res://assets/enemies/wolf_lv3.png",

		# --- AI ---
		"is_aggressive": false,
		"aggro_range": 260.0,
		"leash_radius": 450.0,
		"wander_radius": 150.0,
	},

	# LV 5 – Genç Alfa Kurt
	"wolf_lv5": {
		"name": "Genç Alfa Kurt",
		"level": 5,
		"max_hp": 260,
		"damage": 36,
		"move_speed": 70.0,
		"exp": 90,
		"loot_table_id": "wolf_mid",
		"sprite_path": "res://assets/enemies/wolf_lv5.png",

		# --- AI ---
		"is_aggressive": true,
		"aggro_range": 280.0,
		"leash_radius": 500.0,
		"wander_radius": 180.0,
	},

	# LV 8 – Gri Alfa Kurt
	"wolf_lv8": {
		"name": "Gri Alfa Kurt",
		"level": 8,
		"max_hp": 360,
		"damage": 50,
		"move_speed": 75.0,
		"exp": 150,
		"loot_table_id": "wolf_mid",
		"sprite_path": "res://assets/enemies/wolf_lv8.png",

		# --- AI ---
		"is_aggressive": false,
		"aggro_range": 320.0,
		"leash_radius": 550.0,
		"wander_radius": 220.0,
	},

	# LV 12 – Kanlı Alfa Kurt
	"wolf_lv12": {
		"name": "Kanlı Alfa Kurt",
		"level": 12,
		"max_hp": 520,
		"damage": 70,
		"move_speed": 80.0,
		"exp": 240,
		"loot_table_id": "wolf_high",
		"sprite_path": "res://assets/enemies/wolf_lv12.png",

		# --- AI ---
		"is_aggressive": true,
		"aggro_range": 360.0,
		"leash_radius": 600.0,
		"wander_radius": 260.0,
	},

	# LV 15 – Alfa Kurt Lideri (mini boss)
	"wolf_lv15": {
		"name": "Alfa Kurt Lideri",
		"level": 15,
		"max_hp": 1400,
		"damage": 95,
		"move_speed": 85.0,
		"exp": 360,
		"loot_table_id": "wolf_high",
		"sprite_path": "res://assets/enemies/wolf_lv15.png",

		# --- AI ---
		"is_aggressive": true,
		"aggro_range": 400.0,
		"leash_radius": 650.0,
		"wander_radius": 300.0,
	},
}
