# TalentTree.gd (DİNAMİK, TOGGLE EDİLEBİLİR VE DOĞRU SINIFI YÜKLEYEN VERSİYON)
extends Control

# --- DÜZELTME 1: Hardcoded class_id kaldırıldı ---
# @export var class_id: String = "Warden" # <-- BU SATIRI SİL
var class_id: String = "" # <-- BUNU EKLE

# Bu, kodun "TalentNode.tscn" sahnesini kopyalayabilmesi için gerekli.
@export var talent_node_scene: PackedScene

# Sütun ve satır başına ne kadar boşluk bırakılacağı (Piksel)
@export var h_spacing: int = 210
@export var v_spacing: int = 100

@onready var class_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/ClassLabel
@onready var points_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/PointsLabel
@onready var node_container: Control = $MarginContainer/VBoxContainer/NodeContainer


func _ready() -> void:
    # --- YENİ EKLENDİ (Toggle için) ---
    # 1. Paneli oyun başında gizle
    visible = false
    # 2. hud.gd'nin bu paneli bulabilmesi için gruba ekle
    add_to_group("talent_tree")
    # --- EKLENTİ SONU ---

    # --- DÜZELTME 2: class_id'yi PlayerData'dan (Autoload) oku ---
    class_id = PlayerData.character_class_name
    if class_id == "":
        push_error("TalentTree: PlayerData.character_class_name boş!")
        return
    # --- DÜZELTME SONU ---
    
    # TalentNode sahnesinin ayarlanıp ayarlanmadığını kontrol et
    if talent_node_scene == null:
        push_error("TalentTree: 'Talent Node Scene' ayarlanmamış! (TalentNode.tscn dosyasını sürükle)")
        return
        
    class_label.text = class_id + " – Talent Tree"

    # TalentManager'ı (doğru class_id ile) başlat
    TalentManager.init_class_talents(class_id, 0) #

    # AĞACI İNŞA ET
    build_talent_tree()

    # Başlangıç puanlarını göster
    _refresh_points()


# =====================================================
# AÇ/KAPA FONKSİYONU (YENİ EKLENDİ)
# =====================================================

# hud.gd'nin "N" tuşuna basıldığında çağıracağı fonksiyon
func toggle() -> void:
    visible = not visible
    
    if visible:
        # Panel her açıldığında puanları ve node'ları yenile
        _refresh_points()
        _refresh_all_nodes()


# =====================================================
# MEVCUT FONKSİYONLARIN (DEĞİŞMEDİ)
# =====================================================

func build_talent_tree() -> void:
    # 1. Önceki ağacı temizle
    for node in node_container.get_children():
        node.queue_free()

    # 2. Seçili sınıf için tüm yetenek verilerini al (Artık doğru class_id'yi kullanıyor)
    var class_talents: Dictionary = TalentManager.talent_definitions.get(class_id, {})
    if class_talents.is_empty():
        push_warning("TalentTree: '" + class_id + "' için yetenek bulunamadı.")
        return

    # 3. Her bir yetenek için düğüm (node) oluştur
    for talent_id in class_talents.keys():
        var talent_data: Dictionary = class_talents[talent_id]
        
        var pos: Vector2 = talent_data.get("pos", Vector2.ZERO)
        var node_instance := talent_node_scene.instantiate() as TalentNode
        
        node_instance.class_id = class_id
        node_instance.talent_id = talent_id
        
        node_instance.position = pos * Vector2(h_spacing, v_spacing)
        node_instance.talent_learned.connect(_on_talent_learned)
        node_container.add_child(node_instance)


func _refresh_points() -> void:
    if class_id == "": # Güvenlik kontrolü
        return
    var pts: int = TalentManager.get_available_points(class_id)
    points_label.text = "Talent Tree Points: " + str(pts)


# --- YENİ YARDIMCI FONKSİYON ---
# (Hem toggle() hem de _on_talent_learned() tarafından kullanılır)
func _refresh_all_nodes() -> void:
    for node in node_container.get_children():
        if node is TalentNode:
            if is_instance_valid(node):
                node._refresh_data()


# --- FONKSİYON GÜNCELLENDİ ---
# (Artık _refresh_all_nodes() kullanıyor)
func _on_talent_learned() -> void:
    # 1. Puan etiketini güncelle
    _refresh_points()
    
    # 2. TÜM node'ların görünümünü (renklerini) güncelle
    _refresh_all_nodes()
