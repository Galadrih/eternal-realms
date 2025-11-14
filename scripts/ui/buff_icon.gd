extends Control
class_name BuffIcon

# ---------------------------------------------------------
# Node referansları
# ---------------------------------------------------------
@onready var icon_rect: TextureRect = $Icon
@onready var duration_label: Label = get_node_or_null("DurationLabel")
@onready var stack_label: Label = get_node_or_null("StackLabel")

# ---------------------------------------------------------
# Buff bilgileri
# ---------------------------------------------------------
var buff_id: String = ""
var is_debuff: bool = false

var duration: float = 0.0
var max_duration: float = 0.01


func _ready() -> void:
	# ---- ROOT BOYUTU ----
	# BuffIcon paneli 32x32'ye sabitleniyor
	custom_minimum_size = Vector2(32, 32)
	size = custom_minimum_size

	# ---- ICON AYARLARI ----
	# Texture boyutunu tamamen göz ardı et
	icon_rect.ignore_texture_size = true
	# İkonu da 32x32 kutuya kilitle
	icon_rect.custom_minimum_size = Vector2(32, 32)
	icon_rect.size = Vector2(32, 32)

	icon_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	icon_rect.size_flags_horizontal = Control.SIZE_FILL
	icon_rect.size_flags_vertical   = Control.SIZE_FILL

	# Yazıları temiz başlat
	if duration_label:
		duration_label.text = ""
	if stack_label:
		stack_label.text = ""


# ---------------------------------------------------------
# ICON SET
# ---------------------------------------------------------
func set_icon(tex: Texture2D) -> void:
	icon_rect.texture = tex


# ---------------------------------------------------------
# DEBUFF / BUFF STYLING
# ---------------------------------------------------------
func set_style(is_debuff_flag: bool) -> void:
	is_debuff = is_debuff_flag

	if is_debuff:
		modulate = Color(1.0, 0.75, 0.75) # hafif kırmızı
	else:
		modulate = Color(1, 1, 1)


# ---------------------------------------------------------
# STACK SAYISI
# ---------------------------------------------------------
func set_stacks(count: int) -> void:
	if stack_label == null:
		return

	if count <= 1:
		stack_label.text = ""
	else:
		stack_label.text = str(count)


# ---------------------------------------------------------
# BUFF SÜRESİ
# ---------------------------------------------------------
func set_timer(current: float, max_time: float) -> void:
	duration = max(current, 0.0)
	max_duration = max(max_time, 0.01)

	if duration_label == null:
		return

	var shown: float = round(duration * 10.0) / 10.0
	duration_label.text = str(shown)


# ---------------------------------------------------------
# Süresi bitmiş mi?
# ---------------------------------------------------------
func is_expired() -> bool:
	return duration <= 0.0
