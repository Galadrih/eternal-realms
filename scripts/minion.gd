# minion.gd
extends CharacterBody2D

# --- YENİ: ÖZELLEŞTİRİLEBİLİR STATLAR ---
# Bu değerler artık her .tscn dosyasında (Inspector) ayrı ayrı ayarlanabilir.
@export var max_health: int = 30
@export var SPEED = 250.0
@export var ATTACK_DAMAGE: int = 10
@export var ATTACK_RANGE: float = 45.0
@export var ATTACK_COOLDOWN: float = 1.2
@export var LEASH_DISTANCE: float = 100.0 # Sahibinden bu kadar uzakta durur
# ----------------------------------------

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var despawn_timer: Timer = $DespawnTimer
@onready var attack_timer: Timer = $AttackTimer
@onready var attack_hitbox: Area2D = $AttackHitbox

var minion_owner = null # 'owner' yerleşik bir isim olduğu için 'minion_owner' kullanıyoruz
var target = null # Düşman (hedefi)
var last_direction = Vector2.DOWN
var current_health: int = 30 # --- YENİ EKLENDİ (Can) ---
var is_alive: bool = true # --- YENİ EKLENDİ (Can) ---

# AI Durumları
enum State { FOLLOW_OWNER, ATTACK_TARGET }
var current_state = State.FOLLOW_OWNER

func _ready():
	current_health = max_health # --- YENİ EKLENDİ (Can) ---
	add_to_group("minions")
	
	# Düşmanlar minyonlara saldırabilsin diye bu katmana ekle
	# (Eğer Proje Ayarlarında Katman 4'ü 'minions' yaptıysanız)
	# set_collision_layer_value(4, true) 
	
	attack_timer.wait_time = ATTACK_COOLDOWN
	attack_timer.one_shot = true
	despawn_timer.one_shot = true
	
	# Sinyalleri bağla
	despawn_timer.timeout.connect(_on_despawn_timer_timeout)
	attack_timer.timeout.connect(_on_attack_timer_timeout)
	sprite.animation_finished.connect(_on_animation_finished)
	
	# Saldırı hitbox'ı düşmanları algılamalı (monitoring = true)
	attack_hitbox.monitoring = true
	attack_hitbox.monitorable = false
	
	sprite.play("idle_down")

# --- Ana Fonksiyonlar ---

func set_owner_and_duration(player_node: Node, duration: float):
	minion_owner = player_node
	despawn_timer.start(duration)
	print("Minion doğdu. Sahibi: ", minion_owner.name, ", Canı: ", max_health)

func _on_despawn_timer_timeout():
	print("Minion'ın süresi doldu, kayboluyor.")
	die(false) # 'false' = süre bittiği için kaybol, hasar animasyonu oynatma

func _physics_process(delta):
	if not is_alive: # Ölmüşse hareket etme
		velocity = Vector2.ZERO
		move_and_slide()
		return

	if minion_owner == null or not is_instance_valid(minion_owner):
		die(false) # Sahibi yoksa öl
		return

	# 1. Hedef Belirle
	if is_instance_valid(minion_owner.current_target):
		target = minion_owner.current_target
		current_state = State.ATTACK_TARGET
	else:
		target = null
		current_state = State.FOLLOW_OWNER

	var direction = Vector2.ZERO

	# 2. Duruma Göre Hareket Et
	match current_state:
		State.FOLLOW_OWNER:
			var distance_to_owner = global_position.distance_to(minion_owner.global_position)
			if distance_to_owner > LEASH_DISTANCE:
				direction = (minion_owner.global_position - global_position).normalized()
			
		State.ATTACK_TARGET:
			if not is_instance_valid(target) or not target.is_alive:
				current_state = State.FOLLOW_OWNER # Hedef öldüyse sahibine dön
				target = null
				if is_instance_valid(minion_owner):
					minion_owner.current_target = null # Sahibin hedefini de temizle
				return
				
			var distance_to_target = global_position.distance_to(target.global_position)
			
			if distance_to_target > ATTACK_RANGE:
				direction = (target.global_position - global_position).normalized()
			else:
				# Menzildeyiz, saldır
				if attack_timer.is_stopped():
					attack()

	# 3. Hareketi Uygula
	velocity = direction * SPEED
	move_and_slide()
	
	# 4. Animasyonu güncelle
	update_animation(direction)

func attack():
	if not is_instance_valid(target) or not is_alive:
		return
		
	print("Minion saldırıyor: ", target.name)
	attack_timer.start()
	
	var attack_dir = (target.global_position - global_position).normalized()
	last_direction = attack_dir
	
	if abs(attack_dir.x) > abs(attack_dir.y):
		if attack_dir.x > 0: sprite.play("attack_right")
		else: sprite.play("attack_left")
	else:
		if attack_dir.y > 0: sprite.play("attack_down")
		else: sprite.play("attack_up")
	
	# Düşmana hasar ver
	var bodies = attack_hitbox.get_overlapping_bodies()
	for body in bodies:
		if body == target and body.has_method("receive_skill_damage"):
			body.receive_skill_damage(float(ATTACK_DAMAGE))
			return

func _on_attack_timer_timeout():
	pass # Saldırı zamanlayıcısı doldu, tekrar saldırabilir

# --- YENİ: CAN VE ÖLÜM MANTIĞI ---
# Düşmanlar bu fonksiyonu çağıracak (eğer düşmanlar minyonlara saldırırsa)
func take_damage(amount: int, color: Color = Color.ORANGE, attacker = null):
	if not is_alive: return

	current_health -= amount
	print("Minion hasar aldı: ", amount, ", Kalan Can: ", current_health)
	
	if get_parent().has_method("spawn_damage_number_on_effect_layer"):
		get_parent().spawn_damage_number_on_effect_layer(amount, color, global_position + Vector2(0, -30))

	if current_health <= 0:
		die()
	else:
		# Hasar animasyonu (Hurt)
		if abs(last_direction.x) > abs(last_direction.y):
			if last_direction.x > 0: sprite.play("hurt_right")
			else: sprite.play("hurt_left")
		else:
			if last_direction.y > 0: sprite.play("hurt_down")
			else: sprite.play("hurt_up")

func die(play_hurt_anim: bool = true):
	if not is_alive: return
	
	is_alive = false
	current_state = State.FOLLOW_OWNER # Hiçbir şey yapma
	target = null
	if is_instance_valid(minion_owner):
		minion_owner.current_target = null
	
	print("Minion öldü/kayboldu.")
	
	# Çarpışmayı kapat
	$CollisionShape2D.disabled = true
	attack_hitbox.monitoring = false
	
	if play_hurt_anim:
		# Son bir hasar animasyonu oyna
		if abs(last_direction.x) > abs(last_direction.y):
			if last_direction.x > 0: sprite.play("hurt_right")
			else: sprite.play("hurt_left")
		else:
			if last_direction.y > 0: sprite.play("hurt_down")
			else: sprite.play("hurt_up")
		# Animasyon bitince _on_animation_finished 'die' animasyonunu temizleyecek
	else:
		# Süre bittiyse animasyonsuz yok et
		queue_free()

# --- Animasyon Fonksiyonları ---
func update_animation(direction: Vector2):
	if not is_alive: return
	
	# Saldırı veya hasar animasyonu oynuyorsa kesme
	if sprite.get_animation().begins_with("attack") or sprite.get_animation().begins_with("hurt"):
		return
			
	if direction != Vector2.ZERO:
		last_direction = direction.normalized()
		
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0: sprite.play("walk_right")
			else: sprite.play("walk_left")
		else:
			if direction.y > 0: sprite.play("walk_down")
			else: sprite.play("walk_up")
	else:
		if abs(last_direction.x) > abs(last_direction.y):
			if last_direction.x > 0: sprite.play("idle_right")
			else: sprite.play("idle_left")
		else:
			if last_direction.y > 0: sprite.play("idle_down")
			else: sprite.play("idle_up")

func _on_animation_finished():
	var anim_name = sprite.get_animation()
	
	if not is_alive and anim_name.begins_with("hurt"):
		# Ölüm 'hurt' animasyonu bittiyse kendini yok et
		queue_free()
		return

	# Saldırı veya hasar bittiyse idle'a dön
	if anim_name.begins_with("attack") or anim_name.begins_with("hurt"):
		update_animation(Vector2.ZERO)
