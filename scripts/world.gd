extends Node2D

# SINIF SAHNELERİNİN VERİTABANI
const CLASS_SCENES = {
    0: "res://scenes/druid.tscn",
    1: "res://scenes/berserker.tscn",
    2: "res://scenes/elementalist.tscn",
    3: "res://scenes/monk.tscn",
    4: "res://scenes/crusader.tscn",
    5: "res://scenes/warden.tscn",
    6: "res://scenes/dragon_knight.tscn",
    7: "res://scenes/warlock.tscn",
    8: "res://scenes/cleric.tscn",
    9: "res://scenes/bard.tscn",
    10: "res://scenes/necromancer.tscn",
    11: "res://scenes/ranger.tscn"
}

# Sınıf Renk Paleti
const CLASS_COLORS = {
    0: Color("#2E8B57"), # Druid (Doğa Yeşili)
    1: Color("#B22222"), # Berserker (Ateş Kırmızısı)
    2: Color("#1E90FF"), # Elementalist (Buz Mavisi)
    3: Color("#DAA520"), # Monk (Altın Sarısı)
    4: Color("#F0E68C"), # Crusader (Kutsal Işık Sarısı)
    5: Color("#8B4513"), # Warden (Toprak Kahvesi)
    6: Color("#FF4500"), # Dragon Knight (Turuncu Alev)
    7: Color("#9400D3"), # Warlock (Gölge Moru)
    8: Color("#FFFFFF"), # Cleric (Saf Işık Beyazı)
    9: Color("#FF69B4"), # Bard (Büyüleyici Pembe)
    10: Color("#4B0082"), # Necromancer (Ölümcül İndigo)
    11: Color("#006400")  # Ranger (Orman Yeşili)
}
const DASH_DISTANCE = 250.0 # Dash yeteneklerinin ne kadar uzağa gideceği

# Efekt Sahnemizi Yüklüyoruz
const EFFECT_SCENE = preload("res://scenes/skill_effect.tscn")
const DamageNumberScene = preload("res://scenes/damage_number.tscn")


# ARAYÜZ REFERANSLARI
@onready var hud: CanvasLayer = $HUD
@onready var character_sheet = $CharacterSheet 
@onready var effect_layer: CanvasLayer = $EffectLayer # Bu, $EffectLayer düğümüne bağlanır


# KRİTİK: Player düğümünü tutacak değişken
var player_instance: CharacterBody2D = null

# Yetenek Menzilleri ve DoT Tanımları
const DEFAULT_SKILL_RANGE = 200.0 
const AOE_RANGE = 250.0 
const DOT_DURATION = 6.0
const DOT_TICK_RATE = 1.0

# YETENEKLERİN TÜRÜNÜ BELİRLEYEN LİSTE
const AOE_DAMAGE_SKILLS = [
    "earth_splitter", "reckless_fury", "meteor_fall", "cyclone_kick",
    "radiant_slash", "arrow_storm", "infernal_charge", "winged_leap", 
    "magma_burst", "corpse_explosion", "soul_rift", "judgment_of_light", 
    "thunder_step", "seed_shot"
]

const DOT_HOTS_SKILLS = [
    "rejuvenate", "entangle_roots", "poison_spores", "rot_pulse", 
    "bloom_field", "fire_bolt", "flame_vortex", "soul_drain", 
    "curse_of_agony", "plague_field", "melody_of_healing", "beacon_of_hope", 
    "poison_arrow", "sanctified_ground", "chi_wave" 
]


func _ready() -> void:
    var selected_class_id = PlayerData.character_class_id
    
    if not CLASS_SCENES.has(selected_class_id):
        print("HATA: Geçersiz sınıf ID'si! ", selected_class_id)
        selected_class_id = 0 

    var player_scene_path = CLASS_SCENES[selected_class_id]
    var player_scene := load(player_scene_path)
    
    if not player_scene:
        print("HATA: Sahne yüklenemedi! Yol: ", player_scene_path)
        return

    player_instance = player_scene.instantiate()
    player_instance.name = PlayerData.character_name
    add_child(player_instance)
    
    print("Oyuncu '", player_instance.name, "' (Sınıf: ", PlayerData.character_class_name, ") dünyaya eklendi.")

    # --- BAĞLANTILAR ---
    if hud != null and player_instance != null:
        if player_instance.has_signal("skill_executed"):
            player_instance.skill_executed.connect(_on_player_skill_executed)
            print("World: Player yetenek hasarı sinyaline başarıyla bağlandı.")

        if hud.has_method("set_player_class_name"):
            hud.set_player_class_name(PlayerData.character_class_name)
        
        player_instance.health_updated.connect(hud.update_health)
        player_instance.experience_updated.connect(hud.update_experience)
        player_instance.level_updated.connect(hud.update_level) 
        player_instance.mana_updated.connect(hud.update_mana) 

        hud.update_health(player_instance.current_health, player_instance.computed_max_health)
        hud.update_experience(player_instance.experience, player_instance.experience_to_next_level)
        hud.update_level(player_instance.level)
        hud.update_mana(player_instance.current_mana, player_instance.computed_max_mana)
    else:
        print("HATA: World.gd, HUD veya Oyuncu düğümünü bulamadı!")

    # --- KARAKTER PENCERESİ BAĞLANTISI ---
    if character_sheet != null and player_instance != null:
        character_sheet.set_player(player_instance)
        player_instance.stats_updated.connect(character_sheet.update_stats)
        player_instance.call_deferred("emit_full_stat_update")
    else:
        print("HATA: World.gd, CharacterSheet veya Oyuncu düğümünü bulamadı!")


func world_to_screen(world_pos: Vector2) -> Vector2:
    var cam := get_viewport().get_camera_2d()
    if cam == null:
        return world_pos

    var viewport_size: Vector2 = get_viewport().get_visible_rect().size
    return (world_pos - cam.global_position) + viewport_size * 0.5

func toggle_character_sheet() -> void:
    if character_sheet != null:
        character_sheet.toggle()


    
# --- GÜVENLİK KONTROLÜ EKLENMİŞ EFEKT FONKSİYONU ---
func _spawn_skill_effect(pos: Vector2, color: Color):
    if not is_instance_valid(effect_layer):
        print("HATA: Efekt oluşturulamadı. 'EffectLayer' düğümü sahnede bulunamıyor!")
        return

    var effect = EFFECT_SCENE.instantiate()
    effect_layer.add_child(effect)

    var screen_pos := world_to_screen(pos)

    # CPUParticles2D genelde Node2D’den türediği için:
    if effect is Node2D:
        effect.position = screen_pos
    else:
        # Her ihtimale karşı fallback
        effect.global_position = screen_pos

    effect.modulate = color
    effect.emitting = true

    await effect.finished
    effect.queue_free()
# --- FONKSİYON BİTİŞİ ---


# --- Player ve Enemy bu fonksiyonu çağırır ---
func spawn_damage_number_on_effect_layer(amount: int, color: Color, pos: Vector2):
    if not is_instance_valid(effect_layer):
        return
    
    var damage_number = DamageNumberScene.instantiate()
    effect_layer.add_child(damage_number)
    
    var screen_pos = world_to_screen(pos)
    damage_number.position = screen_pos   # yine position
    damage_number.set_damage(amount, color)
# --- YENİ FONKSİYON BİTİŞİ ---


# Yetenek efektlerini ve debuff'ları tetikler
func _on_player_skill_executed(skill_id, value, is_heal, effect_desc, target_or_position):

    if player_instance == null: return

    # --- HAREKET YETENEKLERİ (DASH/CHARGE) ---
    var is_movement_skill = false
    var dash_keywords = ["Dash", "Leap", "Teleport", "Charge", "Roll", "Adımı", "Sıçrayış", "Atak"] 

    for keyword in dash_keywords:
        if effect_desc.contains(keyword):
            is_movement_skill = true
            break

    if is_movement_skill:
        print("World: Hareket yeteneği algılandı: ", skill_id)
        
        var direction = player_instance.last_direction 
        if direction == Vector2.ZERO:
            direction = Vector2(0, 1) 

        var target_pos = player_instance.global_position + (direction.normalized() * DASH_DISTANCE)
        
        var tween = create_tween()
        tween.tween_property(player_instance, "global_position", target_pos, 0.2).set_trans(Tween.TRANS_SINE)
    # --- HAREKET BLOK SONU ---


    var class_color = CLASS_COLORS.get(player_instance.class_id, Color.WHITE)
    
    # 1. KENDİNE YÖNELİK ETKİLER (Self-HoT / Self-Buff)
    if target_or_position == player_instance:
        _spawn_skill_effect(player_instance.global_position, class_color)
        
        if DOT_HOTS_SKILLS.has(skill_id):
            if player_instance.has_method("apply_status_effect"):
                player_instance.apply_status_effect(skill_id, value, DOT_DURATION, DOT_TICK_RATE, true)
                print("PLAYER HoT BAŞARILI: ", skill_id, " başlatıldı.")
        
        elif effect_desc.begins_with("Buff_") or effect_desc == "Thorns" or effect_desc.contains("DMG Reduce") or effect_desc.contains("Kalkan"):
            if player_instance.has_method("apply_buff_debuff"):
                player_instance.apply_buff_debuff(skill_id, 10.0, effect_desc) 
                print("PLAYER BUFF BAŞARILI: ", skill_id, " başlatıldı.")
        return 

    # 2. DÜŞMANA YÖNELİK ETKİLER (Hasar, DoT, Debuff)
    
    var is_debuff = effect_desc.contains("Slow") or effect_desc.contains("Root") or effect_desc.contains("Stun") or effect_desc.contains("Debuff_") or effect_desc.contains("Reduce")
    
    if (is_heal and not DOT_HOTS_SKILLS.has(skill_id)) or (value <= 0.0 and not is_debuff):
        print("World: Anlık heal veya değersiz (debuff olmayan) yetenek atlandı: ", skill_id)
        return 
    
    var enemies = get_tree().get_nodes_in_group("enemies") 
    var player_pos = player_instance.global_position 
    
    var is_dot = DOT_HOTS_SKILLS.has(skill_id)
    var is_instant_aoe = AOE_DAMAGE_SKILLS.has(skill_id) 
    var is_aoe_dot = (is_dot and (skill_id == "poison_spores" or skill_id == "bloom_field" or skill_id == "plague_field" or skill_id == "flame_vortex" or skill_id == "rot_pulse" or skill_id == "sanctified_ground"))
    
    var use_aoe_logic = is_instant_aoe or is_aoe_dot
    
    if not use_aoe_logic and (effect_desc == "Alan Slow"):
        use_aoe_logic = true
    
    
    if use_aoe_logic:
        # --- AOE VE AOE-DOT/HOT MANTIĞI ---
        _spawn_skill_effect(player_pos, class_color.lightened(0.3))
        
        var hit_count = 0
        for enemy in enemies:
            if enemy.is_alive and enemy.has_method("apply_status_effect"):
                var dist = player_pos.distance_to(enemy.global_position)
                
                if dist <= AOE_RANGE: 
                    if is_dot:
                        enemy.apply_status_effect(skill_id, value, DOT_DURATION, DOT_TICK_RATE, is_heal)
                    elif not is_dot:
                        enemy.receive_skill_damage(value)
                    
                    _apply_enemy_debuffs(enemy, effect_desc)
                    hit_count += 1
        
        if hit_count > 0:
            print("AOE BAŞARILI: ", skill_id, " ", hit_count, " canavara hasar/efekt uygulandı.")
        else:
            print("HASAR BAŞARISIZ: Menzilde hasar vurulacak canavar bulunamadı (", skill_id, ").")

    else:
        # --- TEK HEDEF MANTIĞI (DoT ve Anlık Hasar) ---
        var target_enemy = _find_nearest_target(player_pos, DEFAULT_SKILL_RANGE, enemies)
        
        if target_enemy != null:
            _spawn_skill_effect(target_enemy.global_position, class_color)
            
            if is_dot:
                target_enemy.apply_status_effect(skill_id, value, DOT_DURATION, DOT_TICK_RATE, is_heal)
                # --- DÜZELTME: Bu print satırı 'if is_dot' içine alındı ---
                print("TEK HEDEF DOT BAŞARILI: ", target_enemy.enemy_name, " - ", skill_id, " efekti başlatıldı.")
            else:
                target_enemy.receive_skill_damage(value)
                print("TEK HEDEF HASAR BAŞARILI: ", target_enemy.enemy_name, " - ", value, " hasar")

            _apply_enemy_debuffs(target_enemy, effect_desc)
        else:
            _spawn_skill_effect(player_pos, class_color.darkened(0.5)) 
            print("HASAR BAŞARISIZ: Menzilde hasar vurulacak uygun canavar bulunamadı (", skill_id, ").")


# YARDIMCI FONKSİYON: En yakın hedefi bulur
func _find_nearest_target(origin_pos: Vector2, range: float, enemies: Array):
    var target_enemy = null
    var min_distance = range
    
    for enemy in enemies:
        if enemy.is_alive and enemy.has_method("receive_skill_damage"):
            var dist = origin_pos.distance_to(enemy.global_position)
            
            if dist <= range and dist < min_distance:
                min_distance = dist
                target_enemy = enemy
                
    return target_enemy

# YARDIMCI FONKSİYON: Efekt metnini ayrıştırır ve düşmana debuff uygular
func _apply_enemy_debuffs(enemy_node, effect_desc: String):
    if not enemy_node.has_method("apply_debuff"):
        return

    # 1. YAVAŞLATMA (Slow)
    if effect_desc.contains("Slow"):
        var parts = effect_desc.split(" ")
        var slow_amount_percent = 40.0 # Varsayılan
        
        for part in parts:
            if part.ends_with("%") and part.begins_with("Slow"):
                var value_str = part.trim_prefix("Slow").trim_suffix("%")
                if value_str.is_valid_float():
                    slow_amount_percent = value_str.to_float()
                    
        var slow_amount = slow_amount_percent / 100.0 # 40.0 -> 0.4
        enemy_node.apply_debuff("Slow", 3.0, slow_amount) # Süreyi 3sn varsayalım
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " yavaşladı: ", slow_amount)

    # 2. SABİTLEME (Root)
    if effect_desc.contains("Root"):
        var parts = effect_desc.split(" ")
        var duration = 1.5 # Varsayılan
        
        for part in parts:
            if part.ends_with("s") and part.begins_with("Root"):
                var value_str = part.trim_prefix("Root").trim_suffix("s")
                if value_str.is_valid_float():
                    duration = value_str.to_float() # 1.5
                    break
                    
        enemy_node.apply_debuff("Root", duration)
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " sabitlendi: ", duration, "s")
                        
    # 3. SERSEMLETME (Stun) - Root ile aynı etkiyi yapar (enemy.gd'ye göre)
    if effect_desc.contains("Stun"):
        var parts = effect_desc.split(" ")
        var duration = 0.8 # Varsayılan
        
        for part in parts:
            if part.ends_with("s") and part.begins_with("Stun"):
                var value_str = part.trim_prefix("Stun").trim_suffix("s")
                if value_str.is_valid_float():
                    duration = value_str.to_float() # 0.8
                    break
                    
        enemy_node.apply_debuff("Root", duration) # Stun = Root
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " sersemledi: ", duration, "s")

    # 4. STAT DÜŞÜRME (Debuff_AtkDef)
    if effect_desc.contains("Debuff_AtkDef") or effect_desc.contains("Atk Reduce"):
        enemy_node.apply_debuff("Debuff_AtkDef", 8.0) # 8sn varsayalım
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " zayıfladı (Atk/Def)")
    
    # 5. İYİLEŞME AZALTMA (Heal Reduce)
    if effect_desc.contains("Heal Reduce"):
        enemy_node.apply_debuff("Heal_Reduce", 10.0, 0.5) # 10sn, %50 azaltma varsayalım
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " iyileşme azaltması aldı.")
