extends Node
class_name talent_manager

# --------------------------------------------------------
# VERİ
# --------------------------------------------------------

# learned_talents["Druid"]["nourish"] = { "rank": 3 }
var learned_talents: Dictionary = {}

# available_points["Druid"] = 12
var available_points: Dictionary = {}

# talent_definitions["Druid"]["nourish"] = { name, path, max_points, ... }
var talent_definitions: Dictionary = {}


func _ready() -> void:
    # Talent tanımlarını TalentDatabase'den çekiyoruz
    talent_definitions = TalentDatabase.get_all_talents()


# --------------------------------------------------------
# KAMU API
# --------------------------------------------------------

func init_class_talents(p_class_id: String, starting_points: int = 0) -> void:
    if not learned_talents.has(p_class_id):
        learned_talents[p_class_id] = {}
    if not available_points.has(p_class_id):
        available_points[p_class_id] = starting_points


func get_learned_rank(p_class_id: String, talent_id: String) -> int:
    if not learned_talents.has(p_class_id):
        return 0
    if not learned_talents[p_class_id].has(talent_id):
        return 0
    return int(learned_talents[p_class_id][talent_id].get("rank", 0))


func get_available_points(p_class_id: String) -> int:
    return int(available_points.get(p_class_id, 0))


func add_talent_points(p_class_id: String, amount: int) -> void:
    var current := get_available_points(p_class_id)
    available_points[p_class_id] = current + amount


func get_talent_data(p_class_id: String, talent_id: String) -> Dictionary:
    if not talent_definitions.has(p_class_id):
        return {}
    var class_tree: Dictionary = talent_definitions[p_class_id]
    return class_tree.get(talent_id, {})


# --------------------------------------------------------
# ÖĞRENME / KONTROL
# --------------------------------------------------------

func can_learn_talent(p_class_id: String, talent_id: String, current_level: int) -> bool:
    var talent := get_talent_data(p_class_id, talent_id)
    if talent.is_empty():
        return false

    var max_rank: int = int(talent.get("max_points", talent.get("max_rank", 1)))
    var current_rank: int = get_learned_rank(p_class_id, talent_id)

    # Max rank'a ulaştı mı?
    if current_rank >= max_rank:
        return false

    # Yeterli talent puanı var mı?
    if get_available_points(p_class_id) <= 0:
        return false

    # Level kontrolü
    var required_level: int = int(talent.get("required_level", 1))
    if current_level < required_level:
        return false

    # Harcanmış toplam puan kontrolü
    var required_points: int = int(talent.get("required_points", 0))
    var spent_points := _get_spent_points_for_class(p_class_id)
    if spent_points < required_points:
        return false

    # Önkoşul talentler varsa
    var prerequisites: Array = talent.get("prerequisites", [])
    for req_id in prerequisites:
        if get_learned_rank(p_class_id, str(req_id)) <= 0:
            return false

    return true


func learn_talent(p_class_id: String, talent_id: String, current_level: int) -> bool:
    if not can_learn_talent(p_class_id, talent_id, current_level):
        return false

    var new_rank := get_learned_rank(p_class_id, talent_id) + 1

    if not learned_talents.has(p_class_id):
        learned_talents[p_class_id] = {}
    learned_talents[p_class_id][talent_id] = {
        "rank": new_rank
    }

    available_points[p_class_id] = get_available_points(p_class_id) - 1

    # --- DÜZELTME: TODO YERİNE ARTIK BUNU KULLANIYORUZ ---
    _apply_talent_effect(p_class_id)

    return true


# --------------------------------------------------------
# YARDIMCI
# --------------------------------------------------------

# --- YENİ FONKSİYON ---
func _apply_talent_effect(p_class_id: String) -> void:
    # 1. Sahnedeki aktif oyuncuyu bul
    # (PlayerBase.gd'nin "player_character" grubunda olduğunu varsayıyoruz [cite: 468])
    var player_nodes = get_tree().get_nodes_in_group("player_character")
    
    if player_nodes.is_empty():
        print("TalentManager HATA: Sahnede 'player_character' grubunda oyuncu bulunamadı.")
        return
        
    var player = player_nodes[0] as PlayerBase
    
    # 2. Oyuncunun yetenek bonuslarını yeniden hesaplamasını sağla
    if player and player.has_method("update_talent_bonuses"):
        player.update_talent_bonuses()
    else:
        print("TalentManager HATA: Oyuncu 'update_talent_bonuses' fonksiyonuna sahip değil.")


func _get_spent_points_for_class(p_class_id: String) -> int:
    # ... (bu fonksiyon aynı kalır) ...
    if not learned_talents.has(p_class_id):
        return 0
    var total := 0
    for talent_id in learned_talents[p_class_id].keys():
        total += int(learned_talents[p_class_id][talent_id].get("rank", 0))
    return total
