extends Node2D

# 1. Spawner şablonunu (Spawner.tscn) buraya sürükle
@export var spawner_scene: PackedScene
# 2. Kaç tane spawn noktası oluşturulacağı
@export var spawn_point_count: int = 15

# 3. Haritanın (TileMapLayer) referansını almamız lazım
@onready var tilemap = get_parent().get_node("TileMapLayer")


func _ready():
	if spawner_scene == null:
		print("HATA: SpawnManager'ın 'Spawner Scene' değişkeni boş!")
		return
	
	# 4. Haritanın sınırlarını piksel olarak al
	var map_rect_in_cells = tilemap.get_used_rect()
	var top_left_corner = tilemap.map_to_local(map_rect_in_cells.position)
	var bottom_right_corner = tilemap.map_to_local(map_rect_in_cells.end)
	# Haritanın piksel cinsinden dikdörtgen alanı
	var map_rect_in_pixels = Rect2(top_left_corner, bottom_right_corner - top_left_corner)
	
	# 5. Fizik motoruna erişim al (ağaçların yerini sormak için)
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.collision_mask = 1 # Sadece 1. Katman (Dünya/Ağaçlar) ile çarpışmayı kontrol et
	
	var spawned_count = 0
	var attempts = 0 # Sonsuz döngüye girmeyi engelle
	
	# 6. 15 tane geçerli (boş) nokta bulana kadar döngü
	while spawned_count < spawn_point_count and attempts < 1000:
		attempts += 1
		
		# 7. Harita sınırları içinde rastgele bir nokta seç
		var random_x = randf_range(map_rect_in_pixels.position.x, map_rect_in_pixels.end.x)
		var random_y = randf_range(map_rect_in_pixels.position.y, map_rect_in_pixels.end.y)
		var random_pos = Vector2(random_x, random_y)
		
		# 8. O noktada bir ağaç var mı diye kontrol et
		query.position = random_pos
		var result = space_state.intersect_point(query)
		
		# 9. Eğer 'result' boşsa (hiçbir şeye çarpmıyorsa), orası güvenlidir!
		if result.is_empty():
			spawned_count += 1
			
			# 10. Spawner'ı oluştur ve pozisyonunu ayarla
			var new_spawner = spawner_scene.instantiate()
			new_spawner.global_position = random_pos
			# call_deferred() kullanarak zamanlama hatasını çözüyoruz
			get_parent().add_child.call_deferred(new_spawner) 

	if spawned_count < spawn_point_count:
		print("UYARI: Yeterli boş alan bulunamadı. Sadece ", spawned_count, " spawner oluşturuldu.")
	else:
		print(spawned_count, " adet otomatik spawn noktası oluşturuldu.")
