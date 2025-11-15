extends Control

# Sahnenizdeki nodelara göre yolları güncelleyin
@onready var item_grid: GridContainer = $Panel/ScrollContainer/ItemGrid
@onready var close_button: Button = $Panel/CloseButton

# Eşya slotu için şablon
const InventorySlotScene = preload("res://scenes/ui/InventorySlot.tscn")

var player = null
var player_inventory = null
var hud_node = null # Uyarılar için

func _ready():
    close_button.pressed.connect(close_shop)
    self.visible = false # Başlangıçta gizli
    
    # HUD referansını al
    hud_node = get_tree().get_first_node_in_group("hud")

func open_shop(item_list: Array):
    if player == null:
        player = get_tree().get_first_node_in_group("player_character")
        
    if player_inventory == null:
        if hud_node and hud_node.has_node("InventoryPanel"):
             player_inventory = hud_node.get_node("InventoryPanel")

    # Dükkanı temizle ve yeni eşyalarla doldur
    for child in item_grid.get_children():
        child.queue_free()
        
    for item_data in item_list:
        var slot = InventorySlotScene.instantiate()
        
        # --- HATA DÜZELTMESİ BURADA ---
        # 'set_item_data' yerine 'refresh_with_item' kullanılmalı
        slot.refresh_with_item(item_data) 
        # -------------------------------
        
        # Dükkandaki eşyaya tıklandığında ne olacağını ayarla
        # 'gui_input' sinyalini bağla
        slot.gui_input.connect(_on_shop_item_clicked.bind(item_data))
        item_grid.add_child(slot)
        
    if player_inventory and player_inventory.has_method("set_shop_mode"):
        player_inventory.set_shop_mode(true)
        
    self.visible = true

func close_shop():
    if player_inventory and player_inventory.has_method("set_shop_mode"):
        player_inventory.set_shop_mode(false)
    self.visible = false

# Dükkandaki bir eşyaya tıklandığında
func _on_shop_item_clicked(event: InputEvent, item_data: Dictionary):
    # Sadece sol tıka tepki ver
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
        if player == null or player_inventory == null:
            return

        # Eşyanın "Alış" fiyatını hesapla
        var price = ItemDB.get_item_price(item_data)
        
        # 1. Parayı harcamayı dene
        if player.spend_gold(price):
            # 2. Envantere eklemeyi dene
            var success = player_inventory.add_item_to_inventory(item_data)
            
            # 3. Envanter doluysa, parayı iade et
            if not success:
                player.add_gold(price)
                print("Envanter dolu! Eşya alınamadı.")
                if hud_node and hud_node.has_method("show_loot_alert_text"):
                    hud_node.show_loot_alert_text("Envanter Dolu!")
            else:
                # Başarıyla alındıysa bir ses çalabilir veya uyarı verebiliriz
                if hud_node and hud_node.has_method("show_loot_alert_text"):
                    hud_node.show_loot_alert_text("%s satın alındı." % item_data.get("name", "Eşya"))
        else:
            print("Yetersiz Altın!")
            if hud_node and hud_node.has_method("show_loot_alert_text"):
                hud_node.show_loot_alert_text("Yetersiz Altın!")
