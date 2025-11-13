extends Node2D

@onready var label = $Label

var move_amount = Vector2(0, -40) # Yukarı hareket miktarı
var duration = 0.8 # Sahnede kalma süresi (saniye)
var spread = 25.0 # Yatayda ne kadar dağılacağı

func _ready():
	# Başlangıçta rastgele yatay bir konuma ata
	position.x += randf_range(-spread, spread)

	# Hareketi ve kaybolmayı yönetmek için bir Tween oluştur
	var tween = create_tween()

	# 1. Hareket: Belirlenen süre içinde 'move_amount' kadar yukarı taşı
	tween.tween_property(self, "position", position + move_amount, duration).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

	# 2. Kaybolma (Fade): Hareketle aynı anda, sürenin son yarısında etiketi görünmez yap
	tween.parallel().tween_property(label, "modulate:a", 0.0, duration * 0.5).set_delay(duration * 0.5)

	# 3. Silme: Tween bittiğinde sahneden sil
	tween.tween_callback(queue_free)

# Bu fonksiyon, sayıyı ve rengini ayarlamak için dışarıdan çağrılacak
func set_damage(amount, color = Color.WHITE):
	label.text = str(amount)
	label.modulate = color
