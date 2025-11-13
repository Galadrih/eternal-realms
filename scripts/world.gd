extends Node2D

# SINIF SAHNELERİNİN VERİTABANI
const CLASS_SCENES = {
	0: "res://scenes/druid.tscn",               # ID 0 (Druid)
	1: "res://scenes/berserker.tscn",           # ID 1 (Berserker)
	2: "res://scenes/elementalist.tscn",
	3: "res://scenes/monk.tscn",
	4: "res://scenes/crusader.tscn",
	5: "res://scenes/warden.tscn",
	6: "res://scenes/dragon_knight.tscn",
	7: "res://scenes/warlock.tscn",
	8: "res://scenes/cleric.tscn",
	9: "res://scenes/bard.tscn",
	10: "res://scenes/necromancer.tscn",
	11: "res://scenes/ranger.tscn"              # ID 11 (Ranger)
}

# ARAYÜZ REFERANSLARI
@onready var hud: CanvasLayer = $HUD
@onready var character_sheet = $CharacterSheet 

func _ready() -> void:
	# 1. Global PlayerData'dan hangi sınıfın seçildiğini oku
	var selected_class_id = PlayerData.character_class_id
	
	# 2. O sınıfın sahne yolunu veritabanından bul
	if not CLASS_SCENES.has(selected_class_id):
		print("HATA: Geçersiz sınıf ID'si! ", selected_class_id)
		selected_class_id = 0 

	var player_scene_path = CLASS_SCENES[selected_class_id]
	
	# 3. Sahneyi diskten yükle
	var player_scene := load(player_scene_path)
	if not player_scene:
		print("HATA: Sahne yüklenemedi! Yol: ", player_scene_path)
		return

	# 4. Sahneden bir kopya (instance) oluştur
	var player_instance = player_scene.instantiate()
	
	# 5. Oyuncunun ismini PlayerData'dan alıp ayarla
	player_instance.name = PlayerData.character_name
	
	# 6. Oyuncuyu dünyaya (sahneye) ekle
	add_child(player_instance)
	
	print("Oyuncu '", player_instance.name, "' (Sınıf: ", PlayerData.character_class_name, ") dünyaya eklendi.")

	# --- HUD'A AKTİF SINIFI BİLDİR ---
	# Skill penceresi, bu isim üzerinden doğru klasöre gidecek (res://skills/<isim>)
	if hud != null and hud.has_method("set_player_class_name"):
		# Örn: "Druid", "Berserker", "Dragon Knight" ...
		# skill_panel.gd içinde boşluklar otomatik "_" ile değiştiriliyor.
		hud.set_player_class_name(PlayerData.character_class_name)

	# --- HUD BAĞLANTISI ---
	if hud != null and player_instance != null:
		player_instance.health_updated.connect(hud.update_health)
		player_instance.experience_updated.connect(hud.update_experience)
		player_instance.level_updated.connect(hud.update_level)
		player_instance.mana_updated.connect(hud.update_mana) 

		# HUD'ı ilk değerlerle manuel olarak GÜNCELLE
		hud.update_health(player_instance.current_health, player_instance.computed_max_health)
		hud.update_experience(player_instance.experience, player_instance.experience_to_next_level)
		hud.update_level(player_instance.level)
		hud.update_mana(player_instance.current_mana, player_instance.computed_max_mana)
	else:
		print("HATA: World.gd, HUD veya Oyuncu düğümünü bulamadı!")

	# --- KARAKTER PENCERESİ BAĞLANTISI ---
	if character_sheet != null and player_instance != null:
		# 1. Oyuncuyu CharacterSheet'e tanıt
		character_sheet.set_player(player_instance)
		
		# 2. Stats sinyali
		player_instance.stats_updated.connect(character_sheet.update_stats)
		
		# 3. Tüm statları yeniden gönder (bağlantılar kurulduktan sonra)
		player_instance.call_deferred("emit_full_stat_update")
	else:
		print("HATA: World.gd, CharacterSheet veya Oyuncu düğümünü bulamadı!")

# EKSİK OLAN FONKSİYON: Karakter penceresini aç/kapa
# Bu fonksiyon 'player.gd' tarafından çağrılacak
func toggle_character_sheet() -> void:
	if character_sheet != null:
		character_sheet.toggle()
