extends CharacterBody2D

# --- SİNYAL ---
signal health_updated(current_hp, max_hp)

var level: int = 1
var loot_table_id: String = ""

# --- DÜŞMAN KİMLİĞİ (EnemyDb için) ---
@export var enemy_id: StringName = &"wolf_1"
@export var enemy_level: int = 1

# --- DÜŞMAN İSTATİSTİKLERİ (default) ---
@export var max_health: int = 50
var current_health: int = 50
@export var SPEED: float = 100.0
@export var ATTACK_DAMAGE: int = 5
@export var ATTACK_RANGE: float = 40.0
@export var stop_range: float = 50.0
@export var experience_reward: int = 15
@export var enemy_name: String = "Goblin"

@export var respawn_radius: float = 100.0
@export var drop_chance: float = 0.2

# --- ALTIN ÖDÜLÜ ---
@export var gold_reward_min: int = 2
@export var gold_reward_max: int = 8

# --- AI PARAMETRELERİ (EnemyDb'den override edilecek) ---
@export var is_aggressive: bool = true      # true → oyuncuyu görünce saldırır; false → sadece vurulunca agro
@export var aggro_range: float = 250.0      # agresifse kaç pikselden agro alır
@export var leash_radius: float = 800.0     # yuvasından ne kadar uzağa kovalar
@export var wander_radius: float = 400.0   # yuvası etrafında gezeceği alan

enum EnemyState { IDLE, WANDER, CHASE, RETURN }
var state: int = EnemyState.IDLE
var wander_target: Vector2 = Vector2.ZERO
var idle_time: float = 0.0

# --- DURUM ETKİLERİ (DOT/HOT/DEBUFF) ---
var active_dots: Dictionary = {}
var active_debuffs: Dictionary = {} # Slow, Root, Stun vb.

# --- DÜĞÜM REFERANSLARI ---
@onready var attack_timer: Timer = $AttackTimer
@onready var attack_area: Area2D = $AttackArea
@onready var follow_area: Area2D = $FollowArea
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var respawn_timer: Timer = $RespawnTimer
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var body_linger_timer: Timer = $BodyLingerTimer
@onready var health_bar: ProgressBar = $HealthBar
@onready var overhead_display: VBoxContainer = $OverheadDisplay

var target: Node = null
var can_attack: bool = true
var is_alive: bool = true
var start_position: Vector2 = Vector2.ZERO
var last_direction: Vector2 = Vector2(0, 1)

var hud: Node = null
var enemy_db: Node = null

# --- Temel renk (her düşmanın “default” rengi) ---
var base_modulate: Color = Color(1, 1, 1, 1)


func _ready() -> void:
    start_position = global_position

    # 1) ÖNCE EnemyDb’den veriyi çek
    _apply_enemy_data()

    # 2) enemy_id'ye göre spriteFrames'i doğru sahneden çek
    _apply_sprite_scene_from_enemy_id()

    # 3) Enemy verisine göre temel rengini ata (wolf_1..wolf_6 vb.)
    _apply_sprite_color_from_enemy_id()

    # 4) Canı buna göre set et
    if is_instance_valid(health_bar):
        health_bar.max_value = max_health
    set_health(max_health)

    add_to_group("enemies")

    if is_instance_valid(overhead_display):
        overhead_display.set_data(enemy_name, enemy_level, Color.RED, Color.YELLOW)
        health_updated.connect(overhead_display.update_health)
        overhead_display.update_health(current_health, max_health)

    hud = get_tree().get_first_node_in_group("hud")
    if not is_instance_valid(hud):
        print("HATA: enemy.gd, 'hud' grubunu bulamadı!")

    # İlk state → biraz idle
    idle_time = randf_range(0.3, 1.0)
    state = EnemyState.IDLE


# ==============================
#  ENEMYDB'DEN VERİ ÇEKME
# ==============================
func _apply_enemy_data() -> void:
    # EnemyDb autoload yoksa hiç dokunma
    if typeof(EnemyDb) == TYPE_NIL:
        push_warning("enemy.gd: EnemyDb autoload bulunamadı, export değerleri kullanılacak.")
        return

    if not ("ENEMIES" in EnemyDb) or not (EnemyDb.ENEMIES is Dictionary):
        push_warning("enemy.gd: EnemyDb.ENEMIES bulunamadı, export değerleri kullanılacak.")
        return

    var enemies_dict: Dictionary = EnemyDb.ENEMIES
    var data: Dictionary = {}

    # ---------------------------------------------
    # 1) BACKWARDS COMPAT: eski wolf_1..wolf_6 → yeni id'ler
    # ---------------------------------------------
    var id_str: String = str(enemy_id)
    var compat_map := {
        "wolf_1": "wolf_lv1",
        "wolf_2": "wolf_lv3",
        "wolf_3": "wolf_lv5",
        "wolf_4": "wolf_lv8",
        "wolf_5": "wolf_lv12",
        "wolf_6": "wolf_lv15",
    }

    if compat_map.has(id_str):
        var mapped: String = str(compat_map[id_str])
        if enemies_dict.has(mapped):
            print("enemy.gd: Eski id '%s' yeni id '%s' olarak eşlendi." % [id_str, mapped])
            enemy_id = StringName(mapped)
            id_str = mapped

    # ---------------------------------------------
    # 2) Önce EnemyDb.get_enemy_data(enemy_id) dene
    # ---------------------------------------------
    if EnemyDb.has_method("get_enemy_data"):
        var result: Variant = EnemyDb.get_enemy_data(enemy_id)
        if result is Dictionary:
            data = result

    # 3) Hâlâ boşsa, ENEMIES[enemy_id] dene
    if data.is_empty() and enemies_dict.has(enemy_id) and enemies_dict[enemy_id] is Dictionary:
        data = enemies_dict[enemy_id]

    # 4) Hâlâ boşsa: level’e göre en yakın kurdu bul (aynı family)
    if data.is_empty():
        var best_id: String = ""
        var best_delta: float = 999999.0

        for k in enemies_dict.keys():
            var e_data = enemies_dict[k]
            if not (e_data is Dictionary):
                continue

            var k_str: String = str(k)
            if not k_str.begins_with("wolf_"):
                continue

            var lvl: int = int(e_data.get("level", 1))
            var delta: float = float(abs(lvl - enemy_level))
            if delta < best_delta:
                best_delta = delta
                best_id = k_str

        if best_id != "":
            data = enemies_dict[best_id]
            print("enemy.gd: '%s' bulunamadı, en yakın seviye düşman olarak '%s' kullanıldı." % [id_str, best_id])
            enemy_id = StringName(best_id)
            id_str = best_id

    # 5) Son kontrol – hâlâ boşsa export değerleriyle devam
    if data.is_empty():
        push_warning("enemy.gd: EnemyDb içinde '%s' için veri bulunamadı, export değerleri kullanılacak." % str(enemy_id))
        return

    # --- DEBUG ---
    print("EnemyDb RAW (%s): %s" % [str(enemy_id), data])
    print("EnemyDb KEYS (%s): %s" % [str(enemy_id), data.keys()])

    # --------------------------------------------------
    #  İSİM / LEVEL
    # --------------------------------------------------
    enemy_name = str(data.get("name", enemy_name))

    if data.has("level"):
        enemy_level = int(data["level"])
    elif data.has("lvl"):
        enemy_level = int(data["lvl"])

    # EnemyDb içindeki loot_table_id varsa, local değişkene yaz
    if data.has("loot_table_id"):
        loot_table_id = str(data["loot_table_id"])

    # --------------------------------------------------
    #  HP
    # --------------------------------------------------
    var hp: int = max_health
    var hp_set: bool = false

    if data.has("max_health"):
        hp = int(data["max_health"]); hp_set = true
    elif data.has("hp_max"):
        hp = int(data["hp_max"]); hp_set = true
    elif data.has("max_hp"):
        hp = int(data["max_hp"]); hp_set = true
    elif data.has("hp"):
        hp = int(data["hp"]); hp_set = true
    elif data.has("health"):
        hp = int(data["health"]); hp_set = true
    elif data.has("maxHp"):
        hp = int(data["maxHp"]); hp_set = true
    elif data.has("MaxHP"):
        hp = int(data["MaxHP"]); hp_set = true
    elif data.has("hp_base"):
        hp = int(data["hp_base"]); hp_set = true
    elif data.has("base_hp"):
        hp = int(data["base_hp"]); hp_set = true
    elif data.has("base_health"):
        hp = int(data["base_health"]); hp_set = true

    if not hp_set:
        push_warning("enemy.gd: EnemyDb'de '%s' için HP alanı bulunamadı, export max_health=%d kullanılacak." % [str(enemy_id), max_health])

    max_health = hp
    current_health = max_health

    # --------------------------------------------------
    #  DAMAGE
    # --------------------------------------------------
    var dmg: int = ATTACK_DAMAGE
    if data.has("attack_damage"):
        dmg = int(data["attack_damage"])
    elif data.has("damage"):
        dmg = int(data["damage"])
    elif data.has("attack"):
        dmg = int(data["attack"])
    elif data.has("dmg"):
        dmg = int(data["dmg"])
    ATTACK_DAMAGE = dmg

    # --------------------------------------------------
    #  SPEED
    # --------------------------------------------------
    var spd: float = SPEED
    if data.has("speed"):
        spd = float(data["speed"])
    elif data.has("move_speed"):
        spd = float(data["move_speed"])
    SPEED = spd

    # --------------------------------------------------
    #  EXP & GOLD
    # --------------------------------------------------
    if data.has("exp"):
        experience_reward = int(data["exp"])
    elif data.has("experience"):
        experience_reward = int(data["experience"])

    if data.has("gold_min"):
        gold_reward_min = int(data["gold_min"])
    elif data.has("goldMin"):
        gold_reward_min = int(data["goldMin"])

    if data.has("gold_max"):
        gold_reward_max = int(data["gold_max"])
    elif data.has("goldMax"):
        gold_reward_max = int(data["goldMax"])

    if data.has("drop_chance"):
        drop_chance = float(data["drop_chance"])
    elif data.has("dropChance"):
        drop_chance = float(data["dropChance"])

    # --------------------------------------------------
    #  AI PARAMETRELERİ
    # --------------------------------------------------
    if data.has("is_aggressive"):
        is_aggressive = bool(data["is_aggressive"])

    if data.has("aggro_range"):
        aggro_range = float(data["aggro_range"])

    if data.has("leash_radius"):
        leash_radius = float(data["leash_radius"])
        respawn_radius = leash_radius

    if data.has("wander_radius"):
        wander_radius = float(data["wander_radius"])

    print("EnemyDb APPLY -> id=%s name=%s lvl=%d HP=%d DMG=%d SPD=%.1f EXP=%d GOLD=[%d-%d] AGGRO=%s" % [
        str(enemy_id),
        enemy_name,
        enemy_level,
        max_health,
        ATTACK_DAMAGE,
        SPEED,
        experience_reward,
        gold_reward_min,
        gold_reward_max,
        str(is_aggressive)
    ])


func _apply_sprite_scene_from_enemy_id() -> void:
    if not is_instance_valid(sprite):
        return

    var id_str: String = str(enemy_id)
    var scene_path: String = ""

    if id_str.begins_with("wolf"):
        scene_path = "res://scenes/enemies/wolf.tscn"  # kendi path'ine göre ayarla

    if scene_path == "":
        return

    if not ResourceLoader.exists(scene_path):
        push_warning("enemy.gd: '%s' yolu bulunamadı, varsayılan Sprite kullanılacak." % scene_path)
        return

    var temp_scene: PackedScene = load(scene_path)
    var temp_instance: Node = temp_scene.instantiate()

    var temp_sprite: AnimatedSprite2D = temp_instance.get_node_or_null("Sprite") as AnimatedSprite2D

    if temp_sprite and temp_sprite.sprite_frames:
        sprite.sprite_frames = temp_sprite.sprite_frames
        sprite.play("idle_down")
    else:
        push_warning("enemy.gd: %s içinde uygun AnimatedSprite2D/SpriteFrames bulunamadı." % scene_path)

    temp_instance.queue_free()


# ==============================
#  RENK VARYASYONU
# ==============================
func _apply_sprite_color_from_enemy_id() -> void:
    if not is_instance_valid(sprite):
        return

    var id_str: String = str(enemy_id)

    match id_str:
        "wolf_1":
            base_modulate = Color(1.0, 1.0, 1.0, 1.0)
        "wolf_2":
            base_modulate = Color(1.2, 0.5, 0.5, 1.0)
        "wolf_3":
            base_modulate = Color(0.5, 0.7, 1.4, 1.0)
        "wolf_4":
            base_modulate = Color(0.9, 0.5, 1.3, 1.0)
        "wolf_5":
            base_modulate = Color(0.6, 1.3, 0.6, 1.0)
        "wolf_6":
            base_modulate = Color(0.35, 0.35, 0.35, 1.0)
        _:
            if enemy_level <= 3:
                base_modulate = Color(1.0, 1.0, 1.0, 1.0)
            elif enemy_level <= 6:
                base_modulate = Color(1.1, 0.8, 0.5, 1.0)
            elif enemy_level <= 9:
                base_modulate = Color(0.8, 0.9, 1.3, 1.0)
            elif enemy_level <= 12:
                base_modulate = Color(1.0, 0.7, 1.0, 1.0)
            else:
                base_modulate = Color(0.5, 0.5, 0.5, 1.0)

    sprite.modulate = base_modulate


func _update_target_frame() -> void:
    var hud_local: Node = get_tree().get_first_node_in_group("hud")
    if hud_local and hud_local.has_method("set_target_from_node"):
        hud_local.set_target_from_node(self)


# ==============================
#  AI UPDATE
# ==============================
func _pick_new_wander_target() -> void:
    var angle: float = randf_range(0.0, TAU)
    # Çok dibinde dolaşmasın, hep biraz uzak hedefler seçsin
    var min_dist: float = wander_radius * 0.4    # örn: 260 ise min ~100
    var dist: float = randf_range(min_dist, wander_radius)
    var offset: Vector2 = Vector2.RIGHT.rotated(angle) * dist
    wander_target = start_position + offset


func _update_ai(delta: float) -> void:
    var current_speed: float = SPEED
    velocity = Vector2.ZERO

    # Hedef canlı mı?
    if target != null and (not is_instance_valid(target) or not target.is_inside_tree()):
        target = null

    match state:
        EnemyState.IDLE:
            idle_time -= delta
            if idle_time <= 0.0:
                # Daha sık yürüsün: %70 wander / %30 idle
                if randf() < 0.7:
                    _pick_new_wander_target()
                    state = EnemyState.WANDER
                else:
                    idle_time = randf_range(0.5, 1.5)

            # Agresifse ve hedef atanmamışsa, çevredeki player'ı kovala (follow_area sinyaline ek olarak)
            if is_aggressive and target != null and is_instance_valid(target):
                var dist_to_player_idle: float = global_position.distance_to(target.global_position)
                if dist_to_player_idle <= aggro_range:
                    state = EnemyState.CHASE

        EnemyState.WANDER:
            var to_wander: Vector2 = wander_target - global_position
            if to_wander.length() < 8.0:
                # Hedefe ulaştı: bazen direkt yeni hedef seçsin, bazen kısa idle
                if randf() < 0.6:
                    _pick_new_wander_target()
                    # state WANDER olarak kalsın, tekrar yürüsün
                else:
                    state = EnemyState.IDLE
                    idle_time = randf_range(0.5, 1.5)
            else:
                velocity = to_wander.normalized() * current_speed

            if is_aggressive and target != null and is_instance_valid(target):
                var dist_to_player_w: float = global_position.distance_to(target.global_position)
                if dist_to_player_w <= aggro_range:
                    state = EnemyState.CHASE

        EnemyState.CHASE:
            if target == null or not is_instance_valid(target):
                state = EnemyState.RETURN
            else:
                var dist_to_player: float = global_position.distance_to(target.global_position)
                var dist_from_home: float = global_position.distance_to(start_position)

                # Çok uzaklaştıysa leash
                if dist_from_home > leash_radius:
                    target = null
                    state = EnemyState.RETURN
                else:
                    if dist_to_player > stop_range:
                        velocity = (target.global_position - global_position).normalized() * current_speed
                    else:
                        velocity = Vector2.ZERO

                    if dist_to_player < ATTACK_RANGE and can_attack:
                        attack()

        EnemyState.RETURN:
            var to_home: Vector2 = start_position - global_position
            if to_home.length() < 8.0:
                state = EnemyState.IDLE
                idle_time = randf_range(0.5, 2.0)
            else:
                velocity = to_home.normalized() * current_speed


func _physics_process(delta: float) -> void:
    if is_instance_valid(overhead_display) and is_instance_valid(collision_shape) and collision_shape.shape:
        var top_of_head: float = collision_shape.position.y + collision_shape.shape.get_rect().position.y
        overhead_display.position.y = top_of_head - overhead_display.size.y - 5.0
        var half_width: float = overhead_display.size.x * 0.5
        overhead_display.position.x = -half_width

    _tick_dots(delta)
    _tick_debuffs(delta)

    if not is_alive:
        velocity = Vector2.ZERO
        move_and_slide()
        return

    _update_ai(delta)

    # Root / Slow debuff’lerini hıza uygula
    if active_debuffs.has("Root"):
        velocity = Vector2.ZERO
    else:
        if active_debuffs.has("Slow"):
            var slow_value: float = active_debuffs["Slow"].value
            var factor: float = 1.0 - slow_value
            if factor < 0.0:
                factor = 0.0
            velocity *= factor

    move_and_slide()

    if not sprite.get_animation().begins_with("attack") and not sprite.get_animation().begins_with("hurt"):
        var dir: Vector2 = Vector2.ZERO
        if velocity.length() > 1.0:
            dir = velocity.normalized()
        update_animation(dir)


# ==============================
#  CAN SETTER + SİNYAL
# ==============================
func set_health(new_health: int) -> void:
    var old_health: int = current_health
    current_health = clampi(new_health, 0, max_health)

    if old_health != current_health:
        health_updated.emit(current_health, max_health)
        if is_instance_valid(health_bar):
            health_bar.value = current_health


# ==============================
#  DURUM ETKİLERİ
# ==============================
func apply_status_effect(skill_id: String, total_value: float, duration: float, tick_rate: float, is_heal: bool) -> void:
    if not is_alive:
        return

    if is_heal:
        print(enemy_name, " iyileştirme etkisini reddetti: ", skill_id)
        return

    var num_ticks: int = int(ceil(duration / tick_rate))
    if num_ticks == 0:
        num_ticks = 1
    var value_per_tick: float = total_value / float(num_ticks)

    active_dots[skill_id] = {
        "damage_per_tick": value_per_tick,
        "time_left": duration,
        "tick_rate": tick_rate,
        "next_tick": tick_rate,
        "is_heal": is_heal
    }

    print("DÜŞMAN DURUM BAŞLATILDI: ", skill_id, " (Değer: ", total_value, ", Ticks: ", num_ticks, ")")

func apply_debuff(effect_type: String, duration: float, value: float = 0.0) -> void:
    if not is_alive:
        return

    if active_debuffs.has(effect_type) and active_debuffs[effect_type].value > value:
        return

    active_debuffs[effect_type] = {"time_left": duration, "value": value}
    print(enemy_name, " debuff aldı: ", effect_type, " Süre: ", duration, " Değer: ", value)


func _tick_dots(delta: float) -> void:
    var keys_to_remove: Array = []

    for skill_id in active_dots.keys():
        var dot = active_dots[skill_id]
        dot.time_left -= delta
        dot.next_tick -= delta

        if dot.next_tick <= 0.0:
            var value: int = int(round(dot.damage_per_tick))

            if dot.is_heal:
                set_health(current_health + value)
                spawn_damage_number(value, Color.GREEN)
                print(enemy_name, " HoT Aldı: ", value, ". Kalan Can: ", current_health)
            else:
                set_health(current_health - value)
                spawn_damage_number(value, Color("#9900CC"))
                print(enemy_name, " DoT Aldı: ", value, ". Kalan Can: ", current_health)

            dot.next_tick = dot.tick_rate

            if current_health <= 0:
                die()
                keys_to_remove.append(skill_id)
                break

        if dot.time_left <= 0.0:
            keys_to_remove.append(skill_id)

    for skill_id in keys_to_remove:
        active_dots.erase(skill_id)


func _tick_debuffs(delta: float) -> void:
    var keys_to_remove: Array = []
    for debuff_id in active_debuffs.keys():
        active_debuffs[debuff_id].time_left -= delta
        if active_debuffs[debuff_id].time_left <= 0.0:
            keys_to_remove.append(debuff_id)

    for key in keys_to_remove:
        active_debuffs.erase(key)
        print(enemy_name, " debuff'ı bitti: ", key)


# ==============================
#  HASAR & SALDIRI
# ==============================
func receive_skill_damage(amount: float) -> void:
    if not is_alive:
        return

    var final_damage: float = amount

    if active_debuffs.has("Marked"):
        final_damage *= (1.0 + active_debuffs["Marked"].value)
        print(enemy_name, " işaretli, ekstra hasar alıyor!")

    if active_debuffs.has("Armor_Shred"):
        final_damage *= (1.0 + active_debuffs["Armor_Shred"].value)
        print(enemy_name, " zırhı kırık, ekstra hasar alıyor!")

    _update_target_frame()
    take_damage(int(round(final_damage)), Color.RED)


func take_damage(amount: int, damage_color: Color) -> void:
    if not is_alive:
        return

    var final_amount: float = amount
    if active_debuffs.has("Debuff_AtkDef"):
        final_amount *= 1.2

    set_health(current_health - int(round(final_amount)))
    _update_target_frame()
    spawn_damage_number(int(round(final_amount)), damage_color)

    print(enemy_name, " Hasar Aldı: ", int(round(final_amount)), ". Kalan Can: ", current_health)

    # Pasif moblar için: vurulunca agro olsun
    if target == null and is_alive:
        var player_node: Node = get_tree().get_first_node_in_group("player")
        if player_node != null:
            target = player_node
            state = EnemyState.CHASE

    if current_health <= 0:
        die()
    else:
        if abs(last_direction.x) > abs(last_direction.y):
            if last_direction.x > 0:
                sprite.play("hurt_right")
            else:
                sprite.play("hurt_left")
        else:
            if last_direction.y > 0:
                sprite.play("hurt_down")
            else:
                sprite.play("hurt_up")


func attack() -> void:
    if not can_attack:
        return
    can_attack = false

    if abs(last_direction.x) > abs(last_direction.y):
        if last_direction.x > 0:
            sprite.play("attack_right")
        else:
            sprite.play("attack_left")
    else:
        if last_direction.y > 0:
            sprite.play("attack_down")
        else:
            sprite.play("attack_up")

    attack_timer.start()

    var final_attack_damage: int = ATTACK_DAMAGE
    if active_debuffs.has("Debuff_AtkDef") or active_debuffs.has("Debuff_Atk"):
        final_attack_damage = int(round(final_attack_damage * 0.8))
        print(enemy_name, " zayıfladı, saldırısı düştü!")

    var bodies: Array = attack_area.get_overlapping_bodies()
    for body in bodies:
        if body.is_in_group("player"):
            if body.has_method("take_damage"):
                body.take_damage(final_attack_damage, Color.WHITE, self)
                print("Düşman, Oyuncuya vurdu! Hasar: ", final_attack_damage)


func _on_attack_timer_timeout() -> void:
    can_attack = true


# ==============================
#  ALAN TESPİTİ & ÖLÜM
# ==============================
func _on_follow_area_body_entered(body: Node) -> void:
    if not body.is_in_group("player"):
        return

    # Sadece agresifler oyuncu alana girince agro alsın
    if not is_aggressive:
        return

    var dist_to_player: float = global_position.distance_to(body.global_position)
    if dist_to_player <= aggro_range:
        target = body
        state = EnemyState.CHASE


func _on_follow_area_body_exited(body: Node) -> void:
    print("DÜŞMAN: Bir cisim alanımdan çıktı: ", body.name)
    if body == target:
        target = null
        state = EnemyState.RETURN
        print("DÜŞMAN: Hedefimi (", body.name, ") kaybettim, yuvasına dönüyor.")


func die() -> void:
    if not is_alive:
        return
    is_alive = false
    active_dots.clear()
    active_debuffs.clear()

    set_health(0)

    if is_instance_valid(health_bar):
        health_bar.visible = false
    if is_instance_valid(overhead_display):
        overhead_display.visible = false

    print(enemy_name, " yenildi!")

    # -------------------------
    # EXP & GOLD ÖDÜLLERİ
    # -------------------------
    if target != null and target.has_method("add_experience"):
        target.add_experience(experience_reward)

        if target.has_method("add_gold"):
            var gold_to_drop: int = randi_range(gold_reward_min, gold_reward_max)
            if gold_to_drop > 0:
                target.add_gold(gold_to_drop)

    # -------------------------
    # LOOT DROP (drop_chance kullan)
    # -------------------------
    if is_instance_valid(hud) \
    and is_instance_valid(target) \
    and typeof(PlayerData) != TYPE_NIL \
    and typeof(ItemDB) != TYPE_NIL:

        var roll: float = randf()
        if roll <= drop_chance:
            var drop_level: int = enemy_level
            if drop_level <= 0:
                drop_level = 1

            var item_data: Dictionary = {}

            if ItemDB.has_method("get_random_item_for_level"):
                item_data = ItemDB.get_random_item_for_level(drop_level)
            elif ItemDB.has_method("get_random_item_for_class"):
                item_data = ItemDB.get_random_item_for_class("", drop_level)
            else:
                print("DEBUG: ItemDB'de uygun drop fonksiyonu yok.")

            if not item_data.is_empty():
                print("DEBUG: Eşya bulundu: ", item_data.name)

                var success: bool = hud.inventory_panel.add_item_to_inventory(item_data)
                if success:
                    hud.show_loot_alert(item_data)
                else:
                    print("DEBUG: Envanter dolu, eşya yere atılamadı (world.drop_item_at eksik).")
            else:
                print("DEBUG: ItemDB, level=%d için eşya bulamadı." % drop_level)
    else:
        if not is_instance_valid(hud):
            print("HATA: 'die()' fonksiyonu 'hud' referansını bulamadı!")

    # -------------------------
    # ÇARPIŞMA / RESPWAN
    # -------------------------
    collision_shape.disabled = true
    attack_area.get_node("CollisionShape2D").disabled = true
    follow_area.get_node("CollisionShape2D").disabled = true

    if abs(last_direction.x) > abs(last_direction.y):
        if last_direction.x > 0:
            sprite.play("hurt_right")
        else:
            sprite.play("hurt_left")
    else:
        if last_direction.y > 0:
            sprite.play("hurt_down")
        else:
            sprite.play("hurt_up")

    respawn_timer.start()

# ==============================
#  ANİMASYON & YARDIMCI
# ==============================
func update_animation(direction: Vector2) -> void:
    if not is_alive:
        return

    if direction != Vector2.ZERO:
        last_direction = direction.normalized()

        if abs(direction.x) > abs(direction.y):
            if direction.x > 0:
                sprite.play("walk_right")
            else:
                sprite.play("walk_left")
        else:
            if direction.y > 0:
                sprite.play("walk_down")
            else:
                sprite.play("walk_up")
    else:
        if abs(last_direction.x) > abs(last_direction.y):
            if last_direction.x > 0:
                sprite.play("idle_right")
            else:
                sprite.play("idle_left")
        else:
            if last_direction.y > 0:
                sprite.play("idle_down")
            else:
                sprite.play("idle_up")


func _on_sprite_animation_finished() -> void:
    var anim_name: String = sprite.get_animation()

    if anim_name.begins_with("hurt"):
        if not is_alive:
            body_linger_timer.start()
        else:
            update_animation(Vector2.ZERO)
    elif anim_name.begins_with("attack"):
        update_animation(Vector2.ZERO)


func _on_body_linger_timer_timeout() -> void:
    sprite.visible = false
    print("Beden kayboldu.")


func _on_respawn_timer_timeout() -> void:
    print(enemy_name, " yeniden doğdu!")

    is_alive = true
    set_health(max_health)

    if is_instance_valid(health_bar):
        health_bar.max_value = max_health
        health_bar.visible = true
    if is_instance_valid(overhead_display):
        overhead_display.visible = true

    var random_direction: Vector2 = Vector2.RIGHT.rotated(randf_range(0, TAU))
    var random_distance: float = randf_range(0, respawn_radius)
    global_position = start_position + (random_direction * random_distance)

    target = null

    sprite.visible = true
    sprite.play("idle_down")
    collision_shape.disabled = false
    attack_area.get_node("CollisionShape2D").disabled = false
    follow_area.get_node("CollisionShape2D").disabled = false

    # Respawn sonrası AI reset
    state = EnemyState.IDLE
    idle_time = randf_range(0.5, 2.0)


# ==============================
#  HASAR SAYISI
# ==============================
func spawn_damage_number(amount: int, color: Color) -> void:
    if get_parent().has_method("spawn_damage_number_on_effect_layer"):
        get_parent().spawn_damage_number_on_effect_layer(amount, color, global_position + Vector2(0, -35))
    else:
        print("HATA: Enemy'nin ebeveyninde 'spawn_damage_number_on_effect_layer' fonksiyonu bulunamadı!")


# ==============================
#  GLOW KONTROLÜ
# ==============================
func set_glow_state(is_glowing: bool) -> void:
    if not is_instance_valid(sprite):
        return

    if is_glowing:
        var highlight_color: Color = Color(1.3, 1.1, 0.7, 1.0)
        sprite.modulate = Color(
            base_modulate.r * highlight_color.r,
            base_modulate.g * highlight_color.g,
            base_modulate.b * highlight_color.b,
            base_modulate.a
        )
    else:
        sprite.modulate = base_modulate


func _find_enemy_db() -> Node:
    var root: Node = get_tree().root
    var possible_names: Array = ["EnemyDb", "EnemyDB", "enemy_db"]

    for n in possible_names:
        var node: Node = root.get_node_or_null(n)
        if node != null:
            print("Enemy.gd: EnemyDb bulundu. İsim: %s" % n)
            return node

    print("Enemy.gd: /root altındaki çocuklar:")
    for child in root.get_children():
        print("  - ", child.name)

    return null
