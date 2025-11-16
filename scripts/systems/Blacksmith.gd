extends Node
class_name Blacksmith

# Maksimum + seviyesi
const MAX_UPGRADE := 15

# Metin2 tarzı başarı oranları
const SUCCESS_CHANCE := {
	0: 1.0,   # +0 → +1 (garanti)
	1: 0.95,  # +1 → +2
	2: 0.90,  # +2 → +3
	3: 0.80,  # +3 → +4
	4: 0.70,  # +4 → +5
	5: 0.60,  # +5 → +6
	6: 0.50,  # +6 → +7
	7: 0.45,  # +7 → +8
	8: 0.40,  # +8 → +9
	9: 0.30,  # +9 → +10
	10: 0.25, # +10 → +11
	11: 0.20, # +11 → +12
	12: 0.15, # +12 → +13
	13: 0.10, # +13 → +14
	14: 0.05, # +14 → +15
}

# Tek iş yapan fonksiyon: itemi alır, sonucu döner
# result: "success" | "destroy" | "max"
static func roll_upgrade(item: Dictionary) -> Dictionary:
	var upgrade: int = int(item.get("upgrade", 0))

	# Zaten max ise
	if upgrade >= MAX_UPGRADE:
		return {
			"result": "max",
			"item": item,
		}

	# Şans oranı
	var chance: float = SUCCESS_CHANCE.get(upgrade, 0.0)
	var roll := randf()

	# Debug istersen:
	# print("UPGRADE ROLL: +%d chance=%.2f roll=%.2f" % [upgrade, chance, roll])

	if roll <= chance:
		var upgraded_item := _compute_upgraded_item(item)
		return {
			"result": "success",
			"item": upgraded_item,
		}
	else:
		# Şimdilik Metin2 hard mode: kırılıyor :)
		return {
			"result": "destroy",
			"item": item,
		}


# Stat güncelleme — base_stats üzerinden hesaplar
static func _compute_upgraded_item(item: Dictionary) -> Dictionary:
	var new_item := item.duplicate(true)

	var upgrade: int = int(new_item.get("upgrade", 0))
	upgrade += 1
	new_item["upgrade"] = upgrade

	var stats: Dictionary = new_item.get("stats", {})
	var base_stats: Dictionary = new_item.get("base_stats", {})

	# İlk defa + basılıyorsa, mevcut statleri "base" olarak kaydediyoruz
	if base_stats.size() == 0:
		base_stats = stats.duplicate(true)
		new_item["base_stats"] = base_stats

	# Metin2 vibe: her + için ~%7 bonus
	var multiplier := 1.0 + (0.07 * float(upgrade))

	var new_stats := {}
	for key in base_stats.keys():
		var base_val := float(base_stats[key])
		new_stats[key] = int(round(base_val * multiplier))

	new_item["stats"] = new_stats
	return new_item
