extends Node2D

# 1) Hangi spawner sahnesi (Spawner.tscn)
@export var spawner_scene: PackedScene

# 2) Her ring başına kaç spawner oluşturulsun?
@export var spawn_per_ring: int = 10

# 3) Player’ın doğduğu nokta (opsiyonel – Inspector’dan bağlayabilirsin)
@export var player_start: Node2D

# 4) Ring yarıçapları (piksel cinsinden, oyuncudan uzaklık)
@export var close_min_radius: float = 200.0
@export var close_max_radius: float = 600.0

@export var mid_min_radius: float = 600.0
@export var mid_max_radius: float = 1200.0

@export var far_min_radius: float = 1200.0
@export var far_max_radius: float = 2000.0

# 5) Her ring için level aralıkları
@export var close_min_level: int = 1
@export var close_max_level: int = 5

@export var mid_min_level: int = 6
@export var mid_max_level: int = 10

@export var far_min_level: int = 11
@export var far_max_level: int = 15

# 6) Harita TileMap’i (parent altında "TileMapLayer" varsayıyorum)
@onready var tilemap := get_parent().get_node("TileMapLayer")


func _ready() -> void:
	if spawner_scene == null:
		push_warning("SpawnManager: 'spawner_scene' atanmadı!")
		return

	# --- PLAYER MERKEZİNİ OTOMATİK BUL ---
	var center := _get_player_spawn_position()

	if tilemap == null:
		push_warning("SpawnManager: TileMapLayer bulunamadı, harita sınırı kontrolü olmayacak.")

	# Harita dikdörtgenini hesapla (spawn pozisyonlarını sınırlamak için)
	var map_rect := Rect2()
	var has_map_rect := false
	if tilemap != null:
		var map_rect_in_cells = tilemap.get_used_rect()
		var top_left_corner = tilemap.map_to_local(map_rect_in_cells.position)
		var bottom_right_corner = tilemap.map_to_local(map_rect_in_cells.end)
		map_rect = Rect2(top_left_corner, bottom_right_corner - top_left_corner)
		has_map_rect = true

	# Fizik motoru (duvar/ağaç üstüne spawnlamamak için)
	var space_state := get_world_2d().direct_space_state
	var query := PhysicsPointQueryParameters2D.new()
	# Çarpışma maskesini senin dünyadaki "world/engeller" katmanına göre ayarla.
	query.collision_mask = 1

	# RING TANIMLARI
	var rings := [
		{
			"min_r": close_min_radius,
			"max_r": close_max_radius,
			"min_lvl": close_min_level,
			"max_lvl": close_max_level,
			"name": "CLOSE_RING"
		},
		{
			"min_r": mid_min_radius,
			"max_r": mid_max_radius,
			"min_lvl": mid_min_level,
			"max_lvl": mid_max_level,
			"name": "MID_RING"
		},
		{
			"min_r": far_min_radius,
			"max_r": far_max_radius,
			"min_lvl": far_min_level,
			"max_lvl": far_max_level,
			"name": "FAR_RING"
		}
	]

	for ring in rings:
		_spawn_ring(
			center,
			ring["min_r"],
			ring["max_r"],
			ring["min_lvl"],
			ring["max_lvl"],
			ring["name"],
			map_rect,
			has_map_rect,
			space_state,
			query
		)


# Player’ın spawn pozisyonunu otomatik bulur
func _get_player_spawn_position() -> Vector2:
	# 1) Eğer Inspector’dan player_start atandıysa onu kullan
	if player_start != null:
		return player_start.global_position

	# 2) Sahnedeki ilk "player" grubundaki node’u bul
	var p := get_tree().get_first_node_in_group("player")
	if p != null and p is Node2D:
		print("SpawnManager: player_start atanmadı, 'player' grubundaki node kullanılıyor: %s" % p.name)
		return (p as Node2D).global_position

	# 3) Hiçbiri yoksa uyarı ver, (0,0)'ı kullan
	push_warning("SpawnManager: Player bulunamadı. Ring merkezi (0,0) kullanılacak.")
	return Vector2.ZERO


func _spawn_ring(
	center: Vector2,
	min_radius: float,
	max_radius: float,
	min_level: int,
	max_level: int,
	ring_name: String,
	map_rect: Rect2,
	has_map_rect: bool,
	space_state: PhysicsDirectSpaceState2D,
	query: PhysicsPointQueryParameters2D
) -> void:
	var spawned_count := 0
	var attempts := 0
	var max_attempts := spawn_per_ring * 50  # güvenlik, sonsuz döngü olmasın

	while spawned_count < spawn_per_ring and attempts < max_attempts:
		attempts += 1

		# 1) Ring içinde rastgele bir mesafe ve açı
		var angle := randf_range(0.0, TAU)
		var dist := randf_range(min_radius, max_radius)
		var offset := Vector2.RIGHT.rotated(angle) * dist
		var candidate_pos := center + offset

		# 2) Harita sınırı kontrolü
		if has_map_rect and not map_rect.has_point(candidate_pos):
			continue

		# 3) Fizik kontrolü (duvar/ağaç üstüne spawnlama)
		query.position = candidate_pos
		var result := space_state.intersect_point(query)
		if not result.is_empty():
			continue

		# 4) Spawner oluştur
		var new_spawner := spawner_scene.instantiate()
		if new_spawner == null:
			push_warning("SpawnManager: spawner_scene instantiate başarısız (ring: %s)." % ring_name)
			continue

		new_spawner.global_position = candidate_pos

		# Spawner.gd içinde min_level / max_level export'larını ayarlıyoruz
		if "min_level" in new_spawner:
			new_spawner.min_level = min_level
		if "max_level" in new_spawner:
			new_spawner.max_level = max_level

		new_spawner.name = "%s_Spawner_%d" % [ring_name, spawned_count]

		get_parent().add_child.call_deferred(new_spawner)
		spawned_count += 1

	if spawned_count < spawn_per_ring:
		print("UYARI: %s ring'i için yeterli boş alan bulunamadı. İstenen: %d, oluşturulan: %d" %
			[ring_name, spawn_per_ring, spawned_count])
	else:
		print("%s ring'i için %d spawner oluşturuldu. (Lv %d–%d, r=%.1f–%.1f)" %
			[ring_name, spawn_per_ring, min_level, max_level, min_radius, max_radius])
