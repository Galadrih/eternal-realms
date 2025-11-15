extends Area2D

@export var vendor_name: String = "Tüccar"
# items_for_sale listesini buradan kaldırıyoruz

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
	
	# İksir yüklemeyi _ready fonksiyonundan sildik.

func _on_body_entered(body):
	if body.is_in_group("player_character"):
		player_in_range = true
		# TODO: Oyuncunun kafasının üstünde "E tuşu" uyarısı göster
		print("Satıcıyla konuşmak için [interact] tuşuna bas.")

func _on_body_exited(body):
	if body.is_in_group("player_character"):
		player_in_range = false
		shop_is_open = false # Oyuncu uzaklaşınca dükkan durumunu sıfırla
		# TODO: "E tuşu" uyarısını gizle
		
		# Oyuncu uzaklaşırsa dükkanı otomatik kapat
		if hud and hud.has_method("close_shop"):
			hud.close_shop()

func _unhandled_input(event):
	if player_in_range and event.is_action_pressed("interact"): # "interact" (E tuşu)
		get_viewport().set_input_as_handled() 
		
		if hud == null: return

		if not shop_is_open:
			if hud.has_method("open_shop"):
				
				# --- YENİ MANTIK BURADA ---
				# Dükkanı açmadan hemen önce listeyi oluştur
				var items_for_sale: Array = []
				if ItemDB and ItemDB.ITEM_DATABASE.has("POTIONS"):
					var potions = ItemDB.ITEM_DATABASE["POTIONS"]["LOW_LEVEL"]
					for key in potions:
						items_for_sale.append(potions[key])
				# -------------------------
				
				hud.open_shop(items_for_sale)
				shop_is_open = true
		else:
			if hud.has_method("close_shop"):
				hud.close_shop()
				shop_is_open = false
