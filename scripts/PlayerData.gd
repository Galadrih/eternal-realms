extends Node

# Karakter oluşturma ekranında seçilen veriler
var character_name: String = "Varsayılanİsim"

# Sınıf ismi (ör: "Druid", "Berserker"...)
var character_class_name: String = "Druid"

# Sınıf ID’si (0–11 arası, PlayerBase.class_id ile aynı mantık)
var character_class_id: int = 0

# Başlangıç seviyesi – istersen karakter yaratırken güncellersin
var character_level: int = 1
