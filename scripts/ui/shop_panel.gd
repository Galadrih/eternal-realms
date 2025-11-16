extends Control

# Yollar
@onready var vendor_item_grid: GridContainer = $Panel/MarginContainer/MainVBox/ColumnsHBox/VendorColumn/VendorScroll/VendorItemGrid
@onready var close_button: Button = $Panel/MarginContainer/MainVBox/CloseButton

const InventorySlotScene = preload("res://scenes/ui/ShopSlot.tscn")

const PLAYER_GROUP_NAME := "player_character"  # >>> PROJENDE NEYSE ONU YAZ ("player" mı, "player_character" mı?)

var player: Node = null
var player_inventory: Node = null
var hud_node: Node = null

func _ready() -> void:
    close_button.pressed.connect(close_shop)
    visible = false
    
    # HUD'u gruba göre bul
    hud_node = get_tree().get_first_node_in_group("hud")
    if hud_node == null:
        print("UYARI (shop_panel): 'hud' grubunda HUD bulunamadı. Daha sonra tekrar denenecek.")
    else:
        print("DEBUG (shop_panel): HUD bulundu: %s" % hud_node.name)
        
        
func _ensure_player_and_inventory() -> bool:
    if player == null:
        player = get_tree().get_first_node_in_group("player_character")

    if player_inventory == null:
        if hud_node:
            if hud_node.has_property("inventory_panel") and is_instance_valid(hud_node.inventory_panel):
                player_inventory = hud_node.inventory_panel
            elif hud_node.has_node("InventoryPanel"):
                player_inventory = hud_node.get_node("InventoryPanel")
            elif hud_node.has_node("Inventory"):
                player_inventory = hud_node.get_node("Inventory")

    return player != null and player_inventory != null


func open_shop(item_list: Array) -> void:
    # Önce player / HUD / Inventory referanslarını tazele
    _ensure_references_valid()

    print("--- DEBUG: [shop_panel.gd] ---")
    print("6. open_shop() fonksiyonu çalıştı, %d eşya alındı." % item_list.size())

    # Eski slotları temizle
    for child in vendor_item_grid.get_children():
        child.queue_free()
    print("   > VendorItemGrid temizlendi.")

    # Yeni slotları oluştur
    for item_data in item_list:
        if not item_data is Dictionary or item_data.is_empty():
            print("   > HATA: Geçersiz veya boş eşya verisi alındı.")
            continue
        
        print("   > Slot oluşturuluyor: %s" % item_data.get("name", "İSİMSİZ EŞYA"))
        var slot = InventorySlotScene.instantiate()
        slot.refresh_with_item(item_data)
        slot.item_clicked.connect(_on_shop_item_clicked)
        vendor_item_grid.add_child(slot)

        var bg_panel = slot.get_node_or_null("Background")
        if bg_panel:
            bg_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE

        var icon_rect = slot.get_node_or_null("Background/Icon")
        if icon_rect:
            icon_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE

        var qty_label = slot.get_node_or_null("Background/Quantity")
        if qty_label:
            qty_label.mouse_filter = Control.MOUSE_FILTER_IGNORE

    print("7. Eşya slotları oluşturma tamamlandı.")

    # Envanteri shop SELL moduna al
    _ensure_references_valid()
    if player_inventory and player_inventory.has_method("set_shop_sell_mode"):
        player_inventory.set_shop_sell_mode(true)

    visible = true


func close_shop() -> void:
    _ensure_references_valid()

    if player_inventory and player_inventory.has_method("set_shop_sell_mode"):
        player_inventory.set_shop_sell_mode(false)

    # Eski shop_mode kullanıyorsan, bunu da istersen koru
    if player_inventory and player_inventory.has_method("set_shop_mode"):
        player_inventory.set_shop_mode(false)

    visible = false

func _ensure_references_valid() -> void:
    # 1) Player
    if player == null or not is_instance_valid(player):
        player = get_tree().get_first_node_in_group(PLAYER_GROUP_NAME)
        if player:
            print("DEBUG (shop_panel): Player referansı yenilendi: %s" % player.name)
        else:
            print("HATA (shop_panel): Player gruptan bulunamadı! Grup adı: %s" % PLAYER_GROUP_NAME)

    # 2) HUD
    if hud_node == null or not is_instance_valid(hud_node):
        hud_node = get_tree().get_first_node_in_group("hud")
        if hud_node:
            print("DEBUG (shop_panel): HUD referansı yenilendi: %s" % hud_node.name)
        else:
            print("HATA (shop_panel): 'hud' grubunda HUD bulunamadı!")

    # 3) Inventory panel
    if player_inventory == null or not is_instance_valid(player_inventory):
        if hud_node:
            # Eğer HUD scriptinde "inventory_panel" değişkeni varsa
            if "inventory_panel" in hud_node and is_instance_valid(hud_node.inventory_panel):
                player_inventory = hud_node.inventory_panel
            # Yoksa child node olarak ara (burayı senin node adına göre düzelt)
            elif hud_node.has_node("InventoryPanel"):
                player_inventory = hud_node.get_node("InventoryPanel")
            elif hud_node.has_node("Inventory"):
                player_inventory = hud_node.get_node("Inventory")
            
            if player_inventory:
                print("DEBUG (shop_panel): Inventory referansı yenilendi: %s" % player_inventory.name)
            else:
                print("HATA (shop_panel): HUD içinde Inventory panel bulunamadı!")

# Dükkandaki eşyaya tıklandığında
func _on_shop_item_clicked(item_data: Dictionary) -> void:
    _ensure_references_valid()

    if player == null or player_inventory == null:
        print("HATA (shop_panel): KRİTİK HATA! Satın alma esnasında referanslar kayboldu. Player/Inventory null.")
        return

    print("DEBUG (shop_panel): '%s' satın alma denemesi..." % item_data.get("name", "Eşya"))

    var price = ItemDB.get_item_price(item_data)

    if player.spend_gold(price):
        var success: bool = player_inventory.add_item_to_inventory(item_data)
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
