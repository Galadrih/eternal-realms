extends Node2D

# SINIF SAHNELERİNİN VERİTABANI
const CLASS_SCENES = {
    0: "res://scenes/druid.tscn",              # ID 0 (Druid)
    1: "res://scenes/berserker.tscn",          # ID 1 (Berserker)
    2: "res://scenes/elementalist.tscn",
    3: "res://scenes/monk.tscn",
    4: "res://scenes/crusader.tscn",
    5: "res://scenes/warden.tscn",
    6: "res://scenes/dragon_knight.tscn",
    7: "res://scenes/warlock.tscn",
    8: "res://scenes/cleric.tscn",
    9: "res://scenes/bard.tscn",
    10: "res://scenes/necromancer.tscn",
    11: "res://scenes/ranger.tscn"              # ID 11 (Ranger)
}

# ARAYÜZ REFERANSLARI
@onready var hud: CanvasLayer = $HUD
@onready var character_sheet = $CharacterSheet 

# KRİTİK: Player düğümünü tutacak değişken
var player_instance: CharacterBody2D = null

# Yetenek Menzilleri ve DoT Tanımları
const DEFAULT_SKILL_RANGE = 200.0 
const AOE_RANGE = 250.0 
const DOT_DURATION = 6.0    # Varsayılan DoT/HoT süresi (saniye)
const DOT_TICK_RATE = 1.0   # Varsayılan DoT/HoT tick hızı (saniye)

# YETENEKLERİN TÜRÜNÜ BELİRLEYEN LİSTE (PlayerBase'deki snake_case ID'ler kullanılmalıdır)
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
    # 1. Global PlayerData'dan hangi sınıfın seçildiğini oku
    var selected_class_id = PlayerData.character_class_id
    
    # 2. O sınıfın sahne yolunu veritabanından bul
    if not CLASS_SCENES.has(selected_class_id):
        print("HATA: Geçersiz sınıf ID'si! ", selected_class_id)
        selected_class_id = 0 

    var player_scene_path = CLASS_SCENES[selected_class_id]
    
    # 3. Sahneyi diskten yükle
    var player_scene := load(player_scene_path)
    if not player_scene:
        print("HATA: Sahne yüklenemedi! Yol: ", player_scene_path)
        return

    # 4. Sahneden bir kopya (instance) oluştur
    player_instance = player_scene.instantiate()
    
    # 5. Oyuncunun ismini PlayerData'dan alıp ayarla
    player_instance.name = PlayerData.character_name
    
    # 6. Oyuncuyu dünyaya (sahneye) ekle
    add_child(player_instance)
    
    print("Oyuncu '", player_instance.name, "' (Sınıf: ", PlayerData.character_class_name, ") dünyaya eklendi.")

    # --- BAĞLANTILAR ---
    if hud != null and player_instance != null:
        # KRİTİK: Yetenek hasar sinyalini dinle
        if player_instance.has_signal("skill_executed"):
            player_instance.skill_executed.connect(_on_player_skill_executed)
            print("World: Player yetenek hasarı sinyaline başarıyla bağlandı.")

        # HUD BAĞLANTILARI
        if hud.has_method("set_player_class_name"):
            hud.set_player_class_name(PlayerData.character_class_name)
        
        player_instance.health_updated.connect(hud.update_health)
        player_instance.experience_updated.connect(hud.update_experience)
        player_instance.level_updated.connect(hud.update_level) 
        player_instance.mana_updated.connect(hud.update_mana) 

        # HUD'ı ilk değerlerle manuel olarak GÜNCELLE
        hud.update_health(player_instance.current_health, player_instance.computed_max_health)
        hud.update_experience(player_instance.experience, player_instance.experience_to_next_level)
        hud.update_level(player_instance.level)
        hud.update_mana(player_instance.current_mana, player_instance.computed_max_mana)
    else:
        print("HATA: World.gd, HUD veya Oyuncu düğümünü bulamadı!")

    # --- KARAKTER PENCERESİ BAĞLANTISI ---
    if character_sheet != null and player_instance != null:
        # 1. Oyuncuyu CharacterSheet'e tanıt
        character_sheet.set_player(player_instance)
        
        # 2. Stats sinyali
        player_instance.stats_updated.connect(character_sheet.update_stats)
        
        # 3. Tüm statları yeniden gönder (bağlantılar kurulduktan sonra)
        player_instance.call_deferred("emit_full_stat_update")
    else:
        print("HATA: World.gd, CharacterSheet veya Oyuncu düğümünü bulamadı!")

# EKSİK OLAN FONKSİYON: Karakter penceresini aç/kapa
func toggle_character_sheet() -> void:
    if character_sheet != null:
        character_sheet.toggle()

# KRİTİK DÜZELTME: 5 ARGÜMAN ALACAK ŞEKİLDE GÜNCELLENDİ
func _on_player_skill_executed(skill_id, value, is_heal, effect_desc, target_or_position):
    
    if player_instance == null: return
    
    # 1. KENDİNE YÖNELİK ETKİLER (Self-HoT / Self-Buff)
    if target_or_position == player_instance:
        if DOT_HOTS_SKILLS.has(skill_id):
            if player_instance.has_method("apply_status_effect"):
                player_instance.apply_status_effect(skill_id, value, DOT_DURATION, DOT_TICK_RATE, true)
                print("PLAYER HoT BAŞARILI: ", skill_id, " başlatıldı.")
        
        elif effect_desc.begins_with("Buff_") or effect_desc == "Thorns" or effect_desc == "DMG Reduce":
             if player_instance.has_method("apply_buff_debuff"):
                # (Süre şimdilik 10 saniye, bunu yetenek veritabanına ekleyebiliriz)
                player_instance.apply_buff_debuff(skill_id, 10.0, effect_desc) 
                print("PLAYER BUFF BAŞARILI: ", skill_id, " başlatıldı.")
        
        # 'bloodletting' gibi anlık self-damage etkileri PlayerBase'de halledildi.
        return 

    # 2. DÜŞMANA YÖNELİK ETKİLER (Hasar, DoT, Debuff)
    
    # Anlık iyileştirme (HoT değil) veya Değersiz (Buff olmayan) sinyalleri atla
    if (is_heal and not DOT_HOTS_SKILLS.has(skill_id)) or value <= 0.0:
        # (WarCry gibi Debuff'lar buraya gelebilir, ancak value > 0 değilse atlanır)
        return 
    
    var enemies = get_tree().get_nodes_in_group("enemies") 
    var player_pos = player_instance.global_position 
    
    var is_dot = DOT_HOTS_SKILLS.has(skill_id)
    var is_instant_aoe = AOE_DAMAGE_SKILLS.has(skill_id) 
    
    var is_aoe_dot = (is_dot and (skill_id == "poison_spores" or skill_id == "bloom_field" or skill_id == "plague_field" or skill_id == "flame_vortex" or skill_id == "rot_pulse" or skill_id == "sanctified_ground"))
    
    var use_aoe_logic = is_instant_aoe or is_aoe_dot
    
    
    if use_aoe_logic:
        # --- AOE VE AOE-DOT/HOT MANTIĞI ---
        var hit_count = 0
        
        for enemy in enemies:
            if enemy.is_alive and enemy.has_method("apply_status_effect"):
                var dist = player_pos.distance_to(enemy.global_position)
                
                if dist <= AOE_RANGE: 
                    if is_dot:
                        enemy.apply_status_effect(skill_id, value, DOT_DURATION, DOT_TICK_RATE, is_heal)
                    else:
                        enemy.receive_skill_damage(value)
                    hit_count += 1
        
        if hit_count > 0:
            print("AOE BAŞARILI: ", skill_id, " ", hit_count, " canavara hasar/efekt uygulandı.")
        else:
            print("HASAR BAŞARISIZ: Menzilde hasar vurulacak canavar bulunamadı (", skill_id, ").")

    else:
        # --- TEK HEDEF MANTIĞI (DoT ve Anlık Hasar) ---
        var target_enemy = _find_nearest_target(player_pos, DEFAULT_SKILL_RANGE, enemies)
        
        if target_enemy != null:
            if is_dot:
                target_enemy.apply_status_effect(skill_id, value, DOT_DURATION, DOT_TICK_RATE, is_heal)
                print("TEK HEDEF DOT BAŞARILI: ", target_enemy.enemy_name, " - ", skill_id, " efekti başlatıldı.")
            else:
                target_enemy.receive_skill_damage(value)
                print("TEK HEDEF HASAR BAŞARILI: ", target_enemy.enemy_name, " - ", value, " hasar")
        else:
            print("HASAR BAŞARISIZ: Menzilde hasar vurulacak uygun canavar bulunamadı (", skill_id, ").")


# Yardımcı fonksiyon: En yakın hedefi bulur
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
