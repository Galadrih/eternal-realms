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
const LOOT_SCENE = preload("res://scenes/ui/LootBag.tscn")

# --- YENİ EKLENTİ: Tüm Minion Sahnelerinin Yolları ---
# Artık her yetenek ID'si kendi .tscn dosyasını çağıracak.
# Bu dosyaların "res://scenes/" altında olması gerekir.
const MINION_SCENE_PATHS = {
    "summon_companion": "res://scenes/summon_companion.tscn",             # Warden: Kurt/Ayı/Kartal
    "guardian_of_the_forest": "res://scenes/guardian_of_the_forest.tscn", # Warden: Toprak Golemi
    "infernal_summon": "res://scenes/infernal_summon.tscn",               # Warlock: İblis
    "raise_skeletons": "res://scenes/raise_skeletons.tscn",               # Necromancer: İskeletler
    "summon_abomination": "res://scenes/summon_abomination.tscn"          # Necromancer: Tank Minion
}
# --------------------------------------------------

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

# --- YENİ EKLENTİ: TAB HEDEFLEME MENZİLİ ---
const TAB_TARGET_RANGE = 400.0
# -------------------------------------------

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

# --- YENİ DEĞİŞKEN: TAB İLE HEDEFLEME İÇİN ---
var current_target_index = -1
# -------------------------------------------


func _ready() -> void:
    add_to_group("world") # <-- BU SATIRI EKLE
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
    
    # HUD bağlantılarından SONRA:
    if hud != null:
        var inv_panel: Node = hud.get_node_or_null("InventoryPanel")
        if inv_panel and inv_panel.has_method("set_player"):
            inv_panel.set_player(player_instance)
        # --- DÜZENLEME BURADA ---
            if player_instance.has_signal("gold_updated") and inv_panel.has_method("update_gold_display"):
                # 1. Sinyali GELECEKTEKİ güncellemeler için bağla
                player_instance.gold_updated.connect(inv_panel.update_gold_display)
                
                # 2. (YENİ EKLENTİ) Etiketi BAŞLANGIÇ durumu için manuel olarak güncelle
                # Bu, oyun başlar başlamaz doğru altını gösterir.
                if "gold" in PlayerData:
                    inv_panel.update_gold_display(PlayerData.gold)
            # --- DÜZENLEME SONU ---

    print("Oyuncu '", player_instance.name, "' (Sınıf: ", PlayerData.character_class_name, ") dünyaya eklendi.")

    # --- BAĞLANTILAR ---
    if hud != null and player_instance != null:
        if player_instance.has_signal("skill_executed"):
            player_instance.skill_executed.connect(_on_player_skill_executed)
            print("World: Player yetenek hasarı sinyaline başarıyla bağlandı.")

        if hud.has_method("set_player_class_name"):
            hud.set_player_class_name(PlayerData.character_class_name)
        
        if hud.has_method("set_character_name"):
            hud.set_character_name(PlayerData.character_name)
        
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


# world.gd'deki mevcut _input fonksiyonunun tamamını değiştir.
func _input(event):
    # Oyuncu henüz oluşturulmadıysa veya UI'a tıklandıysa işlemi durdur
    if not is_instance_valid(player_instance):
        return
    if get_viewport().gui_get_focus_owner() != null:
        return

    # --- TAB HEDEFLEME ---
    if event.is_action_pressed("target_next_enemy"):
        get_viewport().set_input_as_handled() 
        
        var enemies = get_tree().get_nodes_in_group("enemies")
        var alive_enemies_in_range = []
        var player_pos = player_instance.global_position
        
        # Hangi düşmanın glow'unu kapatacağımızı kaydet
        var old_target = player_instance.current_target
        
        for enemy in enemies:
            if enemy.is_alive:
                var dist = player_pos.distance_to(enemy.global_position)
                if dist <= TAB_TARGET_RANGE:
                    alive_enemies_in_range.append(enemy)
        
        if alive_enemies_in_range.is_empty():
            # Menzilde düşman yoksa, eski hedefin glow'unu kapat ve temizle
            if is_instance_valid(old_target) and old_target.has_method("set_glow_state"):
                old_target.set_glow_state(false)
                
            player_instance.current_target = null
            hud.set_target_from_node(null)
            current_target_index = -1
            return 
        
        alive_enemies_in_range.sort_custom(Callable(self, "_sort_by_distance_to_player"))

        var current_target = player_instance.current_target
        if is_instance_valid(current_target) and current_target in alive_enemies_in_range:
            current_target_index = alive_enemies_in_range.find(current_target)
        else:
            current_target_index = -1 
            
        current_target_index = (current_target_index + 1) % alive_enemies_in_range.size()
        
        var new_target = alive_enemies_in_range[current_target_index]
        
        # --- DÜZELTME: GLOW YÖNETİMİ ---
        if is_instance_valid(old_target) and old_target != new_target and old_target.has_method("set_glow_state"):
            old_target.set_glow_state(false)
            
        if is_instance_valid(new_target) and new_target.has_method("set_glow_state"):
            new_target.set_glow_state(true)
        # --------------------------------
        
        player_instance.current_target = new_target
        hud.set_target_from_node(new_target)

    # --- TIKLAMA İLE HEDEFLEME ---
    elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        
        var mouse_pos = get_global_mouse_position()
        var space_state = get_world_2d().direct_space_state
        
        var query = PhysicsPointQueryParameters2D.new()
        query.position = mouse_pos
        query.collision_mask = 1 << 2 # 3. katman "enemies"
        query.collide_with_bodies = true
        
        var results = space_state.intersect_point(query, 1) 
        var old_target = player_instance.current_target # Eski hedefi kaydet

        if not results.is_empty():
            var collider = results[0].collider
            
            if collider.is_in_group("enemies") and collider.has_method("die") and collider.is_alive:
                
                # --- DÜZELTME: GLOW YÖNETİMİ (Yeni Hedef) ---
                if is_instance_valid(old_target) and old_target != collider and old_target.has_method("set_glow_state"):
                    old_target.set_glow_state(false)
                    
                if collider.has_method("set_glow_state"):
                    collider.set_glow_state(true)
                # -------------------------------------------
                
                player_instance.current_target = collider
                hud.set_target_from_node(collider)
                
                var enemies = get_tree().get_nodes_in_group("enemies")
                var alive_enemies_in_range = []
                for enemy in enemies:
                    if enemy.is_alive and player_instance.global_position.distance_to(enemy.global_position) <= TAB_TARGET_RANGE:
                        alive_enemies_in_range.append(enemy)
                
                if !alive_enemies_in_range.is_empty():
                    alive_enemies_in_range.sort_custom(Callable(self, "_sort_by_distance_to_player"))
                    current_target_index = alive_enemies_in_range.find(collider)
                else:
                    current_target_index = -1
            else:
                # Geçersiz tıklama (boşa veya ölü hedefe)
                # --- DÜZELTME: GLOW YÖNETİMİ (Hedef Temizleme) ---
                if is_instance_valid(old_target) and old_target.has_method("set_glow_state"):
                    old_target.set_glow_state(false)
                # ------------------------------------------------
                
                player_instance.current_target = null
                hud.set_target_from_node(null) 
                current_target_index = -1 
        else:
            # Boş alana tıklandı
            # --- DÜZELTME: GLOW YÖNETİMİ (Hedef Temizleme) ---
            if is_instance_valid(old_target) and old_target.has_method("set_glow_state"):
                old_target.set_glow_state(false)
            # ------------------------------------------------
                
            if player_instance.current_target != null:
                player_instance.current_target = null
                hud.set_target_from_node(null) 
                current_target_index = -1
# --- INPUT FONKSİYONU SONU ---


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

    if effect is Node2D:
        effect.position = screen_pos
    else:
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
    damage_number.position = screen_pos
    damage_number.set_damage(amount, color)
# --- YENİ FONKSİYON BİTİŞİ ---


# Yetenek efektlerini ve debuff'ları tetikler
func _on_player_skill_executed(skill_id, value, is_heal, effect_desc, target_or_position):

    if player_instance == null: 
        return

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
    
    # =======================================================================
    # KENDİNE YÖNELİK ETKİLER
    # =======================================================================
    if target_or_position == player_instance:
        _spawn_skill_effect(player_instance.global_position, class_color)
        
        # --- ÇAĞIRMA MANTIĞI ---
        if MINION_SCENE_PATHS.has(skill_id):
            var scene_path = MINION_SCENE_PATHS[skill_id]
            var minion_scene = load(scene_path)
            
            if not minion_scene:
                print("HATA: Minion sahnesi yüklenemedi! Yol: ", scene_path)
                return
                
            var minion = minion_scene.instantiate()
            minion.global_position = player_instance.global_position + (Vector2.RIGHT * 60).rotated(randf_range(0, TAU))
            add_child(minion)
            minion.set_owner_and_duration(player_instance, 30.0)
            print("WORLD: Minion çağrıldı: ", skill_id)
        
        elif is_heal:
            if DOT_HOTS_SKILLS.has(skill_id):
                if player_instance.has_method("apply_status_effect"):
                    player_instance.apply_status_effect(skill_id, value, DOT_DURATION, DOT_TICK_RATE, true)
                    print("PLAYER HoT BAŞARILI: ", skill_id, " başlatıldı.")
            else:
                if player_instance.has_method("heal"):
                    player_instance.heal(int(round(value)), Color.GREEN)
                    print("PLAYER ANLIK HEAL BAŞARILI: ", skill_id, " uygulandı.")
        else:
            if player_instance.has_method("apply_buff_debuff"):
                player_instance.apply_buff_debuff(skill_id, 10.0, effect_desc) 
                print("PLAYER BUFF BAŞARILI: ", skill_id, " (Etki: ", effect_desc, ") başlatıldı.")
        
        return
    # --- SELF BLOK SONU ---


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
                    # TARGETFRAME: AOE'de vurulan ilk düşmanı hedef yap
                    # (Sadece mevcut bir hedefimiz yoksa ilk vurulanı kilitle)
                    if hit_count == 0 and hud != null and not is_instance_valid(player_instance.current_target):
                        print("WORLD: TargetFrame AOE ->", enemy.name)
                        player_instance.current_target = enemy # Oyuncunun hedefini de ayarla
                        hud.set_target_from_node(enemy)

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
        
        # ÖNCE: Oyuncunun kilitli bir hedefi var mı? (Tıklayarak veya Tab ile seçtiği)
        var target_enemy = player_instance.current_target
        
        # EĞER YOKSA: En yakındakini bul
        if not is_instance_valid(target_enemy):
            target_enemy = _find_nearest_target(player_pos, DEFAULT_SKILL_RANGE, enemies)
        
        if is_instance_valid(target_enemy):
            # Menzil dışındaysa yine de vurma
            if player_pos.distance_to(target_enemy.global_position) > DEFAULT_SKILL_RANGE:
                print("HASAR BAŞARISIZ: Kilitli hedef menzil dışında (", target_enemy.enemy_name, ").")
                return

            # TARGETFRAME: Tek hedef skillde hedefi set et (zaten kilitli değilse)
            if hud != null and player_instance.current_target != target_enemy:
                print("WORLD: TargetFrame OTOMATİK ->", target_enemy.name)
                player_instance.current_target = target_enemy
                hud.set_target_from_node(target_enemy)

            _spawn_skill_effect(target_enemy.global_position, class_color)
            
            if is_dot:
                target_enemy.apply_status_effect(skill_id, value, DOT_DURATION, DOT_TICK_RATE, is_heal)
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
        var slow_amount_percent = 40.0
        
        for part in parts:
            if part.ends_with("%") and part.begins_with("Slow"):
                var value_str = part.trim_prefix("Slow").trim_suffix("%")
                if value_str.is_valid_float():
                    slow_amount_percent = value_str.to_float()
                    
        var slow_amount = slow_amount_percent / 100.0
        enemy_node.apply_debuff("Slow", 3.0, slow_amount)
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " yavaşladı: ", slow_amount)

    # 2. SABİTLEME (Root)
    if effect_desc.contains("Root"):
        var parts = effect_desc.split(" ")
        var duration = 1.5
        
        for part in parts:
            if part.ends_with("s") and part.begins_with("Root"):
                var value_str = part.trim_prefix("Root").trim_suffix("s")
                if value_str.is_valid_float():
                    duration = value_str.to_float()
                    break
                    
        enemy_node.apply_debuff("Root", duration)
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " sabitlendi: ", duration, "s")
                        
    # 3. SERSEMLETME (Stun) / ZAYIF SERSEMLETME
    if effect_desc.contains("Stun") or effect_desc.contains("Sersemletme"):
        var parts = effect_desc.split(" ")
        var duration = 0.8
        
        for part in parts:
            if part.ends_with("s") and (part.begins_with("Stun") or part.begins_with("Sersemletme")):
                var value_str = part.trim_prefix("Stun").trim_prefix("Sersemletme").trim_suffix("s")
                if value_str.is_valid_float():
                    duration = value_str.to_float()
                    break
                    
        enemy_node.apply_debuff("Root", duration)
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " sersemledi: ", duration, "s")
    
    # 4. STAT DÜŞÜRME (Atk/Def Reduce)
    if effect_desc.contains("Debuff_AtkDef") or effect_desc.contains("Atk Reduce") or effect_desc.contains("Atk Düşürme") or effect_desc.contains("Def Düşürme"):
        enemy_node.apply_debuff("Debuff_AtkDef", 8.0)
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " zayıfladı (Atk/Def)")
    
    # 5. İYİLEŞME AZALTMA (Heal Reduce)
    if effect_desc.contains("Heal Reduce"):
        enemy_node.apply_debuff("Heal_Reduce", 10.0, 0.5)
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " iyileşme azaltması aldı.")
        
    # 6. ZIRH KIRMA (Armor Shred)
    if effect_desc.contains("Zırh Kırma") or effect_desc.contains("Zırh Delme"):
        var parts = effect_desc.split(" ")
        var shred_amount = 25.0
        
        for part in parts:
            if part.ends_with("%"):
                var value_str = part.trim_suffix("%")
                if value_str.is_valid_float():
                    shred_amount = value_str.to_float()
                    break
        
        enemy_node.apply_debuff("Armor_Shred", 8.0, shred_amount / 100.0)
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " zırhı kırıldı: %", shred_amount)

    # 7. İŞARETLEME (Marked)
    if effect_desc.contains("Hedef İşaretle"):
        enemy_node.apply_debuff("Marked", 10.0, 0.15)
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " işaretlendi!")
        
    # 8. SADECE ATK DÜŞÜRME (Debuff_Atk)
    if effect_desc == "Debuff_Atk":
        enemy_node.apply_debuff("Debuff_Atk", 8.0, 0.20)
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " saldırı gücü düştü!")
        
    # 9. CRIT DÜŞÜRME (Debuff_Crit)
    if effect_desc == "Debuff_Crit":
        enemy_node.apply_debuff("Debuff_Crit", 8.0)
        print("DEBUFF UYGULANDI: ", enemy_node.enemy_name, " kritik şansı düştü!")


# --- YENİ YARDIMCI FONKSİYON: DÜŞMANLARI MESAFEYE GÖRE SIRALAR ---
# sort_custom için bir karşılaştırıcı (comparator) fonksiyonu
# 'a' ve 'b' iki düşman (enemy) node'udur.
func _sort_by_distance_to_player(a, b):
    if not is_instance_valid(player_instance):
        return false # Oyuncu yoksa sıralama yapma
    
    var player_pos = player_instance.global_position
    # (distance_squared_to kullanmak, kök alma (sqrt) işleminden 
    #  kaçındığı için daha hızlıdır ve sıralama için yeterlidir)
    var dist_a = player_pos.distance_squared_to(a.global_position)
    var dist_b = player_pos.distance_squared_to(b.global_position)
    
    return dist_a < dist_b
# ----------------------------------------------------------------
# --- YENİ EKLENDİ: EŞYA DÜŞÜRME FONKSİYONU ---
# enemy.gd'deki die() fonksiyonu bu fonksiyonu çağırır
func drop_item_at(item_data: Dictionary, position: Vector2):
    if item_data.is_empty():
        return
        
    # 1. LootBag sahnesini oluştur
    var loot_bag = LOOT_SCENE.instantiate()
    
    # 2. Pozisyonunu ayarla (üst üste binmesinler diye hafif rastgele)
    loot_bag.global_position = position + Vector2(randf_range(-15, 15), randf_range(-15, 15))
    
    # 3. loot.gd'ye hangi eşya olduğunu söyle
    loot_bag.set_item(item_data)
    
    # 4. Sahnemize (World) ekle
    #    (Eğer YSort kullanıyorsan $YSort.add_child(loot_bag) daha iyi olabilir)
    add_child(loot_bag)
# --- FONKSİYON SONU ---
