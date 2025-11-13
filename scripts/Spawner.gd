extends Node2D # Spawner'ımız bir pozisyona sahip olmalı

# Bu spawner'ın hangi düşmanı yaratacağını belirler
@export var enemy_scene: PackedScene

# 3'lü grup
@export var spawn_count: int = 3

func _ready():
	# Oyun başlar başlamaz, 3'lü grubu spawn et
	spawn_group()

func spawn_group():
	if enemy_scene == null:
		print("HATA: Spawner (", name, ") içinde hangi enemy_scene'in spawn edileceği seçilmemiş!")
		return
		
	for i in spawn_count:
		# 1. Düşmanı hafızada oluştur
		var new_enemy = enemy_scene.instantiate()
		
		# 2. Düşmanı bu spawner'ın tam üstüne yerleştir
		new_enemy.global_position = global_position
		
		# 3. Düşmanı 'World' sahnesine ekle (HATA DÜZELTME)
		# add_child() yerine call_deferred() kullanarak zamanlama hatasını çözüyoruz
		get_parent().add_child.call_deferred(new_enemy)

	print(name, " spawner'ı ", spawn_count, " adet düşman yarattı.")
