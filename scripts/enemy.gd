extends CharacterBody2D

# Hasar sayısı sahnesini önceden yükle
const DamageNumberScene = preload("res://scenes/damage_number.tscn") 

# --- DÜŞMAN İSTATİSTİKLERİ ---
@export var max_health: int = 50
var current_health: int = 50
@export var SPEED = 100.0
@export var ATTACK_DAMAGE: int = 5
@export var ATTACK_RANGE: float = 40.0
@export var stop_range: float = 50.0 
@export var experience_reward: int = 15
@export var enemy_name: String = "Goblin"
@export var respawn_radius: float = 100.0
# -----------------------------

# --- DURUM ETKİLERİ (DOT/HOT) ---
var active_dots: Dictionary = {}

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
    
    health_bar.max_value = max_health 
    health_bar.value = current_health
    add_to_group("enemies") 

func _physics_process(delta):
    _tick_dots(delta) 
    
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


# YENİ FONKSİYON: Dot/Hot Hasarını/İyileştirmesini Zaman İçinde Uygular
func _tick_dots(delta):
    var keys_to_remove = []
    
    for skill_id in active_dots.keys():
        var dot = active_dots[skill_id]
        dot.time_left -= delta
        dot.next_tick -= delta
        
        if dot.next_tick <= 0.0:
            var value = int(round(dot.damage_per_tick))
            
            # DOT/HOT Uygulama
            if dot.is_heal:
                current_health = clampi(current_health + value, 0, max_health)
                spawn_damage_number(value, Color.GREEN)
                print(enemy_name, " HoT Aldı: ", value, ". Kalan Can: ", current_health)
            else:
                # KRİTİK DÜZELTME: Color.from_html -> Color("#RRGGBB")
                current_health -= value
                spawn_damage_number(value, Color("#9900CC")) 
                print(enemy_name, " DoT Aldı: ", value, ". Kalan Can: ", current_health)
            
            health_bar.value = current_health
            dot.next_tick = dot.tick_rate
            
            if current_health <= 0:
                current_health = 0
                die()
                keys_to_remove.append(skill_id)
                break 

        if dot.time_left <= 0.0:
            keys_to_remove.append(skill_id)

    for skill_id in keys_to_remove:
        active_dots.erase(skill_id)

# YENİ FONKSİYON: World.gd'den Dot/Hot etkisini başlatmak için çağrılır
func apply_status_effect(skill_id: String, total_value: float, duration: float, tick_rate: float, is_heal: bool):
    if not is_alive: return

    var num_ticks = ceil(duration / tick_rate)
    var value_per_tick = total_value / num_ticks

    active_dots[skill_id] = {
        "damage_per_tick": value_per_tick,
        "time_left": duration,
        "tick_rate": tick_rate,
        "next_tick": tick_rate, 
        "is_heal": is_heal
    }
    
    print("DURUM BAŞLATILDI: ", skill_id, " (Değer: ", total_value, ", Ticks: ", num_ticks, ")")


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


# YENİ FONKSİYON: Skill hasarını float olarak kabul eder (Anlık hasarlar için kullanılır)
func receive_skill_damage(amount: float):
    if not is_alive: return
    # Kırmızı renk anlık hasar için
    take_damage(int(round(amount)), Color.RED) 


# Canavarın temel saldırısından hasar alma fonksiyonu (DÜZELTME)
func take_damage(amount: int, damage_color: Color):
    if not is_alive: return
    current_health -= amount
    
    health_bar.value = current_health 
    spawn_damage_number(amount, damage_color) 
    
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


# KRİTİK DÜZELTME: Canavarın Oyuncuya hasar verirken renk göndermesi sağlandı
func attack():
    if not can_attack: return
    can_attack = false
    
    # ... (Animasyon mantığı) ...
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
            # KRİTİK DÜZELTME: take_damage fonksiyonuna Color.WHITE gönderildi
            if body.has_method("take_damage"):
                body.take_damage(ATTACK_DAMAGE, Color.WHITE) 
                print("Düşman, Oyuncuya vurdu!")

func _on_attack_timer_timeout():
    can_attack = true

func _on_follow_area_body_entered(body):
    if body.is_in_group("player"):
        target = body

func _on_follow_area_body_exited(body):
    if body == target:
        target = null

func die():
    if not is_alive: return
    is_alive = false
    active_dots.clear()
    
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
