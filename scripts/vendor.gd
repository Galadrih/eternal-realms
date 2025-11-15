extends Area2D

@export var vendor_name: String = "Tüccar"

var player_in_range: bool = false
var hud = null
var shop_is_open: bool = false # Dükkanın açık olup olmadığını takip et

func _ready():
    collision_layer = 0
    collision_mask = 1 << 1 # Sadece 2. katmanı (player_detect) algıla
    body_entered.connect(_on_body_entered)
    body_exited.connect(_on_body_exited)
    
    # HUD'ı bir kez al
    hud = get_tree().get_first_node_in_group("hud")

func _on_body_entered(body):
    if body.is_in_group("player_character"):
        player_in_range = true

func _on_body_exited(body):
    if body.is_in_group("player_character"):
        player_in_range = false
        
        # Oyuncu uzaklaşırsa dükkanı otomatik kapat
        if shop_is_open:
            if hud and hud.has_method("close_shop"):
                hud.close_shop()
            shop_is_open = false # Durumu sıfırla

func _unhandled_input(event):
    if player_in_range and event.is_action_pressed("interact"): # "interact" (E tuşu)
        get_viewport().set_input_as_handled() 
        
        print("--- DEBUG: [vendor.gd] ---")
        print("1. Etkileşim ('E' tuşu) algılandı.")
        
        if hud == null: 
            print("HATA: HUD bulunamadı!")
            return

        if not shop_is_open:
            if hud.has_method("open_shop"):
                
                # --- DEĞİŞİKLİK BURADA ---
                var items_for_sale: Array = []
                if ItemDB and ItemDB.has_method("get_vendor_items"):
                    print("2. ItemDB.get_vendor_items() çağrılıyor...")
                    items_for_sale = ItemDB.get_vendor_items()
                    print("4. ItemDB'den %d adet eşya listesi alındı." % items_for_sale.size())
                else:
                    print("HATA: ItemDB veya get_vendor_items() fonksiyonu bulunamadı!")
                # -------------------------
                
                # Eğer satacak bir şey varsa dükkanı aç
                if not items_for_sale.is_empty():
                    print("5. hud.open_shop() %d eşya ile çağrılıyor." % items_for_sale.size())
                    hud.open_shop(items_for_sale)
                    shop_is_open = true
                else:
                    print("UYARI: Satıcıda satılacak eşya bulunamadı (liste boş).")
                    if hud.has_method("show_loot_alert_text"):
                        hud.show_loot_alert_text("Satacak bir şey yok.")
        else:
            if hud.has_method("close_shop"):
                print("--- DEBUG: [vendor.gd] ---")
                print("Dükkan kapatılıyor.")
                hud.close_shop()
                shop_is_open = false
