extends Panel
class_name SkillPanel

# ---------------------------------------------------------
#  SKILL DESCRIPTION VERİTABANI
# ---------------------------------------------------------
const SKILL_DESCRIPTIONS := {
    # ... SENİN GÖNDERDİĞİN TÜM DEV DICT HİÇ DEĞİŞMEDEN BURADA KALACAK ...
    # (yerden kazanmak için burada kısaltmıyorum; direkt kopyala-yapıştır)
}

# ---------------------------------------------------------
#  PANEL AYARLARI
# ---------------------------------------------------------
@export_dir var skills_root := "res://skills"

# 2 kolonlu grid istiyoruz
@export var grid_columns := 2

# Skill kartlarının minimum boyutu
# (Grid'de yan yana 2 tane sığacak şekilde)
@export var item_min_size := Vector2(260, 52)

# Hiyerarşi:
# SkillPanel
#   MarginContainer
#     VBoxContainer
#       TitleBar (HBoxContainer)
#         Title (Label)
#         CloseButton (Button)
#       Search (LineEdit)
#       ScrollContainer
#         Grid (GridContainer)
@onready var _grid: GridContainer         = $"MarginContainer/VBoxContainer/ScrollContainer/Grid"
@onready var _close_btn: Button           = $"MarginContainer/VBoxContainer/TitleBar/CloseButton"
@onready var _search: LineEdit            = $"MarginContainer/VBoxContainer/Search"

var _all_skills: Array = []

func _ready() -> void:
    add_to_group("skill_panel")
    hide()

    if _grid:
        _grid.columns = grid_columns
        # Grid, ScrollContainer'ın yatayını doldursun
        _grid.size_flags_horizontal = Control.SIZE_EXPAND | Control.SIZE_FILL

    if _close_btn:
        _close_btn.pressed.connect(_on_close)
    if _search:
        _search.text_changed.connect(_on_search)

    _load_all_skills()
    _populate("")

# ---------------------------------------------------------
#  PUBLIC API (HUD buradan çağırıyor)
# ---------------------------------------------------------

func refresh_for_class(cname) -> void:
    if cname == null or cname == "":
        return

    var safe_name := str(cname)
    if " " in safe_name:
        safe_name = safe_name.replace(" ", "_")

    skills_root = "res://skills/%s" % safe_name
    _load_all_skills()

    var current_filter := ""
    if _search:
        current_filter = _search.text

    _populate(current_filter)

func set_skills_root(path: String) -> void:
    if path == null or path == "":
        return

    skills_root = path
    _load_all_skills()

    var current_filter := ""
    if _search:
        current_filter = _search.text

    _populate(current_filter)

func set_filter(text: String) -> void:
    if _search:
        _search.text = text
    _populate(text)

func open_panel() -> void:
    show()

func close_panel() -> void:
    hide()

# ---------------------------------------------------------
#  İÇ MANTIK
# ---------------------------------------------------------

func _on_close() -> void:
    close_panel()

func _on_search(new_text: String) -> void:
    _populate(new_text)

func _load_all_skills() -> void:
    _all_skills.clear()
    var exts := [".tres", ".res"]
    _recurse_load(skills_root, exts)

func _recurse_load(path: String, exts: Array) -> void:
    if path == "" or not DirAccess.dir_exists_absolute(path):
        return

    var da := DirAccess.open(path)
    if da == null:
        return

    da.list_dir_begin()
    while true:
        var name := da.get_next()
        if name == "":
            break
        if name.begins_with("."):
            continue

        var full := path.path_join(name)
        if da.current_is_dir():
            _recurse_load(full, exts)
        else:
            for e in exts:
                if name.ends_with(e):
                    var res := load(full)
                    if res is SkillData:
                        _ensure_skill_extras(res)
                        _all_skills.append(res)
                    break
    da.list_dir_end()

# SkillData içini ikon + description ile tamamla
func _ensure_skill_extras(sd: SkillData) -> void:
    var res_path := sd.resource_path
    if res_path == "":
        return

    # Örnek: res://skills/Druid/bloom_field.tres
    var base_dir := res_path.get_base_dir()      # res://skills/Druid
    var file_name := res_path.get_file()        # bloom_field.tres
    var skill_name := file_name.get_basename()  # bloom_field

    var parts := base_dir.split("/")
    if parts.size() == 0:
        return
    var class_dir := parts[parts.size() - 1]    # Druid, Berserker, Dragon_Knight...

    # 1) İKON OTO YÜKLE
    if not sd.icon:
        var icon_path := "res://assets/skill_icons/%s/%s.png" % [class_dir, skill_name]
        if ResourceLoader.exists(icon_path):
            var tex := load(icon_path)
            if tex is Texture2D:
                sd.icon = tex

    # 2) DESCRIPTION OTO DOLDUR
    if (sd.description == "" or sd.description == null) and SKILL_DESCRIPTIONS.has(class_dir):
        var class_dict = SKILL_DESCRIPTIONS[class_dir]
        if class_dict.has(skill_name):
            sd.description = class_dict[skill_name]

func _clear_grid() -> void:
    if not _grid:
        return
    for c in _grid.get_children():
        c.queue_free()

func _populate(filter_text: String = "") -> void:
    if not _grid:
        return

    _clear_grid()
    var f := filter_text.strip_edges().to_lower()

    for sd in _all_skills:
        var name_str := str(sd.display_name)
        var id_str := ""
        if "id" in sd:
            id_str = String(sd.id)

        if f != "" and not name_str.to_lower().contains(f) and not id_str.to_lower().contains(f):
            continue

        var item: SkillItem = SkillItem.new()

        # Satır genişliğini panelin item_min_size.x'ine göre ayarla
        if "row_width" in item:
            item.row_width = int(item_min_size.x)

        item.set_skill(sd)
        _grid.add_child(item)
