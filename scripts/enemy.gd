extends CharacterBody2D

# Hasar sayısı sahnesini önceden yükle
const DamageNumberScene = preload("res://scenes/damage_number.tscn") 

# --- DÜŞMAN İSTATİSTİKLERİ ---
@export var max_health: int = 50
var current_health: int = 50
@export var SPEED = 100.0
@export var ATTACK_DAMAGE: int = 5
@export var ATTACK_RANGE: float = 40.0
@export var stop_range: float = 50.0 # Sürüklenmeyi önlemek için
@export var experience_reward: int = 15
@export var enemy_name: String = "Goblin"
@export var respawn_radius: float = 100.0
# -----------------------------

# --- DÜĞÜM REFERANSLARI ---
@onready var attack_timer = $AttackTimer
@onready var attack_area = $AttackArea
@onready var follow_area = $FollowArea
@onready var collision_shape = $CollisionShape2D
@onready var respawn_timer = $RespawnTimer
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var body_linger_timer = $BodyLingerTimer
@onready var health_bar = $HealthBar

var target = null
var can_attack = true
var is_alive = true
var start_position = Vector2.ZERO
var last_direction = Vector2(0, 1)

func _ready():
	start_position = global_position
	current_health = max_health
	
	# Can barını başlat
	health_bar.max_value = max_health 
	health_bar.value = current_health

func _physics_process(delta):
	if not is_alive:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var direction = Vector2.ZERO
	
	if target != null:
		var distance = global_position.distance_to(target.global_position)
		
		if distance > stop_range:
			direction = (target.global_position - global_position).normalized()
		
		if distance < ATTACK_RANGE:
			if can_attack:
				attack()
	
	velocity = direction * SPEED
	move_and_slide()
	
	if sprite.get_animation().begins_with("attack") == false and sprite.get_animation().begins_with("hurt") == false:
		update_animation(direction)


func update_animation(direction: Vector2):
	if not is_alive: return
			
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

# --- SALDIRI, HASAR, ÖLÜM ---

func attack():
	if not can_attack: return
	can_attack = false
	
	if abs(last_direction.x) > abs(last_direction.y):
		if last_direction.x > 0: sprite.play("attack_right")
		else: sprite.play("attack_left")
	else:
		if last_direction.y > 0: sprite.play("attack_down")
		else: sprite.play("attack_up")
	
	attack_timer.start()
	
	var bodies = attack_area.get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("player"):
			body.take_damage(ATTACK_DAMAGE)
			print("Düşman, Oyuncuya vurdu!")

func _on_attack_timer_timeout():
	can_attack = true

func _on_follow_area_body_entered(body):
	if body.is_in_group("player"):
		target = body

func _on_follow_area_body_exited(body):
	if body == target:
		target = null

func take_damage(amount: int):
	if not is_alive: return
	current_health -= amount
	
	health_bar.value = current_health 
	spawn_damage_number(amount, Color.WHITE) 
	
	print(enemy_name, " Hasar Aldı: ", amount, ". Kalan Can: ", current_health)
	
	if current_health <= 0:
		current_health = 0
		die()
	else:
		if abs(last_direction.x) > abs(last_direction.y):
			if last_direction.x > 0: sprite.play("hurt_right")
			else: sprite.play("hurt_left")
		else:
			if last_direction.y > 0: sprite.play("hurt_down")
			else: sprite.play("hurt_up")

func die():
	if not is_alive: return
	is_alive = false
	
	health_bar.visible = false 
	
	print(enemy_name, " yenildi!")
	
	if target != null and target.has_method("add_experience"):
		target.add_experience(experience_reward)
	
	collision_shape.disabled = true
	attack_area.get_node("CollisionShape2D").disabled = true
	follow_area.get_node("CollisionShape2D").disabled = true
	
	if abs(last_direction.x) > abs(last_direction.y):
		if last_direction.x > 0: sprite.play("hurt_right")
		else: sprite.play("hurt_left")
	else:
		if last_direction.y > 0: sprite.play("hurt_down")
		else: sprite.play("hurt_up")
	
	respawn_timer.start()

func _on_sprite_animation_finished():
	var anim_name = sprite.get_animation()
	
	if anim_name.begins_with("hurt"):
		if not is_alive:
			body_linger_timer.start()
		elif is_alive:
			update_animation(Vector2.ZERO)
			
	elif anim_name.begins_with("attack"):
		update_animation(Vector2.ZERO)

func _on_body_linger_timer_timeout():
	sprite.visible = false
	print("Beden kayboldu.")

func _on_respawn_timer_timeout():
	print(enemy_name, " yeniden doğdu!")
	
	is_alive = true
	current_health = max_health
	
	health_bar.max_value = max_health
	health_bar.value = current_health
	health_bar.visible = true
	
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var random_distance = randf_range(0, respawn_radius)
	global_position = start_position + (random_direction * random_distance)
	
	target = null
	
	sprite.visible = true
	sprite.play("idle_down")
	collision_shape.disabled = false
	attack_area.get_node("CollisionShape2D").disabled = false
	follow_area.get_node("CollisionShape2D").disabled = false

func spawn_damage_number(amount, color):
	var damage_number = DamageNumberScene.instantiate()
	get_parent().add_child(damage_number) 
	
	damage_number.global_position = global_position + Vector2(0, -35)
	damage_number.set_damage(amount, color)
