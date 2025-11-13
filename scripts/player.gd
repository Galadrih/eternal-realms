extends "res://scripts/PlayerBase.gd"

@export var SPEED = 300.0
@export var ATTACK_COOLDOWN: float = 0.5
var can_attack: bool = true
var last_direction = Vector2(0, 1)

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

# --- DÜZELTİLMİŞ FİZİK FONKSİYONU ---
func _physics_process(_delta):
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
            # --- DÜZELTME: Bu satır hatalı girintilenmişti ---
            elif direction.x > 0:
                anim_sprite.play("walk_right")
            # --- Düzeltme Bitişi ---
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
# --- Düzeltme Bitişi ---


# --- STAT FONKSİYONLARI ---

func take_damage(amount: int, color: Color = Color.RED, attacker = null):
    if current_health <= 0:
        return

    # --- 1. ADIM: HASAR AZALTMA HESAPLAMASI ---
    var final_damage_float = float(amount)
    
    # A. Fiziksel Savunma (PDef) azaltması uygula
    final_damage_float = final_damage_float * (1.0 - computed_pdef_percent / 100.0)

    # B. Genel Hasar Azaltma (DMG Reduce) uygula
    final_damage_float = final_damage_float * (1.0 - computed_dmg_reduction)
    
    var final_damage = int(round(final_damage_float))
    # --- BİTİŞ ---

    
    # --- 2. ADIM: HASARI UYGULA ---
    set_health(current_health - final_damage)
    spawn_damage_number(final_damage, color) 
    print("Hasar Alındı: ", final_damage, " (Orijinal: ", amount, "). Kalan Can: ", current_health)

    
    # --- 3. ADIM: THORNS (DİKEN) HASARINI YANSITMA ---
    if attacker != null and computed_thorns_base_dmg > 0:
        
        var thorns_stat_value = _get_stat_value(computed_thorns_scale_stat)
        var thorns_damage = float(computed_thorns_base_dmg) + (thorns_stat_value * computed_thorns_scale_ratio)
        
        if attacker.has_method("receive_skill_damage"):
            attacker.receive_skill_damage(thorns_damage)
            print("THORNS: Düşmana %d hasar yansıtıldı!" % int(thorns_damage))
    # --- BİTİŞ ---

    
    if current_health == 0:
        die() 

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
        take_damage(10, Color.RED, null) 
        get_viewport().set_input_as_handled()
    
    elif event.is_action_pressed("test_heal"):
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
    if get_parent().has_method("spawn_damage_number_on_effect_layer"):
        get_parent().spawn_damage_number_on_effect_layer(amount, color, global_position + Vector2(0, -30))
    else:
        print("HATA: Player'ın ebeveyninde 'spawn_damage_number_on_effect_layer' fonksiyonu bulunamadı!")
