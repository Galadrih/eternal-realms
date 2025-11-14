extends Area2D

var item_data: Dictionary = {}
var is_collectible: bool = true
@onready var sprite: Sprite2D = $Sprite2D

# Eşya türüne göre varsayılan icon yolları (Dosya listene göre hazırlandı)
const TYPE_ICONS = {
    "weapon": "res://assets/icons/weapon.png",
    "armor": "res://assets/icons/armor.png",
    "helmet": "res://assets/icons/helmet.png",
    "pants": "res://assets/icons/armor.png",
    "gloves": "res://assets/icons/gloves.png",
    "boots": "res://assets/icons/boots.png",
    "bracelet": "res://assets/icons/ring.png",
    "necklace": "res://assets/icons/necklace.png",
    "cloak": "res://assets/icons/cloak.png",
    "belt": "res://assets/icons/armor.png",
    "offhand": "res://assets/icons/offhand.png"
}

# --- YENİ EKLENDİ: _ready fonksiyonu ---
func _ready():
    # 1. "loot" grubuna ekle (player.gd'nin bulabilmesi için)
    add_to_group("loot")
    
    # 2. Fizik katmanını ayarla (Layer 5 = "loot")
    collision_layer = 16 # (2^4 = 16)
    
    # 3. Hiçbir şeyi algılamasın, sadece algılansın
    collision_mask = 0
    
    # 4. --- EN ÖNEMLİ DÜZELTME ---
    # Player'ın LootPickupArea'sının beni algılayabilmesi için AÇIK olmalıyım.
    monitorable = true
    
    # 5. Garanti Çözüm: CollisionShape'i kodla oluştur
    # (Eğer .tscn içinde zaten bir CollisionShape2D varsa bu bloğu silebilirsin)
    if not has_node("CollisionShape2D"):
        var shape_node = CollisionShape2D.new()
        var shape_resource = CircleShape2D.new()
        shape_resource.radius = 16 # 16 piksellik algılama alanı
        shape_node.shape = shape_resource
        add_child(shape_node)
        print("DEBUG: LootBag için CollisionShape2D kod ile oluşturuldu.")
# --- _ready Düzeltmesi Sonu ---

# World tarafından çağrılacak
func set_item(data: Dictionary):
    item_data = data
    if item_data.is_empty():
        queue_free() # Boşsa spawn olma
        return

    if not is_instance_valid(sprite):
        print("HATA: loot.tscn içinde 'Sprite2D' adında bir düğüm bulunamadı!")
        return

    # Eşya verisinden icon yolunu bul
    var icon_path = _get_icon_path_from_item(item_data)
    
    if ResourceLoader.exists(icon_path):
        sprite.texture = load(icon_path)
    else:
        print("HATA: Loot icon'u bulunamadı, varsayılan icon kullanılıyor. Yol: ", icon_path)
        sprite.texture = load("res://icon.svg")

# InventoryPanel.gd'deki mantığın kopyası
func _get_icon_path_from_item(item: Dictionary) -> String:
    # 1. Eşyanın kendi "icon_path" özelliği varsa onu kullan
    if item.has("icon_path") and item.icon_path != "":
        if ResourceLoader.exists(item.icon_path):
            return item.icon_path
        
    # 2. 'slot_type' özelliği varsa onu kullan
    if item.has("slot_type"):
        var stype = str(item["slot_type"]).to_lower()
        if TYPE_ICONS.has(stype):
            return TYPE_ICONS[stype]

    # 3. ID'den tahmin et (Örn: "B_W_1" -> "weapon")
    if item.has("id"):
        var id_str := str(item["id"])
        var parts: Array = id_str.split("_")
        if parts.size() >= 2:
            var code := str(parts[1])
            var slot_type_from_code = ""
            match code:
                "W": slot_type_from_code = "weapon"
                "A": slot_type_from_code = "armor"
                "H": slot_type_from_code = "helmet"
                "P": slot_type_from_code = "pants"
                "G": slot_type_from_code = "gloves"
                "B": slot_type_from_code = "boots"
                "WR": slot_type_from_code = "bracelet"
                "N": slot_type_from_code = "necklace"
                "C": slot_type_from_code = "cloak"
                "BT": slot_type_from_code = "belt"
                "O": slot_type_from_code = "offhand"
            
            if TYPE_ICONS.has(slot_type_from_code):
                return TYPE_ICONS[slot_type_from_code]

    # 4. Hiçbiri bulunamazsa, en azından bir şey göster (Godot icon'u)
    return "res://icon.svg"

# Player tarafından çağrılacak
func collect() -> Dictionary:
    if not is_collectible:
        return {}
        
    is_collectible = false 
    var data_to_return = item_data
    item_data = {}
    
    # Toplama efekti (anında kaybolma)
    queue_free()
    
    return data_to_return

# Envanter doluysa, player bunu çağırır
func re_drop():
    is_collectible = true
