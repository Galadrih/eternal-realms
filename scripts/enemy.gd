extends CharacterBody2D

# --- YENİ SİNYAL ---
# Canımız her değiştiğinde bu sinyali yayacağız
signal health_updated(current_hp, max_hp)
# --------------------
var hud = null # <-- YENİ EKLENDİ
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
@export var drop_chance: float = 0.2 # --- YENİ EKLENDİ (Drop şansı, 0.0 ile 1.0 arası) ---
# --- YENİ EKLENTİ: ALTIN ---
@export var gold_reward_min: int = 2
@export var gold_reward_max: int = 8
# ---------------------------
# -----------------------------

# --- DURUM ETKİLERİ (DOT/HOT/DEBUFF) ---
var active_dots: Dictionary = {}
var active_debuffs: Dictionary = {} # Slow, Root, Stun vb.
# --- DÜĞÜM REFERANSLARI ---
@onready var attack_timer = $AttackTimer
@onready var attack_area = $AttackArea
@onready var follow_area = $FollowArea
@onready var collision_shape = $CollisionShape2D
@onready var respawn_timer = $RespawnTimer
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var body_linger_timer = $BodyLingerTimer
@onready var health_bar = $HealthBar
@onready var overhead_display: VBoxContainer = $OverheadDisplay

var target = null
var can_attack = true
var is_alive = true
var start_position = Vector2.ZERO
var last_direction = Vector2(0, 1)

func _ready():
    start_position = global_position
    
    # --- DEĞİŞTİRİLDİ ---
    # Canı doğrudan atamak yerine sinyali tetikleyen set_health kullan
    set_health(max_health)
    # --------------------
    
    health_bar.max_value = max_health 
    # health_bar.value = current_health # (set_health içine taşındı)
    add_to_group("enemies") 
    
    # --- YENİ BLOK BAŞLANGICI ---
    if is_instance_valid(overhead_display):
        # Düşman level'ı için şimdilik 1 kullanıyoruz, istersen @export var level yapabilirsin
        overhead_display.set_data(enemy_name, 1, Color.RED, Color.YELLOW)
        
        # Sinyali bağla
        health_updated.connect(overhead_display.update_health)
        
        # İlk durumu ayarla (can barını gizlemek için)
        overhead_display.update_health(current_health, max_health)
    # --- YENİ BLOK SONU ---
    
    # --- YENİ EKLENDİ: HUD referansını al ---
    hud = get_tree().get_first_node_in_group("hud")
    if not is_instance_valid(hud):
        print("HATA: enemy.gd, 'hud' grubunu bulamadı!")
    # ----------------------------------------
    
func _update_target_frame():
    var hud = get_tree().get_first_node_in_group("hud")
    if hud and hud.has_method("set_target_from_node"):
        hud.set_target_from_node(self)


func _physics_process(delta):
    # --- YENİ EKLENDİ: İSİM PLAKASINI DİNAMİK OLARAK KAFANIN ÜSTÜNDE TUT ---
    if is_instance_valid(overhead_display):
        # 1. Dikey Pozisyon (Kafanın Üstü)
        var top_of_head = collision_shape.position.y + collision_shape.shape.get_rect().position.y
        overhead_display.position.y = top_of_head - overhead_display.size.y - 5
        
        # 2. Yatay Pozisyon (Orta)
        var half_width = overhead_display.size.x / 2
        overhead_display.position.x = -half_width
    # -------------------------------------------------------------------
    
    _tick_dots(delta) 
    _tick_debuffs(delta) # Debuff sürelerini azalt
    
    if not is_alive:
        velocity = Vector2.ZERO
        move_and_slide()
        return

    var direction = Vector2.ZERO
    var current_speed = SPEED # Hızı varsayılana ayarla

    # --- HAREKET VE DEBUFF KONTROLÜ ---
    if active_debuffs.has("Root"):
        direction = Vector2.ZERO # Köklenmişse (Root) hareket etme
    elif target != null:
        var distance = global_position.distance_to(target.global_position)
        
        if distance > stop_range:
            direction = (target.global_position - global_position).normalized()
        
        if distance < ATTACK_RANGE:
            if can_attack:
                attack()
    
    if active_debuffs.has("Slow"):
        # Yavaşlatma debuff'ı varsa hızı düşür
        current_speed = SPEED * (1.0 - active_debuffs["Slow"].value)
    # --- BİTİŞ ---

    velocity = direction * current_speed
    move_and_slide()
    
    if sprite.get_animation().begins_with("attack") == false and sprite.get_animation().begins_with("hurt") == false:
        update_animation(direction)


# --- YENİ FONKSİYON (SETTER) ---
# Canı güvenle değiştirmek ve sinyal göndermek için
func set_health(new_health):
    var old_health = current_health
    current_health = clampi(new_health, 0, max_health)
    
    # Sadece can değiştiyse sinyal gönder ve barı güncelle
    if old_health != current_health:
        health_updated.emit(current_health, max_health) # Sinyali burada yay
        health_bar.value = current_health # Düşmanın kendi can barını da güncelle
# ---------------------------------


# --- DURUM ETKİSİ YÖNETİMİ ---

func apply_status_effect(skill_id: String, total_value: float, duration: float, tick_rate: float, is_heal: bool):
    if not is_alive: return

    # Düşmanlar iyileştirme (HoT) alamaz.
    if is_heal:
        print(enemy_name, " iyileştirme etkisini reddetti: ", skill_id)
        return
    # -----------------------------

    var num_ticks = ceil(duration / tick_rate)
    
    if num_ticks == 0: num_ticks = 1
    var value_per_tick = total_value / num_ticks

    active_dots[skill_id] = {
        "damage_per_tick": value_per_tick,
        "time_left": duration,
        "tick_rate": tick_rate,
        "next_tick": tick_rate, 
        "is_heal": is_heal
    }
    
    print("DÜŞMAN DURUM BAŞLATILDI: ", skill_id, " (Değer: ", total_value, ", Ticks: ", num_ticks, ")")

func apply_debuff(effect_type: String, duration: float, value: float = 0.0):
    if not is_alive: return
    
    # YENİ: Aynı türde daha güçlü bir debuff varsa, süreyi yenileme
    if active_debuffs.has(effect_type) and active_debuffs[effect_type].value > value:
        return # Mevcut debuff daha iyi
        
    active_debuffs[effect_type] = {"time_left": duration, "value": value}
    print(enemy_name, " debuff aldı: ", effect_type, " Süre: ", duration, " Değer: ", value)

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
                # --- DEĞİŞTİRİLDİ ---
                # current_health = clampi(current_health + value, 0, max_health)
                set_health(current_health + value) # Sinyal için set_health kullan
                # --------------------
                spawn_damage_number(value, Color.GREEN)
                print(enemy_name, " HoT Aldı: ", value, ". Kalan Can: ", current_health)
            else:
                # --- DEĞİŞTİRİLDİ ---
                # current_health -= value
                set_health(current_health - value) # Sinyal için set_health kullan
                # --------------------
                spawn_damage_number(value, Color("#9900CC")) # Mor renk DoT için
                print(enemy_name, " DoT Aldı: ", value, ". Kalan Can: ", current_health)
            
            # health_bar.value = current_health # (set_health içine taşındı)
            dot.next_tick = dot.tick_rate
            
            if current_health <= 0:
                # current_health = 0 # (set_health zaten 0'da sınırlar)
                die()
                keys_to_remove.append(skill_id)
                break 

        if dot.time_left <= 0.0:
            keys_to_remove.append(skill_id)

    for skill_id in keys_to_remove:
        active_dots.erase(skill_id)

func _tick_debuffs(delta):
    var keys_to_remove = []
    for debuff_id in active_debuffs.keys():
        active_debuffs[debuff_id].time_left -= delta
        if active_debuffs[debuff_id].time_left <= 0.0:
            keys_to_remove.append(debuff_id)

    for key in keys_to_remove:
        active_debuffs.erase(key)
        print(enemy_name, " debuff'ı bitti: ", key)

# --- HASAR VE SALDIRI ---

func receive_skill_damage(amount: float):
    if not is_alive: return
    
    var final_damage = amount
    
    # YENİ: Debuff'ları hasar hesaplamasına dahil et
    if active_debuffs.has("Marked"):
        final_damage *= (1.0 + active_debuffs["Marked"].value) # %15 fazla hasar
        print(enemy_name, " işaretli, ekstra hasar alıyor!")
        
    if active_debuffs.has("Armor_Shred"):
        # Normalde PDef olurdu, şimdilik hasarı direkt artıralım
        final_damage *= (1.0 + active_debuffs["Armor_Shred"].value) # %25 fazla hasar
        print(enemy_name, " zırhı kırık, ekstra hasar alıyor!")
    
    # HP değiştiyse TargetFrame'i güncelle (Bu satır _update_target_frame'i çağırır)
    _update_target_frame()
    
    take_damage(int(round(final_damage)), Color.RED) 

func take_damage(amount: int, damage_color: Color):
    if not is_alive: return
    
    # YENİ: Savunma debuff'ı varsa hasarı artır
    var final_amount = float(amount)
    if active_debuffs.has("Debuff_AtkDef"):
        final_amount *= 1.2 # Örnek: %20 daha fazla hasar al
        
    # --- DEĞİŞTİRİLDİ ---
    # current_health -= int(round(final_amount))
    set_health(current_health - int(round(final_amount))) # Sinyal için set_health kullan
    # --------------------
    
    _update_target_frame()
    
    # health_bar.value = current_health # (set_health içine taşındı)
    spawn_damage_number(int(round(final_amount)), damage_color) 
    
    print(enemy_name, " Hasar Aldı: ", int(round(final_amount)), ". Kalan Can: ", current_health)
    
    if current_health <= 0:
        # current_health = 0 # (set_health zaten 0'da sınırlar)
        die()
    else:
        if abs(last_direction.x) > abs(last_direction.y):
            if last_direction.x > 0: sprite.play("hurt_right")
            else: sprite.play("hurt_left")
        else:
            if last_direction.y > 0: sprite.play("hurt_down")
            else: sprite.play("hurt_up")


func attack():
    if not can_attack: return
    can_attack = false
    
    # ... (animasyon kodları) ...
    if abs(last_direction.x) > abs(last_direction.y):
        if last_direction.x > 0: sprite.play("attack_right")
        else: sprite.play("attack_left")
    else:
        if last_direction.y > 0: sprite.play("attack_down")
        else: sprite.play("attack_up")
    
    
    attack_timer.start()
    
    # YENİ: Hasar debuff'ı varsa saldırıyı düşür
    var final_attack_damage = ATTACK_DAMAGE
    if active_debuffs.has("Debuff_AtkDef") or active_debuffs.has("Debuff_Atk"):
        final_attack_damage = int(round(final_attack_damage * 0.8)) # %20 daha az hasar
        print(enemy_name, " zayıfladı, saldırısı düştü!")
    
    var bodies = attack_area.get_overlapping_bodies()
    for body in bodies:
        if body.is_in_group("player"):
            if body.has_method("take_damage"):
                body.take_damage(final_attack_damage, Color.WHITE, self) 
                print("Düşman, Oyuncuya vurdu! Hasar: ", final_attack_damage)

func _on_attack_timer_timeout():
    can_attack = true

# --- ALAN TESPİTİ VE ÖLÜM ---

func _on_follow_area_body_entered(body):
    if body.is_in_group("player"):
        target = body

func _on_follow_area_body_exited(body):
    print("DÜŞMAN: Bir cisim alanımdan çıktı: ", body.name) # Debug
    if body == target:
        target = null
        print("DÜŞMAN: Hedefimi (", body.name, ") kaybettim.")

func die():
    if not is_alive: return
    is_alive = false
    active_dots.clear()
    active_debuffs.clear() 
    
    set_health(0) # Sinyalin 0 can göndermesini garantile
    
    health_bar.visible = false 
    overhead_display.visible = false # --- YENİ EKLENDİ ---
    
    print(enemy_name, " yenildi!")
    
    if target != null and target.has_method("add_experience"):
        target.add_experience(experience_reward)
        # --- YENİ EKLENTİ: ALTIN VERME ---
        if target.has_method("add_gold"):
            var gold_to_drop = randi_range(gold_reward_min, gold_reward_max)
            if gold_to_drop > 0:
                target.add_gold(gold_to_drop)
        # -------------------------------
        
   # --- GÜNCELLENMİŞ BLOK: OTOMATİK LOOT ---
    
    # 'drop_chance' yerine şimdilik %100 drop için 'true' kullan
    if true: # randf() < drop_chance:
        
        # 'world' yerine 'hud'ı kullanacağız
        if is_instance_valid(hud) and is_instance_valid(target) and PlayerData:
            var p_class_name = PlayerData.character_class_name
            var level = target.level
            
            if ItemDB: # ItemDB'nin Autoload olduğunu varsayıyoruz
                var item_data = ItemDB.get_random_item_for_class(p_class_name, level)
                
                if not item_data.is_empty():
                    print("DEBUG: Eşya bulundu: ", item_data.name) 
                    
                    # 1. Envantere eklemeyi dene
                    var success = hud.inventory_panel.add_item_to_inventory(item_data)
                    
                    if success:
                        # 2. Başarılıysa, HUD'a bildirimi göster
                        hud.show_loot_alert(item_data)
                    else:
                        # 3. Envanter doluysa (şimdilik) yere at
                        # (Bu, 'world.gd'de 'drop_item_at' fonksiyonu olmasını gerektirir)
                        print("DEBUG: Envanter dolu, eşya yere atılamadı (world.drop_item_at eksik)")
                        # var world = get_tree().get_first_node_in_group("world")
                        # if is_instance_valid(world):
                        # 	world.drop_item_at(item_data, global_position)
                else:
                    print("DEBUG: ItemDB eşya bulamadı (get_random_item_for_class boş döndü)")
        else:
            if not is_instance_valid(hud):
                print("HATA: 'die()' fonksiyonu 'hud' referansını bulamadı!")
    # --- OTOMATİK LOOT SONU ---
    
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

# --- ANİMASYON VE YARDIMCI FONKSİYONLAR ---

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
    
    # --- DEĞİŞTİRİLDİ ---
    # current_health = max_health
    set_health(max_health) # Sinyal için set_health kullan
    # --------------------
    
    health_bar.max_value = max_health
    # health_bar.value = current_health # (set_health içine taşındı)
    health_bar.visible = true
    overhead_display.visible = true # --- YENİ EKLENDİ ---
    
    var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
    var random_distance = randf_range(0, respawn_radius)
    global_position = start_position + (random_direction * random_distance)
    
    target = null
    
    sprite.visible = true
    sprite.play("idle_down")
    collision_shape.disabled = false
    attack_area.get_node("CollisionShape2D").disabled = false
    follow_area.get_node("CollisionShape2D").disabled = false

# --- Hasar Sayısı Fonksiyonu ---
func spawn_damage_number(amount, color):
    if get_parent().has_method("spawn_damage_number_on_effect_layer"):
        get_parent().spawn_damage_number_on_effect_layer(amount, color, global_position + Vector2(0, -35))
    else:
        print("HATA: Enemy'nin ebeveyninde 'spawn_damage_number_on_effect_layer' fonksiyonu bulunamadı!")
        
        # enemy.gd'nin en sonuna ekle

# enemy.gd'nin en sonuna (veya var olan fonksiyonun üzerine) yapıştır

# --- YENİ EKLENDİ: GLOW KONTROLÜ (Düzeltildi) ---
# Hedef halkası yerine düşmanın parlamasını sağlar
func set_glow_state(is_glowing: bool):
    if not is_instance_valid(sprite):
        return # Sprite yoksa hata verme
        
    if is_glowing:
        # Hata giderildi: 'YELLOW_ORANGE' yerine 'ORANGE' kullanıldı ve parlaklığı artırıldı.
        sprite.modulate = Color.ORANGE * 1.5 
    else:
        # Normal renge (beyaza) dön
        sprite.modulate = Color.WHITE
# ------------------------------------
# ------------------------------------
