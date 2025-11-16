# TalentNode.gd (Düzeltilmiş ve Tooltip Eklenmiş Hali)

extends Button
class_name TalentNode

signal talent_learned

@export var class_id: String = "Druid"
@export var talent_id: String = ""

var name_label: Label
var rank_label: Label

var _data: Dictionary = {}
var _current_rank: int = 0


func _ready() -> void:
    # Buton ayarları
    focus_mode = Control.FOCUS_NONE
    toggle_mode = false
    flat = false

    # Grid’ten gelen min size zaten var, ama garanti olsun
    size_flags_horizontal = Control.SIZE_EXPAND_FILL
    size_flags_vertical = Control.SIZE_SHRINK_CENTER

    _ensure_ui()
    _refresh_data()

    pressed.connect(_on_pressed)


func _ensure_ui() -> void:
    var vbox := get_node_or_null("VBoxContainer") as VBoxContainer 
    if vbox == null:
        vbox = VBoxContainer.new()
        vbox.name = "VBoxContainer"
        vbox.alignment = BoxContainer.ALIGNMENT_CENTER
        vbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
        vbox.size_flags_vertical = Control.SIZE_EXPAND_FILL
        add_child(vbox)

    name_label = vbox.get_node_or_null("NameLabel") as Label
    if name_label == null:
        name_label = Label.new()
        name_label.name = "NameLabel" 
        name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
        name_label.autowrap_mode = TextServer.AUTOWRAP_WORD
        vbox.add_child(name_label)

    rank_label = vbox.get_node_or_null("RankLabel") as Label
    if rank_label == null:
        rank_label = Label.new()
        rank_label.name = "RankLabel"
        rank_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
        vbox.add_child(rank_label)


# --- BU FONKSİYON GÜNCELLENDİ ---
func _refresh_data() -> void:
    if talent_id == "":
        name_label.text = "(empty)" 
        rank_label.text = "0/0" 
        tooltip_text = ""
        modulate = Color(0.4, 0.4, 0.4) 
        return

    _data = TalentManager.get_talent_data(class_id, talent_id) 
    _current_rank = TalentManager.get_learned_rank(class_id, talent_id) 

    if _data.is_empty():
        name_label.text = talent_id 
        rank_label.text = "0/0" 
        tooltip_text = "VERİTABANI HATASI: " + talent_id
        modulate = Color(0.4, 0.4, 0.4) 
        return

    name_label.text = _data.get("name", talent_id) 
    
    # --- DÜZELTME 1: "max_rank" -> "max_points" ---
    # Veritabanında (talent_database.gd) "max_points" kullanıyoruz.
    var max_points: int = _data.get("max_points", 1) #  'da "max_rank" idi
    rank_label.text = str(_current_rank, "/", max_points) 

    # --- DÜZELTME 2: Tooltip Ekleme ---
    # Veritabanından "description" (açıklama) alanını çekiyoruz.
    tooltip_text = _data.get("description", "Açıklama bulunamadı.")

    var maxed := _current_rank >= max_points
    var can_learn := TalentManager.can_learn_talent(class_id, talent_id, _get_player_level()) 

    # --- İyileştirme: Renk Mantığı ---
    if maxed:
        # Maksimum puana ulaşılmış (Altın Rengi)
        modulate = Color(1.0, 0.84, 0.0) 
    elif can_learn:
        # Öğrenilebilir (Yeşil)
        modulate = Color(0.7, 1.0, 0.7) 
    else:
        # Öğrenilemez (Koyu Gri/Soluk)
        modulate = Color(0.7, 0.7, 0.7) 


func _on_pressed() -> void:
    if talent_id == "":
        return 

    var success := TalentManager.learn_talent(class_id, talent_id, _get_player_level()) 
    if success:
        talent_learned.emit() 


func _get_player_level() -> int:
    # TODO: Bunu daha sonra gerçek oyuncu verisinden çek
    return 75
