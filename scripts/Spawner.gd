extends Node2D # Spawner'ımız bir pozisyona sahip olmalı

# Bu spawner'ın hangi düşman sahnesini yaratacağını belirler (Enemy.tscn)
@export var enemy_scene: PackedScene

# Bu spawner açıldığında kaç tane düşman doğuracak?
@export var spawn_count: int = 3

# SpawnManager tarafından mesafeye göre atanacak enemy_id
# (SpawnManager.gd’de: new_spawner.enemy_id_for_spawns = _pick_enemy_id_for_position(...))
@export var enemy_id_for_spawns: StringName = &""

# Eski sistem: level aralığına göre EnemyDb'den id çekmek için
@export var min_level: int = 1
@export var max_level: int = 15

var enemy_db: Node = null


func _ready() -> void:
	enemy_db = _find_enemy_db()
	if enemy_db == null:
		push_warning("Spawner '%s': EnemyDb bulunamadı, varsayılan export değerleri kullanılacak." % name)
	
	spawn_group()


func _find_enemy_db() -> Node:
	var root := get_tree().root

	# 1) En muhtemel isimler (Autoload Name kısmında hangisini yazdıysan ona göre)
	var possible_names = ["EnemyDb", "EnemyDB", "enemy_db"]
	for n in possible_names:
		var node := root.get_node_or_null(n)
		if node != null:
			print("Spawner '%s': EnemyDb bulundu. İsim: %s" % [name, n])
			return node

	# 2) Hâlâ bulamadıysak, root çocuklarını listele ve debug için isimlerini yaz
	print("Spawner '%s': /root altındaki çocuklar:" % name)
	for child in root.get_children():
		print("  - ", child.name)

	return null


func spawn_group() -> void:
	if enemy_scene == null:
		print("HATA: Spawner (", name, ") içinde hangi enemy_scene'in spawn edileceği seçilmemiş!")
		return

	for i in range(spawn_count):
		var new_enemy = enemy_scene.instantiate()
		if new_enemy == null:
			push_warning("Spawner '%s': enemy_scene instantiate başarısız!" % name)
			continue

		# --- 1) ÖNCE SpawnManager'dan gelen enemy_id_for_spawns'ı kullan ---
		var final_enemy_id: String = str(enemy_id_for_spawns)

		# Eğer SpawnManager bu spawner için özel id set etmediyse (boşsa),
		# eski mantığa dön: min_level–max_level aralığından EnemyDb'den rastgele id çek.
		if final_enemy_id == "" and enemy_db != null:
			final_enemy_id = _get_random_enemy_id_for_level_range(min_level, max_level)

		# Sonuçta elimizde geçerli bir id varsa Enemy scriptine yaz
		if final_enemy_id != "" and "enemy_id" in new_enemy:
			new_enemy.enemy_id = final_enemy_id

			# EnemyDb'de level bilgisi varsa enemy_level'ı da senkronla (opsiyonel ama güzel)
			if enemy_db != null and ("ENEMIES" in enemy_db):
				var enemies_dict: Dictionary = enemy_db.ENEMIES
				if enemies_dict.has(final_enemy_id):
					var data = enemies_dict[final_enemy_id]
					if data is Dictionary and data.has("level") and "enemy_level" in new_enemy:
						new_enemy.enemy_level = int(data["level"])

		# Düşmanı spawner çevresine hafif random offset ile spawnla
		var offset_radius: float = 48.0
		var random_dir: Vector2 = Vector2.RIGHT.rotated(randf_range(0.0, TAU))
		var random_dist: float = randf_range(0.0, offset_radius)
		var spawn_pos: Vector2 = global_position + random_dir * random_dist

		new_enemy.global_position = spawn_pos
		get_parent().add_child.call_deferred(new_enemy)

	print(name, " spawner'ı ", spawn_count, " adet düşman yarattı. (Lv %d–%d, enemy_id_for_spawns='%s')" %
		[min_level, max_level, str(enemy_id_for_spawns)])


func _get_random_enemy_id_for_level_range(min_lvl: int, max_lvl: int) -> String:
	if enemy_db == null:
		return ""

	# EnemyDb.gd içinde şöyle bir şey olduğunu varsayıyoruz:
	# const ENEMIES = { "wolf_1": { "level": 1, ... }, ... }
	if not ("ENEMIES" in enemy_db):
		push_warning("Spawner '%s': EnemyDb üzerinde ENEMIES sabiti bulunamadı." % name)
		return ""

	var enemies_dict: Dictionary = enemy_db.ENEMIES
	var candidates: Array[String] = []

	for id in enemies_dict.keys():
		var data = enemies_dict[id]
		if not (data is Dictionary):
			continue

		var lvl: int = int(data.get("level", 1))
		if lvl >= min_lvl and lvl <= max_lvl:
			candidates.append(str(id))

	if candidates.is_empty():
		push_warning("Spawner '%s': EnemyDb'de seviye aralığına (Lv %d–%d) uygun düşman bulunamadı." %
			[name, min_lvl, max_lvl])
		return ""

	var idx := randi() % candidates.size()
	var chosen_id := candidates[idx]
	print("SPAWNER DEBUG: ", name, " Lv ", min_lvl, "-", max_lvl, " -> seçilen id: ", chosen_id)
	return chosen_id
