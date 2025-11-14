extends Control
class_name CharacterCreator

# --------------------------------------------------------------------
#  UI NODE BAĞLANTILARI
# --------------------------------------------------------------------

# --- SOL PANEL ---
@onready var class_list: VBoxContainer = $MarginContainer/MainHBox/LeftPanel/ClassVBox/ClassScroll/ClassList

# --- ORTA PANEL ---
@onready var preview_sprite: Sprite2D = $MarginContainer/MainHBox/CenterPanel/CenterVBox/PreviewFrame/PreviewCenter/PreviewSprite
@onready var current_class_label: Label = $MarginContainer/MainHBox/CenterPanel/CenterVBox/ClassSwitchHBox/CurrentClassLabel
@onready var next_class_button: Button = $MarginContainer/MainHBox/CenterPanel/CenterVBox/ClassSwitchHBox/NextClassButton
@onready var previous_class_button: Button = $MarginContainer/MainHBox/CenterPanel/CenterVBox/ClassSwitchHBox/PrevClassButton
@onready var name_input: LineEdit = $MarginContainer/MainHBox/CenterPanel/CenterVBox/NameHBox/NameInput

# --- SAĞ PANEL ---
@onready var class_name_label: Label = $MarginContainer/MainHBox/RightPanel/RightVBox/ClassNameLabel
@onready var lore_text: RichTextLabel = $MarginContainer/MainHBox/RightPanel/RightVBox/LoreText
@onready var role_label: Label = $MarginContainer/MainHBox/RightPanel/RightVBox/InfoVBox/RoleLabel
@onready var recommended_stats_label: Label = $MarginContainer/MainHBox/RightPanel/RightVBox/InfoVBox/RecommendedStatsLabel
@onready var difficulty_label: Label = $MarginContainer/MainHBox/RightPanel/RightVBox/InfoVBox/DifficultyLabel
@onready var create_button: Button = $MarginContainer/MainHBox/RightPanel/RightVBox/BottomButtonsHBox/CreateButton
@onready var back_button: Button = $MarginContainer/MainHBox/RightPanel/RightVBox/BottomButtonsHBox/BackButton

# --------------------------------------------------------------------
#  SINIF VERİLERİ
# --------------------------------------------------------------------

var class_data: Array = [
    # DOĞA İLKESİ (VERIDIA)
    {
        "name": "Druid",
        "lore": "Veridia'nın çürüyen kalbinden yükselen, Yaşam ve Çürüme döngüsünün bilge rahipleridir. Onlar için zehir, sadece yanlış yönlendirilmiş yaşam gücüdür. Güçlerini kadim Yaşam Ağaçlarının köklerinden çeker, köklerin fısıltılarıyla şifa verirken, toprağın öfkesiyle Gölge'den sızan zehirleri düşmanın üzerine salarlar. Druid'in nihai amacı, yaşam ile ölüm arasındaki o ince dengeyi bulmak ve Veridia'nın çılgın büyümesini yeniden yönetilebilir hale getirmektir.",
        "sprite_path": "res://assets/sprites/classes/druid.png",
        "role": "Hibrit Destek / DPS",
        "stats": "Zeka, Ruh, Dayanıklılık",
        "difficulty": "★★★☆☆"
    },
    {
        "name": "Warden",
        "lore": "Ormanın ve Vahşi Yaşamın ruhlarıyla derin, almost telepatik bir Ruh Bağı kurmuş yalnız bekçilerdir. Bölünme'nin ardından yaban hayatının kontrolden çıkışını bizzat yaşamışlardır. Bir Warden, tehlikeli bir yırtıcıyı yoldaş edinerek, onun içindeki Vahşi Ruh'u evcilleştirir ve bu güçlü pet'i kendi gücünün bir uzantısı haline getirir. Onların hikayesi, insanlık medeniyeti ve yaban doğa arasındaki o kaybolmuş ittifakı yeniden kurma mücadelesidir. Yabanın kaosu ve düzeni arasında bir köprü kurarlar.",
        "sprite_path": "res://assets/sprites/classes/warden.png",
        "role": "Menzilli DPS / Çağırıcı",
        "stats": "Çeviklik, Dayanıklılık, Zeka",
        "difficulty": "★★★★☆"
    },

    # ÇELİK İLKESİ (IRONHOLD)
    {
        "name": "Berserker",
        "lore": "Ironhold'un buzlu uçurumlarında hayatı bir meydan okuma olarak gören, saf gücün son temsilcileridir. Ebedi Diyar'da, ataları Çelik İlkesi'nin sadık gardiyanlarıydı, ancak Bölünme anında maruz kaldıkları aşırı enerji, soylarına 'Kan Laneti'ni miras bıraktı. Canı azaldıkça zihinlerini tüketir ve onları kontrolsüz bir Öfke'ye sürükler. Onların misyonu, Çelik İlkesi'nin kaba gücünü dengelemek değil, onu tamamen sahiplenmek ve dünyayı kendi iradeleriyle yeniden inşa etmektir.",
        "sprite_path": "res://assets/sprites/classes/berserker.png",
        "role": "Yakın Dövüş DPS (Melee DPS)",
        "stats": "Güç, Dayanıklılık, Çeviklik",
        "difficulty": "★★★★☆"
    },
    {
        "name": "Dragon Knight",
        "lore": "Ironhold'un volkanik fırınlarında Ejderha Kanı ile mühürlenmiş, kibri zırhından daha ağır basan elit şövalyelerdir. Onların soyu, Bölünme'den önce Ironhold'a hizmet eden, Ejderha Lordları'ndan güç alan soylu muhafızlara dayanır. Dragon Knight'lar, Element ve Çelik'in yıkıcı sınırında yaşarlar; damarlarındaki Ejderha Kanı onlara hem ateşe hem de buza direnç verir. Onların görevi, diğer tüm ilkelerin disiplinsiz olduğunu kanıtlamak ve Diyar'ı sadece kendi kudretli kalkanları altında birleştirmektir.",
        "sprite_path": "res://assets/sprites/classes/dragon_knight.png",
        "role": "Tank",
        "stats": "Dayanıklılık, Güç, Akıl (Defansif)",
        "difficulty": "★★★☆☆"
    },

    # IŞIK İLKESİ (AETHELOS)
    {
        "name": "Cleric",
        "lore": "Cleric'ler, Aethelos'un ilahi yasalarına körü körüne uymayı reddeden, ancak Işık'ın saf Şifa ve Merhamet gücüne inanan din adamlarıdır. Bölünme'nin ardından Aethelos'un Liderleri, Işık'ı bir baskı aracı olarak kullanırken, Cleric'ler inancın asıl amacını hatırlatır: Kurtuluş. Onların duaları, fiziksel yaraları kapatabilir ve zihinsel travmaları hafifletebilir. Cleric, Aethelos'un dogmatik kibrine rağmen, Işık İlkesi'nin koşulsuz umudunu temsil eder.",
        "sprite_path": "res://assets/sprites/classes/cleric.png",
        "role": "Şifacı (Healer)",
        "stats": "Zeka, Ruh, Dayanıklılık",
        "difficulty": "★★★★☆"
    },
    {
        "name": "Crusader",
        "lore": "Aethelos'un Demir İradesi ve Kutsal Zırhı. Onlar, Bölünme'den sonra hayatta kalan ve Işık'ın düzenini (fakat liderlerinin zalimliğini değil) yeniden kurmaya ant içen şövalyelerdir. Onların görevi, savaşın en ön saflarında durarak, kalkan ve kılıçlarıyla sadece Aethelos'tan gelenleri değil, tüm masum müttefiklerini korumaktır. Crusader, Işık İlkesi'nin sarsılmaz savunmasını ve adanmışlığını temsil eder, kendi içindeki kibir ve merhamet arasındaki ince çizgide yürür.",
        "sprite_path": "res://assets/sprites/classes/crusader.png",
        "role": "Tank",
        "stats": "Dayanıklılık, Güç, Zeka (Kalkan Büyüsü)",
        "difficulty": "★★★☆☆"
    },

    # GÖLGE İLKESİ (UMBRA)
    {
        "name": "Warlock",
        "lore": "Warlock'lar, Gölge İlkesi'nin yasaklanmış sırlarını öğrenmek için varlıklarla kan yemini etmiş, kudretli Lanet Efendisidir. Onların gücü, Umbra'nın o anki enerjisini kullanarak düşmanın zayıflığını bulmak ve onu tüketen DoT (Zamanla Verilen Hasar) Lanetlerine dönüştürmektir. Warlock'lar, Gölge'nin yıkıcı doğasını kabul ederler, ancak bunu stratejik bir araç olarak kullanırlar. Onlar, Gölge'nin kıskacına girenlerin son nefesini yönetir.",
        "sprite_path": "res://assets/sprites/classes/warlock.png",
        "role": "Menzilli DPS (Ranged DoT DPS)",
        "stats": "Zeka, Ruh",
        "difficulty": "★★★★☆"
    },
    {
        "name": "Necromancer",
        "lore": "Umbra'nın en karanlık köşelerinden yükselmiş, yaşam ile ölüm arasındaki ince perdeyi yırtmış çağırıcıdır. Onlar, Bölünme'de kaybolan ruhların enerjisini toplayarak İskelet Orduları kurar. Necromancer'ın misyonu, yalnızca savaşmak değil, aynı zamanda Umbra'nın gücünü kullanarak Bölünme'de dağılan ruhları huzura kavuşturmaktır. Bu amaçla, ölülerin kudretli, soğuk ve acımasız gücünü kullanmaktan çekinmezler.",
        "sprite_path": "res://assets/sprites/classes/necromancer.png",
        "role": "Çağırıcı / Menzilli DPS",
        "stats": "Zeka, Ruh, Dayanıklılık",
        "difficulty": "★★★★★"
    },

    # ELEMENT İLKESİ (ALEM)
    {
        "name": "Elementalist",
        "lore": "Elementalistler, Alem'in Fırtınası'ndan saf yıkım gücünü kendi iradesine çeken, elementleri kusursuz bir uyum içinde kullanan büyücüdür. Onların ataları, Element İlkesi'nin kontrolsüz gücünü birleştirmeye çalışarak Bölünme'ye sebep olanlardır. Elementalistler, gücü kontrol etmenin tek yolunun onu en saf ve patlayıcı haliyle kullanmak olduğuna inanırlar.",
        "sprite_path": "res://assets/sprites/classes/elementalist.png",
        "role": "Menzilli DPS (Ranged Burst DPS)",
        "stats": "Zeka, Ruh",
        "difficulty": "★★★★☆"
    },

    # RUH/DENGE İLKESİ (OASIS)
    {
        "name": "Monk",
        "lore": "Bedeni bir tapınak, yumrukları ilahi bir denge noktası. İç Chi enerjisini kusursuz bir ustalıkla yöneten Mistik Dövüşçü. Monk'lar, Bölünme'nin nedeninin ruhsal dengesizlik olduğuna inanır. Hızlı, akıcı ve zarif bir dövüş stiliyle düşmanını yenerken, aynı Chi'yi kullanarak yaralarını iyileştirir ve hasarı absorbe ederler.",
        "sprite_path": "res://assets/sprites/classes/monk.png",
        "role": "Yakın Dövüş DPS / Off-Tank",
        "stats": "Çeviklik, Güç, Ruh",
        "difficulty": "★★★★☆"
    },
    {
        "name": "Bard",
        "lore": "Bard'lar, Ruh İlkesi'nin Etki ve İrade gücünü müzikle yansıtan gezgin ozandır. Onların liri, sadece ses değil, büyülü bir eter taşır. Bir orduya moral aşılayabilir, düşmanın zihnini bulandırabilir. Bard'ın en büyük gücü, takımın ritmini, hızını ve dayanıklılığını kontrol etmektir.",
        "sprite_path": "res://assets/sprites/classes/bard.png",
        "role": "Destek / Güçlendirici (Buffer / Support)",
        "stats": "Ruh, Zeka, Çeviklik",
        "difficulty": "★★★☆☆"
    },
    {
        "name": "Ranger",
        "lore": "Ruh İlkesi'nin Odaklanma ve Hızını benimseyen, gölgelerin çevik avcısı. Onların en büyük gücü, bir hedefe mutlak bir dikkatle odaklanmaktır. Okları, uzak mesafeden düşmanı kontrol etmek için zehirli tuzaklar veya yavaşlatıcı büyülerle desteklenir. Ranger'ın yolculuğu, Diyarların tehlikeli sınırlarında gezinmek ve Odak gücüyle kaosun öngörülemezliğini alt etmektir.",
        "sprite_path": "res://assets/sprites/classes/ranger.png",
        "role": "Menzilli DPS (Ranged DPS)",
        "stats": "Çeviklik, Güç, Dayanıklılık",
        "difficulty": "★★★☆☆"
    }
]

var current_class_index: int = 0

# --------------------------------------------------------------------
#  READY
# --------------------------------------------------------------------

func _ready() -> void:
    _build_class_list()

    next_class_button.pressed.connect(_on_next_class)
    previous_class_button.pressed.connect(_on_previous_class)
    create_button.pressed.connect(_on_create_pressed)
    back_button.pressed.connect(_on_back_pressed)

    _update_ui()

# --------------------------------------------------------------------
#  SOL PANEL – CLASS LİSTESİ
# --------------------------------------------------------------------

func _build_class_list() -> void:
    if class_list == null:
        push_error("CharacterCreator: class_list node'u bulunamadı, path'i tekrar kontrol et.")
        return

    for child in class_list.get_children():
        child.queue_free()

    for i in range(class_data.size()):
        var data: Dictionary = class_data[i]
        var btn := Button.new()
        btn.text = String(data["name"])
        btn.size_flags_horizontal = Control.SIZE_EXPAND_FILL
        btn.pressed.connect(_on_class_button.bind(i))
        class_list.add_child(btn)


func _on_class_button(index: int) -> void:
    current_class_index = clamp(index, 0, class_data.size() - 1)
    _update_ui()

# --------------------------------------------------------------------
#  CLASS GEÇİŞ BUTONLARI
# --------------------------------------------------------------------

func _on_next_class() -> void:
    current_class_index += 1
    if current_class_index >= class_data.size():
        current_class_index = 0
    _update_ui()


func _on_previous_class() -> void:
    current_class_index -= 1
    if current_class_index < 0:
        current_class_index = class_data.size() - 1
    _update_ui()

# --------------------------------------------------------------------
#  UI’YI GÜNCELLEYEN ANA FONKSİYON
# --------------------------------------------------------------------

func _update_ui() -> void:
    if class_data.is_empty():
        return

    var data: Dictionary = class_data[current_class_index]

    var class_name_str := String(data["name"])
    var lore := String(data["lore"])
    var role := String(data["role"])
    var stats := String(data["stats"])
    var diff := String(data.get("difficulty", ""))

    # Orta panel
    current_class_label.text = class_name_str

    var tex: Texture2D = load(String(data["sprite_path"]))
    if tex:
        preview_sprite.texture = tex
    else:
        push_warning("Sprite bulunamadı: %s" % [data["sprite_path"]])

    # Sağ panel
    class_name_label.text = class_name_str
    lore_text.text = lore
    role_label.text = "Rol: %s" % role
    recommended_stats_label.text = "Önerilen Statlar: %s" % stats
    difficulty_label.text = "Zorluk: %s" % diff

# --------------------------------------------------------------------
#  CREATE BUTTON
# --------------------------------------------------------------------

func _on_create_pressed() -> void:
    var character_name := name_input.text.strip_edges()
    if character_name.is_empty():
        print("HATA: İsim boş olamaz!")
        return

    var data: Dictionary = class_data[current_class_index]

    if typeof(PlayerData) != TYPE_NIL:
        PlayerData.character_name = character_name
        PlayerData.character_class_name = String(data["name"])
        PlayerData.character_class_id = current_class_index

    print("Karakter verisi kaydedildi. İsim: %s | Sınıf: %s"
        % [character_name, PlayerData.character_class_name])

    get_tree().change_scene_to_file("res://scenes/world.tscn")

# --------------------------------------------------------------------
#  BACK BUTTON
# --------------------------------------------------------------------

func _on_back_pressed() -> void:
    print("Geri butonu: Buradan main menü sahnesine dönebilirsin.")
    # Örnek:
    # get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
