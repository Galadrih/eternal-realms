extends Button
class_name SkillItem

# Satır tasarımı
@export var icon_size: int = 40      # Sol taraftaki ikon alanı
@export var row_width: int = 260     # SkillPanel'deki item_min_size.x ile uyumlu olacak genişlik

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
    size_flags_horizontal = Control.SIZE_SHRINK_CENTER

    # GÖRSEL DÜZELTME: PANEL İÇİ İKON BOYUT KONTROLÜ
    add_theme_constant_override("h_separation", icon_size / 4)
    add_theme_constant_override("icon_max_width", icon_size) # K Panelindeki ikon boyutu

    # İç marginler
    add_theme_constant_override("content_margin_left", 6)
    add_theme_constant_override("content_margin_right", 6)
    add_theme_constant_override("content_margin_top", 4)
    add_theme_constant_override("content_margin_bottom", 4)

    # YAZI RENKLERİNİ ZORLA (asıl önemli kısım)
    add_theme_color_override("font_color", Color(1, 1, 1))              # normal
    add_theme_color_override("font_hover_color", Color(1, 1, 1))        # hover
    add_theme_color_override("font_pressed_color", Color(0.9, 0.9, 0.9))# basılı
    add_theme_color_override("font_disabled_color", Color(0.6, 0.6, 0.6))

    # Metin taşmasını üç nokta ile kes
    text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS

    # Eğer önceden skill atanmışsa UI'yi güncelle
    if skill != null:
        _apply_skill()

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
        tooltip_text = ""
        return

    var skill_id_str = String(skill.id)

    # Mana maliyeti bilgisini göster
    text = "%s (MP: %d)" % [skill.display_name, skill.mana_cost]
    icon = skill.icon

    # Tooltip
    if skill.description and skill.description != "":
        tooltip_text = skill.description
    else:
        tooltip_text = ""


# --- YETENEK TETİKLEME FONKSİYONU ---
func _on_skill_button_pressed():
    if skill == null:
        print("HATA: Buton boş.")
        return

    # K Panelindeki item'a tıklandığında Player'ı bulur
    var player_node = get_tree().get_first_node_in_group("player_character")

    if player_node and player_node.has_method("execute_skill"):
        var skill_id_str = String(skill.id)
        # PlayerBase'e gönderilecek ID'yi direkt kullanıyoruz (snake_case)
        player_node.execute_skill(skill_id_str, null)
    else:
        # BAĞLANTI BAŞARISIZ DURUM: Detaylı Teşhis
        print("--- KRİTİK HATA TEŞHİSİ: PlayerBase.execute_skill'e ulaşılamadı ---")

        if player_node == null:
            print("1. 'player_character' grubunda HİÇBİR düğüm bulunamadı.")
            print("ÇÖZÜM: Karakteriniz sahneye DİNAMİK ekleniyorsa, eklenir eklenmez kendisini 'player_character' grubuna eklediğinden emin olun. (PlayerBase.gd içindeki _ready fonksiyonuna add_to_group('player_character') eklendi)")
        else:
            print("1. 'player_character' grubunda düğüm BULUNDU: ", player_node.name)
            print("2. Bulunan düğümde 'execute_skill' metodu var mı? HAYIR")
            print("ÇÖZÜM: Bulunan düğüm (", player_node.name, ") PlayerBase.gd scriptini (execute_skill fonksiyonunu içeren) kullanmıyor olabilir.")


# ---------------------------------------------------------
#  TOOLTIP (Dikey büyüyen, çok genişlemeyen panel)
# ---------------------------------------------------------

# Godot 4'te özel tooltip için
func _make_custom_tooltip(for_text: String) -> Control:
    # row_width üzerinden dar, aşağı doğru uzayan bir tooltip üret
    return _draw_tooltip(for_text, row_width)


func _draw_tooltip(for_text: String, base_width: int, max_lines: int = 4) -> Control:
    var panel := PanelContainer.new()

    # Tooltip genişliğini sınırlı tut; yatay büyümek yerine satır sararak dikey uzasın
    var tooltip_width : int = min(base_width, 260)
    panel.custom_minimum_size = Vector2(tooltip_width + 12, 0)

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

    # Sağa taşma yerine kelime kırarak alta insin
    label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

    # Genişliği sabit, yükseklik serbest: aşağıya doğru büyür
    label.custom_minimum_size = Vector2(tooltip_width, 0)
    label.size_flags_horizontal = Control.SIZE_FILL
    label.size_flags_vertical = Control.SIZE_SHRINK_CENTER

    label.add_theme_font_size_override("font_size", 13)

    mc.add_child(label)

    return panel


# ---------------------------------------------------------
#  DRAG & DROP (Sürükleme İkonu Boyut Düzeltildi)
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
    # Drag preview'i K Panelinde gözüken boyuta zorla (40x40)
    root.custom_minimum_size = Vector2(icon_size, icon_size)

    var tex := TextureRect.new()
    if skill.icon:
        tex.texture = skill.icon

    # GÖRSEL DÜZELTME: TextureRect'i küçük boyuta zorla ve alanı kapla
    tex.set_anchors_preset(Control.PRESET_FULL_RECT)
    tex.custom_minimum_size = Vector2(icon_size, icon_size)

    # Resmi ortala ve önizleme alanına sığdır
    tex.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
    tex.expand_mode = TextureRect.EXPAND_FIT_WIDTH

    root.add_child(tex)
    set_drag_preview(root)

    return data
