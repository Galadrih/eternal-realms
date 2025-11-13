extends "res://scripts/PlayerBase.gd"

# Hasar sayısı sahnesini önceden yükle
const DamageNumberScene = preload("res://scenes/damage_number.tscn") 

@export var SPEED = 300.0
@export var ATTACK_COOLDOWN: float = 0.5
var can_attack: bool = true
var last_direction = Vector2(0, 1)

# --- YENİ HOT İŞLEYİCİSİ İÇİN TEMİZ BAŞLANGIÇ ---
# PlayerBase'den _tick_dots tarafından çağrılacaktır.

func _ready():
    if not has_node("AttackTimer"):
        var timer = Timer.new()
        timer.name = "AttackTimer"
        add_child(timer)
        timer.one_shot = true
        timer.timeout.connect(_on_attack_timer_timeout)
    
    # PlayerBase'in _ready'si çağrılacak
    super._ready() # PlayerBase'deki add_to_group ve stat ayarları için
    
    $AnimatedSprite2D.play("idle_down")

func _physics_process(_delta):
    # (Hareket kodu aynı kaldı, değişiklik yok)
    var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    var anim_sprite = $AnimatedSprite2D

    if direction:
        velocity = direction.normalized() * SPEED
        last_direction = direction.normalized()
        
        if not anim_sprite.get_animation().begins_with("attack"):
            if direction.y < 0:
                anim_sprite.play("walk_up")
            elif direction.y > 0:
                anim_sprite.play("walk_down")
            elif direction.x < 0:
                anim_sprite.play("walk_left")
            elif direction.x > 0:
                anim_sprite.play("walk_right")
    else:
        velocity = Vector2.ZERO
        
        if not anim_sprite.get_animation().begins_with("attack"):
            if abs(last_direction.y) > abs(last_direction.x):
                if last_direction.y < 0:
                    anim_sprite.play("idle_up")
                else:
                    anim_sprite.play("idle_down")
            else:
                if last_direction.x < 0:
                    anim_sprite.play("idle_left")
                else:
                    anim_sprite.play("idle_right")
                
    move_and_slide()


# --- STAT FONKSİYONLARI ---

# KRİTİK DÜZELTME: Düşmandan gelen renk argümanını kabul eder
func take_damage(amount: int, color: Color = Color.RED):
    if current_health <= 0:
        return
    
    var final_damage = amount
    
    set_health(current_health - final_damage)
    
    spawn_damage_number(final_damage, color) 
    
    print("Hasar Alındı: ", final_damage, ". Kalan Can: ", current_health)
    if current_health == 0:
        die() 

# KRİTİK DÜZELTME: HoT/Heal'ı PlayerBase'den işlemek için yeni fonksiyon
func heal(amount: int, color: Color = Color.GREEN):
    if current_health == computed_max_health:
        return
        
    var final_heal = amount
    
    set_health(current_health + final_heal)
    
    spawn_damage_number(final_heal, color)
    
    print("İyileşme: ", final_heal, ". Yeni Can: ", current_health) 

func die():
    print("Kahraman öldü! Eternal Realms sona erdi.")

# --- SALDIRI SİSTEMİ ---

func _on_attack_timer_timeout():
    can_attack = true

func _on_animated_sprite_2d_animation_finished():
    var anim_name = $AnimatedSprite2D.get_animation()
    
    if anim_name.begins_with("attack"):
        if abs(last_direction.y) > abs(last_direction.x):
            if last_direction.y < 0:
                $AnimatedSprite2D.play("idle_up")
            else:
                $AnimatedSprite2D.play("idle_down")
        else:
            if last_direction.x < 0:
                $AnimatedSprite2D.play("idle_left")
            else:
                $AnimatedSprite2D.play("idle_right")

func _unhandled_input(event):
    if event.is_action_pressed("test_damage"):
        take_damage(10, Color.RED) 
        get_viewport().set_input_as_handled()
    
    elif event.is_action_pressed("test_heal"):
        # Anlık iyileşme için heal çağrısı (HoT değil)
        heal(15, Color.GREEN)
        get_viewport().set_input_as_handled()
    
    elif event.is_action_pressed("test_xp"):
        add_experience(50)
        get_viewport().set_input_as_handled()
        
    elif event.is_action_pressed("toggle_character_sheet"): 
        get_parent().toggle_character_sheet()
        get_viewport().set_input_as_handled()
        
    elif event.is_action_pressed("player_attack"):
        if not can_attack:
            return
            
        can_attack = false
        var anim_sprite = $AnimatedSprite2D
        
        # (Animasyon kodları aynı kaldı)
        if abs(last_direction.y) > abs(last_direction.x):
            if last_direction.y < 0: anim_sprite.play("attack_up") 
            else: anim_sprite.play("attack_down") 
        else:
            if last_direction.x < 0: anim_sprite.play("attack_left") 
            else: anim_sprite.play("attack_right") 
        
        var damage_amount = computed_physical_attack_power
        
        var hit_enemies = $AttackHitbox.get_overlapping_bodies()
        
        for body in hit_enemies:
            if body.is_in_group("enemies") and body.has_method("receive_skill_damage"):
                body.receive_skill_damage(float(damage_amount))
                print("Düşmana Vuruldu! Hasar: ", damage_amount)
                
        $AttackTimer.start(ATTACK_COOLDOWN)
        get_viewport().set_input_as_handled()

# --- DİĞER FONKSİYONLAR ---

func spawn_damage_number(amount, color):
    var damage_number = DamageNumberScene.instantiate()
    get_parent().add_child(damage_number) 
    damage_number.global_position = global_position + Vector2(0, -30) 
    damage_number.set_damage(amount, color)
