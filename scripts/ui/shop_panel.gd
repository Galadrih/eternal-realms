extends Control

# YENİ .TSCN YAPISINA GÖRE GÜNCELLENEN YOLLAR
@onready var vendor_item_grid: GridContainer = $Panel/MarginContainer/MainVBox/ColumnsHBox/VendorColumn/VendorScroll/VendorItemGrid
@onready var close_button: Button = $Panel/MarginContainer/MainVBox/CloseButton

# Eşya slotu için şablon
const InventorySlotScene = preload("res://scenes/ui/InventorySlot.tscn")

var player = null
var player_inventory = null
var hud_node = null # Uyarılar için

func _ready():
    close_button.pressed.connect(close_shop)
    self.visible = false
    hud_node = get_tree().get_first_node_in_group("hud")

func open_shop(item_list: Array):
    print("--- DEBUG: [shop_panel.gd] ---")
    print("6. open_shop() fonksiyonu çalıştı, %d eşya alındı." % item_list.size())
    
    if player == null:
        player = get_tree().get_first_node_in_group("player_character")
    if player_inventory == null:
        if hud_node and hud_node.has_node("InventoryPanel"):
             player_inventory = hud_node.get_node("InventoryPanel")

    # Dükkanı (VendorItemGrid'i) temizle
    for child in vendor_item_grid.get_children():
        child.queue_free()
    
    print("   > VendorItemGrid temizlendi.")
    
    # Yeni eşyalarla doldur
    for item_data in item_list:
        if not item_data is Dictionary or item_data.is_empty():
            print("   > HATA: Geçersiz veya boş eşya verisi alındı.")
            continue
            
        print("   > Slot oluşturuluyor: %s" % item_data.get("name", "İSİMSİZ EŞYA"))
        var slot = InventorySlotScene.instantiate()
        
        slot.refresh_with_item(item_data) 
        slot.item_clicked.connect(_on_shop_item_clicked)
        
        vendor_item_grid.add_child(slot)
    
    print("7. Eşya slotları oluşturma tamamlandı.")

    if player_inventory and player_inventory.has_method("set_shop_mode"):
        player_inventory.set_shop_mode(true)
        
    self.visible = true

func close_shop():
    if player_inventory and player_inventory.has_method("set_shop_mode"):
        player_inventory.set_shop_mode(false)
    self.visible = false

# Dükkandaki bir eşyaya tıklandığında
func _on_shop_item_clicked(item_data: Dictionary):
    if player == null or player_inventory == null:
        return

    var price = ItemDB.get_item_price(item_data)
    
    if player.spend_gold(price):
        var success = player_inventory.add_item_to_inventory(item_data)
        if not success:
            player.add_gold(price)
            if hud_node and hud_node.has_method("show_loot_alert_text"):
                hud_node.show_loot_alert_text("Envanter Dolu!")
        else:
            if hud_node and hud_node.has_method("show_loot_alert_text"):
                hud_node.show_loot_alert_text("%s satın alındı." % item_data.get("name", "Eşya"))
    else:
        if hud_node and hud_node.has_method("show_loot_alert_text"):
            hud_node.show_loot_alert_text("Yeterli altın yok!")
