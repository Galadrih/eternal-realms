extends "res://scripts/PlayerBase.gd"

@export var SPEED = 300.0
@export var ATTACK_COOLDOWN: float = 0.5
var can_attack: bool = true
var last_direction = Vector2(0, 1)
var current_target: Node2D = null # Minion'lar bu hedefi takip edecek
var inventory_panel = null

# --- LOOT PICKUP ---
var loot_pickup_area: Area2D = null

@onready var overhead_display: VBoxContainer = $OverheadDisplay
@onready var collision_shape: CollisionShape2D = $CollisionShape2D


func _ready():
    # AttackTimer garanti olsun
    if not has_node("AttackTimer"):
        var timer = Timer.new()
        timer.name = "AttackTimer"
        add_child(timer)
        timer.one_shot = true
        timer.timeout.connect(_on_attack_timer_timeout)
    
    # Görünmezlik sinyaline bağlan
    invisibility_changed.connect(_on_invisibility_changed)
    
    # PlayerBase _ready
    super._ready()
    
    # Loot alanı fizik ayarları
    if is_instance_valid(loot_pickup_area):
        loot_pickup_area.collision_layer = 0
        loot_pickup_area.collision_mask = 16 # Layer 5 = loot
        loot_pickup_area.monitoring = true
    else:
        print("HATA: player.gd, LootPickupArea'yı _ready içinde bulamadı!")
    
    # HUD / Inventory Panel
    var hud = get_tree().get_first_node_in_group("hud")
    if hud and hud.has_node("InventoryPanel"):
        inventory_panel = hud.get_node("InventoryPanel")
    
    $AnimatedSprite2D.play("idle_down")
    
    # İsim plakası
    if is_instance_valid(overhead_display):
        var player_name = "Player"
        if "character_name" in PlayerData:
            player_name = PlayerData.character_name
        
        overhead_display.set_data(player_name, level, Color.BLUE, Color.YELLOW)
        
        health_updated.connect(overhead_display.update_health)
        level_updated.connect(_on_level_updated_overhead)
        
        overhead_display.update_health(current_health, computed_max_health)


# --- FİZİK FONKSİYONU ---
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

    # İsim plakası pozisyonu
    if is_instance_valid(overhead_display):
        var top_of_head = collision_shape.position.y + collision_shape.shape.get_rect().position.y
        overhead_display.position.y = top_of_head - overhead_display.size.y - 5
        var half_width = overhead_display.size.x / 2
        overhead_display.position.x = -half_width


# --- STAT / DAMAGE FONKSİYONLARI ---

func take_damage(amount: int, color: Color = Color.RED, attacker = null):
    if current_health <= 0:
        return

    # 1) Hasar azaltma
    var final_damage_float = float(amount)
    final_damage_float = final_damage_float * (1.0 - computed_pdef_percent / 100.0)
    final_damage_float = final_damage_float * (1.0 - computed_dmg_reduction)
    
    var final_damage = int(round(final_damage_float))

    # 2) Uygula
    set_health(current_health - final_damage)
    spawn_damage_number(final_damage, color)
    print("Hasar Alındı: ", final_damage, " (Orijinal: ", amount, "). Kalan Can: ", current_health)

    # 3) Thorns
    if attacker != null and computed_thorns_base_dmg > 0:
        var thorns_stat_value = _get_stat_value(computed_thorns_scale_stat)
        var thorns_damage = float(computed_thorns_base_dmg) + (thorns_stat_value * computed_thorns_scale_ratio)
        
        if attacker.has_method("receive_skill_damage"):
            attacker.receive_skill_damage(thorns_damage)
            print("THORNS: Düşmana %d hasar yansıtıldı!" % int(thorns_damage))

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
    if is_instance_valid(overhead_display):
        overhead_display.visible = false


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
        
        # 1) Animasyon
        if abs(last_direction.y) > abs(last_direction.x):
            if last_direction.y < 0:
                anim_sprite.play("attack_up")
            else:
                anim_sprite.play("attack_down")
        else:
            if last_direction.x < 0:
                anim_sprite.play("attack_left")
            else:
                anim_sprite.play("attack_right")

        # 2) Yön vektörü
        var attack_dir: Vector2 = last_direction
        if attack_dir == Vector2.ZERO:
            attack_dir = Vector2(0, 1)
        attack_dir = attack_dir.normalized()

        # 3) Hasar (PlayerBase içindeki fonksiyon)
        var damage_amount: int = compute_basic_attack_damage()

        # 4) Origin:
        #    Melee → biraz önünden, AoE tam karakter üzerinde kalmasın
        #    Ranged → direkt oyuncu pozisyonu
        var attack_origin: Vector2
        if is_melee_basic_attacker():
            attack_origin = global_position + attack_dir * 32.0
        else:
            attack_origin = global_position

        # 5) Hedefleri bul (ranged için current_target öncelikli)
        var targets: Array = find_basic_attack_targets(attack_origin, attack_dir, current_target)

        var hit_someone := false
        current_target = null

        for body in targets:
            if body.is_in_group("enemies") and body.has_method("receive_skill_damage"):
                body.receive_skill_damage(float(damage_amount))
                print("Basic Attack → ", body.name, " için hasar: ", damage_amount)
                
                if not hit_someone:
                    current_target = body  # minion'lar için focus hedefi
                hit_someone = true

        if not hit_someone:
            print("Basic Attack: menzilde hedef yok.")
            current_target = null

        $AttackTimer.start(ATTACK_COOLDOWN)
        get_viewport().set_input_as_handled()


# --- DİĞER FONKSİYONLAR ---

func spawn_damage_number(amount, color):
    if get_parent().has_method("spawn_damage_number_on_effect_layer"):
        get_parent().spawn_damage_number_on_effect_layer(amount, color, global_position + Vector2(0, -30))
    else:
        print("HATA: Player'ın ebeveyninde 'spawn_damage_number_on_effect_layer' fonksiyonu bulunamadı!")


# Görünmezlik
func _on_invisibility_changed(is_now_invisible: bool):
    var anim_sprite = $AnimatedSprite2D

    if is_now_invisible:
        anim_sprite.modulate.a = 0.5
        set_collision_layer_value(2, false)
        print("GÖRÜNMEZ OLDUM. Katman 2 (player_detect) kapatıldı.")
        print("Mevcut katmanlarım: ", collision_layer)
    else:
        anim_sprite.modulate.a = 1.0
        set_collision_layer_value(2, true)
        print("GÖRÜNÜR OLDUM. Katman 2 (player_detect) açıldı.")
        print("Mevcut katmanlarım: ", collision_layer)


# Level atlandığında overhead display'i güncelle
func _on_level_updated_overhead(new_level: int):
    if is_instance_valid(overhead_display):
        var player_name = "Player"
        if "character_name" in PlayerData:
            player_name = PlayerData.character_name
        
        overhead_display.set_data(player_name, new_level, Color.BLUE, Color.YELLOW)

# --- (İleride loot için devam edersin) ---
# En yakındaki toplanabilir eşyayı bulur ve toplar
