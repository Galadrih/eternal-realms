extends Label

# Animasyonun ne kadar süreceğini (saniye)
@export var animation_duration: float = 1.2
# Rakamın yukarı doğru ne kadar hareket edeceğini (piksel)
@export var rise_distance: float = 40.0
# Rakamın rastgele sağa/sola ne kadar sapacağını (yayılma)
@export var spread: float = 15.0


func _ready():
	# Sahne ağacına eklendiğinde hemen animasyonu başlat
	# (set_damage çağrılana kadar beklemek yerine)
	# Bu, scene'den manuel olarak eklenenleri de çalıştırır (test için)
	# Ancak biz set_damage'den çağıracağız.
	pass


# world.gd  ve enemy.gd bu fonksiyonu çağırır
func set_damage(amount: int, color: Color):
	# 1. Rakamı ve rengi ayarla
	text = str(amount)
	modulate = color
	
	# 2. Animasyonu başlat
	_start_animation()


func _start_animation():
	# 1. Başlangıç ve Bitiş Pozisyonlarını Ayarla
	var start_pos = position
	# Rastgele bir yatay sapma ekle
	var random_x = randf_range(-spread, spread)
	# Bitiş pozisyonu (orijinal yerinden 'rise_distance' kadar yukarıda)
	var end_pos = start_pos - Vector2(-random_x, rise_distance)

	# 2. Tween Oluştur
	# 'create_tween()' Godot 4'teki en modern yöntemdir.
	var tween = create_tween()
	
	# İki animasyonu (hareket ve kaybolma) aynı anda yap
	tween.set_parallel(true)
	tween.set_trans(Tween.TRANS_QUAD) # Animasyonun yumuşak olmasını sağlar
	tween.set_ease(Tween.EASE_OUT)    # Yavaşlayarak durma efekti verir

	# 3. HAREKET Animasyonu
	# 'position' özelliğini 'end_pos'a doğru 'animation_duration' süresinde animasyonla
	tween.tween_property(self, "position", end_pos, animation_duration)

	# 4. KAYBOLMA (Fade-Out) Animasyonu
	# 'modulate:a' (alpha/şeffaflık) özelliğini 0'a (görünmez) doğru
	# 'animation_duration' süresinde animasyonla
	tween.tween_property(self, "modulate:a", 0.0, animation_duration)

	# 5. Animasyon Bitince Yok Et
	# Animasyonun bitmesini bekle
	await tween.finished
	# Animasyon bittiğinde, bu düğümü (rakamı) sahneden sil
	queue_free()
