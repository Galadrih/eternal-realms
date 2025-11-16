extends Node
#
# PlayerData = Karakterin kalıcı verisi
# Sahne değişse bile burada durur. MMORPG için:
# - İleride bunu diske / DB'ye serialize edip kaydedeceğiz.
#

# Karakter oluşturma ekranında seçilen veriler
var character_name: String = "Galadrih"

# Sınıf ismi (ör: "Druid", "Berserker"...)
var character_class_name: String = "Crusader"

# Sınıf ID’si (0–11 arası, PlayerBase.class_id ile aynı)
var character_class_id: int = 4

# Level / XP
var character_level: int = 1
var experience: int = 0
var experience_to_next_level: int = 100

# Harcanmamış stat puanı (MMORPG için kalıcı tutmak mantıklı)
var manual_points_available: int = 0

# Temel statlar – Character Creator bunları doldurabilir
var stats: Dictionary = {
	"STR": 10,
	"DEX": 10,
	"VIT": 10,
	"INT": 10,
	"WIS": 10,
	"FOC": 10,
}

# Altın (hesap/karakter bazlı ekonomi)
var gold: int = 25  # Test için istersen 1500000 yapabilirsin

# İleride MMORPG tarafı için:
# - inventory_data
# - equipped_items_data
# - tamamlanmış questler vs.
# gibi şeyleri de buraya ekleyip serialize edeceğiz.
