extends "res://scripts/PlayerBase.gd"

@export var SPEED = 300.0
@export var ATTACK_COOLDOWN: float = 0.5
var can_attack: bool = true
var last_direction = Vector2(0, 1)
var current_target: Node2D = null # Minion'lar bu hedefi takip edecek
var inventory_panel = null

# --- DÜZELTME (Hata 2): @onready kaldırıldı, çünkü bu düğümü kodla oluşturacağız ---
var loot_pickup_area: Area2D = null
# --------------------------------------------------------------------------

@onready var overhead_display: VBoxContainer = $OverheadDisplay
@onready var collision_shape: CollisionShape2D = $CollisionShape2D


func _ready():
    # --- DÜZELTME (Hata 1): AttackTimer'ın _ready() içinde olduğundan emin ol ---
    if not has_node("AttackTimer"):
        var timer = Timer.new()
        timer.name = "AttackTimer"
        add_child(timer)
        timer.one_shot = true
        timer.timeout.connect(_on_attack_timer_timeout)
    # ---------------------------------------------------------------------
    
    # --- Görünmezlik sinyaline bağlan ---
    invisibility_changed.connect(_on_invisibility_changed)
    
    # PlayerBase'in _ready'si çağrılacak
    super._ready() # PlayerBase'deki add_to_group ve stat ayarları için
    # --- YENİ EKLENDİ: Loot Alanının Fizik Ayarları ---
    if is_instance_valid(loot_pickup_area):
        # Bu alan hiçbir katmanda olmasın (Layer 0)
        loot_pickup_area.collision_layer = 0 
        # Bu alan SADECE "loot" katmanını (Layer 5) algılasın
        # (Proje Ayarları'nda 5. katmanın 'loot' olduğunu varsayıyoruz. 2^4 = 16)
        loot_pickup_area.collision_mask = 16 
        
        # (Bu zaten 'true' olmalı ama garanti olsun)
        loot_pickup_area.monitoring = true 
    else:
        # Bu hatayı görmemen lazım, çünkü 'Node not found' hatasını çözdün
        print("HATA: player.gd, LootPickupArea'yı _ready içinde bulamadı!")
    # --------------------------------------------------
    
    # --- (Mevcut kodun) ---
    var hud = get_tree().get_first_node_in_group("hud")
    if hud and hud.has_node("InventoryPanel"):
        inventory_panel = hud.get_node("InventoryPanel")
    # -------------------------------
    
    $AnimatedSprite2D.play("idle_down")
    
    # --- İsim Plakası (Nameplate) Ayarları ---
    if is_instance_valid(overhead_display):
        # İsim ve level'ı PlayerData'dan al
        var player_name = "Player"
        if "character_name" in PlayerData:
            player_name = PlayerData.character_name
            
        overhead_display.set_data(player_name, level, Color.BLUE, Color.YELLOW)
        
        # Sinyali bağla
        health_updated.connect(overhead_display.update_health)
        
        # Level atlayınca level yazısını da güncellemek için
        level_updated.connect(_on_level_updated_overhead)
        
        # İlk durumu ayarla
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

    # --- İSİM PLAKASINI DİNAMİK OLARAK KAFANIN ÜSTÜNDE TUT ---
    if is_instance_valid(overhead_display):
        # 1. Dikey Pozisyon (Kafanın Üstü)
        var top_of_head = collision_shape.position.y + collision_shape.shape.get_rect().position.y
        overhead_display.position.y = top_of_head - overhead_display.size.y - 5
        
        # 2. Yatay Pozisyon (Orta)
        var half_width = overhead_display.size.x / 2
        overhead_display.position.x = -half_width

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
        
        if abs(last_direction.y) > abs(last_direction.x):
            if last_direction.y < 0: anim_sprite.play("attack_up") 
            else: anim_sprite.play("attack_down") 
        else:
            if last_direction.x < 0: anim_sprite.play("attack_left") 
            else: anim_sprite.play("attack_right") 
        
        # --- DÜZELTME: Fiziksel veya Büyü Hasarını Belirle ---
        var damage_amount: float = computed_physical_attack_power # Varsayılan: Fiziksel
        
        # Büyücü Sınıflar: Druid (0), Elementalist (2), Warlock (7), Cleric (8), Bard (9), Necromancer (10)
        var caster_classes = [0, 2, 7, 8, 9, 10]
        
        if caster_classes.has(class_id):
            # Büyücü sınıflar temel saldırıda MAP kullanmalı
            damage_amount = computed_magical_attack_power
        # -----------------------------------------------------
        
        var hit_enemies = $AttackHitbox.get_overlapping_bodies()
        
        var hit_someone = false
        for body in hit_enemies:
            if body.is_in_group("enemies") and body.has_method("receive_skill_damage"):
                body.receive_skill_damage(float(damage_amount))
                print("Düşmana Vuruldu! Hasar: ", damage_amount)
                
                # Minion'ların saldırması için hedefi ayarla
                current_target = body 
                hit_someone = true
                
                # Sadece ilk hedefe kilitleniriz
                break 
        
        if not hit_someone:
            current_target = null # Boşa vurduysak veya menzilde düşman yoksa hedefi temizle
            
        $AttackTimer.start(ATTACK_COOLDOWN)
        get_viewport().set_input_as_handled()

# --- DİĞER FONKSİYONLAR ---

func spawn_damage_number(amount, color):
    if get_parent().has_method("spawn_damage_number_on_effect_layer"):
        get_parent().spawn_damage_number_on_effect_layer(amount, color, global_position + Vector2(0, -30))
    else:
        print("HATA: Player'ın ebeveyninde 'spawn_damage_number_on_effect_layer' fonksiyonu bulunamadı!")

# --- YENİ FONKSİYON: Görünmezlik durumunu yönetir ---
func _on_invisibility_changed(is_now_invisible: bool):
    var anim_sprite = $AnimatedSprite2D

    if is_now_invisible:
        anim_sprite.modulate.a = 0.5
        set_collision_layer_value(2, false)
        print("GÖRÜNMEZ OLDUM. Katman 2 (player_detect) kapatıldı.")
        print("Mevcut katmanlarım: ", collision_layer) # Debug

    else:
        anim_sprite.modulate.a = 1.0
        set_collision_layer_value(2, true)
        print("GÖRÜNÜR OLDUM. Katman 2 (player_detect) açıldı.")
        print("Mevcut katmanlarım: ", collision_layer) # Debug
        

# --- YENİ FONKSİYON ---
# Level atlandığında overhead display'deki level yazısını günceller
func _on_level_updated_overhead(new_level: int):
    if is_instance_valid(overhead_display):
        var player_name = "Player"
        if "character_name" in PlayerData:
            player_name = PlayerData.character_name
            
        overhead_display.set_data(player_name, new_level, Color.BLUE, Color.YELLOW)
        
# --- YENİ FONKSİYONLAR (Loot için) ---

# En yakındaki toplanabilir eşyayı bulur ve toplar
