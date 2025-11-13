extends Button
class_name SkillItem

# Satır tasarımı
@export var icon_size: int = 40      # Sol taraftaki ikon alanı
@export var row_width: int = 220     # Satır genişliği (SkillPanel’deki item_min_size.x ile uyumlu)

# Dışarıdan atanan skill resource
var skill: SkillData = null : set = set_skill


func _ready() -> void:
    # Buton temel ayarları
    focus_mode = Control.FOCUS_NONE
    toggle_mode = false
    flat = true
    clip_text = true
    mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

    # Satır boyutu – kompakt satır
    custom_minimum_size = Vector2(row_width, max(icon_size + 8, 48))

    # PANEL İÇİ İKON BOYUT KONTROLÜ
    add_theme_constant_override("h_separation", icon_size / 4)
    add_theme_constant_override("icon_max_width", icon_size) # K Panelindeki ikon boyutu

    # İç marginler
    add_theme_constant_override("content_margin_left", 6)
    add_theme_constant_override("content_margin_right", 6)
    add_theme_constant_override("content_margin_top", 4)
    add_theme_constant_override("content_margin_bottom", 4)

    # Metin taşmasını üç nokta ile kes
    text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS

    # Inspector’dan skill atanmışsa hemen uygula
    if skill != null:
        _apply_skill()
        
    # Yetenek tetikleme fonksiyonunu bağla
    pressed.connect(_on_skill_button_pressed)


# ---------------------------------------------------------
#  Skill atandığında otomatik UI güncelle
# ---------------------------------------------------------
func set_skill(value: SkillData) -> void:
    skill = value
    if is_node_ready():
        _apply_skill()

func _apply_skill() -> void:
    if not skill:
        text = "Yetenek Yok"
        icon = null
        return
    
    var skill_id_str = String(skill.id)
    
    # Mana maliyeti bilgisini göster
    text = "%s (MP: %d)" % [skill.display_name, skill.mana_cost]
    icon = skill.icon
    
    if skill.description and skill.description != "":
        tooltip_text = skill.description
        
# --- YETENEK TETİKLEME FONKSİYONU VE KRİTİK HATA TEŞHİSİ ---
func _on_skill_button_pressed():
    if skill == null:
        print("HATA: Buton boş.")
        return
        
    # Player'ı 'player_character' grubu üzerinden bulmayı dene
    var player_node = get_tree().get_first_node_in_group("player_character")
    
    if player_node and player_node.has_method("execute_skill"):
        var skill_id_str = String(skill.id)
        
        # Başarılı bağlantı: Yeteneği çağır. Mana/Cooldown kontrolü PlayerBase.gd'de yapılır.
        player_node.execute_skill(skill_id_str, null)
        
    else:
        # Bağlantı başarısız: Detaylı hata teşhisi çıktısı
        print("--- KRİTİK HATA TEŞHİSİ: PlayerBase.execute_skill'e ulaşılamadı ---")
        
        # 1. Player düğümü sahnede var mı?
        if player_node == null:
            print("1. 'player_character' grubunda HİÇBİR düğüm bulunamadı.")
            print("ÇÖZÜM: Karakterinizin yüklenmesinden hemen sonra kendisini 'player_character' grubuna eklediğinden emin olun.")
        else:
            # 2. Düğüm bulundu ama doğru script bağlı değil mi?
            print("1. 'player_character' grubunda düğüm BULUNDU: ", player_node.name)
            print("2. Bulunan düğümde 'execute_skill' metodu var mı? HAYIR")
            print("ÇÖZÜM: Düğüm (", player_node.name, ") doğru PlayerBase.gd scriptini (CharacterBody2D uzantılı) kullanmıyor.")


# ---------------------------------------------------------
#  UI ÇİZİMİ (Tooltip Düzeltmesi - Tekrar aşağı doğru genişleyecek)
# ---------------------------------------------------------
func _draw_tooltip(for_text: String, row_width: int, max_lines: int = 4) -> Control:
    var panel := PanelContainer.new()
    var mc := MarginContainer.new()
    mc.add_theme_constant_override("margin_left", 6)
    mc.add_theme_constant_override("margin_right", 6)
    mc.add_theme_constant_override("margin_top", 6)
    mc.add_theme_constant_override("margin_bottom", 6)
    panel.add_child(mc)

    # Metin
    var label := Label.new()
    label.text = for_text
    label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
    label.vertical_alignment = VERTICAL_ALIGNMENT_TOP
    label.autowrap_mode = TextServer.AUTOWRAP_WORD       
    
    # KRİTİK DÜZELTME: Genişliği sınırlar, yüksekliğin içeriğe göre büyümesini sağlar.
    label.custom_minimum_size = Vector2(row_width, 0)
    
    label.size_flags_vertical = Control.SIZE_EXPAND       
    label.add_theme_font_size_override("font_size", 13)

    mc.add_child(label)

    return panel

# ---------------------------------------------------------
#  DRAG & DROP – skillbar’a sürükleme için (İkon Boyutu Düzeltildi)
# ---------------------------------------------------------
func _get_drag_data(at_position: Vector2) -> Variant:
    if skill == null:
        return null

    var data := {
        "type": "SkillData",
        "resource": skill,
        "res_path": skill.resource_path,
    }

    # Küçük önizleme konteynırı: Sabit boyutlu root oluştur
    var root := Control.new()
    # Drag preview'i sabit boyuta zorla (K Panelinde gözüken boyut)
    root.custom_minimum_size = Vector2(icon_size, icon_size)

    var tex := TextureRect.new()
    if skill.icon:
        tex.texture = skill.icon
    
    # KRİTİK DÜZELTME: TextureRect'i boyutlandırmaya zorla
    tex.custom_minimum_size = Vector2(icon_size, icon_size) 
    tex.set_anchors_preset(Control.PRESET_FULL_RECT)
    
    # Boyutu koruyarak kutuya sığdırır.
    tex.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED 
    tex.expand_mode = TextureRect.EXPAND_FIT_WIDTH 
    
    root.add_child(tex)
    set_drag_preview(root)
    
    return data
