extends Button
class_name ShopSlot

# Envanterden farklı olarak sürükleme veya index bilgisi YOK
var current_item: Dictionary = {}

@onready var icon_rect: TextureRect = $Background/Icon
@onready var quantity_label: Label   = $Background/Quantity
@onready var bg_panel: Panel = $Background

# Sadece "satın almak için tıklandım" sinyali
signal item_clicked(item_data)

func _ready() -> void:
    focus_mode = Control.FOCUS_NONE
    toggle_mode = false
    clip_text = false
    mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
    custom_minimum_size = Vector2(56, 56)

    # Sarı çerçeveyi ayarla
    _setup_background_style()

    # Tıklama sorununu çözen "mouse_filter" ayarları
    if bg_panel:
        bg_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE 
    
    if icon_rect:
        icon_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE 
        icon_rect.stretch_mode = TextureRect.STRETCH_SCALE
        icon_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH
        icon_rect.custom_minimum_size = Vector2(48, 48)
    
    if quantity_label:
        quantity_label.mouse_filter = Control.MOUSE_FILTER_IGNORE 

    # Spawn sorunları yaşamamak için _apply_empty_visual çağırmıyoruz
    # _apply_empty_visual()

    # Sol tıka basıldığında _on_self_pressed fonksiyonunu çalıştır
    pressed.connect(_on_self_pressed) 

# ================================================================
# SAĞ TIKLA SATIN ALMA
# ================================================================
func _gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
        if not current_item.is_empty():
            print("DEBUG (ShopSlot): Sağ tık algılandı! Eşya: %s" % current_item.get("name", "BOŞ VERİ"))
            item_clicked.emit(current_item)
            get_viewport().set_input_as_handled()

# Sarı çerçeveyi çizer
func _setup_background_style() -> void:
    if bg_panel == null:
        return
    var sb := StyleBoxFlat.new()
    sb.bg_color = Color(0.05, 0.05, 0.05, 0.95)
    sb.set_corner_radius_all(2)
    sb.set_border_width_all(1)
    sb.border_color = Color(0.9, 0.8, 0.35, 1.0) # Sarı çerçeve
    sb.shadow_size = 1
    sb.shadow_color = Color(0, 0, 0, 0.8)
    sb.set_content_margin_all(3)
    bg_panel.add_theme_stylebox_override("panel", sb)

# Tıklandığında (SATIN ALMA sinyali) - sol tık
func _on_self_pressed() -> void:
    print("DEBUG (ShopSlot): Sol tık algılandı! Eşya: %s" % current_item.get("name", "BOŞ VERİ"))
    if not current_item.is_empty():
        item_clicked.emit(current_item)

# Slotu temizler
func _apply_empty_visual() -> void:
    current_item.clear()
    if icon_rect:
        icon_rect.texture = null
    if quantity_label:
        quantity_label.text = ""
    tooltip_text = ""

# Slotu eşya verisiyle doldurur
func refresh_with_item(item: Dictionary) -> void:
    current_item = item.duplicate(true) 

    if current_item.is_empty():
        _apply_empty_visual()
        return

    # --------------------------
    # 1) ICON (InventorySlot ile aynı mantık)
    # --------------------------
    var tex: Texture2D = null

    # 1. Öncelik: "icon_path"
    if current_item.has("icon_path"):
        var path_str := str(current_item["icon_path"])
        if ResourceLoader.exists(path_str):
            tex = load(path_str)

    # 2. Öncelik: "icon"
    if tex == null and current_item.has("icon"):
        var icon_name := str(current_item["icon"]).to_lower()
        var path2 := "res://assets/icons/%s.png" % icon_name
        if ResourceLoader.exists(path2):
            tex = load(path2)

    # 3. Öncelik: ID ile aynı isim
    if tex == null and current_item.has("id"):
        var id_fallback_path := "res://assets/icons/%s.png" % str(current_item["id"])
        if ResourceLoader.exists(id_fallback_path):
            tex = load(id_fallback_path)

    # 4. Öncelik: Ekipmanlar için eski match bloğu
    if tex == null and current_item.has("id"):
        var id_str := str(current_item["id"])
        if not id_str.begins_with("P_"): # Pot değilse
            var parts := id_str.split("_")
            if parts.size() >= 2:
                var code := parts[1]
                var icon_name2 := ""
                match code:
                    "W": icon_name2 = "weapon"
                    "A": icon_name2 = "armor"
                    "H": icon_name2 = "helmet"
                    "P": icon_name2 = "pants"
                    "G": icon_name2 = "gloves"
                    "B": icon_name2 = "boots"
                    "N": icon_name2 = "necklace"
                    "WR": icon_name2 = "bracelet"
                    "C": icon_name2 = "cloak"
                    "O": icon_name2 = "offhand"
                    _: icon_name2 = ""
                if icon_name2 != "":
                    var path3 := "res://assets/icons/%s.png" % icon_name2
                    if ResourceLoader.exists(path3):
                        tex = load(path3)

    if icon_rect:
        icon_rect.texture = tex
        if tex == null and not current_item.is_empty():
            print("UYARI (ShopSlot): '%s' için ikon bulunamadı. Aranan potansiyel yollar:" % current_item.get("name", "BİLİNMEYEN EŞYA"))
            if current_item.has("icon_path"):
                print("   - icon_path: %s" % current_item["icon_path"])
            if current_item.has("icon"):
                print("   - res://assets/icons/%s.png" % current_item["icon"])
            if current_item.has("id"):
                print("   - res://assets/icons/%s.png" % current_item["id"])

    # --------------------------
    # 2) STACK MİKTARI
    # --------------------------
    # Dükkanda stack göstermek istemiyorsun, boş bırakıyoruz
    if quantity_label:
        quantity_label.text = ""

    # --------------------------
    # 3) TOOLTIP (senin eski shop tooltip'in)
    # --------------------------
    var lines: Array = []
    var name_str := str(current_item.get("name", "")).strip_edges()
    if name_str != "":
        lines.append(name_str)

    var req_level := -1
    if current_item.has("req_level"):
        req_level = int(current_item["req_level"])
    var req_class_str := ""
    if current_item.has("req_class"):
        req_class_str = str(current_item["req_class"]).strip_edges()
    if req_level > 0 or (req_class_str != "" and req_class_str != "POTIONS"):
        var req_line := ""
        if req_level > 0:
            req_line += "Lv %d" % req_level
        if req_class_str != "":
            if req_line != "": req_line += " | " 
            req_line += req_class_str.capitalize()
        if req_line != "":
            lines.append(req_line)

    var desc_str := str(current_item.get("tooltip", "")).strip_edges()
    if desc_str != "":
        lines.append(desc_str)

    var stats = current_item.get("stats", {})
    if stats is Dictionary and stats.size() > 0:
        if lines.size() > 0:
            lines.append("")
        var db = ItemDB
        if db.STAT_ORDER.size() > 0:
            for key in db.STAT_ORDER:
                if stats.has(key):
                    lines.append(db.format_stat_line(key, stats[key]))
        for key in stats.keys():
            if key in db.STAT_ORDER:
                continue
            lines.append(db.format_stat_line(key, stats[key]))

    # FİYAT BİLGİSİ (Satın alma fiyatı)
    if ItemDB.has_method("get_item_price"):
        var price: int = ItemDB.get_item_price(current_item)
        if price > 0:
            lines.append("")
            lines.append("Fiyat: %d Altın" % price) 

    tooltip_text = "\n".join(lines)
