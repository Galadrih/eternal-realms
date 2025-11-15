extends Node
class_name ItemDatabase

# =====================================================
#  BÜYÜK VERİ TABANINI BURAYA YAPIŞTIR
#  ÖR: const ITEM_DATABASE := { "DRUID": { ... }, ... }
# =====================================================
const ITEM_DATABASE = {
    # Stat Scaling Logic: Lvl 75 Max Stat * (Lvl Factor)
    
    # ------------------------------------------------------------------------------------------------------
    # 1. BERSERKER (STR/VIT Odaklı - Ağır Zırh/Çift El)
    # ------------------------------------------------------------------------------------------------------
    "BERSERKER": {
        "1": {
            "Silah": {"id": "B_W_1", "name": "Kaba Odun Balta", "tooltip": "Temel Saldırı: 15. Acemi savaşçının baltası.", "req_level": 1, "req_class": "BERSERKER", "stats": {"STR": 2, "PAP_BONUS": 5, "RAW_ATK": 15, "P_DEF": 5}},
            "Kask": {"id": "B_H_1", "name": "Eski Deri Kafa Bandı", "tooltip": "Temel Defans: 5, HP: 10. Temel kafa koruması.", "req_level": 1, "req_class": "BERSERKER", "stats": {"VIT": 1, "P_DEF": 1, "RAW_DEF": 5, "HP": 10}},
            "Zırh": {"id": "B_A_1", "name": "Savaşçı Yeleği", "tooltip": "Temel Defans: 10, HP: 20. Hafif koruma.", "req_level": 1, "req_class": "BERSERKER", "stats": {"VIT": 2, "P_DEF": 3, "RAW_DEF": 10, "HP": 20, "M_DEF": 1}},
            "Pantolon": {"id": "B_P_1", "name": "Basit Keten Pantolon", "tooltip": "Temel Defans: 7, HP: 5. Hareket serbestliği.", "req_level": 1, "req_class": "BERSERKER", "stats": {"VIT": 1, "P_DEF": 2, "RAW_DEF": 7, "HP": 5}},
            "Eldiven": {"id": "B_G_1", "name": "Deri Sargı", "tooltip": "Temel Defans: 4. Elleri korur.", "req_level": 1, "req_class": "BERSERKER", "stats": {"STR": 1, "P_DEF": 1, "RAW_DEF": 4, "ASPD_BONUS": 1}},
            "Bileklik": {"id": "B_WR_1", "name": "Kemik Bilezik", "tooltip": "Temel Defans: 2. Uğur getirir.", "req_level": 1, "req_class": "BERSERKER", "stats": {"STR": 1, "RAW_DEF": 2}},
            "Kolye": {"id": "B_N_1", "name": "Diş Kolye", "tooltip": "Temel Defans: 1, HP: 15. İlk av hatırası.", "req_level": 1, "req_class": "BERSERKER", "stats": {"VIT": 1, "RAW_DEF": 1, "HP": 15}},
            "Pelerin": {"id": "B_C_1", "name": "Koyu Gri Pelerin", "tooltip": "Temel Defans: 3. Tozdan korur.", "req_level": 1, "req_class": "BERSERKER", "stats": {"M_DEF": 1, "RAW_DEF": 3, "P_DEF": 1}}
        },
        "9": {
            "Silah": {"id": "B_W_9", "name": "Paslı Savaş Baltası", "tooltip": "Temel Saldırı: 30. Gelişmiş temel hasar.", "req_level": 9, "req_class": "BERSERKER", "stats": {"STR": 5, "PAP_BONUS": 15, "VIT": 1, "RAW_ATK": 30, "P_CRIT_BONUS": 1}},
            "Kask": {"id": "B_H_9", "name": "Kaba Zincir Başlık", "tooltip": "Temel Defans: 15, HP: 30. Hafif dayanıklılık.", "req_level": 9, "req_class": "BERSERKER", "stats": {"VIT": 3, "P_DEF": 5, "RAW_DEF": 15, "HP": 30, "M_DEF": 2}},
            "Zırh": {"id": "B_A_9", "name": "Kaba Zincir Yelek", "tooltip": "Temel Defans: 30, HP: 60. Deriye göre daha iyi.", "req_level": 9, "req_class": "BERSERKER", "stats": {"STR": 3, "VIT": 5, "P_DEF": 12, "RAW_DEF": 30, "HP": 60}},
            "Pantolon": {"id": "B_P_9", "name": "Savaşçı Şalvarı", "tooltip": "Temel Defans: 20, HP: 40. Daha iyi savunma.", "req_level": 9, "req_class": "BERSERKER", "stats": {"VIT": 4, "P_DEF": 8, "RAW_DEF": 20, "HP": 40}},
            "Eldiven": {"id": "B_G_9", "name": "Sert Deri Eldiven", "tooltip": "Temel Defans: 10. Daha iyi tutuş.", "req_level": 9, "req_class": "BERSERKER", "stats": {"STR": 3, "P_DEF": 4, "RAW_DEF": 10, "ASPD_BONUS": 2}},
            "Bileklik": {"id": "B_WR_9", "name": "Güç Bilekliği", "tooltip": "Temel Defans: 5. Temel STR artışı.", "req_level": 9, "req_class": "BERSERKER", "stats": {"STR": 2, "VIT": 1, "RAW_DEF": 5, "P_DEF": 2}},
            "Kolye": {"id": "B_N_9", "name": "Taş Kolye", "tooltip": "Temel Defans: 3, HP: 50. Temel HP sağlar.", "req_level": 9, "req_class": "BERSERKER", "stats": {"VIT": 2, "HP": 50, "RAW_DEF": 3, "M_DEF": 1}},
            "Pelerin": {"id": "B_C_9", "name": "Düz Kumaş Pelerin", "tooltip": "Temel Defans: 5. Temel büyü direnci.", "req_level": 9, "req_class": "BERSERKER", "stats": {"M_DEF": 3, "RAW_DEF": 5, "P_DEF": 3}}
        },
        "18": {
            "Silah": {"id": "B_W_18", "name": "Demir Uçlu Balta", "tooltip": "Temel Saldırı: 50. Güçlendirilmiş saldırı.", "req_level": 18, "req_class": "BERSERKER", "stats": {"STR": 9, "PAP_BONUS": 30, "VIT": 2, "RAW_ATK": 50, "LIFESTEAL": 1}},
            "Kask": {"id": "B_H_18", "name": "Hafif Demir Miğfer", "tooltip": "Temel Defans: 25, HP: 50. Dayanıklılık odaklı.", "req_level": 18, "req_class": "BERSERKER", "stats": {"VIT": 6, "P_DEF": 12, "STR": 2, "RAW_DEF": 25, "HP": 50, "M_DEF": 4}},
            "Zırh": {"id": "B_A_18", "name": "Perçinli Zırh", "tooltip": "Temel Defans: 55, HP: 100. Orta düzey fiziksel koruma.", "req_level": 18, "req_class": "BERSERKER", "stats": {"STR": 5, "VIT": 10, "P_DEF": 25, "RAW_DEF": 55, "HP": 100, "HP_REGEN": 1}},
            "Pantolon": {"id": "B_P_18", "name": "Sert Keten Pantolon", "tooltip": "Temel Defans: 35, HP: 60. Denge ve koruma.", "req_level": 18, "req_class": "BERSERKER", "stats": {"VIT": 8, "P_DEF": 18, "RAW_DEF": 35, "HP": 60}},
            "Eldiven": {"id": "B_G_18", "name": "Savaşçı Eldiveni", "tooltip": "Temel Defans: 18. Saldırı gücünü destekler.", "req_level": 18, "req_class": "BERSERKER", "stats": {"STR": 5, "P_DEF": 8, "RAW_DEF": 18, "P_CRIT_BONUS": 1}},
            "Bileklik": {"id": "B_WR_18", "name": "Dövülmüş Bileklik", "tooltip": "Temel Defans: 10, HP: 30. STR ve HP artışı.", "req_level": 18, "req_class": "BERSERKER", "stats": {"STR": 4, "VIT": 2, "RAW_DEF": 10, "HP": 30}},
            "Kolye": {"id": "B_N_18", "name": "Savaşçı Tılsımı", "tooltip": "Temel Defans: 5. STR ve dayanıklılık.", "req_level": 18, "req_class": "BERSERKER", "stats": {"STR": 3, "VIT": 3, "RAW_DEF": 5, "ASPD_BONUS": 1}},
            "Pelerin": {"id": "B_C_18", "name": "Kaçak Pelerini", "tooltip": "Temel Defans: 10. Daha iyi büyü direnci.", "req_level": 18, "req_class": "BERSERKER", "stats": {"M_DEF": 6, "VIT": 1, "RAW_DEF": 10, "EVASION_BONUS": 1}}
        },
        "24": {
            "Silah": {"id": "B_W_24", "name": "Ateşli Çelik Balta", "tooltip": "Temel Saldırı: 70. Gelişmiş saldırı gücü.", "req_level": 24, "req_class": "BERSERKER", "stats": {"STR": 12, "PAP_BONUS": 40, "VIT": 3, "RAW_ATK": 70, "P_CRIT_BONUS": 2}},
            "Kask": {"id": "B_H_24", "name": "Koruma Miğferi", "tooltip": "Temel Defans: 35, HP: 70. Yüksek fiziksel savunma.", "req_level": 24, "req_class": "BERSERKER", "stats": {"VIT": 8, "P_DEF": 18, "STR": 3, "RAW_DEF": 35, "HP": 70}},
            "Zırh": {"id": "B_A_24", "name": "Çelik Plaka Zırh", "tooltip": "Temel Defans: 80, HP: 150. Yüksek savunma sağlar.", "req_level": 24, "req_class": "BERSERKER", "stats": {"STR": 7, "VIT": 14, "P_DEF": 35, "RAW_DEF": 80, "HP": 150, "M_DEF": 6}},
            "Pantolon": {"id": "B_P_24", "name": "Savaş Dizliği", "tooltip": "Temel Defans: 50, HP: 90. Sağlam savunma.", "req_level": 24, "req_class": "BERSERKER", "stats": {"VIT": 10, "P_DEF": 25, "RAW_DEF": 50, "HP": 90}},
            "Eldiven": {"id": "B_G_24", "name": "Keskin Pençe Eldiven", "tooltip": "Temel Defans: 25. Daha iyi kritik şansı.", "req_level": 24, "req_class": "BERSERKER", "stats": {"STR": 7, "P_DEF": 10, "RAW_DEF": 25, "P_CRIT_BONUS": 1, "ASPD_BONUS": 3}},
            "Bileklik": {"id": "B_WR_24", "name": "Öfke Bilekliği", "tooltip": "Temel Defans: 15, HP: 50. STR ve HP artışı.", "req_level": 24, "req_class": "BERSERKER", "stats": {"STR": 5, "VIT": 3, "RAW_DEF": 15, "HP": 50}},
            "Kolye": {"id": "B_N_24", "name": "Güç Mührü", "tooltip": "Temel Defans: 8. STR ve dayanıklılık.", "req_level": 24, "req_class": "BERSERKER", "stats": {"STR": 4, "VIT": 4, "RAW_DEF": 8, "P_DEF": 5}},
            "Pelerin": {"id": "B_C_24", "name": "Hızlı Rüzgar Pelerini", "tooltip": "Temel Defans: 15. Hareket ve büyü direnci.", "req_level": 24, "req_class": "BERSERKER", "stats": {"M_DEF": 8, "VIT": 2, "RAW_DEF": 15, "EVASION_BONUS": 2}}
        },
        "34": {
            "Silah": {"id": "B_W_34", "name": "Gölge Çeliği Balta", "tooltip": "Temel Saldırı: 90. Hasar ve kritik destek.", "req_level": 34, "req_class": "BERSERKER", "stats": {"STR": 16, "PAP_BONUS": 60, "VIT": 4, "RAW_ATK": 90, "P_CRIT_BONUS": 3}},
            "Kask": {"id": "B_H_34", "name": "Gelişmiş Savaş Miğferi", "tooltip": "Temel Defans: 45, HP: 100. Dayanıklılık odaklı.", "req_level": 34, "req_class": "BERSERKER", "stats": {"VIT": 12, "P_DEF": 25, "STR": 4, "RAW_DEF": 45, "HP": 100, "M_DEF": 8}},
            "Zırh": {"id": "B_A_34", "name": "Miğfer Zırhı", "tooltip": "Temel Defans: 110, HP: 220. Yüksek fiziksel savunma.", "req_level": 34, "req_class": "BERSERKER", "stats": {"STR": 10, "VIT": 18, "P_DEF": 50, "RAW_DEF": 110, "HP": 220, "HP_REGEN": 2}},
            "Pantolon": {"id": "B_P_34", "name": "Kırılmaz Dizlik", "tooltip": "Temel Defans: 70, HP: 130. Savunma ve hareket.", "req_level": 34, "req_class": "BERSERKER", "stats": {"VIT": 14, "P_DEF": 35, "RAW_DEF": 70, "HP": 130}},
            "Eldiven": {"id": "B_G_34", "name": "Kanlı Eldiven", "tooltip": "Temel Defans: 35. Saldırı gücünü destekler.", "req_level": 34, "req_class": "BERSERKER", "stats": {"STR": 9, "P_DEF": 15, "RAW_DEF": 35, "P_CRIT_BONUS": 2, "ASPD_BONUS": 4}},
            "Bileklik": {"id": "B_WR_34", "name": "Savaşçı Bilekliği", "tooltip": "Temel Defans: 20, HP: 70. STR ve HP artışı.", "req_level": 34, "req_class": "BERSERKER", "stats": {"STR": 7, "VIT": 4, "RAW_DEF": 20, "HP": 70}},
            "Kolye": {"id": "B_N_34", "name": "Canavarı Dize Getiren", "tooltip": "Temel Defans: 12, HP: 100. STR ve dayanıklılık.", "req_level": 34, "req_class": "BERSERKER", "stats": {"STR": 5, "VIT": 6, "HP": 100, "RAW_DEF": 12, "M_DEF": 10}},
            "Pelerin": {"id": "B_C_34", "name": "Şampiyon Pelerini", "tooltip": "Temel Defans: 20. Büyü direnci.", "req_level": 34, "req_class": "BERSERKER", "stats": {"M_DEF": 12, "VIT": 3, "RAW_DEF": 20, "P_DEF": 10}}
        },
        "42": {
            "Silah": {"id": "B_W_42", "name": "Sertleştirilmiş Balta", "tooltip": "Temel Saldırı: 110. Dövüşün yarısında ustalaşmış.", "req_level": 42, "req_class": "BERSERKER", "stats": {"STR": 22, "PAP_BONUS": 75, "VIT": 5, "RAW_ATK": 110, "P_CRIT_BONUS": 4, "LIFESTEAL": 1}},
            "Kask": {"id": "B_H_42", "name": "Korku Miğferi", "tooltip": "Temel Defans: 60, HP: 150. STR ve VIT dengesi.", "req_level": 42, "req_class": "BERSERKER", "stats": {"VIT": 15, "P_DEF": 35, "STR": 5, "RAW_DEF": 60, "HP": 150, "HP_REGEN": 1}},
            "Zırh": {"id": "B_A_42", "name": "Mangan Zırhı", "tooltip": "Temel Defans: 140, HP: 300. Orta-üst düzey fiziksel koruma.", "req_level": 42, "req_class": "BERSERKER", "stats": {"STR": 12, "VIT": 22, "P_DEF": 65, "RAW_DEF": 140, "HP": 300, "M_DEF": 12}},
            "Pantolon": {"id": "B_P_42", "name": "Ateşli Çelik Pantolon", "tooltip": "Temel Defans: 90, HP: 180. Sağlam ve dayanıklı.", "req_level": 42, "req_class": "BERSERKER", "stats": {"VIT": 18, "P_DEF": 45, "RAW_DEF": 90, "HP": 180}},
            "Eldiven": {"id": "B_G_42", "name": "Yırtıcı Eldiveni", "tooltip": "Temel Defans: 45. Kritik vuruş odaklı.", "req_level": 42, "req_class": "BERSERKER", "stats": {"STR": 12, "P_DEF": 20, "RAW_DEF": 45, "P_CRIT_BONUS": 3, "ASPD_BONUS": 4}},
            "Bileklik": {"id": "B_WR_42", "name": "Savaş Gücü Bilekliği", "tooltip": "Temel Defans: 25, HP: 100. STR ve HP artışı.", "req_level": 42, "req_class": "BERSERKER", "stats": {"STR": 10, "VIT": 5, "RAW_DEF": 25, "HP": 100}},
            "Kolye": {"id": "B_N_42", "name": "Ölümsüz Kolyesi", "tooltip": "Temel Defans: 18, HP: 150. STR ve dayanıklılık.", "req_level": 42, "req_class": "BERSERKER", "stats": {"STR": 7, "VIT": 8, "HP": 150, "RAW_DEF": 18, "M_DEF": 15}},
            "Pelerin": {"id": "B_C_42", "name": "Kara Savaş Pelerini", "tooltip": "Temel Defans: 25. Büyü direnci.", "req_level": 42, "req_class": "BERSERKER", "stats": {"M_DEF": 15, "VIT": 5, "RAW_DEF": 25, "P_DEF": 15}}
        },
        "48": {
            "Silah": {"id": "B_W_48", "name": "Runik Balta", "tooltip": "Temel Saldırı: 130. Rün gücü ile STR artışı.", "req_level": 48, "req_class": "BERSERKER", "stats": {"STR": 25, "PAP_BONUS": 85, "VIT": 6, "RAW_ATK": 130, "P_CRIT_BONUS": 4, "P_DEF": 50}},
            "Kask": {"id": "B_H_48", "name": "Kahraman Miğferi", "tooltip": "Temel Defans: 75, HP: 200. Sağlık ve STR artışı.", "req_level": 48, "req_class": "BERSERKER", "stats": {"VIT": 18, "P_DEF": 42, "STR": 7, "RAW_DEF": 75, "HP": 200, "HP_REGEN": 2}},
            "Zırh": {"id": "B_A_48", "name": "Runik Plaka Zırh", "tooltip": "Temel Defans: 170, HP: 400. STR ve VIT yüksek koruma.", "req_level": 48, "req_class": "BERSERKER", "stats": {"STR": 15, "VIT": 25, "P_DEF": 80, "RAW_DEF": 170, "HP": 400, "M_DEF": 15}},
            "Pantolon": {"id": "B_P_48", "name": "Kutsal Savaş Dizliği", "tooltip": "Temel Defans: 110, HP: 220. Yüksek fiziksel savunma.", "req_level": 48, "req_class": "BERSERKER", "stats": {"VIT": 22, "P_DEF": 55, "RAW_DEF": 110, "HP": 220}},
            "Eldiven": {"id": "B_G_48", "name": "Yüksek Hiddet Eldiveni", "tooltip": "Temel Defans: 55. Saldırı gücü ve hızı.", "req_level": 48, "req_class": "BERSERKER", "stats": {"STR": 15, "P_DEF": 25, "RAW_DEF": 55, "ASPD_BONUS": 2, "LIFESTEAL": 1}},
            "Bileklik": {"id": "B_WR_48", "name": "Mitoloji Bilekliği", "tooltip": "Temel Defans: 30, HP: 120. STR ve HP artışı.", "req_level": 48, "req_class": "BERSERKER", "stats": {"STR": 12, "VIT": 6, "RAW_DEF": 30, "HP": 120}},
            "Kolye": {"id": "B_N_48", "name": "Efsanevi Kolye", "tooltip": "Temel Defans: 25, HP: 200. STR ve dayanıklılık.", "req_level": 48, "req_class": "BERSERKER", "stats": {"STR": 9, "VIT": 10, "HP": 200, "RAW_DEF": 25, "M_DEF": 20}},
            "Pelerin": {"id": "B_C_48", "name": "Kutsal Toprak Pelerini", "tooltip": "Temel Defans: 30. Büyü direnci ve HP.", "req_level": 48, "req_class": "BERSERKER", "stats": {"M_DEF": 18, "VIT": 6, "RAW_DEF": 30, "P_DEF": 18, "HP": 50}}
        },
        "54": {
            "Silah": {"id": "B_W_54", "name": "İntikam Baltası", "tooltip": "Temel Saldırı: 150. Yüksek hasar ve kritik.", "req_level": 54, "req_class": "BERSERKER", "stats": {"STR": 29, "PAP_BONUS": 95, "VIT": 7, "RAW_ATK": 150, "P_CRIT_BONUS": 5}},
            "Kask": {"id": "B_H_54", "name": "Ejderha Nefesi Miğferi", "tooltip": "Temel Defans: 90, HP: 250. Can ve STR artışı.", "req_level": 54, "req_class": "BERSERKER", "stats": {"VIT": 22, "P_DEF": 50, "STR": 9, "RAW_DEF": 90, "HP": 250, "M_DEF": 20}},
            "Zırh": {"id": "B_A_54", "name": "Kalkan Plaka Zırh", "tooltip": "Temel Defans: 200, HP: 500. Yüksek STR ve VIT koruması.", "req_level": 54, "req_class": "BERSERKER", "stats": {"STR": 18, "VIT": 28, "P_DEF": 95, "RAW_DEF": 200, "HP": 500, "HP_REGEN": 3}},
            "Pantolon": {"id": "B_P_54", "name": "Kahraman Pantolonu", "tooltip": "Temel Defans: 130, HP: 280. Yüksek fiziksel savunma.", "req_level": 54, "req_class": "BERSERKER", "stats": {"VIT": 26, "P_DEF": 65, "RAW_DEF": 130, "HP": 280}},
            "Eldiven": {"id": "B_G_54", "name": "Yıkıcı Darbe Eldiveni", "tooltip": "Temel Defans: 65. Kritik vuruş gücü.", "req_level": 54, "req_class": "BERSERKER", "stats": {"STR": 18, "P_DEF": 30, "RAW_DEF": 65, "P_CRIT_BONUS": 4, "ASPD_BONUS": 3}},
            "Bileklik": {"id": "B_WR_54", "name": "Korkunç Güç Bilekliği", "tooltip": "Temel Defans: 40, HP: 150. STR ve HP artışı.", "req_level": 54, "req_class": "BERSERKER", "stats": {"STR": 15, "VIT": 8, "RAW_DEF": 40, "HP": 150, "LIFESTEAL": 1}},
            "Kolye": {"id": "B_N_54", "name": "Efsanenin Kalbi", "tooltip": "Temel Defans: 30, HP: 250. STR ve dayanıklılık.", "req_level": 54, "req_class": "BERSERKER", "stats": {"STR": 11, "VIT": 12, "HP": 250, "RAW_DEF": 30, "M_DEF": 25}},
            "Pelerin": {"id": "B_C_54", "name": "Fırtına Gecesi Pelerini", "tooltip": "Temel Defans: 40. Büyü direnci ve HP.", "req_level": 54, "req_class": "BERSERKER", "stats": {"M_DEF": 22, "VIT": 8, "RAW_DEF": 40, "P_DEF": 22, "HP": 80}}
        },
        "66": {
            "Silah": {"id": "B_W_66", "name": "Kızgın Demir Balta", "tooltip": "Temel Saldırı: 170. Hasar ve can çalma.", "req_level": 66, "req_class": "BERSERKER", "stats": {"STR": 35, "PAP_BONUS": 110, "VIT": 8, "RAW_ATK": 170, "LIFESTEAL": 2, "P_CRIT_BONUS": 5}},
            "Kask": {"id": "B_H_66", "name": "Sonsuz Öfke Miğferi", "tooltip": "Temel Defans: 110, HP: 300. Can ve STR artışı.", "req_level": 66, "req_class": "BERSERKER", "stats": {"VIT": 25, "P_DEF": 60, "STR": 12, "RAW_DEF": 110, "HP": 300, "HP_REGEN": 3}},
            "Zırh": {"id": "B_A_66", "name": "Ölümsüz Plaka Zırh", "tooltip": "Temel Defans: 230, HP: 600. Maksimum STR ve VIT koruması.", "req_level": 66, "req_class": "BERSERKER", "stats": {"STR": 22, "VIT": 32, "P_DEF": 110, "RAW_DEF": 230, "HP": 600, "M_DEF": 20}},
            "Pantolon": {"id": "B_P_66", "name": "Ejderha Derisi Pantolon", "tooltip": "Temel Defans: 150, HP: 350. Yüksek fiziksel savunma.", "req_level": 66, "req_class": "BERSERKER", "stats": {"VIT": 30, "P_DEF": 75, "RAW_DEF": 150, "HP": 350}},
            "Eldiven": {"id": "B_G_66", "name": "Hiddet Eldiveni", "tooltip": "Temel Defans: 75. Kritik vuruş gücü.", "req_level": 66, "req_class": "BERSERKER", "stats": {"STR": 22, "P_DEF": 35, "RAW_DEF": 75, "P_CRIT_BONUS": 4, "ASPD_BONUS": 3}},
            "Bileklik": {"id": "B_WR_66", "name": "Yüce Savaş Bilekliği", "tooltip": "Temel Defans: 50, HP: 200. STR ve HP artışı.", "req_level": 66, "req_class": "BERSERKER", "stats": {"STR": 18, "VIT": 10, "RAW_DEF": 50, "HP": 200}},
            "Kolye": {"id": "B_N_66", "name": "Destan Kolyesi", "tooltip": "Temel Defans: 40, HP: 300. STR ve dayanıklılık.", "req_level": 66, "req_class": "BERSERKER", "stats": {"STR": 14, "VIT": 15, "HP": 300, "RAW_DEF": 40, "M_DEF": 30}},
            "Pelerin": {"id": "B_C_66", "name": "Savaş Lordu Pelerini", "tooltip": "Temel Defans: 50. Büyü direnci ve HP.", "req_level": 66, "req_class": "BERSERKER", "stats": {"M_DEF": 26, "VIT": 10, "RAW_DEF": 50, "P_DEF": 26, "HP": 120}}
        },
        "75": {
            "Silah": {"id": "B_W_75", "name": "Kan İntikamı Baltası", "tooltip": "Temel Saldırı: 200. Öfkenin özü, tek bir darbede dağları yarar.", "req_level": 75, "req_class": "BERSERKER", "stats": {"STR": 40, "VIT": 10, "PAP_BONUS": 125, "RAW_ATK": 200, "P_CRIT_BONUS": 5, "LIFESTEAL": 3}},
            "Kask": {"id": "B_H_75", "name": "Demir İrade Miğferi", "tooltip": "Temel Defans: 120, HP: 400. Sarsılmaz bir dayanıklılık sağlar.", "req_level": 75, "req_class": "BERSERKER", "stats": {"STR": 15, "VIT": 30, "P_DEF": 70, "RAW_DEF": 120, "WIS": 5, "HP": 400, "M_DEF": 30}},
            "Zırh": {"id": "B_A_75", "name": "Kızgın Hiddet Plakası", "tooltip": "Temel Defans: 250, HP: 750. Can azaldıkça güçlenir.", "req_level": 75, "req_class": "BERSERKER", "stats": {"STR": 25, "VIT": 35, "P_DEF": 130, "RAW_DEF": 250, "HP_REGEN": 5, "HP": 750, "M_DEF": 35}},
            "Pantolon": {"id": "B_P_75", "name": "Ejderha Derisi Korumalık", "tooltip": "Temel Defans: 170, HP: 450. Hasar azaltımını maksimize eder.", "req_level": 75, "req_class": "BERSERKER", "stats": {"STR": 15, "VIT": 30, "P_DEF": 85, "RAW_DEF": 170, "WIS": 8, "HP": 450}},
            "Eldiven": {"id": "B_G_75", "name": "Yıkım Eldiveni", "tooltip": "Temel Defans: 85. Kritik vuruş gücünü artırır.", "req_level": 75, "req_class": "BERSERKER", "stats": {"STR": 25, "DEX": 6, "P_DEF": 40, "RAW_DEF": 85, "ASPD_BONUS": 4, "P_CRIT_BONUS": 5}},
            "Bileklik": {"id": "B_WR_75", "name": "Öfke Bilekliği", "tooltip": "Temel Defans: 60, HP: 250. Her vuruşta ekstra hasar yükü biriktirir.", "req_level": 75, "req_class": "BERSERKER", "stats": {"STR": 20, "VIT": 12, "P_DEF": 25, "RAW_DEF": 60, "HP": 250}},
            "Kolye": {"id": "B_N_75", "name": "Savaş Çığlığı Kolyesi", "tooltip": "Temel Defans: 45, HP: 400. Saldırı gücüne ilahi bir dokunuş katar.", "req_level": 75, "req_class": "BERSERKER", "stats": {"STR": 16, "DEX": 5, "HP": 400, "RAW_DEF": 45, "LIFESTEAL": 1}},
            "Pelerin": {"id": "B_C_75", "name": "Akşamın Gölgesi Pelerini", "tooltip": "Temel Defans: 65. Büyü savunmasını artırır.", "req_level": 75, "req_class": "BERSERKER", "stats": {"VIT": 12, "WIS": 15, "M_DEF": 35, "RAW_DEF": 65, "P_DEF": 30, "HP_REGEN": 5}}
        },
    },
    
    # ------------------------------------------------------------------------------------------------------
    # 2. ELEMENTALIST (INT/FOC Odaklı - Kumaş Zırh/Asa + Offhand)
    # ------------------------------------------------------------------------------------------------------
    "ELEMENTALIST": {
        "1": {
            "Silah": {"id": "E_W_1", "name": "Çırak Asası", "tooltip": "Temel Saldırı: 12. İlk büyü gücü.", "req_level": 1, "req_class": "ELEMENTALIST", "stats": {"INT": 2, "MAP_BONUS": 5, "RAW_ATK": 12, "CSPD_BONUS": 1}},
            "Kask": {"id": "E_H_1", "name": "Basit Başlık", "tooltip": "Temel Defans: 3, MP: 10. Temel kafa koruması.", "req_level": 1, "req_class": "ELEMENTALIST", "stats": {"FOC": 1, "M_DEF": 1, "RAW_DEF": 3, "MP": 10}},
            "Zırh": {"id": "E_A_1", "name": "Keten Cüppe", "tooltip": "Temel Defans: 8, MP: 20. Hafif ve rahat.", "req_level": 1, "req_class": "ELEMENTALIST", "stats": {"INT": 1, "M_DEF": 3, "RAW_DEF": 8, "MP": 20, "P_DEF": 1}},
            "Pantolon": {"id": "E_P_1", "name": "Yün Pantolon", "tooltip": "Temel Defans: 5, MP: 15. Hareket kolaylığı.", "req_level": 1, "req_class": "ELEMENTALIST", "stats": {"FOC": 1, "M_DEF": 2, "RAW_DEF": 5, "MP": 15}},
            "Eldiven": {"id": "E_G_1", "name": "Parmaksız Eldiven", "tooltip": "Temel Defans: 2. Hassasiyet sağlar.", "req_level": 1, "req_class": "ELEMENTALIST", "stats": {"INT": 1, "CSPD_BONUS": 1, "RAW_DEF": 2, "M_DEF": 1}},
            "Bileklik": {"id": "E_WR_1", "name": "İnce Bileklik", "tooltip": "Temel Defans: 1. Temel FOC.", "req_level": 1, "req_class": "ELEMENTALIST", "stats": {"FOC": 1, "RAW_DEF": 1, "MP_REGEN": 1}},
            "Kolye": {"id": "E_N_1", "name": "Cam Tılsım", "tooltip": "Temel Defans: 1. Temel INT.", "req_level": 1, "req_class": "ELEMENTALIST", "stats": {"INT": 1, "RAW_DEF": 1}},
            "Pelerin": {"id": "E_C_1", "name": "Basit Pelerin", "tooltip": "Temel Defans: 3. Hafiflik.", "req_level": 1, "req_class": "ELEMENTALIST", "stats": {"P_DEF": 1, "RAW_DEF": 3, "EVASION_BONUS": 1}},
            "Offhand": {"id": "E_O_1", "name": "Tahta Odak", "tooltip": "Temel Defans: 4, MP: 15. Büyü gücünü destekler.", "req_level": 1, "req_class": "ELEMENTALIST", "stats": {"FOC": 1, "INT": 1, "RAW_DEF": 4, "MP": 15}}
        },
        "9": {
            "Silah": {"id": "E_W_9", "name": "Rün İşlemeli Asa", "tooltip": "Temel Saldırı: 25. Büyü gücünü artırır.", "req_level": 9, "req_class": "ELEMENTALIST", "stats": {"INT": 5, "MAP_BONUS": 15, "FOC": 1, "RAW_ATK": 25, "M_CRIT_BONUS": 1}},
            "Kask": {"id": "E_H_9", "name": "Yıldız Tozu Başlık", "tooltip": "Temel Defans: 8, MP: 40. Cast hızına başlangıç.", "req_level": 9, "req_class": "ELEMENTALIST", "stats": {"FOC": 3, "M_DEF": 5, "RAW_DEF": 8, "CSPD_BONUS": 1, "MP": 40}},
            "Zırh": {"id": "E_A_9", "name": "Mavi Keten Cüppe", "tooltip": "Temel Defans: 20, MP: 70. Daha iyi büyü savunması.", "req_level": 9, "req_class": "ELEMENTALIST", "stats": {"INT": 3, "FOC": 2, "M_DEF": 12, "RAW_DEF": 20, "MP": 70}},
            "Pantolon": {"id": "E_P_9", "name": "Gölge Kumaş Pantolon", "tooltip": "Temel Defans: 15, MP: 50. Daha iyi mana.", "req_level": 9, "req_class": "ELEMENTALIST", "stats": {"FOC": 4, "M_DEF": 8, "RAW_DEF": 15, "MP": 50, "M_DEF_BONUS": 1}},
            "Eldiven": {"id": "E_G_9", "name": "Mana Eldiveni", "tooltip": "Temel Defans: 5. Hızlı cast.", "req_level": 9, "req_class": "ELEMENTALIST", "stats": {"INT": 3, "CSPD_BONUS": 2, "RAW_DEF": 5, "MAP_BONUS": 5}},
            "Bileklik": {"id": "E_WR_9", "name": "Akıl Bilekliği", "tooltip": "Temel Defans: 3, MP: 20. INT ve FOC artışı.", "req_level": 9, "req_class": "ELEMENTALIST", "stats": {"INT": 2, "FOC": 1, "RAW_DEF": 3, "MP": 20}},
            "Kolye": {"id": "E_N_9", "name": "Element Tohumu", "tooltip": "Temel Defans: 2, MP: 30. INT artışı.", "req_level": 9, "req_class": "ELEMENTALIST", "stats": {"INT": 3, "MP": 30, "RAW_DEF": 2, "M_DEF": 3}},
            "Pelerin": {"id": "E_C_9", "name": "İpeksi Pelerin", "tooltip": "Temel Defans: 7. Daha iyi fiziksel direnç.", "req_level": 9, "req_class": "ELEMENTALIST", "stats": {"P_DEF": 3, "RAW_DEF": 7, "EVASION_BONUS": 1}},
            "Offhand": {"id": "E_O_9", "name": "Enerji Küresi", "tooltip": "Temel Defans: 7, MP: 50. Mana ve FOC artışı.", "req_level": 9, "req_class": "ELEMENTALIST", "stats": {"FOC": 3, "INT": 2, "RAW_DEF": 7, "MP": 50, "CSPD_BONUS": 1}}
        },
        "18": {
            "Silah": {"id": "E_W_18", "name": "Gümüş İşlemeli Asa", "tooltip": "Temel Saldırı: 45. Büyü gücünü artırır.", "req_level": 18, "req_class": "ELEMENTALIST", "stats": {"INT": 9, "MAP_BONUS": 30, "FOC": 2, "RAW_ATK": 45, "M_DEF": 35}},
            "Kask": {"id": "E_H_18", "name": "Astral Başlık", "tooltip": "Temel Defans: 15, MP: 70. Cast hızına odaklı.", "req_level": 18, "req_class": "ELEMENTALIST", "stats": {"FOC": 6, "M_DEF": 12, "RAW_DEF": 15, "CSPD_BONUS": 2, "MP": 70}},
            "Zırh": {"id": "E_A_18", "name": "İpek Cüppe", "tooltip": "Temel Defans: 35, MP: 120. Orta büyü savunması.", "req_level": 18, "req_class": "ELEMENTALIST", "stats": {"INT": 6, "FOC": 4, "M_DEF": 25, "RAW_DEF": 35, "MP": 120, "M_CRIT_BONUS": 1}},
            "Pantolon": {"id": "E_P_18", "name": "Mistik Tayt", "tooltip": "Temel Defans: 25, MP: 100. Mana havuzu.", "req_level": 18, "req_class": "ELEMENTALIST", "stats": {"FOC": 8, "M_DEF": 18, "RAW_DEF": 25, "MP": 100, "HP": 30}},
            "Eldiven": {"id": "E_G_18", "name": "Hızlı Cast Eldiveni", "tooltip": "Temel Defans: 10. Cast hızını artırır.", "req_level": 18, "req_class": "ELEMENTALIST", "stats": {"INT": 5, "CSPD_BONUS": 3, "RAW_DEF": 10, "MAP_BONUS": 10}},
            "Bileklik": {"id": "E_WR_18", "name": "Element Bilekliği", "tooltip": "Temel Defans: 5, MP: 40. INT ve FOC artışı.", "req_level": 18, "req_class": "ELEMENTALIST", "stats": {"INT": 4, "FOC": 3, "RAW_DEF": 5, "MP": 40}},
            "Kolye": {"id": "E_N_18", "name": "Büyü Gücü Tılsımı", "tooltip": "Temel Defans: 4, HP: 20. INT artışı.", "req_level": 18, "req_class": "ELEMENTALIST", "stats": {"INT": 4, "FOC": 2, "RAW_DEF": 4, "HP": 20, "M_DEF": 5}},
            "Pelerin": {"id": "E_C_18", "name": "Gizemli Pelerin", "tooltip": "Temel Defans: 12. Fiziksel direnç.", "req_level": 18, "req_class": "ELEMENTALIST", "stats": {"P_DEF": 6, "RAW_DEF": 12, "M_DEF": 8}},
            "Offhand": {"id": "E_O_18", "name": "Parlayan Odak", "tooltip": "Temel Defans: 12, MP: 90. Mana ve FOC artışı.", "req_level": 18, "req_class": "ELEMENTALIST", "stats": {"FOC": 6, "INT": 4, "RAW_DEF": 12, "MP": 90, "CSPD_BONUS": 1}}
        },
        "24": {
            "Silah": {"id": "E_W_24", "name": "Kristal Asa", "tooltip": "Temel Saldırı: 60. Yüksek büyü hasarı.", "req_level": 24, "req_class": "ELEMENTALIST", "stats": {"INT": 12, "MAP_BONUS": 40, "FOC": 3, "RAW_ATK": 60, "M_CRIT_BONUS": 2}},
            "Kask": {"id": "E_H_24", "name": "Enerji Başlığı", "tooltip": "Temel Defans: 22, MP: 100. Cast hızına odaklı.", "req_level": 24, "req_class": "ELEMENTALIST", "stats": {"FOC": 8, "M_DEF": 18, "RAW_DEF": 22, "CSPD_BONUS": 3, "MP": 100}},
            "Zırh": {"id": "E_A_24", "name": "Runik Cüppe", "tooltip": "Temel Defans: 50, MP: 180. Yüksek büyü savunması.", "req_level": 24, "req_class": "ELEMENTALIST", "stats": {"INT": 8, "FOC": 6, "M_DEF": 35, "RAW_DEF": 50, "MP": 180, "M_CRIT_BONUS": 1}},
            "Pantolon": {"id": "E_P_24", "name": "Mistik Enerji Pantolonu", "tooltip": "Temel Defans: 35, MP: 150. Mana havuzu.", "req_level": 24, "req_class": "ELEMENTALIST", "stats": {"FOC": 10, "M_DEF": 25, "RAW_DEF": 35, "MP": 150, "HP": 50}},
            "Eldiven": {"id": "E_G_24", "name": "Büyücü Eldiveni", "tooltip": "Temel Defans: 15. Kritik şansını artırır.", "req_level": 24, "req_class": "ELEMENTALIST", "stats": {"INT": 8, "CSPD_BONUS": 4, "RAW_DEF": 15, "M_CRIT_BONUS": 2}},
            "Bileklik": {"id": "E_WR_24", "name": "Hız Bilekliği", "tooltip": "Temel Defans: 10, MP: 60. FOC ve INT artışı.", "req_level": 24, "req_class": "ELEMENTALIST", "stats": {"INT": 6, "FOC": 4, "RAW_DEF": 10, "MP": 60, "CSPD_BONUS": 1}},
            "Kolye": {"id": "E_N_24", "name": "Kıvılcım Kolyesi", "tooltip": "Temel Defans: 6, HP: 40. INT artışı.", "req_level": 24, "req_class": "ELEMENTALIST", "stats": {"INT": 5, "FOC": 3, "RAW_DEF": 6, "HP": 40, "M_DEF": 8}},
            "Pelerin": {"id": "E_C_24", "name": "Gölge Kumaş Pelerin", "tooltip": "Temel Defans: 18. Fiziksel direnç.", "req_level": 24, "req_class": "ELEMENTALIST", "stats": {"P_DEF": 8, "RAW_DEF": 18, "M_DEF": 10}},
            "Offhand": {"id": "E_O_24", "name": "Enerji Kristali", "tooltip": "Temel Defans: 18, MP: 130. Mana ve FOC artışı.", "req_level": 24, "req_class": "ELEMENTALIST", "stats": {"FOC": 8, "INT": 6, "RAW_DEF": 18, "MP": 130, "M_DEF_BONUS": 3}}
        },
        "34": {
            "Silah": {"id": "E_W_34", "name": "Element Kaynağı Asası", "tooltip": "Temel Saldırı: 80. Hasar ve kritik destek.", "req_level": 34, "req_class": "ELEMENTALIST", "stats": {"INT": 16, "MAP_BONUS": 60, "FOC": 4, "RAW_ATK": 80, "M_CRIT_BONUS": 3}},
            "Kask": {"id": "E_H_34", "name": "Büyücü Miğferi", "tooltip": "Temel Defans: 30, MP: 130. INT odaklı.", "req_level": 34, "req_class": "ELEMENTALIST", "stats": {"INT": 10, "M_DEF": 25, "FOC": 4, "RAW_DEF": 30, "MP": 130, "CSPD_BONUS": 2}},
            "Zırh": {"id": "E_A_34", "name": "Güçlendirilmiş Cübbe", "tooltip": "Temel Defans: 70, MP: 250. Yüksek büyü savunması.", "req_level": 34, "req_class": "ELEMENTALIST", "stats": {"INT": 12, "FOC": 8, "M_DEF": 50, "RAW_DEF": 70, "MP": 250, "HP": 80}},
            "Pantolon": {"id": "E_P_34", "name": "Mistik Güç Pantolonu", "tooltip": "Temel Defans: 45, MP: 250. Mana havuzu.", "req_level": 34, "req_class": "ELEMENTALIST", "stats": {"FOC": 12, "M_DEF": 35, "RAW_DEF": 45, "MP": 250, "MP_REGEN": 2}},
            "Eldiven": {"id": "E_G_34", "name": "Mana Akımı Eldiveni", "tooltip": "Temel Defans: 20. Kritik şansını artırır.", "req_level": 34, "req_class": "ELEMENTALIST", "stats": {"INT": 10, "CSPD_BONUS": 4, "RAW_DEF": 20, "M_CRIT_BONUS": 2}},
            "Bileklik": {"id": "E_WR_34", "name": "Element Bilekliği", "tooltip": "Temel Defans: 12, MP: 80. FOC ve INT artışı.", "req_level": 34, "req_class": "ELEMENTALIST", "stats": {"INT": 8, "FOC": 6, "RAW_DEF": 12, "MP": 80, "CSPD_BONUS": 2}},
            "Kolye": {"id": "E_N_34", "name": "Büyücü Tılsımı", "tooltip": "Temel Defans: 8, HP: 50. INT artışı.", "req_level": 34, "req_class": "ELEMENTALIST", "stats": {"INT": 7, "FOC": 5, "HP": 50, "RAW_DEF": 8, "M_DEF": 12}},
            "Pelerin": {"id": "E_C_34", "name": "Mistik Koruma Pelerini", "tooltip": "Temel Defans: 25. Fiziksel direnç.", "req_level": 34, "req_class": "ELEMENTALIST", "stats": {"P_DEF": 12, "RAW_DEF": 25, "M_DEF": 15}},
            "Offhand": {"id": "E_O_34", "name": "Büyü Odak Taşı", "tooltip": "Temel Defans: 25, MP: 180. Mana ve FOC artışı.", "req_level": 34, "req_class": "ELEMENTALIST", "stats": {"FOC": 12, "INT": 8, "RAW_DEF": 25, "MP": 180, "CSPD_BONUS": 2}}
        },
        "42": {
            "Silah": {"id": "E_W_42", "name": "Alev ve Buz Asası", "tooltip": "Temel Saldırı: 100. Yüksek hasar ve cast hızı.", "req_level": 42, "req_class": "ELEMENTALIST", "stats": {"INT": 22, "MAP_BONUS": 75, "FOC": 5, "RAW_ATK": 100, "CSPD_BONUS": 2, "M_CRIT_BONUS": 4}},
            "Kask": {"id": "E_H_42", "name": "Gök Taşı Başlık", "tooltip": "Temel Defans: 40, MP: 180. INT ve FOC dengesi.", "req_level": 42, "req_class": "ELEMENTALIST", "stats": {"INT": 12, "M_DEF": 35, "FOC": 6, "RAW_DEF": 40, "MP": 180, "M_DEF_BONUS": 5}},
            "Zırh": {"id": "E_A_42", "name": "Usta Cüppesi", "tooltip": "Temel Defans: 90, MP: 350. Orta-üst düzey büyü savunması.", "req_level": 42, "req_class": "ELEMENTALIST", "stats": {"INT": 15, "FOC": 10, "M_DEF": 65, "RAW_DEF": 90, "MP": 350, "HP": 120}},
            "Pantolon": {"id": "E_P_42", "name": "Kozmik İpeği Pantolon", "tooltip": "Temel Defans: 60, MP: 350. Yüksek mana havuzu.", "req_level": 42, "req_class": "ELEMENTALIST", "stats": {"FOC": 15, "M_DEF": 45, "RAW_DEF": 60, "MP": 350, "MP_REGEN": 3}},
            "Eldiven": {"id": "E_G_42", "name": "Yıldırım Eldiveni", "tooltip": "Temel Defans: 25. Kritik ve cast hızı.", "req_level": 42, "req_class": "ELEMENTALIST", "stats": {"INT": 15, "CSPD_BONUS": 5, "RAW_DEF": 25, "M_CRIT_BONUS": 3}},
            "Bileklik": {"id": "E_WR_42", "name": "Büyücü Bilekliği", "tooltip": "Temel Defans: 15, MP: 120. FOC ve INT artışı.", "req_level": 42, "req_class": "ELEMENTALIST", "stats": {"INT": 10, "FOC": 8, "RAW_DEF": 15, "MP": 120, "CSPD_BONUS": 3}},
            "Kolye": {"id": "E_N_42", "name": "Yıldız Tozu Kolyesi", "tooltip": "Temel Defans: 12, HP: 100. INT artışı.", "req_level": 42, "req_class": "ELEMENTALIST", "stats": {"INT": 9, "FOC": 7, "HP": 100, "RAW_DEF": 12, "M_DEF": 20}},
            "Pelerin": {"id": "E_C_42", "name": "Sihirli Kumaş Pelerin", "tooltip": "Temel Defans: 35. Fiziksel direnç.", "req_level": 42, "req_class": "ELEMENTALIST", "stats": {"P_DEF": 15, "RAW_DEF": 35, "M_DEF": 20}},
            "Offhand": {"id": "E_O_42", "name": "Kutsal Odak", "tooltip": "Temel Defans: 30, MP: 250. Mana ve FOC artışı.", "req_level": 42, "req_class": "ELEMENTALIST", "stats": {"FOC": 15, "INT": 10, "RAW_DEF": 30, "MP": 250, "CSPD_BONUS": 3}}
        },
        "48": {
            "Silah": {"id": "E_W_48", "name": "Sonsuz Büyü Asası", "tooltip": "Temel Saldırı: 120. Yüksek hasar ve mana yenileme.", "req_level": 48, "req_class": "ELEMENTALIST", "stats": {"INT": 25, "MAP_BONUS": 85, "FOC": 6, "RAW_ATK": 120, "MP_REGEN": 5, "M_CRIT_BONUS": 4}},
            "Kask": {"id": "E_H_48", "name": "Kahraman Başlığı", "tooltip": "Temel Defans: 50, MP: 220. INT ve FOC dengesi.", "req_level": 48, "req_class": "ELEMENTALIST", "stats": {"INT": 15, "M_DEF": 42, "FOC": 8, "RAW_DEF": 50, "MP": 220, "CSPD_BONUS": 3}},
            "Zırh": {"id": "E_A_48", "name": "Runik İpek Cüppe", "tooltip": "Temel Defans: 110, MP: 450. Yüksek büyü savunması.", "req_level": 48, "req_class": "ELEMENTALIST", "stats": {"INT": 18, "FOC": 12, "M_DEF": 80, "RAW_DEF": 110, "MP": 450, "HP": 150}},
            "Pantolon": {"id": "E_P_48", "name": "Yüksek Enerji Pantolonu", "tooltip": "Temel Defans: 75, MP: 450. Maksimum mana havuzu.", "req_level": 48, "req_class": "ELEMENTALIST", "stats": {"FOC": 18, "M_DEF": 55, "RAW_DEF": 75, "MP": 450, "M_DEF_BONUS": 8}},
            "Eldiven": {"id": "E_G_48", "name": "Aether Eldiveni", "tooltip": "Temel Defans: 30. Kritik ve cast hızı.", "req_level": 48, "req_class": "ELEMENTALIST", "stats": {"INT": 18, "CSPD_BONUS": 5, "RAW_DEF": 30, "M_CRIT_BONUS": 4}},
            "Bileklik": {"id": "E_WR_48", "name": "Mitoloji Bilekliği", "tooltip": "Temel Defans: 18, MP: 150. FOC ve INT artışı.", "req_level": 48, "req_class": "ELEMENTALIST", "stats": {"INT": 12, "FOC": 10, "RAW_DEF": 18, "MP": 150, "CSPD_BONUS": 3}},
            "Kolye": {"id": "E_N_48", "name": "Büyü Akımı Kolyesi", "tooltip": "Temel Defans: 15, HP: 150. INT artışı.", "req_level": 48, "req_class": "ELEMENTALIST", "stats": {"INT": 10, "FOC": 8, "HP": 150, "RAW_DEF": 15, "MP_REGEN": 2}},
            "Pelerin": {"id": "E_C_48", "name": "Göksel Kumaş Pelerin", "tooltip": "Temel Defans: 40. Fiziksel direnç.", "req_level": 48, "req_class": "ELEMENTALIST", "stats": {"P_DEF": 18, "RAW_DEF": 40, "M_DEF": 25}},
            "Offhand": {"id": "E_O_48", "name": "Sonsuzluk Odak", "tooltip": "Temel Defans: 40, MP: 300. Mana ve FOC artışı.", "req_level": 48, "req_class": "ELEMENTALIST", "stats": {"FOC": 18, "INT": 12, "RAW_DEF": 40, "MP": 300, "M_CRIT_BONUS": 1}}
        },
        "54": {
            "Silah": {"id": "E_W_54", "name": "Element Hükmü Asası", "tooltip": "Temel Saldırı: 140. Yüksek hasar ve kritik.", "req_level": 54, "req_class": "ELEMENTALIST", "stats": {"INT": 29, "MAP_BONUS": 95, "FOC": 7, "RAW_ATK": 140, "M_CRIT_BONUS": 5, "CSPD_BONUS": 1}},
            "Kask": {"id": "E_H_54", "name": "Yüce Büyücü Başlığı", "tooltip": "Temel Defans: 60, MP: 250. INT ve FOC dengesi.", "req_level": 54, "req_class": "ELEMENTALIST", "stats": {"INT": 18, "M_DEF": 50, "FOC": 10, "RAW_DEF": 60, "MP": 250, "MP_REGEN": 3}},
            "Zırh": {"id": "E_A_54", "name": "Lord Cübbesi", "tooltip": "Temel Defans: 130, MP: 550. Maksimum büyü savunması.", "req_level": 54, "req_class": "ELEMENTALIST", "stats": {"INT": 22, "FOC": 15, "M_DEF": 95, "RAW_DEF": 130, "MP": 550, "HP": 200}},
            "Pantolon": {"id": "E_P_54", "name": "Kozmik Toz Pantolon", "tooltip": "Temel Defans: 90, MP: 550. Maksimum mana havuzu.", "req_level": 54, "req_class": "ELEMENTALIST", "stats": {"FOC": 22, "M_DEF": 65, "RAW_DEF": 90, "MP": 550, "HP": 120}},
            "Eldiven": {"id": "E_G_54", "name": "Efsunlu Eldiven", "tooltip": "Temel Defans: 35. Kritik ve cast hızı.", "req_level": 54, "req_class": "ELEMENTALIST", "stats": {"INT": 22, "CSPD_BONUS": 6, "RAW_DEF": 35, "M_CRIT_BONUS": 5}},
            "Bileklik": {"id": "E_WR_54", "name": "Gizemli Bileklik", "tooltip": "Temel Defans: 22, MP: 180. FOC ve INT artışı.", "req_level": 54, "req_class": "ELEMENTALIST", "stats": {"INT": 15, "FOC": 12, "RAW_DEF": 22, "MP": 180, "CSPD_BONUS": 4}},
            "Kolye": {"id": "E_N_54", "name": "Büyü Lordu Kolyesi", "tooltip": "Temel Defans: 20, HP: 200. INT artışı.", "req_level": 54, "req_class": "ELEMENTALIST", "stats": {"INT": 12, "FOC": 10, "HP": 200, "RAW_DEF": 20, "M_DEF": 30}},
            "Pelerin": {"id": "E_C_54", "name": "Karanlık Madde Pelerini", "tooltip": "Temel Defans: 50. Fiziksel direnç.", "req_level": 54, "req_class": "ELEMENTALIST", "stats": {"P_DEF": 22, "RAW_DEF": 50, "M_DEF": 30}},
            "Offhand": {"id": "E_O_54", "name": "Evrenin Odak Taşı", "tooltip": "Temel Defans: 50, MP: 350. Mana ve FOC artışı.", "req_level": 54, "req_class": "ELEMENTALIST", "stats": {"FOC": 22, "INT": 15, "RAW_DEF": 50, "MP": 350, "M_DEF_BONUS": 10}}
        },
        "66": {
            "Silah": {"id": "E_W_66", "name": "Kadim Enerji Asası", "tooltip": "Temel Saldırı: 160. Yüksek hasar ve kritik.", "req_level": 66, "req_class": "ELEMENTALIST", "stats": {"INT": 35, "MAP_BONUS": 110, "FOC": 8, "RAW_ATK": 160, "M_CRIT_BONUS": 6, "CSPD_BONUS": 2}},
            "Kask": {"id": "E_H_66", "name": "Sonsuzluk Başlığı", "tooltip": "Temel Defans: 75, MP: 300. INT ve FOC dengesi.", "req_level": 66, "req_class": "ELEMENTALIST", "stats": {"INT": 22, "M_DEF": 60, "FOC": 12, "RAW_DEF": 75, "MP": 300, "MP_REGEN": 4}},
            "Zırh": {"id": "E_A_66", "name": "Yüce Element Cübbesi", "tooltip": "Temel Defans: 150, MP: 650. Maksimum büyü savunması.", "req_level": 66, "req_class": "ELEMENTALIST", "stats": {"INT": 25, "FOC": 18, "M_DEF": 110, "RAW_DEF": 150, "MP": 650, "HP": 250}},
            "Pantolon": {"id": "E_P_66", "name": "Kozmik Enerji Pantolonu", "tooltip": "Temel Defans: 110, MP: 650. Maksimum mana havuzu.", "req_level": 66, "req_class": "ELEMENTALIST", "stats": {"FOC": 25, "M_DEF": 75, "RAW_DEF": 110, "MP": 650, "HP": 150}},
            "Eldiven": {"id": "E_G_66", "name": "Mistik Enerji Eldiveni", "tooltip": "Temel Defans: 40. Kritik ve cast hızı.", "req_level": 66, "req_class": "ELEMENTALIST", "stats": {"INT": 25, "CSPD_BONUS": 7, "RAW_DEF": 40, "M_CRIT_BONUS": 5}},
            "Bileklik": {"id": "E_WR_66", "name": "Ustalar Bilekliği", "tooltip": "Temel Defans: 30, MP: 250. FOC ve INT artışı.", "req_level": 66, "req_class": "ELEMENTALIST", "stats": {"INT": 18, "FOC": 15, "RAW_DEF": 30, "MP": 250, "CSPD_BONUS": 5}},
            "Kolye": {"id": "E_N_66", "name": "Evrenin Gözü Kolyesi", "tooltip": "Temel Defans: 25, HP: 300. INT artışı.", "req_level": 66, "req_class": "ELEMENTALIST", "stats": {"INT": 15, "FOC": 12, "HP": 300, "RAW_DEF": 25, "M_DEF": 40}},
            "Pelerin": {"id": "E_C_66", "name": "Yıldız Tozu Pelerini", "tooltip": "Temel Defans: 60. Fiziksel direnç.", "req_level": 66, "req_class": "ELEMENTALIST", "stats": {"P_DEF": 26, "RAW_DEF": 60, "M_DEF": 35}},
            "Offhand": {"id": "E_O_66", "name": "Büyücü Mührü", "tooltip": "Temel Defans: 60, MP: 450. Mana ve FOC artışı.", "req_level": 66, "req_class": "ELEMENTALIST", "stats": {"FOC": 28, "INT": 18, "RAW_DEF": 60, "MP": 450, "M_CRIT_BONUS": 2}}
        },
        "75": {
            "Silah": {"id": "E_W_75", "name": "Kıyamet Kristali", "tooltip": "Temel Saldırı: 180. Elementlerin saf gücü.", "req_level": 75, "req_class": "ELEMENTALIST", "stats": {"INT": 45, "FOC": 10, "MAP_BONUS": 130, "RAW_ATK": 180, "M_CRIT_BONUS": 6, "CSPD_BONUS": 3}},
            "Kask": {"id": "E_H_75", "name": "Ateş Rünü Başlığı", "tooltip": "Temel Defans: 90, MP: 400. Cast hızını artırır.", "req_level": 75, "req_class": "ELEMENTALIST", "stats": {"INT": 25, "FOC": 15, "M_DEF": 70, "RAW_DEF": 90, "CSPD_BONUS": 4, "MP": 400, "MP_REGEN": 5}},
            "Zırh": {"id": "E_A_75", "name": "Fırtına Cübbesi", "tooltip": "Temel Defans: 170, MP: 800. Yüksek büyü hasarı için koruma.", "req_level": 75, "req_class": "ELEMENTALIST", "stats": {"INT": 30, "FOC": 20, "M_DEF": 130, "RAW_DEF": 170, "MP": 800, "HP": 300, "M_CRIT_BONUS": 3}},
            "Pantolon": {"id": "E_P_75", "name": "Buz İpeği Pantolon", "tooltip": "Temel Defans: 120, MP: 500. Savunma sağlarken hareket kısıtlamaz.", "req_level": 75, "req_class": "ELEMENTALIST", "stats": {"INT": 18, "VIT": 10, "M_DEF": 85, "RAW_DEF": 120, "MP": 500, "HP": 200}},
            "Eldiven": {"id": "E_G_75", "name": "Yanardağ Eldiveni", "tooltip": "Temel Defans: 50. Hasar büyülerinin gücünü maksimize eder.", "req_level": 75, "req_class": "ELEMENTALIST", "stats": {"INT": 30, "CSPD_BONUS": 8, "RAW_DEF": 50, "M_CRIT_BONUS": 7}},
            "Bileklik": {"id": "E_WR_75", "name": "Şimşek Bilekliği", "tooltip": "Temel Defans: 40, MP: 300. Cast hızına önemli katkı.", "req_level": 75, "req_class": "ELEMENTALIST", "stats": {"FOC": 25, "CSPD_BONUS": 5, "INT": 15, "RAW_DEF": 40, "MP": 300}},
            "Kolye": {"id": "E_N_75", "name": "Yıldırımın Kalbi Kolyesi", "tooltip": "Temel Defans: 30, HP: 300. MP havuzu ve kritik şansı.", "req_level": 75, "req_class": "ELEMENTALIST", "stats": {"INT": 20, "FOC": 15, "M_CRIT_BONUS": 5, "RAW_DEF": 30, "HP": 300, "MP": 450}},
            "Pelerin": {"id": "E_C_75", "name": "Kozmik Toz Pelerini", "tooltip": "Temel Defans: 75. Büyü savunması sağlar.", "req_level": 75, "req_class": "ELEMENTALIST", "stats": {"WIS": 15, "M_DEF": 50, "RAW_DEF": 75, "P_DEF": 35}},
            "Offhand": {"id": "E_O_75", "name": "Büyü Odak Taşı", "tooltip": "Temel Defans: 70, MP: 550. Mana ve büyü hızı odaklı.", "req_level": 75, "req_class": "ELEMENTALIST", "stats": {"FOC": 35, "CSPD_BONUS": 5, "M_DEF": 30, "RAW_DEF": 70, "MP": 550, "INT": 12}}
        },
    },
    
    # ------------------------------------------------------------------------------------------------------
    # 3. DRUID (INT/WIS/FOC Odaklı - Kumaş Zırh/Asa + Offhand)
    # ------------------------------------------------------------------------------------------------------
    "DRUID": {
        "1": {
            "Silah": {"id": "D_W_1", "name": "Çubuk Dal", "tooltip": "Temel Saldırı: 10. İlk doğa gücü.", "req_level": 1, "req_class": "DRUID", "stats": {"WIS": 2, "MAP_BONUS": 5, "RAW_ATK": 10, "HEAL_BONUS": 5}},
            "Kask": {"id": "D_H_1", "name": "Yaprak Bandı", "tooltip": "Temel Defans: 3, MP: 10. Temel FOC.", "req_level": 1, "req_class": "DRUID", "stats": {"FOC": 1, "M_DEF": 1, "RAW_DEF": 3, "MP": 10}},
            "Zırh": {"id": "D_A_1", "name": "Deri Yelek", "tooltip": "Temel Defans: 7, HP: 10. Hafif koruma.", "req_level": 1, "req_class": "DRUID", "stats": {"INT": 1, "WIS": 1, "M_DEF": 2, "RAW_DEF": 7, "HP": 10, "P_DEF": 1}},
            "Pantolon": {"id": "D_P_1", "name": "Kaba Keten", "tooltip": "Temel Defans: 4. Hareket serbestliği.", "req_level": 1, "req_class": "DRUID", "stats": {"FOC": 1, "P_DEF": 1, "RAW_DEF": 4}},
            "Eldiven": {"id": "D_G_1", "name": "Bitki Sargısı", "tooltip": "Temel Defans: 2. Temel INT/WIS.", "req_level": 1, "req_class": "DRUID", "stats": {"INT": 1, "WIS": 1, "RAW_DEF": 2, "CSPD_BONUS": 1}},
            "Bileklik": {"id": "D_WR_1", "name": "Tohum Bilekliği", "tooltip": "Temel Defans: 1. Temel FOC.", "req_level": 1, "req_class": "DRUID", "stats": {"FOC": 1, "RAW_DEF": 1}},
            "Kolye": {"id": "D_N_1", "name": "Tahta Kolye", "tooltip": "Temel Defans: 1. Temel INT/WIS.", "req_level": 1, "req_class": "DRUID", "stats": {"WIS": 1, "INT": 1, "RAW_DEF": 1, "HP": 5}},
            "Pelerin": {"id": "D_C_1", "name": "Yeşil Pelerin", "tooltip": "Temel Defans: 3. Temel koruma.", "req_level": 1, "req_class": "DRUID", "stats": {"M_DEF": 1, "RAW_DEF": 3, "P_DEF": 1}},
            "Offhand": {"id": "D_O_1", "name": "Kutsal Su Şişesi", "tooltip": "Temel Defans: 4, MP: 10. İyileştirme desteği.", "req_level": 1, "req_class": "DRUID", "stats": {"HEAL_BONUS": 2, "WIS": 1, "RAW_DEF": 4, "MP": 10}}
        },
        "9": {
            "Silah": {"id": "D_W_9", "name": "Yosunlu Asa", "tooltip": "Temel Saldırı: 25. Doğa gücü artışı.", "req_level": 9, "req_class": "DRUID", "stats": {"WIS": 5, "MAP_BONUS": 15, "FOC": 1, "RAW_ATK": 25, "HEAL_BONUS": 10}},
            "Kask": {"id": "D_H_9", "name": "Doğa Başlığı", "tooltip": "Temel Defans: 8, MP: 40. Temel FOC.", "req_level": 9, "req_class": "DRUID", "stats": {"FOC": 3, "M_DEF": 5, "WIS": 1, "RAW_DEF": 8, "MP": 40}},
            "Zırh": {"id": "D_A_9", "name": "Çiçekli Cüppe", "tooltip": "Temel Defans: 20, HP: 30. Daha iyi M_DEF.", "req_level": 9, "req_class": "DRUID", "stats": {"INT": 3, "WIS": 2, "M_DEF": 12, "RAW_DEF": 20, "HP": 30, "MP": 30}},
            "Pantolon": {"id": "D_P_9", "name": "Sarmaşık Pantolon", "tooltip": "Temel Defans: 15, HP: 50. Temel HP.", "req_level": 9, "req_class": "DRUID", "stats": {"FOC": 4, "M_DEF": 8, "RAW_DEF": 15, "HP": 50}},
            "Eldiven": {"id": "D_G_9", "name": "Filiz Eldiveni", "tooltip": "Temel Defans: 5. İyileştirme gücü.", "req_level": 9, "req_class": "DRUID", "stats": {"WIS": 3, "HEAL_BONUS": 5, "RAW_DEF": 5, "CSPD_BONUS": 1}},
            "Bileklik": {"id": "D_WR_9", "name": "Kök Bilekliği", "tooltip": "Temel Defans: 3, MP: 20. INT ve FOC artışı.", "req_level": 9, "req_class": "DRUID", "stats": {"INT": 2, "FOC": 1, "RAW_DEF": 3, "MP": 20}},
            "Kolye": {"id": "D_N_9", "name": "Ağaç Dalı Kolyesi", "tooltip": "Temel Defans: 2, MP: 30. Temel INT/WIS.", "req_level": 9, "req_class": "DRUID", "stats": {"WIS": 3, "INT": 1, "RAW_DEF": 2, "MP": 30}},
            "Pelerin": {"id": "D_C_9", "name": "Hafif Pelerin", "tooltip": "Temel Defans: 7. Temel P_DEF.", "req_level": 9, "req_class": "DRUID", "stats": {"P_DEF": 3, "RAW_DEF": 7, "M_DEF": 5}},
            "Offhand": {"id": "D_O_9", "name": "Tahta Fener", "tooltip": "Temel Defans: 7, MP: 50. Mana ve FOC artışı.", "req_level": 9, "req_class": "DRUID", "stats": {"FOC": 3, "WIS": 2, "RAW_DEF": 7, "MP": 50, "HEAL_BONUS": 5}}
        },
        "18": {
            "Silah": {"id": "D_W_18", "name": "Yaban Gülü Asası", "tooltip": "Temel Saldırı: 45. Hibrit hasar/şifa.", "req_level": 18, "req_class": "DRUID", "stats": {"WIS": 9, "MAP_BONUS": 30, "RAW_ATK": 45, "HEAL_BONUS": 15, "INT": 3, "M_CRIT_BONUS": 1}},
            "Kask": {"id": "D_H_18", "name": "Hava Taç", "tooltip": "Temel Defans: 15, MP: 70. FOC ve M_DEF.", "req_level": 18, "req_class": "DRUID", "stats": {"FOC": 6, "M_DEF": 12, "WIS": 2, "RAW_DEF": 15, "MP": 70, "CSPD_BONUS": 1}},
            "Zırh": {"id": "D_A_18", "name": "Mistik Kumaş Cüppe", "tooltip": "Temel Defans: 35, HP: 60. Orta M_DEF.", "req_level": 18, "req_class": "DRUID", "stats": {"INT": 5, "WIS": 5, "M_DEF": 25, "RAW_DEF": 35, "HP": 60, "MP": 60}},
            "Pantolon": {"id": "D_P_18", "name": "Toprak Rengi Pantolon", "tooltip": "Temel Defans: 25, MP: 100. Mana havuzu.", "req_level": 18, "req_class": "DRUID", "stats": {"FOC": 8, "M_DEF": 18, "RAW_DEF": 25, "MP": 100, "HP": 40}},
            "Eldiven": {"id": "D_G_18", "name": "Doğa Dokunuşu Eldiveni", "tooltip": "Temel Defans: 10. Şifa gücü artışı.", "req_level": 18, "req_class": "DRUID", "stats": {"WIS": 5, "HEAL_BONUS": 10, "RAW_DEF": 10, "CSPD_BONUS": 2}},
            "Bileklik": {"id": "D_WR_18", "name": "Druid Bilekliği", "tooltip": "Temel Defans: 5, MP: 40. INT ve FOC artışı.", "req_level": 18, "req_class": "DRUID", "stats": {"INT": 4, "FOC": 3, "RAW_DEF": 5, "MP": 40, "HEAL_BONUS": 5}},
            "Kolye": {"id": "D_N_18", "name": "Yaban Hayvanı Dişi", "tooltip": "Temel Defans: 4, HP: 30. WIS ve INT.", "req_level": 18, "req_class": "DRUID", "stats": {"WIS": 4, "INT": 3, "RAW_DEF": 4, "HP": 30, "M_DEF": 5}},
            "Pelerin": {"id": "D_C_18", "name": "Gölge Kumaş Pelerin", "tooltip": "Temel Defans: 12. Fiziksel direnç.", "req_level": 18, "req_class": "DRUID", "stats": {"P_DEF": 6, "RAW_DEF": 12, "M_DEF": 8}},
            "Offhand": {"id": "D_O_18", "name": "Kutsal Odak", "tooltip": "Temel Defans: 12, MP: 90. Mana ve FOC artışı.", "req_level": 18, "req_class": "DRUID", "stats": {"FOC": 6, "WIS": 4, "RAW_DEF": 12, "MP": 90, "HEAL_BONUS": 10}}
        },
        "24": {
            "Silah": {"id": "D_W_24", "name": "Sarmaşık Düğümü Asa", "tooltip": "Temel Saldırı: 60. Hibrit hasar/şifa.", "req_level": 24, "req_class": "DRUID", "stats": {"WIS": 12, "MAP_BONUS": 40, "RAW_ATK": 60, "HEAL_BONUS": 20, "INT": 5, "M_CRIT_BONUS": 1}},
            "Kask": {"id": "D_H_24", "name": "Toprak Taç", "tooltip": "Temel Defans: 22, MP: 100. FOC ve M_DEF.", "req_level": 24, "req_class": "DRUID", "stats": {"FOC": 8, "M_DEF": 18, "WIS": 3, "RAW_DEF": 22, "MP": 100, "HP_REGEN": 1}},
            "Zırh": {"id": "D_A_24", "name": "Koruma Cübbesi", "tooltip": "Temel Defans: 50, HP: 80. Yüksek M_DEF.", "req_level": 24, "req_class": "DRUID", "stats": {"INT": 7, "WIS": 7, "M_DEF": 35, "RAW_DEF": 50, "HP": 80, "MP": 80}},
            "Pantolon": {"id": "D_P_24", "name": "Ruhani Pantolon", "tooltip": "Temel Defans: 35, MP: 150. Mana havuzu.", "req_level": 24, "req_class": "DRUID", "stats": {"FOC": 10, "M_DEF": 25, "RAW_DEF": 35, "MP": 150, "HP": 50}},
            "Eldiven": {"id": "D_G_24", "name": "Bereket Eldiveni", "tooltip": "Temel Defans: 15. Şifa gücü artışı.", "req_level": 24, "req_class": "DRUID", "stats": {"WIS": 7, "HEAL_BONUS": 15, "RAW_DEF": 15, "CSPD_BONUS": 2}},
            "Bileklik": {"id": "D_WR_24", "name": "Doğa Gücü Bilekliği", "tooltip": "Temel Defans: 10, MP: 60. INT ve FOC artışı.", "req_level": 24, "req_class": "DRUID", "stats": {"INT": 6, "FOC": 4, "RAW_DEF": 10, "MP": 60, "HEAL_BONUS": 10}},
            "Kolye": {"id": "D_N_24", "name": "Orman Kalbi Kolyesi", "tooltip": "Temel Defans: 6, HP: 50. WIS ve INT.", "req_level": 24, "req_class": "DRUID", "stats": {"WIS": 5, "INT": 4, "RAW_DEF": 6, "HP": 50, "M_DEF": 8}},
            "Pelerin": {"id": "D_C_24", "name": "Hızlı Gezgin Pelerini", "tooltip": "Temel Defans: 18. Fiziksel direnç.", "req_level": 24, "req_class": "DRUID", "stats": {"P_DEF": 8, "RAW_DEF": 18, "M_DEF": 10, "EVASION_BONUS": 2}},
            "Offhand": {"id": "D_O_24", "name": "Yaşam Odak Taşı", "tooltip": "Temel Defans: 18, MP: 130. Mana ve FOC artışı.", "req_level": 24, "req_class": "DRUID", "stats": {"FOC": 8, "WIS": 6, "RAW_DEF": 18, "MP": 130, "HEAL_BONUS": 15}}
        },
        "34": {
            "Silah": {"id": "D_W_34", "name": "Kutsal Kök Asa", "tooltip": "Temel Saldırı: 80. Hibrit hasar/şifa.", "req_level": 34, "req_class": "DRUID", "stats": {"WIS": 16, "MAP_BONUS": 60, "RAW_ATK": 80, "HEAL_BONUS": 30, "INT": 7, "M_CRIT_BONUS": 1}},
            "Kask": {"id": "D_H_34", "name": "Koruyucu Taç", "tooltip": "Temel Defans: 30, MP: 130. FOC ve M_DEF.", "req_level": 34, "req_class": "DRUID", "stats": {"FOC": 12, "M_DEF": 25, "WIS": 4, "RAW_DEF": 30, "MP": 130, "HP_REGEN": 2}},
            "Zırh": {"id": "D_A_34", "name": "Yaşam Cübbesi", "tooltip": "Temel Defans: 70, HP: 120. Yüksek M_DEF.", "req_level": 34, "req_class": "DRUID", "stats": {"INT": 10, "WIS": 10, "M_DEF": 50, "RAW_DEF": 70, "HP": 120, "MP": 120}},
            "Pantolon": {"id": "D_P_34", "name": "Mistik Ağaç Pantolonu", "tooltip": "Temel Defans: 45, MP: 250. Mana havuzu.", "req_level": 34, "req_class": "DRUID", "stats": {"FOC": 12, "M_DEF": 35, "RAW_DEF": 45, "MP": 250, "HP": 80}},
            "Eldiven": {"id": "D_G_34", "name": "Şifa Dokunuşu Eldiveni", "tooltip": "Temel Defans: 20. Şifa gücü artışı.", "req_level": 34, "req_class": "DRUID", "stats": {"WIS": 10, "HEAL_BONUS": 20, "RAW_DEF": 20, "CSPD_BONUS": 3}},
            "Bileklik": {"id": "D_WR_34", "name": "Şifa Bilekliği", "tooltip": "Temel Defans: 12, MP: 80. INT ve FOC artışı.", "req_level": 34, "req_class": "DRUID", "stats": {"INT": 8, "FOC": 6, "RAW_DEF": 12, "MP": 80, "HEAL_BONUS": 15}},
            "Kolye": {"id": "D_N_34", "name": "Uyum Kolyesi", "tooltip": "Temel Defans: 8, HP: 80. WIS ve INT.", "req_level": 34, "req_class": "DRUID", "stats": {"WIS": 7, "INT": 5, "RAW_DEF": 8, "HP": 80, "M_DEF": 12}},
            "Pelerin": {"id": "D_C_34", "name": "Mevsim Pelerini", "tooltip": "Temel Defans: 25. Fiziksel direnç.", "req_level": 34, "req_class": "DRUID", "stats": {"P_DEF": 12, "RAW_DEF": 25, "M_DEF": 15, "EVASION_BONUS": 3}},
            "Offhand": {"id": "D_O_34", "name": "Doğa Kitabı", "tooltip": "Temel Defans: 25, MP: 180. Mana ve FOC artışı.", "req_level": 34, "req_class": "DRUID", "stats": {"FOC": 12, "WIS": 8, "RAW_DEF": 25, "MP": 180, "HEAL_BONUS": 20}}
        },
        "42": {
            "Silah": {"id": "D_W_42", "name": "Uyanış Asası", "tooltip": "Temel Saldırı: 100. Hibrit hasar/şifa.", "req_level": 42, "req_class": "DRUID", "stats": {"WIS": 22, "MAP_BONUS": 75, "RAW_ATK": 100, "HEAL_BONUS": 40, "INT": 10, "M_CRIT_BONUS": 2}},
            "Kask": {"id": "D_H_42", "name": "Orman Lordu Taç", "tooltip": "Temel Defans: 40, MP: 180. FOC ve M_DEF.", "req_level": 42, "req_class": "DRUID", "stats": {"FOC": 15, "M_DEF": 35, "WIS": 6, "RAW_DEF": 40, "MP": 180, "CSPD_BONUS": 2}},
            "Zırh": {"id": "D_A_42", "name": "Yüce Doğa Cübbesi", "tooltip": "Temel Defans: 90, HP: 160. Orta-üst düzey M_DEF.", "req_level": 42, "req_class": "DRUID", "stats": {"INT": 12, "WIS": 15, "M_DEF": 65, "RAW_DEF": 90, "HP": 160, "MP": 200, "HP_REGEN": 3}},
            "Pantolon": {"id": "D_P_42", "name": "Ruhani Kök Pantolon", "tooltip": "Temel Defans: 60, MP: 350. Mana havuzu.", "req_level": 42, "req_class": "DRUID", "stats": {"FOC": 15, "M_DEF": 45, "RAW_DEF": 60, "MP": 350, "HP": 100}},
            "Eldiven": {"id": "D_G_42", "name": "Yeniden Doğuş Eldiveni", "tooltip": "Temel Defans: 25. Şifa gücü artışı.", "req_level": 42, "req_class": "DRUID", "stats": {"WIS": 15, "HEAL_BONUS": 30, "RAW_DEF": 25, "CSPD_BONUS": 3}},
            "Bileklik": {"id": "D_WR_42", "name": "Yaşam Gücü Bilekliği", "tooltip": "Temel Defans: 15, MP: 120. INT ve FOC artışı.", "req_level": 42, "req_class": "DRUID", "stats": {"INT": 10, "FOC": 8, "RAW_DEF": 15, "MP": 120, "HEAL_BONUS": 25}},
            "Kolye": {"id": "D_N_42", "name": "Doğa Ruhu Kolyesi", "tooltip": "Temel Defans: 12, HP: 120. WIS ve INT.", "req_level": 42, "req_class": "DRUID", "stats": {"WIS": 9, "INT": 7, "RAW_DEF": 12, "HP": 120, "M_DEF": 18}},
            "Pelerin": {"id": "D_C_42", "name": "Gölge Yaprak Pelerini", "tooltip": "Temel Defans: 35. Fiziksel direnç.", "req_level": 42, "req_class": "DRUID", "stats": {"P_DEF": 15, "RAW_DEF": 35, "M_DEF": 20, "EVASION_BONUS": 4}},
            "Offhand": {"id": "D_O_42", "name": "Ruh Taşı", "tooltip": "Temel Defans: 30, MP: 250. Mana ve FOC artışı.", "req_level": 42, "req_class": "DRUID", "stats": {"FOC": 15, "WIS": 10, "RAW_DEF": 30, "MP": 250, "HEAL_BONUS": 30}}
        },
        "48": {
            "Silah": {"id": "D_W_48", "name": "Sonsuz Filiz Asa", "tooltip": "Temel Saldırı: 120. Hibrit hasar/şifa.", "req_level": 48, "req_class": "DRUID", "stats": {"WIS": 25, "MAP_BONUS": 85, "RAW_ATK": 120, "HEAL_BONUS": 50, "INT": 12, "M_CRIT_BONUS": 2}},
            "Kask": {"id": "D_H_48", "name": "Kadim Taç", "tooltip": "Temel Defans: 50, MP: 220. FOC ve M_DEF.", "req_level": 48, "req_class": "DRUID", "stats": {"FOC": 18, "M_DEF": 42, "WIS": 8, "RAW_DEF": 50, "MP": 220, "HP": 100}},
            "Zırh": {"id": "D_A_48", "name": "Yüce Druid Cübbesi", "tooltip": "Temel Defans: 110, HP: 200. Yüksek M_DEF.", "req_level": 48, "req_class": "DRUID", "stats": {"INT": 15, "WIS": 18, "M_DEF": 80, "RAW_DEF": 110, "HP": 200, "MP": 250}},
            "Pantolon": {"id": "D_P_48", "name": "Yüce Kök Pantolon", "tooltip": "Temel Defans: 75, MP: 450. Mana havuzu.", "req_level": 48, "req_class": "DRUID", "stats": {"FOC": 18, "M_DEF": 55, "RAW_DEF": 75, "MP": 450, "HP": 120}},
            "Eldiven": {"id": "D_G_48", "name": "Bereketin Eli", "tooltip": "Temel Defans: 30. Şifa gücü artışı.", "req_level": 48, "req_class": "DRUID", "stats": {"WIS": 18, "HEAL_BONUS": 40, "RAW_DEF": 30, "CSPD_BONUS": 3}},
            "Bileklik": {"id": "D_WR_48", "name": "Uyum Bilekliği", "tooltip": "Temel Defans: 18, MP: 150. INT ve FOC artışı.", "req_level": 48, "req_class": "DRUID", "stats": {"INT": 12, "FOC": 10, "RAW_DEF": 18, "MP": 150, "HEAL_BONUS": 30}},
            "Kolye": {"id": "D_N_48", "name": "Mistik Yaşam Kolyesi", "tooltip": "Temel Defans: 15, HP: 150. WIS ve INT.", "req_level": 48, "req_class": "DRUID", "stats": {"WIS": 10, "INT": 8, "RAW_DEF": 15, "HP": 150, "MP_REGEN": 3}},
            "Pelerin": {"id": "D_C_48", "name": "Kutsal Orman Pelerini", "tooltip": "Temel Defans: 40. Fiziksel direnç.", "req_level": 48, "req_class": "DRUID", "stats": {"P_DEF": 18, "RAW_DEF": 40, "M_DEF": 25, "EVASION_BONUS": 5}},
            "Offhand": {"id": "D_O_48", "name": "Doğa Ana Kalbi", "tooltip": "Temel Defans: 40, MP: 300. Mana ve FOC artışı.", "req_level": 48, "req_class": "DRUID", "stats": {"FOC": 18, "WIS": 12, "RAW_DEF": 40, "MP": 300, "HEAL_BONUS": 40}}
        },
        "54": {
            "Silah": {"id": "D_W_54", "name": "Ağaçların Gözyaşı", "tooltip": "Temel Saldırı: 140. Hibrit hasar/şifa.", "req_level": 54, "req_class": "DRUID", "stats": {"WIS": 29, "MAP_BONUS": 95, "RAW_ATK": 140, "HEAL_BONUS": 60, "INT": 15, "M_CRIT_BONUS": 3}},
            "Kask": {"id": "D_H_54", "name": "Yüce Taç", "tooltip": "Temel Defans: 60, MP: 250. FOC ve M_DEF.", "req_level": 54, "req_class": "DRUID", "stats": {"FOC": 22, "M_DEF": 50, "WIS": 10, "RAW_DEF": 60, "MP": 250, "HP_REGEN": 4}},
            "Zırh": {"id": "D_A_54", "name": "Yaşamın Örtüsü", "tooltip": "Temel Defans: 130, HP: 250. Maksimum M_DEF.", "req_level": 54, "req_class": "DRUID", "stats": {"INT": 18, "WIS": 22, "M_DEF": 95, "RAW_DEF": 130, "HP": 250, "MP": 350}},
            "Pantolon": {"id": "D_P_54", "name": "Canlı Kök Pantolon", "tooltip": "Temel Defans: 90, MP: 550. Mana havuzu.", "req_level": 54, "req_class": "DRUID", "stats": {"FOC": 22, "M_DEF": 65, "RAW_DEF": 90, "MP": 550, "HP": 150}},
            "Eldiven": {"id": "D_G_54", "name": "Yüce Şifa Eldiveni", "tooltip": "Temel Defans: 35. Şifa gücü artışı.", "req_level": 54, "req_class": "DRUID", "stats": {"WIS": 22, "HEAL_BONUS": 50, "RAW_DEF": 35, "CSPD_BONUS": 4}},
            "Bileklik": {"id": "D_WR_54", "name": "Evren Bilekliği", "tooltip": "Temel Defans: 22, MP: 180. INT ve FOC artışı.", "req_level": 54, "req_class": "DRUID", "stats": {"INT": 15, "FOC": 12, "RAW_DEF": 22, "MP": 180, "HEAL_BONUS": 35}},
            "Kolye": {"id": "D_N_54", "name": "Mistik Denge Kolyesi", "tooltip": "Temel Defans: 20, HP: 200. WIS ve INT.", "req_level": 54, "req_class": "DRUID", "stats": {"WIS": 12, "INT": 10, "RAW_DEF": 20, "HP": 200, "M_DEF": 30}},
            "Pelerin": {"id": "D_C_54", "name": "Doğa Lordu Pelerini", "tooltip": "Temel Defans: 50. Fiziksel direnç.", "req_level": 54, "req_class": "DRUID", "stats": {"P_DEF": 22, "RAW_DEF": 50, "M_DEF": 30, "EVASION_BONUS": 6}},
            "Offhand": {"id": "D_O_54", "name": "Mistik Odak", "tooltip": "Temel Defans: 50, MP: 350. Mana ve FOC artışı.", "req_level": 54, "req_class": "DRUID", "stats": {"FOC": 22, "WIS": 15, "RAW_DEF": 50, "MP": 350, "HEAL_BONUS": 50}}
        },
        "66": {
            "Silah": {"id": "D_W_66", "name": "Kadim Tohum Asa", "tooltip": "Temel Saldırı: 160. Hibrit hasar/şifa.", "req_level": 66, "req_class": "DRUID", "stats": {"WIS": 35, "MAP_BONUS": 110, "RAW_ATK": 160, "HEAL_BONUS": 75, "INT": 18, "M_CRIT_BONUS": 4}},
            "Kask": {"id": "D_H_66", "name": "Yaşam Ağacı Taç", "tooltip": "Temel Defans: 75, MP: 300. FOC ve M_DEF.", "req_level": 66, "req_class": "DRUID", "stats": {"FOC": 25, "M_DEF": 60, "WIS": 12, "RAW_DEF": 75, "MP": 300, "HP": 120}},
            "Zırh": {"id": "D_A_66", "name": "Yüce Bilge Cübbesi", "tooltip": "Temel Defans: 150, HP: 300. Maksimum M_DEF.", "req_level": 66, "req_class": "DRUID", "stats": {"INT": 22, "WIS": 28, "M_DEF": 110, "RAW_DEF": 150, "HP": 300, "MP": 450, "HP_REGEN": 5}},
            "Pantolon": {"id": "D_P_66", "name": "Mistik Kök Pantolon", "tooltip": "Temel Defans: 110, MP: 650. Mana havuzu.", "req_level": 66, "req_class": "DRUID", "stats": {"FOC": 25, "M_DEF": 75, "RAW_DEF": 110, "MP": 650, "HP": 200}},
            "Eldiven": {"id": "D_G_66", "name": "Doğa Gücü Eldiveni", "tooltip": "Temel Defans: 40. Şifa gücü artışı.", "req_level": 66, "req_class": "DRUID", "stats": {"WIS": 25, "HEAL_BONUS": 65, "RAW_DEF": 40, "CSPD_BONUS": 5}},
            "Bileklik": {"id": "D_WR_66", "name": "Sonsuz Yaşam Bilekliği", "tooltip": "Temel Defans: 30, MP: 250. INT ve FOC artışı.", "req_level": 66, "req_class": "DRUID", "stats": {"INT": 18, "FOC": 15, "RAW_DEF": 30, "MP": 250, "HEAL_BONUS": 45}},
            "Kolye": {"id": "D_N_66", "name": "Mistik Uyarı Kolyesi", "tooltip": "Temel Defans: 25, HP: 250. WIS ve INT.", "req_level": 66, "req_class": "DRUID", "stats": {"WIS": 15, "INT": 12, "RAW_DEF": 25, "HP": 250, "M_DEF": 40}},
            "Pelerin": {"id": "D_C_66", "name": "Gölge Orman Pelerini", "tooltip": "Temel Defans: 60. Fiziksel direnç.", "req_level": 66, "req_class": "DRUID", "stats": {"P_DEF": 26, "RAW_DEF": 60, "M_DEF": 35, "EVASION_BONUS": 7}},
            "Offhand": {"id": "D_O_66", "name": "Doğa Lordu Odak", "tooltip": "Temel Defans: 60, MP: 450. Mana ve FOC artışı.", "req_level": 66, "req_class": "DRUID", "stats": {"FOC": 28, "WIS": 18, "RAW_DEF": 60, "MP": 450, "HEAL_BONUS": 60}}
        },
        "75": {
            "Silah": {"id": "D_W_75", "name": "Kadim Ağaç Asası", "tooltip": "Temel Saldırı: 180. Yaşam ve çürüme döngüsünü yönetir.", "req_level": 75, "req_class": "DRUID", "stats": {"INT": 28, "WIS": 40, "MAP_BONUS": 100, "RAW_ATK": 180, "HEAL_BONUS": 90, "CSPD_BONUS": 5}},
            "Kask": {"id": "D_H_75", "name": "Yosunlu Taç", "tooltip": "Temel Defans: 90, MP: 400. Doğanın fısıltılarını duyar.", "req_level": 75, "req_class": "DRUID", "stats": {"INT": 15, "WIS": 20, "M_DEF": 70, "RAW_DEF": 90, "FOC": 8, "MP": 400, "HP_REGEN": 5}},
            "Zırh": {"id": "D_A_75", "name": "Orman Bekçisi Cübbesi", "tooltip": "Temel Defans: 170, HP: 350. Hafif ama büyüye karşı güçlü.", "req_level": 75, "req_class": "DRUID", "stats": {"INT": 18, "VIT": 10, "M_DEF": 130, "RAW_DEF": 170, "FOC": 15, "HP": 350, "MP": 600}},
            "Pantolon": {"id": "D_P_75", "name": "Sarışık Kök Pantolon", "tooltip": "Temel Defans: 120, MP: 500. Ayakta kalma gücü verir.", "req_level": 75, "req_class": "DRUID", "stats": {"WIS": 20, "VIT": 10, "M_DEF": 85, "RAW_DEF": 120, "FOC": 5, "MP": 500, "HP": 250}},
            "Eldiven": {"id": "D_G_75", "name": "Filiz Eldiveni", "tooltip": "Temel Defans: 50. DoT büyülerini güçlendirir.", "req_level": 75, "req_class": "DRUID", "stats": {"INT": 20, "FOC": 15, "CSPD_BONUS": 5, "RAW_DEF": 50, "HEAL_BONUS": 15}},
            "Bileklik": {"id": "D_WR_75", "name": "Yaşam Çiçeği Bilekliği", "tooltip": "Temel Defans: 40, MP: 300. İyileştirmelere ekstra güç katar.", "req_level": 75, "req_class": "DRUID", "stats": {"WIS": 20, "FOC": 15, "HP_REGEN": 10, "RAW_DEF": 40, "HEAL_BONUS": 60}},
            "Kolye": {"id": "D_N_75", "name": "Doğa Özü Tılsımı", "tooltip": "Temel Defans: 30, HP: 300. Her iki saldırı türünü de destekler.", "req_level": 75, "req_class": "DRUID", "stats": {"INT": 15, "WIS": 18, "FOC": 10, "RAW_DEF": 30, "HP": 300, "M_DEF": 25}},
            "Pelerin": {"id": "D_C_75", "name": "Yaprak Pelerin", "tooltip": "Temel Defans: 75. Çeviklik ve direnç sağlar.", "req_level": 75, "req_class": "DRUID", "stats": {"DEX": 8, "FOC": 10, "M_DEF": 40, "RAW_DEF": 75, "P_DEF": 30, "EVASION_BONUS": 5}},
            "Offhand": {"id": "D_O_75", "name": "Yaban Odak", "tooltip": "Temel Defans: 70, MP: 550. Mana ve büyü hızını artırır.", "req_level": 75, "req_class": "DRUID", "stats": {"FOC": 35, "CSPD_BONUS": 5, "M_DEF": 30, "RAW_DEF": 70, "WIS": 10, "MP": 550}}
        },
    },


    # ------------------------------------------------------------------------------------------------------
    # 4. MONK (DEX/FOC/VIT Odaklı - Hafif Zırh/Çift El)
    # ------------------------------------------------------------------------------------------------------
    "MONK": {
        "1": {
            "Silah": {"id": "M_W_1", "name": "Deri El Sargısı", "tooltip": "Temel Saldırı: 15. Temel DEX.", "req_level": 1, "req_class": "MONK", "stats": {"DEX": 3, "PAP_BONUS": 5, "RAW_ATK": 15, "ASPD_BONUS": 1}},
            "Kask": {"id": "M_H_1", "name": "Pamuk Bandana", "tooltip": "Temel Defans: 4, HP: 10. Temel DEX/VIT.", "req_level": 1, "req_class": "MONK", "stats": {"DEX": 1, "P_DEF": 1, "RAW_DEF": 4, "HP": 10}},
            "Zırh": {"id": "M_A_1", "name": "Basit Kimono", "tooltip": "Temel Defans: 9, HP: 20. Esneme ve hız.", "req_level": 1, "req_class": "MONK", "stats": {"DEX": 1, "VIT": 1, "P_DEF": 2, "RAW_DEF": 9, "HP": 20, "EVASION_BONUS": 1}},
            "Pantolon": {"id": "M_P_1", "name": "Eğitim Şalvarı", "tooltip": "Temel Defans: 6. Temel DEX.", "req_level": 1, "req_class": "MONK", "stats": {"DEX": 1, "P_DEF": 1, "RAW_DEF": 6}},
            "Eldiven": {"id": "M_G_1", "name": "Kaba Eldiven", "tooltip": "Temel Defans: 3. Hız ve hassasiyet.", "req_level": 1, "req_class": "MONK", "stats": {"DEX": 1, "ASPD_BONUS": 1, "RAW_DEF": 3}},
            "Bileklik": {"id": "M_WR_1", "name": "İnce Bileklik", "tooltip": "Temel Defans: 2, MP: 5. Temel FOC.", "req_level": 1, "req_class": "MONK", "stats": {"FOC": 1, "RAW_DEF": 2, "MP": 5}},
            "Kolye": {"id": "M_N_1", "name": "Ahşap Kolye", "tooltip": "Temel Defans: 1, HP: 15. Temel VIT.", "req_level": 1, "req_class": "MONK", "stats": {"VIT": 1, "RAW_DEF": 1, "HP": 15}},
            "Pelerin": {"id": "M_C_1", "name": "Açık Renk Pelerin", "tooltip": "Temel Defans: 3. Temel kaçınma.", "req_level": 1, "req_class": "MONK", "stats": {"EVASION_BONUS": 1, "RAW_DEF": 3, "M_DEF": 1}}
        },
        "9": {
            "Silah": {"id": "M_W_9", "name": "Dokunmuş Eldiven", "tooltip": "Temel Saldırı: 30. Gelişmiş DEX.", "req_level": 9, "req_class": "MONK", "stats": {"DEX": 5, "PAP_BONUS": 15, "VIT": 1, "RAW_ATK": 30, "P_CRIT_BONUS": 1}},
            "Kask": {"id": "M_H_9", "name": "Sert Bandana", "tooltip": "Temel Defans: 12, HP: 30. DEX/VIT.", "req_level": 9, "req_class": "MONK", "stats": {"DEX": 3, "P_DEF": 5, "VIT": 1, "RAW_DEF": 12, "HP": 30, "EVASION_BONUS": 1}},
            "Zırh": {"id": "M_A_9", "name": "Hafif Cüppe", "tooltip": "Temel Defans: 25, HP: 60. Kaçınma odaklı.", "req_level": 9, "req_class": "MONK", "stats": {"DEX": 3, "VIT": 5, "P_DEF": 10, "RAW_DEF": 25, "HP": 60, "EVASION_BONUS": 2}},
            "Pantolon": {"id": "M_P_9", "name": "Esneme Şalvarı", "tooltip": "Temel Defans: 18, HP: 40. Hız ve kaçınma.", "req_level": 9, "req_class": "MONK", "stats": {"DEX": 4, "P_DEF": 6, "RAW_DEF": 18, "HP": 40, "EVASION_BONUS": 1}},
            "Eldiven": {"id": "M_G_9", "name": "Hızlı Sargı", "tooltip": "Temel Defans: 8. Saldırı hızı.", "req_level": 9, "req_class": "MONK", "stats": {"DEX": 3, "ASPD_BONUS": 2, "RAW_DEF": 8, "P_CRIT_BONUS": 1}},
            "Bileklik": {"id": "M_WR_9", "name": "Denge Bilekliği", "tooltip": "Temel Defans: 4, MP: 20. DEX ve FOC.", "req_level": 9, "req_class": "MONK", "stats": {"DEX": 2, "FOC": 1, "RAW_DEF": 4, "MP": 20}},
            "Kolye": {"id": "M_N_9", "name": "Chi Tılsımı", "tooltip": "Temel Defans: 2, MP: 30. Temel FOC.", "req_level": 9, "req_class": "MONK", "stats": {"FOC": 2, "VIT": 1, "RAW_DEF": 2, "MP": 30, "HP": 20}},
            "Pelerin": {"id": "M_C_9", "name": "Rüzgar Pelerini", "tooltip": "Temel Defans: 5. Kaçınma ve hız.", "req_level": 9, "req_class": "MONK", "stats": {"EVASION_BONUS": 2, "RAW_DEF": 5, "P_DEF": 3}}
        },
        "18": {
            "Silah": {"id": "M_W_18", "name": "Savaş Bilekliği", "tooltip": "Temel Saldırı: 50. Hafif hasar artışı.", "req_level": 18, "req_class": "MONK", "stats": {"DEX": 9, "PAP_BONUS": 30, "VIT": 2, "RAW_ATK": 50, "ASPD_BONUS": 3}},
            "Kask": {"id": "M_H_18", "name": "Meditasyon Başlığı", "tooltip": "Temel Defans: 22, MP: 40. FOC odaklı.", "req_level": 18, "req_class": "MONK", "stats": {"FOC": 6, "P_DEF": 10, "DEX": 2, "RAW_DEF": 22, "MP": 40, "M_DEF": 5}},
            "Zırh": {"id": "M_A_18", "name": "Yumuşak Zırh", "tooltip": "Temel Defans: 45, HP: 80. Fiziksel/Büyü dengesi.", "req_level": 18, "req_class": "MONK", "stats": {"DEX": 5, "VIT": 10, "P_DEF": 20, "M_DEF": 5, "RAW_DEF": 45, "HP": 80, "EVASION_BONUS": 3}},
            "Pantolon": {"id": "M_P_18", "name": "Usta Şalvarı", "tooltip": "Temel Defans: 30, HP: 50. Hız ve kaçınma.", "req_level": 18, "req_class": "MONK", "stats": {"DEX": 8, "P_DEF": 15, "RAW_DEF": 30, "HP": 50, "EVASION_BONUS": 2}},
            "Eldiven": {"id": "M_G_18", "name": "Hızlı Yumruk Eldiveni", "tooltip": "Temel Defans: 15. Saldırı hızı artışı.", "req_level": 18, "req_class": "MONK", "stats": {"DEX": 5, "ASPD_BONUS": 3, "RAW_DEF": 15, "P_CRIT_BONUS": 2}},
            "Bileklik": {"id": "M_WR_18", "name": "Yin Yang Bilekliği", "tooltip": "Temel Defans: 8, MP: 50. DEX ve FOC.", "req_level": 18, "req_class": "MONK", "stats": {"DEX": 4, "FOC": 3, "RAW_DEF": 8, "MP": 50, "P_DEF": 5}},
            "Kolye": {"id": "M_N_18", "name": "Dövüş Kolyesi", "tooltip": "Temel Defans: 4, HP: 50. DEX ve VIT.", "req_level": 18, "req_class": "MONK", "stats": {"DEX": 3, "VIT": 3, "RAW_DEF": 4, "HP": 50}},
            "Pelerin": {"id": "M_C_18", "name": "Hafif Pelerin", "tooltip": "Temel Defans: 12. Kaçınma ve hız.", "req_level": 18, "req_class": "MONK", "stats": {"EVASION_BONUS": 3, "RAW_DEF": 12, "M_DEF": 8}}
        },
        "24": {
            "Silah": {"id": "M_W_24", "name": "Demir Bileklik", "tooltip": "Temel Saldırı: 70. Hafif hasar artışı.", "req_level": 24, "req_class": "MONK", "stats": {"DEX": 12, "PAP_BONUS": 40, "VIT": 3, "RAW_ATK": 70, "ASPD_BONUS": 4, "P_CRIT_BONUS": 2}},
            "Kask": {"id": "M_H_24", "name": "Denge Başlığı", "tooltip": "Temel Defans: 30, MP: 70. FOC odaklı.", "req_level": 24, "req_class": "MONK", "stats": {"FOC": 8, "P_DEF": 15, "DEX": 3, "RAW_DEF": 30, "MP": 70, "M_DEF": 8}},
            "Zırh": {"id": "M_A_24", "name": "Usta Zırhı", "tooltip": "Temel Defans: 60, HP: 120. Fiziksel/Büyü dengesi.", "req_level": 24, "req_class": "MONK", "stats": {"DEX": 7, "VIT": 14, "P_DEF": 30, "M_DEF": 10, "RAW_DEF": 60, "HP": 120, "EVASION_BONUS": 4}},
            "Pantolon": {"id": "M_P_24", "name": "Çeviklik Dizliği", "tooltip": "Temel Defans: 40, HP: 70. Hız ve kaçınma.", "req_level": 24, "req_class": "MONK", "stats": {"DEX": 10, "P_DEF": 20, "RAW_DEF": 40, "HP": 70, "EVASION_BONUS": 3}},
            "Eldiven": {"id": "M_G_24", "name": "Enerji Yumruk Eldiveni", "tooltip": "Temel Defans: 20. Saldırı hızı artışı.", "req_level": 24, "req_class": "MONK", "stats": {"DEX": 7, "ASPD_BONUS": 4, "RAW_DEF": 20, "P_CRIT_BONUS": 3}},
            "Bileklik": {"id": "M_WR_24", "name": "Akış Bilekliği", "tooltip": "Temel Defans: 12, MP: 80. DEX ve FOC.", "req_level": 24, "req_class": "MONK", "stats": {"DEX": 6, "FOC": 4, "RAW_DEF": 12, "MP": 80, "P_DEF": 8}},
            "Kolye": {"id": "M_N_24", "name": "Chi Enerjisi Kolyesi", "tooltip": "Temel Defans: 6, HP: 80. DEX ve VIT.", "req_level": 24, "req_class": "MONK", "stats": {"DEX": 4, "VIT": 4, "RAW_DEF": 6, "HP": 80}},
            "Pelerin": {"id": "M_C_24", "name": "Hız Pelerini", "tooltip": "Temel Defans: 15. Kaçınma ve hız.", "req_level": 24, "req_class": "MONK", "stats": {"EVASION_BONUS": 4, "RAW_DEF": 15, "M_DEF": 10}}
        },
        "34": {
            "Silah": {"id": "M_W_34", "name": "Gelişmiş Bileklik", "tooltip": "Temel Saldırı: 90. Hafif hasar artışı.", "req_level": 34, "req_class": "MONK", "stats": {"DEX": 16, "PAP_BONUS": 60, "VIT": 4, "RAW_ATK": 90, "ASPD_BONUS": 5, "LIFESTEAL": 1}},
            "Kask": {"id": "M_H_34", "name": "Usta Başlığı", "tooltip": "Temel Defans: 40, MP: 100. FOC odaklı.", "req_level": 34, "req_class": "MONK", "stats": {"FOC": 12, "P_DEF": 20, "DEX": 4, "RAW_DEF": 40, "MP": 100, "HP": 90}},
            "Zırh": {"id": "M_A_34", "name": "Dövüş Zırhı", "tooltip": "Temel Defans: 85, HP: 180. Fiziksel/Büyü dengesi.", "req_level": 34, "req_class": "MONK", "stats": {"DEX": 10, "VIT": 18, "P_DEF": 40, "M_DEF": 15, "RAW_DEF": 85, "HP": 180, "EVASION_BONUS": 5}},
            "Pantolon": {"id": "M_P_34", "name": "Esneklik Pantolonu", "tooltip": "Temel Defans: 60, HP: 100. Hız ve kaçınma.", "req_level": 34, "req_class": "MONK", "stats": {"DEX": 14, "P_DEF": 30, "RAW_DEF": 60, "HP": 100, "EVASION_BONUS": 4}},
            "Eldiven": {"id": "M_G_34", "name": "Hız ve Darbe Eldiveni", "tooltip": "Temel Defans: 30. Saldırı hızı artışı.", "req_level": 34, "req_class": "MONK", "stats": {"DEX": 9, "ASPD_BONUS": 5, "RAW_DEF": 30, "P_CRIT_BONUS": 3}},
            "Bileklik": {"id": "M_WR_34", "name": "Uyum Bilekliği", "tooltip": "Temel Defans: 18, MP: 120. DEX ve FOC.", "req_level": 34, "req_class": "MONK", "stats": {"DEX": 8, "FOC": 6, "RAW_DEF": 18, "MP": 120, "P_DEF": 12}},
            "Kolye": {"id": "M_N_34", "name": "Mistik Enerji Kolyesi", "tooltip": "Temel Defans: 10, HP: 120. DEX ve VIT.", "req_level": 34, "req_class": "MONK", "stats": {"DEX": 6, "VIT": 6, "RAW_DEF": 10, "HP": 120, "MP": 100}},
            "Pelerin": {"id": "M_C_34", "name": "Gölge Hızı Pelerini", "tooltip": "Temel Defans: 22. Kaçınma ve hız.", "req_level": 34, "req_class": "MONK", "stats": {"EVASION_BONUS": 5, "RAW_DEF": 22, "M_DEF": 15}}
        },
        "42": {
            "Silah": {"id": "M_W_42", "name": "Chi Akımı Eldiveni", "tooltip": "Temel Saldırı: 110. Hafif hasar artışı.", "req_level": 42, "req_class": "MONK", "stats": {"DEX": 22, "PAP_BONUS": 75, "VIT": 5, "RAW_ATK": 110, "ASPD_BONUS": 6, "P_CRIT_BONUS": 4}},
            "Kask": {"id": "M_H_42", "name": "Usta Gözü Başlığı", "tooltip": "Temel Defans: 55, MP: 150. FOC odaklı.", "req_level": 42, "req_class": "MONK", "stats": {"FOC": 15, "P_DEF": 25, "DEX": 5, "RAW_DEF": 55, "MP": 150, "M_DEF": 18}},
            "Zırh": {"id": "M_A_42", "name": "Ruhani Zırh", "tooltip": "Temel Defans: 110, HP: 250. Fiziksel/Büyü dengesi.", "req_level": 42, "req_class": "MONK", "stats": {"DEX": 15, "VIT": 22, "P_DEF": 55, "M_DEF": 20, "RAW_DEF": 110, "HP": 250, "EVASION_BONUS": 6}},
            "Pantolon": {"id": "M_P_42", "name": "Enerji Akımı Pantolonu", "tooltip": "Temel Defans: 80, HP: 150. Hız ve kaçınma.", "req_level": 42, "req_class": "MONK", "stats": {"DEX": 18, "P_DEF": 40, "RAW_DEF": 80, "HP": 150, "EVASION_BONUS": 5}},
            "Eldiven": {"id": "M_G_42", "name": "Yüce Yumruk Eldiveni", "tooltip": "Temel Defans: 40. Saldırı hızı artışı.", "req_level": 42, "req_class": "MONK", "stats": {"DEX": 12, "ASPD_BONUS": 6, "RAW_DEF": 40, "P_CRIT_BONUS": 4}},
            "Bileklik": {"id": "M_WR_42", "name": "Dengeleyici Bileklik", "tooltip": "Temel Defans: 25, MP: 150. DEX ve FOC.", "req_level": 42, "req_class": "MONK", "stats": {"DEX": 10, "FOC": 8, "RAW_DEF": 25, "MP": 150, "HP": 80}},
            "Kolye": {"id": "M_N_42", "name": "Zen Kolyesi", "tooltip": "Temel Defans: 15, HP: 200. DEX ve VIT.", "req_level": 42, "req_class": "MONK", "stats": {"DEX": 8, "VIT": 8, "HP": 200, "RAW_DEF": 15, "LIFESTEAL": 1}},
            "Pelerin": {"id": "M_C_42", "name": "Chi Pelerini", "tooltip": "Temel Defans: 30. Kaçınma ve hız.", "req_level": 42, "req_class": "MONK", "stats": {"EVASION_BONUS": 6, "RAW_DEF": 30, "M_DEF": 20}}
        },
        "48": {
            "Silah": {"id": "M_W_48", "name": "Ruh Yumruğu", "tooltip": "Temel Saldırı: 130. Hafif hasar artışı.", "req_level": 48, "req_class": "MONK", "stats": {"DEX": 25, "PAP_BONUS": 85, "VIT": 6, "RAW_ATK": 130, "ASPD_BONUS": 7, "P_CRIT_BONUS": 5}},
            "Kask": {"id": "M_H_48", "name": "Efsane Başlığı", "tooltip": "Temel Defans: 65, MP: 200. FOC odaklı.", "req_level": 48, "req_class": "MONK", "stats": {"FOC": 18, "P_DEF": 30, "DEX": 7, "RAW_DEF": 65, "MP": 200, "M_DEF": 25}},
            "Zırh": {"id": "M_A_48", "name": "Mistik Zırh", "tooltip": "Temel Defans: 130, HP: 300. Fiziksel/Büyü dengesi.", "req_level": 48, "req_class": "MONK", "stats": {"DEX": 18, "VIT": 25, "P_DEF": 65, "M_DEF": 25, "RAW_DEF": 130, "HP": 300, "EVASION_BONUS": 7}},
            "Pantolon": {"id": "M_P_48", "name": "Uyum Pantolonu", "tooltip": "Temel Defans: 100, HP: 180. Hız ve kaçınma.", "req_level": 48, "req_class": "MONK", "stats": {"DEX": 22, "P_DEF": 45, "RAW_DEF": 100, "HP": 180, "EVASION_BONUS": 6}},
            "Eldiven": {"id": "M_G_48", "name": "Ruhani Darbe Eldiveni", "tooltip": "Temel Defans: 50. Saldırı hızı artışı.", "req_level": 48, "req_class": "MONK", "stats": {"DEX": 15, "ASPD_BONUS": 7, "RAW_DEF": 50, "P_CRIT_BONUS": 5}},
            "Bileklik": {"id": "M_WR_48", "name": "Sonsuz Bileklik", "tooltip": "Temel Defans: 35, MP: 200. DEX ve FOC.", "req_level": 48, "req_class": "MONK", "stats": {"DEX": 12, "FOC": 10, "RAW_DEF": 35, "MP": 200, "HP": 100}},
            "Kolye": {"id": "M_N_48", "name": "Usta Kolyesi", "tooltip": "Temel Defans: 20, HP: 250. DEX ve VIT.", "req_level": 48, "req_class": "MONK", "stats": {"DEX": 10, "VIT": 10, "HP": 250, "RAW_DEF": 20, "P_DEF": 15}},
            "Pelerin": {"id": "M_C_48", "name": "Göksel Hız Pelerini", "tooltip": "Temel Defans: 40. Kaçınma ve hız.", "req_level": 48, "req_class": "MONK", "stats": {"EVASION_BONUS": 7, "RAW_DEF": 40, "M_DEF": 25}}
        },
        "54": {
            "Silah": {"id": "M_W_54", "name": "Usta Yumruğu", "tooltip": "Temel Saldırı: 150. Hafif hasar artışı.", "req_level": 54, "req_class": "MONK", "stats": {"DEX": 29, "PAP_BONUS": 95, "VIT": 7, "RAW_ATK": 150, "ASPD_BONUS": 8, "LIFESTEAL": 2}},
            "Kask": {"id": "M_H_54", "name": "Yüce Usta Başlığı", "tooltip": "Temel Defans: 80, MP: 250. FOC odaklı.", "req_level": 54, "req_class": "MONK", "stats": {"FOC": 22, "P_DEF": 35, "DEX": 9, "RAW_DEF": 80, "MP": 250, "HP": 200}},
            "Zırh": {"id": "M_A_54", "name": "Mistik Uyum Zırhı", "tooltip": "Temel Defans: 150, HP: 350. Fiziksel/Büyü dengesi.", "req_level": 54, "req_class": "MONK", "stats": {"DEX": 22, "VIT": 28, "P_DEF": 75, "M_DEF": 30, "RAW_DEF": 150, "HP": 350, "EVASION_BONUS": 8}},
            "Pantolon": {"id": "M_P_54", "name": "Ruhani Pantolon", "tooltip": "Temel Defans: 120, HP: 220. Hız ve kaçınma.", "req_level": 54, "req_class": "MONK", "stats": {"DEX": 26, "P_DEF": 50, "RAW_DEF": 120, "HP": 220, "EVASION_BONUS": 7}},
            "Eldiven": {"id": "M_G_54", "name": "Dengeleyici Eldiven", "tooltip": "Temel Defans: 60. Saldırı hızı artışı.", "req_level": 54, "req_class": "MONK", "stats": {"DEX": 18, "ASPD_BONUS": 8, "RAW_DEF": 60, "P_CRIT_BONUS": 6}},
            "Bileklik": {"id": "M_WR_54", "name": "Enerji Akışı Bilekliği", "tooltip": "Temel Defans: 45, MP: 250. DEX ve FOC.", "req_level": 54, "req_class": "MONK", "stats": {"DEX": 15, "FOC": 12, "RAW_DEF": 45, "MP": 250, "P_DEF": 20}},
            "Kolye": {"id": "M_N_54", "name": "Uyumun Kalbi", "tooltip": "Temel Defans: 25, HP: 300. DEX ve VIT.", "req_level": 54, "req_class": "MONK", "stats": {"DEX": 12, "VIT": 12, "HP": 300, "RAW_DEF": 25, "M_DEF": 30}},
            "Pelerin": {"id": "M_C_54", "name": "Yüce Chi Pelerini", "tooltip": "Temel Defans: 50. Kaçınma ve hız.", "req_level": 54, "req_class": "MONK", "stats": {"EVASION_BONUS": 8, "RAW_DEF": 50, "M_DEF": 30}}
        },
        "66": {
            "Silah": {"id": "M_W_66", "name": "Zen Yumruğu", "tooltip": "Temel Saldırı: 170. Hafif hasar artışı.", "req_level": 66, "req_class": "MONK", "stats": {"DEX": 35, "PAP_BONUS": 110, "VIT": 8, "RAW_ATK": 170, "ASPD_BONUS": 9, "P_CRIT_BONUS": 7}},
            "Kask": {"id": "M_H_66", "name": "İlahi Denge Başlığı", "tooltip": "Temel Defans: 100, MP: 300. FOC odaklı.", "req_level": 66, "req_class": "MONK", "stats": {"FOC": 25, "P_DEF": 40, "DEX": 12, "RAW_DEF": 100, "MP": 300, "HP": 250}},
            "Zırh": {"id": "M_A_66", "name": "İlahi Uyum Zırhı", "tooltip": "Temel Defans: 180, HP: 400. Fiziksel/Büyü dengesi.", "req_level": 66, "req_class": "MONK", "stats": {"DEX": 25, "VIT": 32, "P_DEF": 85, "M_DEF": 35, "RAW_DEF": 180, "HP": 400, "EVASION_BONUS": 9}},
            "Pantolon": {"id": "M_P_66", "name": "Yüce Esneklik Pantolonu", "tooltip": "Temel Defans: 140, HP: 280. Hız ve kaçınma.", "req_level": 66, "req_class": "MONK", "stats": {"DEX": 30, "P_DEF": 60, "RAW_DEF": 140, "HP": 280, "EVASION_BONUS": 8}},
            "Eldiven": {"id": "M_G_66", "name": "Sonsuz Darbe Eldiveni", "tooltip": "Temel Defans: 70. Saldırı hızı artışı.", "req_level": 66, "req_class": "MONK", "stats": {"DEX": 22, "ASPD_BONUS": 9, "RAW_DEF": 70, "P_CRIT_BONUS": 6}},
            "Bileklik": {"id": "M_WR_66", "name": "Usta Güç Bilekliği", "tooltip": "Temel Defans: 55, MP: 300. DEX ve FOC.", "req_level": 66, "req_class": "MONK", "stats": {"DEX": 18, "FOC": 15, "RAW_DEF": 55, "MP": 300, "HP": 150}},
            "Kolye": {"id": "M_N_66", "name": "Sonsuz Uyum Kolyesi", "tooltip": "Temel Defans: 35, HP: 350. DEX ve VIT.", "req_level": 66, "req_class": "MONK", "stats": {"DEX": 15, "VIT": 15, "HP": 350, "RAW_DEF": 35, "LIFESTEAL": 1}},
            "Pelerin": {"id": "M_C_66", "name": "Zen Pelerini", "tooltip": "Temel Defans: 60. Kaçınma ve hız.", "req_level": 66, "req_class": "MONK", "stats": {"EVASION_BONUS": 9, "RAW_DEF": 60, "M_DEF": 35}}
        },
        "75": {
            "Silah": {"id": "M_W_75", "name": "Chi Düğümü Eldiveni", "tooltip": "Temel Saldırı: 200. Hızlı vuruşlar ve iç denge.", "req_level": 75, "req_class": "MONK", "stats": {"DEX": 40, "FOC": 15, "PAP_BONUS": 125, "RAW_ATK": 200, "ASPD_BONUS": 10, "P_CRIT_BONUS": 8}},
            "Kask": {"id": "M_H_75", "name": "Usta Şapkası", "tooltip": "Temel Defans: 120, HP: 300. DEX ve kaçınma.", "req_level": 75, "req_class": "MONK", "stats": {"DEX": 18, "FOC": 12, "P_DEF": 50, "RAW_DEF": 120, "HP": 300, "M_DEF": 30, "EVASION_BONUS": 2}},
            "Zırh": {"id": "M_A_75", "name": "Usta Elbisesi", "tooltip": "Temel Defans: 220, HP: 500. Hem fiziksel hem büyü savunması.", "req_level": 75, "req_class": "MONK", "stats": {"DEX": 25, "VIT": 25, "P_DEF": 100, "M_DEF": 100, "RAW_DEF": 220, "EVASION_BONUS": 10, "HP": 500}},
            "Pantolon": {"id": "M_P_75", "name": "Denge Taytı", "tooltip": "Temel Defans: 160, HP: 350. Hareket ve VIT.", "req_level": 75, "req_class": "MONK", "stats": {"DEX": 25, "VIT": 15, "P_DEF": 70, "RAW_DEF": 160, "EVASION_BONUS": 8, "HP": 350}},
            "Eldiven": {"id": "M_G_75", "name": "Yıldırım Yumruk Eldiveni", "tooltip": "Temel Defans: 85. Saldırı hızı ve kritik.", "req_level": 75, "req_class": "MONK", "stats": {"DEX": 30, "P_CRIT_BONUS": 5, "RAW_DEF": 85, "ASPD_BONUS": 10}},
            "Bileklik": {"id": "M_WR_75", "name": "Enerji Dengeleyici", "tooltip": "Temel Defans: 65, MP: 400. FOC ve DEX.", "req_level": 75, "req_class": "MONK", "stats": {"DEX": 20, "FOC": 18, "RAW_DEF": 65, "MP": 400, "P_DEF": 25}},
            "Kolye": {"id": "M_N_75", "name": "Sonsuz Enerji Tılsımı", "tooltip": "Temel Defans: 45, HP: 350. HP ve FOC.", "req_level": 75, "req_class": "MONK", "stats": {"VIT": 15, "FOC": 20, "HP": 350, "RAW_DEF": 45, "M_DEF": 35}},
            "Pelerin": {"id": "M_C_75", "name": "Chi Pelerini", "tooltip": "Temel Defans: 75. Büyü direnci ve kaçınma.", "req_level": 75, "req_class": "MONK", "stats": {"WIS": 15, "EVASION_BONUS": 10, "M_DEF": 40, "RAW_DEF": 75, "P_DEF": 30}}
        },
    },

    # ------------------------------------------------------------------------------------------------------
    # 5. CRUSADER (VIT/STR/WIS Odaklı - Ağır Zırh/Kalkan + Tek El Silah)
    # ------------------------------------------------------------------------------------------------------
    "CRUSADER": {
        "1": {
            "Silah": {"id": "C_W_1", "name": "Kaba Kılıç", "tooltip": "Temel Saldırı: 12. Basit koruma.", "req_level": 1, "req_class": "CRUSADER", "stats": {"STR": 1, "VIT": 1, "PAP_BONUS": 4, "RAW_ATK": 12, "P_DEF": 5}},
            "Kask": {"id": "C_H_1", "name": "Temel Miğfer", "tooltip": "Temel Defans: 6, HP: 15. Temel VIT.", "req_level": 1, "req_class": "CRUSADER", "stats": {"VIT": 2, "P_DEF": 2, "RAW_DEF": 6, "HP": 15}},
            "Zırh": {"id": "C_A_1", "name": "Ağır Deri Zırh", "tooltip": "Temel Defans: 12, HP: 25. Dayanıklılık odaklı.", "req_level": 1, "req_class": "CRUSADER", "stats": {"VIT": 3, "P_DEF": 4, "RAW_DEF": 12, "HP": 25}},
            "Pantolon": {"id": "C_P_1", "name": "Koruma Pantolonu", "tooltip": "Temel Defans: 8, HP: 10. Temel savunma.", "req_level": 1, "req_class": "CRUSADER", "stats": {"VIT": 1, "P_DEF": 3, "RAW_DEF": 8, "HP": 10}},
            "Eldiven": {"id": "C_G_1", "name": "Savaş Eldiveni", "tooltip": "Temel Defans: 5. Temel STR.", "req_level": 1, "req_class": "CRUSADER", "stats": {"STR": 1, "P_DEF": 1, "RAW_DEF": 5}},
            "Bileklik": {"id": "C_WR_1", "name": "Kaba Bileklik", "tooltip": "Temel Defans: 3. Temel VIT.", "req_level": 1, "req_class": "CRUSADER", "stats": {"VIT": 1, "RAW_DEF": 3, "P_DEF": 1}},
            "Kolye": {"id": "C_N_1", "name": "Gümüş Haç", "tooltip": "Temel Defans: 1. Temel WIS.", "req_level": 1, "req_class": "CRUSADER", "stats": {"WIS": 1, "RAW_DEF": 1}},
            "Pelerin": {"id": "C_C_1", "name": "Kırmızı Pelerin", "tooltip": "Temel Defans: 3. Temel savunma.", "req_level": 1, "req_class": "CRUSADER", "stats": {"P_DEF": 1, "RAW_DEF": 3, "M_DEF": 1}},
            "Offhand": {"id": "C_O_1", "name": "Tahta Kalkan", "tooltip": "Temel Defans: 6, HP: 5. Temel blok.", "req_level": 1, "req_class": "CRUSADER", "stats": {"VIT": 2, "P_DEF": 3, "RAW_DEF": 6, "BLOCK_CHANCE": 1}}
        },
        "9": {
            "Silah": {"id": "C_W_9", "name": "Zırh Kırıcı Kılıç", "tooltip": "Temel Saldırı: 28. Gelişmiş temel hasar.", "req_level": 9, "req_class": "CRUSADER", "stats": {"STR": 3, "VIT": 3, "PAP_BONUS": 15, "RAW_ATK": 28, "P_DEF": 10, "HP": 30}},
            "Kask": {"id": "C_H_9", "name": "Zincir Miğfer", "tooltip": "Temel Defans: 18, HP: 40. Dayanıklılık odaklı.", "req_level": 9, "req_class": "CRUSADER", "stats": {"VIT": 5, "P_DEF": 8, "STR": 1, "RAW_DEF": 18, "HP": 40, "M_DEF": 3}},
            "Zırh": {"id": "C_A_9", "name": "Zincir Plaka Zırh", "tooltip": "Temel Defans: 35, HP: 80. Yüksek dayanıklılık.", "req_level": 9, "req_class": "CRUSADER", "stats": {"VIT": 8, "P_DEF": 18, "STR": 3, "RAW_DEF": 35, "HP": 80}},
            "Pantolon": {"id": "C_P_9", "name": "Sert Dizlik", "tooltip": "Temel Defans: 25, HP: 50. Dayanıklılık.", "req_level": 9, "req_class": "CRUSADER", "stats": {"VIT": 5, "P_DEF": 10, "RAW_DEF": 25, "HP": 50}},
            "Eldiven": {"id": "C_G_9", "name": "Zırhlı Eldiven", "tooltip": "Temel Defans: 12. Temel STR/VIT.", "req_level": 9, "req_class": "CRUSADER", "stats": {"STR": 3, "P_DEF": 5, "RAW_DEF": 12, "P_CRIT_BONUS": 1}},
            "Bileklik": {"id": "C_WR_9", "name": "Zincir Bileklik", "tooltip": "Temel Defans: 6, HP: 20. Temel VIT.", "req_level": 9, "req_class": "CRUSADER", "stats": {"VIT": 3, "WIS": 1, "RAW_DEF": 6, "HP": 20}},
            "Kolye": {"id": "C_N_9", "name": "Inanç Tılsımı", "tooltip": "Temel Defans: 3, HP: 30. Temel WIS/VIT.", "req_level": 9, "req_class": "CRUSADER", "stats": {"WIS": 2, "VIT": 2, "RAW_DEF": 3, "HP": 30}},
            "Pelerin": {"id": "C_C_9", "name": "Koruyucu Pelerin", "tooltip": "Temel Defans: 8. Temel M_DEF.", "req_level": 9, "req_class": "CRUSADER", "stats": {"M_DEF": 3, "P_DEF": 3, "RAW_DEF": 8}},
            "Offhand": {"id": "C_O_9", "name": "Tahta Duvar Kalkanı", "tooltip": "Temel Defans: 15, HP: 10. Blok şansı.", "req_level": 9, "req_class": "CRUSADER", "stats": {"VIT": 5, "P_DEF": 10, "RAW_DEF": 15, "BLOCK_CHANCE": 2, "M_DEF": 2}}
        },
        "18": {
            "Silah": {"id": "C_W_18", "name": "Gümüş Haç Kılıcı", "tooltip": "Temel Saldırı: 48. Hasar ve şifa gücü.", "req_level": 18, "req_class": "CRUSADER", "stats": {"STR": 5, "VIT": 5, "PAP_BONUS": 30, "RAW_ATK": 48, "HEAL_BONUS": 5, "P_DEF": 20}},
            "Kask": {"id": "C_H_18", "name": "Kutsal Işık Miğferi", "tooltip": "Temel Defans: 30, HP: 70. Dayanıklılık ve WIS.", "req_level": 18, "req_class": "CRUSADER", "stats": {"VIT": 10, "P_DEF": 15, "WIS": 2, "RAW_DEF": 30, "HP": 70, "HP_REGEN": 1}},
            "Zırh": {"id": "C_A_18", "name": "Perçinli Plaka Zırh", "tooltip": "Temel Defans: 65, HP: 140. Yüksek fiziksel savunma.", "req_level": 18, "req_class": "CRUSADER", "stats": {"VIT": 15, "P_DEF": 35, "STR": 5, "RAW_DEF": 65, "HP": 140, "M_DEF": 5}},
            "Pantolon": {"id": "C_P_18", "name": "Şövalye Dizliği", "tooltip": "Temel Defans: 45, HP: 90. Dayanıklılık ve STR.", "req_level": 18, "req_class": "CRUSADER", "stats": {"VIT": 12, "P_DEF": 25, "RAW_DEF": 45, "HP": 90}},
            "Eldiven": {"id": "C_G_18", "name": "Koruma Eldiveni", "tooltip": "Temel Defans: 25. STR/VIT.", "req_level": 18, "req_class": "CRUSADER", "stats": {"STR": 5, "P_DEF": 10, "RAW_DEF": 25, "ASPD_BONUS": 1}},
            "Bileklik": {"id": "C_WR_18", "name": "Şövalye Bilekliği", "tooltip": "Temel Defans: 12, HP: 40. Temel VIT/WIS.", "req_level": 18, "req_class": "CRUSADER", "stats": {"VIT": 5, "WIS": 3, "RAW_DEF": 12, "HP": 40}},
            "Kolye": {"id": "C_N_18", "name": "Kutsal Kalkan", "tooltip": "Temel Defans: 6, HP: 60. VIT ve WIS.", "req_level": 18, "req_class": "CRUSADER", "stats": {"WIS": 4, "VIT": 4, "RAW_DEF": 6, "HP": 60, "HEAL_BONUS": 3}},
            "Pelerin": {"id": "C_C_18", "name": "Yemin Pelerini", "tooltip": "Temel Defans: 15. M_DEF ve P_DEF.", "req_level": 18, "req_class": "CRUSADER", "stats": {"M_DEF": 6, "P_DEF": 5, "RAW_DEF": 15}},
            "Offhand": {"id": "C_O_18", "name": "Metal Kalkan", "tooltip": "Temel Defans: 30, HP: 20. Blok şansı.", "req_level": 18, "req_class": "CRUSADER", "stats": {"VIT": 8, "P_DEF": 15, "RAW_DEF": 30, "BLOCK_CHANCE": 3, "M_DEF": 4}}
        },
        "24": {
            "Silah": {"id": "C_W_24", "name": "Adalet Kılıcı", "tooltip": "Temel Saldırı: 65. Hasar ve şifa gücü.", "req_level": 24, "req_class": "CRUSADER", "stats": {"STR": 7, "VIT": 7, "PAP_BONUS": 40, "RAW_ATK": 65, "HEAL_BONUS": 10, "P_CRIT_BONUS": 1}},
            "Kask": {"id": "C_H_24", "name": "Çelik Haç Miğferi", "tooltip": "Temel Defans: 40, HP: 100. Dayanıklılık ve WIS.", "req_level": 24, "req_class": "CRUSADER", "stats": {"VIT": 14, "P_DEF": 20, "WIS": 3, "RAW_DEF": 40, "HP": 100, "M_DEF": 8}},
            "Zırh": {"id": "C_A_24", "name": "Parlak Plaka Zırh", "tooltip": "Temel Defans: 85, HP: 200. Yüksek fiziksel savunma.", "req_level": 24, "req_class": "CRUSADER", "stats": {"VIT": 20, "P_DEF": 45, "STR": 7, "RAW_DEF": 85, "HP": 200, "HP_REGEN": 2}},
            "Pantolon": {"id": "C_P_24", "name": "Muhafız Dizliği", "tooltip": "Temel Defans: 60, HP: 120. Dayanıklılık ve STR.", "req_level": 24, "req_class": "CRUSADER", "stats": {"VIT": 16, "P_DEF": 35, "RAW_DEF": 60, "HP": 120}},
            "Eldiven": {"id": "C_G_24", "name": "Denge Eldiveni", "tooltip": "Temel Defans: 30. STR/VIT.", "req_level": 24, "req_class": "CRUSADER", "stats": {"STR": 7, "P_DEF": 12, "RAW_DEF": 30, "ASPD_BONUS": 1}},
            "Bileklik": {"id": "C_WR_24", "name": "Kutsal Bileklik", "tooltip": "Temel Defans: 15, HP: 60. Temel VIT/WIS.", "req_level": 24, "req_class": "CRUSADER", "stats": {"VIT": 7, "WIS": 4, "RAW_DEF": 15, "HP": 60}},
            "Kolye": {"id": "C_N_24", "name": "İlahi Işık Kolyesi", "tooltip": "Temel Defans: 10, HP: 80. VIT ve WIS.", "req_level": 24, "req_class": "CRUSADER", "stats": {"WIS": 5, "VIT": 5, "RAW_DEF": 10, "HP": 80, "HEAL_BONUS": 5}},
            "Pelerin": {"id": "C_C_24", "name": "Onur Pelerini", "tooltip": "Temel Defans: 20. M_DEF ve P_DEF.", "req_level": 24, "req_class": "CRUSADER", "stats": {"M_DEF": 8, "P_DEF": 8, "RAW_DEF": 20}},
            "Offhand": {"id": "C_O_24", "name": "Büyük Kalkan", "tooltip": "Temel Defans: 45, HP: 40. Blok şansı.", "req_level": 24, "req_class": "CRUSADER", "stats": {"VIT": 12, "P_DEF": 20, "RAW_DEF": 45, "BLOCK_CHANCE": 4, "P_DEF_BONUS": 2}}
        },
        "34": {
            "Silah": {"id": "C_W_34", "name": "Kutsal Savaş Kılıcı", "tooltip": "Temel Saldırı: 85. Hasar ve şifa gücü.", "req_level": 34, "req_class": "CRUSADER", "stats": {"STR": 10, "VIT": 10, "PAP_BONUS": 60, "RAW_ATK": 85, "HEAL_BONUS": 15, "LIFESTEAL": 1}},
            "Kask": {"id": "C_H_34", "name": "Aydınlanma Miğferi", "tooltip": "Temel Defans: 55, HP: 150. Dayanıklılık ve WIS.", "req_level": 34, "req_class": "CRUSADER", "stats": {"VIT": 20, "P_DEF": 30, "WIS": 4, "RAW_DEF": 55, "HP": 150, "M_DEF": 12}},
            "Zırh": {"id": "C_A_34", "name": "Altın Plaka Zırh", "tooltip": "Temel Defans: 120, HP: 300. Yüksek fiziksel savunma.", "req_level": 34, "req_class": "CRUSADER", "stats": {"VIT": 25, "P_DEF": 60, "STR": 10, "RAW_DEF": 120, "HP": 300, "HP_REGEN": 3}},
            "Pantolon": {"id": "C_P_34", "name": "İnanç Dizliği", "tooltip": "Temel Defans: 80, HP: 180. Dayanıklılık ve STR.", "req_level": 34, "req_class": "CRUSADER", "stats": {"VIT": 22, "P_DEF": 45, "RAW_DEF": 80, "HP": 180}},
            "Eldiven": {"id": "C_G_34", "name": "Kutsal Eldiven", "tooltip": "Temel Defans: 40. STR/VIT.", "req_level": 34, "req_class": "CRUSADER", "stats": {"STR": 10, "P_DEF": 15, "RAW_DEF": 40, "P_CRIT_BONUS": 1}},
            "Bileklik": {"id": "C_WR_34", "name": "İlahi Bileklik", "tooltip": "Temel Defans: 25, HP: 90. Temel VIT/WIS.", "req_level": 34, "req_class": "CRUSADER", "stats": {"VIT": 10, "WIS": 5, "RAW_DEF": 25, "HP": 90}},
            "Kolye": {"id": "C_N_34", "name": "Yüce Haç Kolyesi", "tooltip": "Temel Defans: 15, HP: 120. VIT ve WIS.", "req_level": 34, "req_class": "CRUSADER", "stats": {"WIS": 7, "VIT": 7, "RAW_DEF": 15, "HP": 120, "HEAL_BONUS": 8}},
            "Pelerin": {"id": "C_C_34", "name": "İlahi Pelerin", "tooltip": "Temel Defans: 30. M_DEF ve P_DEF.", "req_level": 34, "req_class": "CRUSADER", "stats": {"M_DEF": 12, "P_DEF": 12, "RAW_DEF": 30}},
            "Offhand": {"id": "C_O_34", "name": "Kutsal Duvar Kalkanı", "tooltip": "Temel Defans: 60, HP: 60. Blok şansı.", "req_level": 34, "req_class": "CRUSADER", "stats": {"VIT": 18, "P_DEF": 35, "RAW_DEF": 60, "BLOCK_CHANCE": 5, "P_DEF_BONUS": 3}}
        },
        "42": {
            "Silah": {"id": "C_W_42", "name": "Onur Kılıcı", "tooltip": "Temel Saldırı: 105. Hasar ve şifa gücü.", "req_level": 42, "req_class": "CRUSADER", "stats": {"STR": 14, "VIT": 14, "PAP_BONUS": 75, "RAW_ATK": 105, "HEAL_BONUS": 20, "P_CRIT_BONUS": 2}},
            "Kask": {"id": "C_H_42", "name": "Yüce Miğfer", "tooltip": "Temel Defans: 70, HP: 200. Dayanıklılık ve WIS.", "req_level": 42, "req_class": "CRUSADER", "stats": {"VIT": 25, "P_DEF": 40, "WIS": 5, "RAW_DEF": 70, "HP": 200, "M_DEF": 15}},
            "Zırh": {"id": "C_A_42", "name": "Kahraman Plaka Zırh", "tooltip": "Temel Defans: 150, HP: 400. Yüksek fiziksel savunma.", "req_level": 42, "req_class": "CRUSADER", "stats": {"VIT": 30, "P_DEF": 75, "STR": 14, "RAW_DEF": 150, "HP": 400, "HP_REGEN": 4}},
            "Pantolon": {"id": "C_P_42", "name": "Savaş Lordu Dizliği", "tooltip": "Temel Defans: 100, HP: 240. Dayanıklılık ve STR.", "req_level": 42, "req_class": "CRUSADER", "stats": {"VIT": 28, "P_DEF": 55, "RAW_DEF": 100, "HP": 240}},
            "Eldiven": {"id": "C_G_42", "name": "Adalet Eldiveni", "tooltip": "Temel Defans: 50. STR/VIT.", "req_level": 42, "req_class": "CRUSADER", "stats": {"STR": 14, "P_DEF": 20, "RAW_DEF": 50, "ASPD_BONUS": 2}},
            "Bileklik": {"id": "C_WR_42", "name": "Adalet Bilekliği", "tooltip": "Temel Defans: 35, HP: 120. Temel VIT/WIS.", "req_level": 42, "req_class": "CRUSADER", "stats": {"VIT": 12, "WIS": 6, "RAW_DEF": 35, "HP": 120}},
            "Kolye": {"id": "C_N_42", "name": "Yüce Kalkan Kolyesi", "tooltip": "Temel Defans: 20, HP: 150. VIT ve WIS.", "req_level": 42, "req_class": "CRUSADER", "stats": {"WIS": 9, "VIT": 9, "RAW_DEF": 20, "HP": 150, "HEAL_BONUS": 12}},
            "Pelerin": {"id": "C_C_42", "name": "Kahraman Pelerini", "tooltip": "Temel Defans: 40. M_DEF ve P_DEF.", "req_level": 42, "req_class": "CRUSADER", "stats": {"M_DEF": 15, "P_DEF": 15, "RAW_DEF": 40}},
            "Offhand": {"id": "C_O_42", "name": "Runik Kalkan", "tooltip": "Temel Defans: 75, HP: 80. Blok şansı.", "req_level": 42, "req_class": "CRUSADER", "stats": {"VIT": 22, "P_DEF": 45, "RAW_DEF": 75, "BLOCK_CHANCE": 6, "M_DEF": 10}}
        },
        "48": {
            "Silah": {"id": "C_W_48", "name": "Işık Kılıcı", "tooltip": "Temel Saldırı: 125. Hasar ve şifa gücü.", "req_level": 48, "req_class": "CRUSADER", "stats": {"STR": 17, "VIT": 17, "PAP_BONUS": 85, "RAW_ATK": 125, "HEAL_BONUS": 25, "LIFESTEAL": 1}},
            "Kask": {"id": "C_H_48", "name": "Efsanevi Miğfer", "tooltip": "Temel Defans: 85, HP: 250. Dayanıklılık ve WIS.", "req_level": 48, "req_class": "CRUSADER", "stats": {"VIT": 30, "P_DEF": 50, "WIS": 6, "RAW_DEF": 85, "HP": 250, "HP_REGEN": 5}},
            "Zırh": {"id": "C_A_48", "name": "Işık Plaka Zırh", "tooltip": "Temel Defans: 170, HP: 500. Yüksek fiziksel savunma.", "req_level": 48, "req_class": "CRUSADER", "stats": {"VIT": 35, "P_DEF": 85, "STR": 17, "RAW_DEF": 170, "HP": 500, "M_DEF": 20}},
            "Pantolon": {"id": "C_P_48", "name": "Koruma Dizliği", "tooltip": "Temel Defans: 120, HP: 300. Dayanıklılık ve STR.", "req_level": 48, "req_class": "CRUSADER", "stats": {"VIT": 32, "P_DEF": 65, "RAW_DEF": 120, "HP": 300}},
            "Eldiven": {"id": "C_G_48", "name": "Sonsuz Eldiven", "tooltip": "Temel Defans: 60. STR/VIT.", "req_level": 48, "req_class": "CRUSADER", "stats": {"STR": 17, "P_DEF": 25, "RAW_DEF": 60, "ASPD_BONUS": 2}},
            "Bileklik": {"id": "C_WR_48", "name": "Işık Bilekliği", "tooltip": "Temel Defans: 45, HP: 150. Temel VIT/WIS.", "req_level": 48, "req_class": "CRUSADER", "stats": {"VIT": 15, "WIS": 8, "RAW_DEF": 45, "HP": 150}},
            "Kolye": {"id": "C_N_48", "name": "Ebedi Kalkan Kolyesi", "tooltip": "Temel Defans: 25, HP: 200. VIT ve WIS.", "req_level": 48, "req_class": "CRUSADER", "stats": {"WIS": 11, "VIT": 11, "RAW_DEF": 25, "HP": 200, "HEAL_BONUS": 15}},
            "Pelerin": {"id": "C_C_48", "name": "Yüce Pelerin", "tooltip": "Temel Defans: 50. M_DEF ve P_DEF.", "req_level": 48, "req_class": "CRUSADER", "stats": {"M_DEF": 18, "P_DEF": 18, "RAW_DEF": 50}},
            "Offhand": {"id": "C_O_48", "name": "Kutsal Mühür Kalkanı", "tooltip": "Temel Defans: 90, HP: 120. Blok şansı.", "req_level": 48, "req_class": "CRUSADER", "stats": {"VIT": 26, "P_DEF": 55, "RAW_DEF": 90, "BLOCK_CHANCE": 8, "P_DEF_BONUS": 4}}
        },
        "54": {
            "Silah": {"id": "C_W_54", "name": "Tanrının Kılıcı", "tooltip": "Temel Saldırı: 145. Hasar ve şifa gücü.", "req_level": 54, "req_class": "CRUSADER", "stats": {"STR": 21, "VIT": 21, "PAP_BONUS": 95, "RAW_ATK": 145, "HEAL_BONUS": 30, "P_CRIT_BONUS": 2}},
            "Kask": {"id": "C_H_54", "name": "Sonsuzluk Miğferi", "tooltip": "Temel Defans: 100, HP: 300. Dayanıklılık ve WIS.", "req_level": 54, "req_class": "CRUSADER", "stats": {"VIT": 35, "P_DEF": 60, "WIS": 8, "RAW_DEF": 100, "HP": 300, "M_DEF": 25}},
            "Zırh": {"id": "C_A_54", "name": "Tanrı Plaka Zırh", "tooltip": "Temel Defans: 200, HP: 600. Yüksek fiziksel savunma.", "req_level": 54, "req_class": "CRUSADER", "stats": {"VIT": 40, "P_DEF": 100, "STR": 21, "RAW_DEF": 200, "HP": 600, "HP_REGEN": 6}},
            "Pantolon": {"id": "C_P_54", "name": "İlahi Dizlik", "tooltip": "Temel Defans: 140, HP: 360. Dayanıklılık ve STR.", "req_level": 54, "req_class": "CRUSADER", "stats": {"VIT": 36, "P_DEF": 75, "RAW_DEF": 140, "HP": 360}},
            "Eldiven": {"id": "C_G_54", "name": "Kudret Eldiveni", "tooltip": "Temel Defans: 70. STR/VIT.", "req_level": 54, "req_class": "CRUSADER", "stats": {"STR": 21, "P_DEF": 30, "RAW_DEF": 70, "ASPD_BONUS": 3}},
            "Bileklik": {"id": "C_WR_54", "name": "Kutsal Güç Bilekliği", "tooltip": "Temel Defans: 55, HP: 200. Temel VIT/WIS.", "req_level": 54, "req_class": "CRUSADER", "stats": {"VIT": 18, "WIS": 10, "RAW_DEF": 55, "HP": 200, "P_DEF": 15}},
            "Kolye": {"id": "C_N_54", "name": "İnancın Kalbi", "tooltip": "Temel Defans: 30, HP: 250. VIT ve WIS.", "req_level": 54, "req_class": "CRUSADER", "stats": {"WIS": 14, "VIT": 14, "RAW_DEF": 30, "HP": 250, "HEAL_BONUS": 20}},
            "Pelerin": {"id": "C_C_54", "name": "Tanrının Pelerini", "tooltip": "Temel Defans: 60. M_DEF ve P_DEF.", "req_level": 54, "req_class": "CRUSADER", "stats": {"M_DEF": 22, "P_DEF": 22, "RAW_DEF": 60}},
            "Offhand": {"id": "C_O_54", "name": "İlahi Kalkan", "tooltip": "Temel Defans: 110, HP: 150. Blok şansı.", "req_level": 54, "req_class": "CRUSADER", "stats": {"VIT": 30, "P_DEF": 65, "RAW_DEF": 110, "BLOCK_CHANCE": 10, "M_DEF": 20}}
        },
        "66": {
            "Silah": {"id": "C_W_66", "name": "İlahi Ceza Kılıcı", "tooltip": "Temel Saldırı: 165. Hasar ve şifa gücü.", "req_level": 66, "req_class": "CRUSADER", "stats": {"STR": 25, "VIT": 25, "PAP_BONUS": 110, "RAW_ATK": 165, "HEAL_BONUS": 40, "P_DEF": 40}},
            "Kask": {"id": "C_H_66", "name": "Zafer Miğferi", "tooltip": "Temel Defans: 120, HP: 350. Dayanıklılık ve WIS.", "req_level": 66, "req_class": "CRUSADER", "stats": {"VIT": 40, "P_DEF": 70, "WIS": 10, "RAW_DEF": 120, "HP": 350, "HP_REGEN": 8}},
            "Zırh": {"id": "C_A_66", "name": "Sonsuz Savunma Plakası", "tooltip": "Temel Defans: 230, HP: 700. Yüksek fiziksel savunma.", "req_level": 66, "req_class": "CRUSADER", "stats": {"VIT": 45, "P_DEF": 115, "STR": 25, "RAW_DEF": 230, "HP": 700, "M_DEF": 30}},
            "Pantolon": {"id": "C_P_66", "name": "İlahi Koruma Pantolonu", "tooltip": "Temel Defans: 160, HP: 420. Dayanıklılık ve STR.", "req_level": 66, "req_class": "CRUSADER", "stats": {"VIT": 40, "P_DEF": 85, "RAW_DEF": 160, "HP": 420}},
            "Eldiven": {"id": "C_G_66", "name": "Yüce Güç Eldiveni", "tooltip": "Temel Defans: 80. STR/VIT.", "req_level": 66, "req_class": "CRUSADER", "stats": {"STR": 25, "P_DEF": 35, "RAW_DEF": 80, "P_CRIT_BONUS": 1}},
            "Bileklik": {"id": "C_WR_66", "name": "Yüce Şövalye Bilekliği", "tooltip": "Temel Defans: 65, HP: 250. Temel VIT/WIS.", "req_level": 66, "req_class": "CRUSADER", "stats": {"VIT": 22, "WIS": 12, "RAW_DEF": 65, "HP": 250}},
            "Kolye": {"id": "C_N_66", "name": "İlahi Kudret Kolyesi", "tooltip": "Temel Defans: 40, HP: 300. VIT ve WIS.", "req_level": 66, "req_class": "CRUSADER", "stats": {"WIS": 17, "VIT": 17, "RAW_DEF": 40, "HP": 300, "HEAL_BONUS": 25}},
            "Pelerin": {"id": "C_C_66", "name": "Adalet Sancağı Pelerini", "tooltip": "Temel Defans: 70. M_DEF ve P_DEF.", "req_level": 66, "req_class": "CRUSADER", "stats": {"M_DEF": 26, "P_DEF": 26, "RAW_DEF": 70}},
            "Offhand": {"id": "C_O_66", "name": "Adalet Kalkanı", "tooltip": "Temel Defans: 130, HP: 200. Blok şansı.", "req_level": 66, "req_class": "CRUSADER", "stats": {"VIT": 35, "P_DEF": 75, "RAW_DEF": 130, "BLOCK_CHANCE": 12, "P_DEF_BONUS": 5}}
        },
        "75": {
            "Silah": {"id": "C_W_75", "name": "İnanç Kılıcı", "tooltip": "Temel Saldırı: 180. Tehdit oluşturur ve hasar azaltır.", "req_level": 75, "req_class": "CRUSADER", "stats": {"STR": 30, "VIT": 15, "PAP_BONUS": 80, "RAW_ATK": 180, "P_DEF_BONUS": 8, "HEAL_BONUS": 15}},
            "Kask": {"id": "C_H_75", "name": "Kutsal Yemin Miğferi", "tooltip": "Temel Defans: 140, HP: 450. Sarsılmaz irade.", "req_level": 75, "req_class": "CRUSADER", "stats": {"VIT": 45, "STR": 10, "P_DEF": 80, "RAW_DEF": 140, "WIS": 12, "HP": 450, "M_DEF": 35}},
            "Zırh": {"id": "C_A_75", "name": "Yüce Kalkan Plakası", "tooltip": "Temel Defans: 250, HP: 750. Maksimum fiziksel dayanıklılık.", "req_level": 75, "req_class": "CRUSADER", "stats": {"VIT": 50, "STR": 20, "P_DEF": 150, "RAW_DEF": 250, "HP": 750, "HP_REGEN": 10}},
            "Pantolon": {"id": "C_P_75", "name": "Ağır Görev Zırhı", "tooltip": "Temel Defans: 180, HP: 500. Büyüye karşı direnç de sağlar.", "req_level": 75, "req_class": "CRUSADER", "stats": {"VIT": 45, "P_DEF": 100, "RAW_DEF": 180, "WIS": 15, "HP": 500}},
            "Eldiven": {"id": "C_G_75", "name": "Kalkan Duvarı Eldiveni", "tooltip": "Temel Defans: 95. Blok şansını artırır.", "req_level": 75, "req_class": "CRUSADER", "stats": {"STR": 15, "VIT": 10, "P_DEF": 50, "RAW_DEF": 95, "BLOCK_CHANCE": 3}},
            "Bileklik": {"id": "C_WR_75", "name": "Kutsanmış Bileklik", "tooltip": "Temel Defans: 80, HP: 300. Hem defans hem de şifa gücü.", "req_level": 75, "req_class": "CRUSADER", "stats": {"VIT": 25, "WIS": 15, "P_DEF": 30, "RAW_DEF": 80, "HP": 300, "HEAL_BONUS": 20}},
            "Kolye": {"id": "C_N_75", "name": "Işık Tılsımı", "tooltip": "Temel Defans: 50, HP: 500. HP ve mana havuzunu dengeler.", "req_level": 75, "req_class": "CRUSADER", "stats": {"VIT": 20, "FOC": 10, "HP_REGEN": 8, "RAW_DEF": 50, "HP": 500, "M_DEF": 40}},
            "Pelerin": {"id": "C_C_75", "name": "Adalet Pelerini", "tooltip": "Temel Defans: 85. Büyü savunmasını artırır.", "req_level": 75, "req_class": "CRUSADER", "stats": {"WIS": 20, "VIT": 15, "M_DEF": 60, "RAW_DEF": 85, "P_DEF": 35}},
            "Offhand": {"id": "C_O_75", "name": "İlahi Kalkan", "tooltip": "Temel Defans: 150, HP: 300. En yüksek dayanıklılık ve blok gücü.", "req_level": 75, "req_class": "CRUSADER", "stats": {"VIT": 40, "P_DEF": 100, "RAW_DEF": 150, "BLOCK_CHANCE": 15, "P_DEF_BONUS": 10}}
        },
    },

    # ------------------------------------------------------------------------------------------------------
    # 6. DRAGON KNIGHT (STR/VIT Odaklı - Ağır Zırh/Tek El veya Çift El Silah)
    # ------------------------------------------------------------------------------------------------------
    "DRAGON_KNIGHT": {
        "1": {
            "Silah": {"id": "DK_W_1", "name": "Ağır Kılıç", "tooltip": "Temel Saldırı: 15. Temel STR.", "req_level": 1, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 2, "VIT": 1, "PAP_BONUS": 5, "RAW_ATK": 15}},
            "Kask": {"id": "DK_H_1", "name": "Kaba Başlık", "tooltip": "Temel Defans: 6, HP: 10. Temel VIT.", "req_level": 1, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 2, "P_DEF": 2, "RAW_DEF": 6, "HP": 10}},
            "Zırh": {"id": "DK_A_1", "name": "Zincir Zırh", "tooltip": "Temel Defans: 11, HP: 20. Temel koruma.", "req_level": 1, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 1, "VIT": 2, "P_DEF": 3, "RAW_DEF": 11, "HP": 20, "M_DEF": 1}},
            "Pantolon": {"id": "DK_P_1", "name": "Sert Deri Pantolon", "tooltip": "Temel Defans: 7, HP: 5. Temel P_DEF.", "req_level": 1, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 1, "P_DEF": 2, "RAW_DEF": 7, "HP": 5}},
            "Eldiven": {"id": "DK_G_1", "name": "Koruma Eldiveni", "tooltip": "Temel Defans: 5. Temel STR.", "req_level": 1, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 1, "P_DEF": 1, "RAW_DEF": 5, "ASPD_BONUS": 1}},
            "Bileklik": {"id": "DK_WR_1", "name": "Kaba Bileklik", "tooltip": "Temel Defans: 3. Temel VIT.", "req_level": 1, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 1, "RAW_DEF": 3}},
            "Kolye": {"id": "DK_N_1", "name": "Kemik Kolye", "tooltip": "Temel Defans: 1, HP: 15. Temel HP.", "req_level": 1, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 1, "RAW_DEF": 1, "HP": 15}},
            "Pelerin": {"id": "DK_C_1", "name": "Siyah Pelerin", "tooltip": "Temel Defans: 3. Temel M_DEF.", "req_level": 1, "req_class": "DRAGON_KNIGHT", "stats": {"M_DEF": 1, "RAW_DEF": 3, "P_DEF": 1}},
            "Offhand": {"id": "DK_O_1", "name": "Hafif Kalkan", "tooltip": "Temel Defans: 5. Temel defans.", "req_level": 1, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 1, "P_DEF": 2, "RAW_DEF": 5}}
        },
        "9": {
            "Silah": {"id": "DK_W_9", "name": "Kaba Mızrak", "tooltip": "Temel Saldırı: 30. Gelişmiş temel hasar.", "req_level": 9, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 5, "PAP_BONUS": 15, "VIT": 3, "RAW_ATK": 30, "P_DEF": 15}},
            "Kask": {"id": "DK_H_9", "name": "Zincir Başlık", "tooltip": "Temel Defans: 18, HP: 40. Dayanıklılık odaklı.", "req_level": 9, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 5, "P_DEF": 8, "STR": 1, "RAW_DEF": 18, "HP": 40, "M_DEF": 3}},
            "Zırh": {"id": "DK_A_9", "name": "Perçinli Zırh", "tooltip": "Temel Defans: 35, HP: 80. Yüksek dayanıklılık.", "req_level": 9, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 8, "P_DEF": 18, "STR": 3, "RAW_DEF": 35, "HP": 80}},
            "Pantolon": {"id": "DK_P_9", "name": "Sert Dizlik", "tooltip": "Temel Defans: 25, HP: 50. Dayanıklılık.", "req_level": 9, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 5, "P_DEF": 10, "RAW_DEF": 25, "HP": 50}},
            "Eldiven": {"id": "DK_G_9", "name": "Zincir Eldiven", "tooltip": "Temel Defans: 12. Temel STR/VIT.", "req_level": 9, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 3, "P_DEF": 5, "RAW_DEF": 12, "P_CRIT_BONUS": 1}},
            "Bileklik": {"id": "DK_WR_9", "name": "Ejderha Dişi Bilekliği", "tooltip": "Temel Defans: 6, HP: 20. Temel VIT.", "req_level": 9, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 3, "STR": 1, "RAW_DEF": 6, "HP": 20}},
            "Kolye": {"id": "DK_N_9", "name": "Sert Kemik Kolye", "tooltip": "Temel Defans: 3, HP: 50. Temel HP/VIT.", "req_level": 9, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 3, "HP": 50, "RAW_DEF": 3, "M_DEF": 1}},
            "Pelerin": {"id": "DK_C_9", "name": "Savaş Pelerini", "tooltip": "Temel Defans: 8. Temel M_DEF.", "req_level": 9, "req_class": "DRAGON_KNIGHT", "stats": {"M_DEF": 3, "P_DEF": 3, "RAW_DEF": 8}},
            "Offhand": {"id": "DK_O_9", "name": "İnce Kalkan", "tooltip": "Temel Defans: 15, HP: 10. Temel defans.", "req_level": 9, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 3, "P_DEF": 8, "RAW_DEF": 15, "P_DEF_BONUS": 1}}
        },
        "18": {
            "Silah": {"id": "DK_W_18", "name": "Demir Mızrak", "tooltip": "Temel Saldırı: 50. Hasar ve dayanıklılık.", "req_level": 18, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 9, "VIT": 5, "PAP_BONUS": 30, "RAW_ATK": 50, "P_CRIT_BONUS": 1}},
            "Kask": {"id": "DK_H_18", "name": "Savaş Miğferi", "tooltip": "Temel Defans: 30, HP: 70. Dayanıklılık odaklı.", "req_level": 18, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 10, "P_DEF": 15, "STR": 2, "RAW_DEF": 30, "HP": 70, "HP_REGEN": 1}},
            "Zırh": {"id": "DK_A_18", "name": "Plaka Zırh", "tooltip": "Temel Defans: 65, HP: 140. Yüksek fiziksel savunma.", "req_level": 18, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 15, "P_DEF": 35, "STR": 5, "RAW_DEF": 65, "HP": 140, "M_DEF": 5}},
            "Pantolon": {"id": "DK_P_18", "name": "Ağır Dizlik", "tooltip": "Temel Defans: 45, HP: 90. Dayanıklılık ve STR.", "req_level": 18, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 12, "P_DEF": 25, "RAW_DEF": 45, "HP": 90}},
            "Eldiven": {"id": "DK_G_18", "name": "Demir Eldiven", "tooltip": "Temel Defans: 25. STR/VIT.", "req_level": 18, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 5, "P_DEF": 10, "RAW_DEF": 25, "ASPD_BONUS": 1}},
            "Bileklik": {"id": "DK_WR_18", "name": "Savaş Bilekliği", "tooltip": "Temel Defans: 12, HP: 40. Temel VIT/STR.", "req_level": 18, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 5, "STR": 3, "RAW_DEF": 12, "HP": 40}},
            "Kolye": {"id": "DK_N_18", "name": "Ejderha Taşı Kolyesi", "tooltip": "Temel Defans: 6, HP: 60. VIT ve STR.", "req_level": 18, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 4, "VIT": 4, "RAW_DEF": 6, "HP": 60, "P_DEF": 5}},
            "Pelerin": {"id": "DK_C_18", "name": "Cesur Pelerin", "tooltip": "Temel Defans: 15. M_DEF ve P_DEF.", "req_level": 18, "req_class": "DRAGON_KNIGHT", "stats": {"M_DEF": 6, "P_DEF": 5, "RAW_DEF": 15}},
            "Offhand": {"id": "DK_O_18", "name": "Muhafız Kalkanı", "tooltip": "Temel Defans: 30, HP: 30. Temel defans.", "req_level": 18, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 8, "P_DEF": 15, "RAW_DEF": 30, "M_DEF": 2}}
        },
        "24": {
            "Silah": {"id": "DK_W_24", "name": "Çelik Mızrak", "tooltip": "Temel Saldırı: 70. Hasar ve dayanıklılık.", "req_level": 24, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 12, "VIT": 8, "PAP_BONUS": 40, "RAW_ATK": 70, "LIFESTEAL": 1}},
            "Kask": {"id": "DK_H_24", "name": "Koruma Miğferi", "tooltip": "Temel Defans: 40, HP: 100. Dayanıklılık odaklı.", "req_level": 24, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 14, "P_DEF": 20, "STR": 3, "RAW_DEF": 40, "HP": 100, "M_DEF": 8}},
            "Zırh": {"id": "DK_A_24", "name": "Güçlendirilmiş Zırh", "tooltip": "Temel Defans: 85, HP: 200. Yüksek fiziksel savunma.", "req_level": 24, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 20, "P_DEF": 45, "STR": 7, "RAW_DEF": 85, "HP": 200, "HP_REGEN": 2}},
            "Pantolon": {"id": "DK_P_24", "name": "Koruyucu Dizlik", "tooltip": "Temel Defans: 60, HP: 120. Dayanıklılık ve STR.", "req_level": 24, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 16, "P_DEF": 35, "RAW_DEF": 60, "HP": 120}},
            "Eldiven": {"id": "DK_G_24", "name": "Zırhlı Eldiven", "tooltip": "Temel Defans: 30. STR/VIT.", "req_level": 24, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 7, "P_DEF": 12, "RAW_DEF": 30, "ASPD_BONUS": 2}},
            "Bileklik": {"id": "DK_WR_24", "name": "Güç Bilekliği", "tooltip": "Temel Defans: 15, HP: 60. Temel VIT/STR.", "req_level": 24, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 7, "STR": 4, "RAW_DEF": 15, "HP": 60}},
            "Kolye": {"id": "DK_N_24", "name": "Ateş Tılsımı", "tooltip": "Temel Defans: 10, HP: 80. VIT ve STR.", "req_level": 24, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 5, "VIT": 5, "RAW_DEF": 10, "HP": 80, "P_DEF": 8}},
            "Pelerin": {"id": "DK_C_24", "name": "Hiddet Pelerini", "tooltip": "Temel Defans: 20. M_DEF ve P_DEF.", "req_level": 24, "req_class": "DRAGON_KNIGHT", "stats": {"M_DEF": 8, "P_DEF": 8, "RAW_DEF": 20}},
            "Offhand": {"id": "DK_O_24", "name": "Ağır Kalkan", "tooltip": "Temel Defans: 45, HP: 60. Temel defans.", "req_level": 24, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 12, "P_DEF": 20, "RAW_DEF": 45, "M_DEF": 5}}
        },
        "34": {
            "Silah": {"id": "DK_W_34", "name": "Runik Mızrak", "tooltip": "Temel Saldırı: 90. Hasar ve dayanıklılık.", "req_level": 34, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 16, "VIT": 12, "PAP_BONUS": 60, "RAW_ATK": 90, "P_CRIT_BONUS": 2}},
            "Kask": {"id": "DK_H_34", "name": "Ateş Miğferi", "tooltip": "Temel Defans: 55, HP: 150. Dayanıklılık odaklı.", "req_level": 34, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 20, "P_DEF": 30, "STR": 4, "RAW_DEF": 55, "HP": 150, "M_DEF": 12}},
            "Zırh": {"id": "DK_A_34", "name": "Ağır Zırh", "tooltip": "Temel Defans: 120, HP: 300. Yüksek fiziksel savunma.", "req_level": 34, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 25, "P_DEF": 60, "STR": 10, "RAW_DEF": 120, "HP": 300, "HP_REGEN": 3}},
            "Pantolon": {"id": "DK_P_34", "name": "Ejderha Dizliği", "tooltip": "Temel Defans: 80, HP: 180. Dayanıklılık ve STR.", "req_level": 34, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 22, "P_DEF": 45, "RAW_DEF": 80, "HP": 180}},
            "Eldiven": {"id": "DK_G_34", "name": "Alev Eldiveni", "tooltip": "Temel Defans: 40. STR/VIT.", "req_level": 34, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 10, "P_DEF": 15, "RAW_DEF": 40, "ASPD_BONUS": 3}},
            "Bileklik": {"id": "DK_WR_34", "name": "Runik Bileklik", "tooltip": "Temel Defans: 25, HP: 90. Temel VIT/STR.", "req_level": 34, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 10, "STR": 5, "RAW_DEF": 25, "HP": 90}},
            "Kolye": {"id": "DK_N_34", "name": "Ejderha Gözü Kolyesi", "tooltip": "Temel Defans: 15, HP: 120. VIT ve STR.", "req_level": 34, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 7, "VIT": 7, "RAW_DEF": 15, "HP": 120, "LIFESTEAL": 1}},
            "Pelerin": {"id": "DK_C_34", "name": "Sert Pelerin", "tooltip": "Temel Defans: 30. M_DEF ve P_DEF.", "req_level": 34, "req_class": "DRAGON_KNIGHT", "stats": {"M_DEF": 12, "P_DEF": 12, "RAW_DEF": 30}},
            "Offhand": {"id": "DK_O_34", "name": "Çelik Kalkan", "tooltip": "Temel Defans: 60, HP: 90. Temel defans.", "req_level": 34, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 18, "P_DEF": 35, "RAW_DEF": 60, "M_DEF": 10}}
        },
        "42": {
            "Silah": {"id": "DK_W_42", "name": "Ejderha Nefesi Mızrağı", "tooltip": "Temel Saldırı: 110. Hasar ve dayanıklılık.", "req_level": 42, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 22, "VIT": 16, "PAP_BONUS": 75, "RAW_ATK": 110, "FIRE_DMG": 10}},
            "Kask": {"id": "DK_H_42", "name": "Sert Miğfer", "tooltip": "Temel Defans: 70, HP: 200. Dayanıklılık odaklı.", "req_level": 42, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 25, "P_DEF": 40, "STR": 5, "RAW_DEF": 70, "HP": 200, "M_DEF": 15}},
            "Zırh": {"id": "DK_A_42", "name": "Ejderha Plaka Zırh", "tooltip": "Temel Defans: 150, HP: 400. Yüksek fiziksel savunma.", "req_level": 42, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 30, "P_DEF": 75, "STR": 14, "RAW_DEF": 150, "HP": 400, "HP_REGEN": 4}},
            "Pantolon": {"id": "DK_P_42", "name": "Savaşçı Pantolonu", "tooltip": "Temel Defans: 100, HP: 240. Dayanıklılık ve STR.", "req_level": 42, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 28, "P_DEF": 55, "RAW_DEF": 100, "HP": 240}},
            "Eldiven": {"id": "DK_G_42", "name": "Ejderha Pençesi", "tooltip": "Temel Defans: 50. STR/VIT.", "req_level": 42, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 14, "P_DEF": 20, "RAW_DEF": 50, "ASPD_BONUS": 3}},
            "Bileklik": {"id": "DK_WR_42", "name": "Ejder Bilekliği", "tooltip": "Temel Defans: 35, HP: 120. Temel VIT/STR.", "req_level": 42, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 12, "STR": 6, "RAW_DEF": 35, "HP": 120, "P_CRIT_BONUS": 1}},
            "Kolye": {"id": "DK_N_42", "name": "Sert Taş Kolye", "tooltip": "Temel Defans: 20, HP: 150. VIT ve STR.", "req_level": 42, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 9, "VIT": 9, "RAW_DEF": 20, "HP": 150, "M_DEF": 20}},
            "Pelerin": {"id": "DK_C_42", "name": "Sert Rüzgar Pelerini", "tooltip": "Temel Defans: 40. M_DEF ve P_DEF.", "req_level": 42, "req_class": "DRAGON_KNIGHT", "stats": {"M_DEF": 15, "P_DEF": 15, "RAW_DEF": 40}},
            "Offhand": {"id": "DK_O_42", "name": "Sert Kalkan", "tooltip": "Temel Defans: 75, HP: 120. Temel defans.", "req_level": 42, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 22, "P_DEF": 45, "RAW_DEF": 75, "P_DEF_BONUS": 3}}
        },
        "48": {
            "Silah": {"id": "DK_W_48", "name": "Yüce Mızrak", "tooltip": "Temel Saldırı: 130. Hasar ve dayanıklılık.", "req_level": 48, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 25, "VIT": 20, "PAP_BONUS": 85, "RAW_ATK": 130, "LIFESTEAL": 2}},
            "Kask": {"id": "DK_H_48", "name": "Kahraman Miğferi", "tooltip": "Temel Defans: 85, HP: 250. Dayanıklılık odaklı.", "req_level": 48, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 30, "P_DEF": 50, "STR": 6, "RAW_DEF": 85, "HP": 250, "HP_REGEN": 5}},
            "Zırh": {"id": "DK_A_48", "name": "Kahraman Zırhı", "tooltip": "Temel Defans: 170, HP: 500. Yüksek fiziksel savunma.", "req_level": 48, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 35, "P_DEF": 85, "STR": 17, "RAW_DEF": 170, "HP": 500, "M_DEF": 25}},
            "Pantolon": {"id": "DK_P_48", "name": "Kutsal Dizlik", "tooltip": "Temel Defans: 120, HP: 300. Dayanıklılık ve STR.", "req_level": 48, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 32, "P_DEF": 65, "RAW_DEF": 120, "HP": 300}},
            "Eldiven": {"id": "DK_G_48", "name": "Kahraman Eldiveni", "tooltip": "Temel Defans: 60. STR/VIT.", "req_level": 48, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 17, "P_DEF": 25, "RAW_DEF": 60, "ASPD_BONUS": 4}},
            "Bileklik": {"id": "DK_WR_48", "name": "Yüce Bileklik", "tooltip": "Temel Defans: 45, HP: 150. Temel VIT/STR.", "req_level": 48, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 15, "STR": 8, "RAW_DEF": 45, "HP": 150, "P_DEF": 20}},
            "Kolye": {"id": "DK_N_48", "name": "Kahraman Kolyesi", "tooltip": "Temel Defans: 25, HP: 200. VIT ve STR.", "req_level": 48, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 11, "VIT": 11, "RAW_DEF": 25, "HP": 200, "M_DEF": 30}},
            "Pelerin": {"id": "DK_C_48", "name": "Ejder Pelerini", "tooltip": "Temel Defans: 50. M_DEF ve P_DEF.", "req_level": 48, "req_class": "DRAGON_KNIGHT", "stats": {"M_DEF": 18, "P_DEF": 18, "RAW_DEF": 50}},
            "Offhand": {"id": "DK_O_48", "name": "Ejderha Kalkanı", "tooltip": "Temel Defans: 90, HP: 180. Temel defans.", "req_level": 48, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 26, "P_DEF": 55, "RAW_DEF": 90, "FIRE_RESIST": 5}}
        },
        "54": {
            "Silah": {"id": "DK_W_54", "name": "Ateş Mührü Mızrağı", "tooltip": "Temel Saldırı: 150. Hasar ve dayanıklılık.", "req_level": 54, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 29, "VIT": 25, "PAP_BONUS": 95, "RAW_ATK": 150, "FIRE_DMG": 15, "P_CRIT_BONUS": 3}},
            "Kask": {"id": "DK_H_54", "name": "Savaş Lordu Miğferi", "tooltip": "Temel Defans: 100, HP: 300. Dayanıklılık odaklı.", "req_level": 54, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 35, "P_DEF": 60, "STR": 8, "RAW_DEF": 100, "HP": 300, "M_DEF": 30}},
            "Zırh": {"id": "DK_A_54", "name": "Savaş Lordu Zırhı", "tooltip": "Temel Defans: 200, HP: 600. Yüksek fiziksel savunma.", "req_level": 54, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 40, "P_DEF": 100, "STR": 21, "RAW_DEF": 200, "HP": 600, "HP_REGEN": 8}},
            "Pantolon": {"id": "DK_P_54", "name": "Sonsuz Dizlik", "tooltip": "Temel Defans: 140, HP: 360. Dayanıklılık ve STR.", "req_level": 54, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 36, "P_DEF": 75, "RAW_DEF": 140, "HP": 360}},
            "Eldiven": {"id": "DK_G_54", "name": "Savaş Lordu Eldiveni", "tooltip": "Temel Defans: 70. STR/VIT.", "req_level": 54, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 21, "P_DEF": 30, "RAW_DEF": 70, "ASPD_BONUS": 5}},
            "Bileklik": {"id": "DK_WR_54", "name": "Ejderha Gücü Bilekliği", "tooltip": "Temel Defans: 55, HP: 200. Temel VIT/STR.", "req_level": 54, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 18, "STR": 10, "RAW_DEF": 55, "HP": 200, "LIFESTEAL": 1}},
            "Kolye": {"id": "DK_N_54", "name": "Ateş Kalbi Kolyesi", "tooltip": "Temel Defans: 30, HP: 250. VIT ve STR.", "req_level": 54, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 14, "VIT": 14, "RAW_DEF": 30, "HP": 250, "M_DEF": 35}},
            "Pelerin": {"id": "DK_C_54", "name": "Savaş Lordu Pelerini", "tooltip": "Temel Defans: 60. M_DEF ve P_DEF.", "req_level": 54, "req_class": "DRAGON_KNIGHT", "stats": {"M_DEF": 22, "P_DEF": 22, "RAW_DEF": 60}},
            "Offhand": {"id": "DK_O_54", "name": "Kudret Kalkanı", "tooltip": "Temel Defans: 110, HP: 250. Temel defans.", "req_level": 54, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 30, "P_DEF": 65, "RAW_DEF": 110, "FIRE_RESIST": 10}}
        },
        "66": {
            "Silah": {"id": "DK_W_66", "name": "Kadim Ejder Mızrağı", "tooltip": "Temel Saldırı: 170. Hasar ve dayanıklılık.", "req_level": 66, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 35, "VIT": 30, "PAP_BONUS": 110, "RAW_ATK": 170, "P_CRIT_BONUS": 4, "LIFESTEAL": 2}},
            "Kask": {"id": "DK_H_66", "name": "Ebedi Miğferi", "tooltip": "Temel Defans: 120, HP: 350. Dayanıklılık odaklı.", "req_level": 66, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 40, "P_DEF": 70, "STR": 10, "RAW_DEF": 120, "HP": 350, "M_DEF": 35}},
            "Zırh": {"id": "DK_A_66", "name": "Sonsuz Zırh", "tooltip": "Temel Defans: 230, HP: 700. Yüksek fiziksel savunma.", "req_level": 66, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 45, "P_DEF": 115, "STR": 25, "RAW_DEF": 230, "HP": 700, "HP_REGEN": 10}},
            "Pantolon": {"id": "DK_P_66", "name": "Yüce Dizlik", "tooltip": "Temel Defans: 160, HP: 420. Dayanıklılık ve STR.", "req_level": 66, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 40, "P_DEF": 85, "RAW_DEF": 160, "HP": 420}},
            "Eldiven": {"id": "DK_G_66", "name": "Sonsuz Güç Eldiveni", "tooltip": "Temel Defans: 80. STR/VIT.", "req_level": 66, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 25, "P_DEF": 35, "RAW_DEF": 80, "ASPD_BONUS": 5}},
            "Bileklik": {"id": "DK_WR_66", "name": "İlahi Bileklik", "tooltip": "Temel Defans: 65, HP: 250. Temel VIT/STR.", "req_level": 66, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 22, "STR": 12, "RAW_DEF": 65, "HP": 250, "P_DEF": 25}},
            "Kolye": {"id": "DK_N_66", "name": "Ejderha Ruhu Kolyesi", "tooltip": "Temel Defans: 40, HP: 300. VIT ve STR.", "req_level": 66, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 17, "VIT": 17, "RAW_DEF": 40, "HP": 300, "FIRE_RESIST": 15}},
            "Pelerin": {"id": "DK_C_66", "name": "Ebediyet Pelerini", "tooltip": "Temel Defans: 70. M_DEF ve P_DEF.", "req_level": 66, "req_class": "DRAGON_KNIGHT", "stats": {"M_DEF": 26, "P_DEF": 26, "RAW_DEF": 70}},
            "Offhand": {"id": "DK_O_66", "name": "Ebedi Kalkan", "tooltip": "Temel Defans: 130, HP: 300. Temel defans.", "req_level": 66, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 35, "P_DEF": 75, "RAW_DEF": 130, "M_DEF": 25}}
        },
        "75": {
            "Silah": {"id": "DK_W_75", "name": "Alev Mızrağı", "tooltip": "Temel Saldırı: 200. Ateş hasarı ekler.", "req_level": 75, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 40, "VIT": 15, "PAP_BONUS": 125, "RAW_ATK": 200, "FIRE_DMG": 25, "LIFESTEAL": 3}},
            "Kask": {"id": "DK_H_75", "name": "Ejder Pulu Miğferi", "tooltip": "Temel Defans: 140, HP: 450. Can ve direnç sağlar.", "req_level": 75, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 15, "VIT": 35, "P_DEF": 80, "RAW_DEF": 140, "RESIST_ALL": 8, "HP": 450, "HP_REGEN": 12}},
            "Zırh": {"id": "DK_A_75", "name": "Ejder Pulu Zırh", "tooltip": "Temel Defans: 250, HP: 750. Yüksek direnç ve dayanıklılık.", "req_level": 75, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 45, "STR": 20, "P_DEF": 150, "RAW_DEF": 250, "RESIST_ALL": 15, "HP": 750}},
            "Pantolon": {"id": "DK_P_75", "name": "Obsidyen Dizlik", "tooltip": "Temel Defans: 180, HP: 500. Yüksek dayanıklılık.", "req_level": 75, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 40, "P_DEF": 100, "RAW_DEF": 180, "STR": 10, "HP": 500}},
            "Eldiven": {"id": "DK_G_75", "name": "Ejderha Pençesi Eldiveni", "tooltip": "Temel Defans: 95. Saldırı gücü ve hızı.", "req_level": 75, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 25, "P_DEF": 50, "RAW_DEF": 95, "ASPD_BONUS": 4, "P_CRIT_BONUS": 5}},
            "Bileklik": {"id": "DK_WR_75", "name": "Ateş Kanı Bilekliği", "tooltip": "Temel Defans: 80, HP: 300. STR ve VIT artışı.", "req_level": 75, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 20, "VIT": 15, "RAW_DEF": 80, "HP": 300, "FIRE_DMG": 10}},
            "Kolye": {"id": "DK_N_75", "name": "Yüce Ejder Kolyesi", "tooltip": "Temel Defans: 50, HP: 450. HP ve tüm statlar.", "req_level": 75, "req_class": "DRAGON_KNIGHT", "stats": {"STR": 15, "VIT": 15, "HP": 450, "RAW_DEF": 50, "RESIST_ALL": 8, "M_DEF": 35}},
            "Pelerin": {"id": "DK_C_75", "name": "Kızgın Pelerin", "tooltip": "Temel Defans: 85. Büyü direnci ve HP.", "req_level": 75, "req_class": "DRAGON_KNIGHT", "stats": {"M_DEF": 35, "VIT": 20, "RAW_DEF": 85, "P_DEF": 35}},
            "Offhand": {"id": "DK_O_75", "name": "Obsidyen Kalkan", "tooltip": "Temel Defans: 150, HP: 350. Yüksek fiziksel ve element direnci.", "req_level": 75, "req_class": "DRAGON_KNIGHT", "stats": {"VIT": 35, "P_DEF": 100, "RAW_DEF": 150, "M_DEF": 30, "RESIST_ALL": 10}}
        },
    },
    
    # ------------------------------------------------------------------------------------------------------
    # 7. WARLOCK (INT/FOC/WIS Odaklı - Kumaş Zırh/Asa + Offhand)
    # ------------------------------------------------------------------------------------------------------
    "WARLOCK": {
        "1": {
            "Silah": {"id": "WL_W_1", "name": "Siyah Asa", "tooltip": "Temel Saldırı: 12. Temel lanet gücü.", "req_level": 1, "req_class": "WARLOCK", "stats": {"INT": 2, "MAP_BONUS": 5, "RAW_ATK": 12, "DEBUFF_SUCCESS": 1}},
            "Kask": {"id": "WL_H_1", "name": "Gölge Başlık", "tooltip": "Temel Defans: 3, MP: 10. Temel FOC.", "req_level": 1, "req_class": "WARLOCK", "stats": {"FOC": 1, "M_DEF": 1, "RAW_DEF": 3, "MP": 10}},
            "Zırh": {"id": "WL_A_1", "name": "Koyu Keten Cüppe", "tooltip": "Temel Defans: 8, MP: 20. Temel INT.", "req_level": 1, "req_class": "WARLOCK", "stats": {"INT": 1, "WIS": 1, "M_DEF": 3, "RAW_DEF": 8, "MP": 20, "P_DEF": 1}},
            "Pantolon": {"id": "WL_P_1", "name": "Lanetli Pantolon", "tooltip": "Temel Defans: 5, MP: 15. Temel M_DEF.", "req_level": 1, "req_class": "WARLOCK", "stats": {"FOC": 1, "M_DEF": 2, "RAW_DEF": 5, "MP": 15}},
            "Eldiven": {"id": "WL_G_1", "name": "Hüküm Eldiveni", "tooltip": "Temel Defans: 2. Temel INT.", "req_level": 1, "req_class": "WARLOCK", "stats": {"INT": 1, "CSPD_BONUS": 1, "RAW_DEF": 2}},
            "Bileklik": {"id": "WL_WR_1", "name": "Kara Bileklik", "tooltip": "Temel Defans: 1, MP: 5. Temel FOC.", "req_level": 1, "req_class": "WARLOCK", "stats": {"FOC": 1, "RAW_DEF": 1, "MP": 5}},
            "Kolye": {"id": "WL_N_1", "name": "Ölüm Tılsımı", "tooltip": "Temel Defans: 1. Temel INT/WIS.", "req_level": 1, "req_class": "WARLOCK", "stats": {"WIS": 1, "INT": 1, "RAW_DEF": 1, "HP": 5}},
            "Pelerin": {"id": "WL_C_1", "name": "Gölge Pelerini", "tooltip": "Temel Defans: 3. Temel P_DEF.", "req_level": 1, "req_class": "WARLOCK", "stats": {"P_DEF": 1, "RAW_DEF": 3, "M_DEF": 1}},
            "Offhand": {"id": "WL_O_1", "name": "Kan Taşı", "tooltip": "Temel Defans: 4, MP: 15. Mana ve lanet.", "req_level": 1, "req_class": "WARLOCK", "stats": {"FOC": 1, "INT": 1, "RAW_DEF": 4, "MP": 15, "M_DEF": 1}}
        },
        "9": {
            "Silah": {"id": "WL_W_9", "name": "Gölge Rünü Asa", "tooltip": "Temel Saldırı: 25. Büyü gücünü artırır.", "req_level": 9, "req_class": "WARLOCK", "stats": {"INT": 5, "MAP_BONUS": 15, "FOC": 2, "RAW_ATK": 25, "M_CRIT_BONUS": 1}},
            "Kask": {"id": "WL_H_9", "name": "Koyu Başlık", "tooltip": "Temel Defans: 8, MP: 40. Temel FOC.", "req_level": 9, "req_class": "WARLOCK", "stats": {"FOC": 3, "M_DEF": 5, "INT": 1, "RAW_DEF": 8, "MP": 40}},
            "Zırh": {"id": "WL_A_9", "name": "Lanetli Cüppe", "tooltip": "Temel Defans: 20, MP: 70. Daha iyi M_DEF.", "req_level": 9, "req_class": "WARLOCK", "stats": {"INT": 3, "WIS": 2, "M_DEF": 12, "RAW_DEF": 20, "MP": 70, "DEBUFF_SUCCESS": 1}},
            "Pantolon": {"id": "WL_P_9", "name": "Lanet Kumaşı Pantolon", "tooltip": "Temel Defans: 15, MP: 50. Temel MP.", "req_level": 9, "req_class": "WARLOCK", "stats": {"FOC": 4, "M_DEF": 8, "RAW_DEF": 15, "MP": 50, "HP": 30}},
            "Eldiven": {"id": "WL_G_9", "name": "Hüküm Sargısı", "tooltip": "Temel Defans: 5. Debuff gücü.", "req_level": 9, "req_class": "WARLOCK", "stats": {"INT": 3, "DEBUFF_SUCCESS": 2, "RAW_DEF": 5, "MAP_BONUS": 5}},
            "Bileklik": {"id": "WL_WR_9", "name": "Kara Mühür", "tooltip": "Temel Defans: 3, MP: 20. INT ve FOC artışı.", "req_level": 9, "req_class": "WARLOCK", "stats": {"INT": 2, "FOC": 2, "RAW_DEF": 3, "MP": 20}},
            "Kolye": {"id": "WL_N_9", "name": "Ölüm Tılsımı", "tooltip": "Temel Defans: 2, MP: 30. Temel INT/WIS.", "req_level": 9, "req_class": "WARLOCK", "stats": {"WIS": 2, "INT": 1, "RAW_DEF": 2, "MP": 30, "M_DEF": 3}},
            "Pelerin": {"id": "WL_C_9", "name": "Gizlilik Pelerini", "tooltip": "Temel Defans: 7. Temel P_DEF.", "req_level": 9, "req_class": "WARLOCK", "stats": {"P_DEF": 3, "RAW_DEF": 7, "EVASION_BONUS": 1}},
            "Offhand": {"id": "WL_O_9", "name": "Gölge Taşı", "tooltip": "Temel Defans: 7, MP: 50. Mana ve FOC artışı.", "req_level": 9, "req_class": "WARLOCK", "stats": {"FOC": 3, "INT": 2, "RAW_DEF": 7, "MP": 50, "DEBUFF_SUCCESS": 1}}
        },
        "18": {
            "Silah": {"id": "WL_W_18", "name": "Ruh Emici Asa", "tooltip": "Temel Saldırı: 45. Lanetlerin gücü.", "req_level": 18, "req_class": "WARLOCK", "stats": {"INT": 9, "MAP_BONUS": 30, "FOC": 3, "RAW_ATK": 45, "M_CRIT_BONUS": 2}},
            "Kask": {"id": "WL_H_18", "name": "Kara Büyücü Başlığı", "tooltip": "Temel Defans: 15, MP: 70. FOC odaklı.", "req_level": 18, "req_class": "WARLOCK", "stats": {"FOC": 6, "M_DEF": 12, "INT": 2, "RAW_DEF": 15, "MP": 70, "DEBUFF_SUCCESS": 1}},
            "Zırh": {"id": "WL_A_18", "name": "Mistik Cüppe", "tooltip": "Temel Defans: 35, MP: 120. Orta M_DEF.", "req_level": 18, "req_class": "WARLOCK", "stats": {"INT": 6, "WIS": 4, "M_DEF": 25, "RAW_DEF": 35, "MP": 120, "SOUL_LEECH": 1}},
            "Pantolon": {"id": "WL_P_18", "name": "Gölge Büyüsü Pantolonu", "tooltip": "Temel Defans: 25, MP: 100. Mana havuzu.", "req_level": 18, "req_class": "WARLOCK", "stats": {"FOC": 8, "M_DEF": 18, "RAW_DEF": 25, "MP": 100, "HP": 40}},
            "Eldiven": {"id": "WL_G_18", "name": "Lanetleme Eldiveni", "tooltip": "Temel Defans: 10. Debuff süresi.", "req_level": 18, "req_class": "WARLOCK", "stats": {"INT": 5, "DEBUFF_SUCCESS": 3, "RAW_DEF": 10, "MAP_BONUS": 10}},
            "Bileklik": {"id": "WL_WR_18", "name": "Gölge Bilekliği", "tooltip": "Temel Defans: 5, MP: 40. INT ve FOC artışı.", "req_level": 18, "req_class": "WARLOCK", "stats": {"INT": 4, "FOC": 4, "RAW_DEF": 5, "MP": 40}},
            "Kolye": {"id": "WL_N_18", "name": "Ölü Adamın Kolyesi", "tooltip": "Temel Defans: 4, HP: 30. WIS ve INT.", "req_level": 18, "req_class": "WARLOCK", "stats": {"WIS": 4, "INT": 3, "RAW_DEF": 4, "HP": 30, "M_DEF": 5}},
            "Pelerin": {"id": "WL_C_18", "name": "Karanlık Pelerin", "tooltip": "Temel Defans: 12. Fiziksel direnç.", "req_level": 18, "req_class": "WARLOCK", "stats": {"P_DEF": 6, "RAW_DEF": 12, "M_DEF": 8}},
            "Offhand": {"id": "WL_O_18", "name": "Lanet Kitabı", "tooltip": "Temel Defans: 12, MP: 90. Mana ve FOC artışı.", "req_level": 18, "req_class": "WARLOCK", "stats": {"FOC": 6, "INT": 4, "RAW_DEF": 12, "MP": 90, "DEBUFF_SUCCESS": 2}}
        },
        "24": {
            "Silah": {"id": "WL_W_24", "name": "Zindan Asası", "tooltip": "Temel Saldırı: 60. Lanetlerin gücü.", "req_level": 24, "req_class": "WARLOCK", "stats": {"INT": 12, "MAP_BONUS": 40, "FOC": 4, "RAW_ATK": 60, "M_CRIT_BONUS": 3}},
            "Kask": {"id": "WL_H_24", "name": "Gölge Büyü Başlığı", "tooltip": "Temel Defans: 22, MP: 100. FOC odaklı.", "req_level": 24, "req_class": "WARLOCK", "stats": {"FOC": 8, "M_DEF": 18, "INT": 3, "RAW_DEF": 22, "MP": 100, "CSPD_BONUS": 1}},
            "Zırh": {"id": "WL_A_24", "name": "Ruhani Cüppe", "tooltip": "Temel Defans: 50, MP: 180. Yüksek M_DEF.", "req_level": 24, "req_class": "WARLOCK", "stats": {"INT": 8, "WIS": 6, "M_DEF": 35, "RAW_DEF": 50, "MP": 180, "SOUL_LEECH": 2}},
            "Pantolon": {"id": "WL_P_24", "name": "Büyücü Pantolonu", "tooltip": "Temel Defans: 35, MP: 150. Mana havuzu.", "req_level": 24, "req_class": "WARLOCK", "stats": {"FOC": 10, "M_DEF": 25, "RAW_DEF": 35, "MP": 150, "HP": 60}},
            "Eldiven": {"id": "WL_G_24", "name": "Zaman Durduran Eldiven", "tooltip": "Temel Defans: 15. Debuff süresi.", "req_level": 24, "req_class": "WARLOCK", "stats": {"INT": 7, "DEBUFF_SUCCESS": 4, "RAW_DEF": 15, "M_DEF": 5}},
            "Bileklik": {"id": "WL_WR_24", "name": "Lanet Akımı Bilekliği", "tooltip": "Temel Defans: 10, MP: 60. INT ve FOC artışı.", "req_level": 24, "req_class": "WARLOCK", "stats": {"INT": 6, "FOC": 5, "RAW_DEF": 10, "MP": 60, "M_CRIT_BONUS": 1}},
            "Kolye": {"id": "WL_N_24", "name": "Karanlık Mühür", "tooltip": "Temel Defans: 6, HP: 50. WIS ve INT.", "req_level": 24, "req_class": "WARLOCK", "stats": {"WIS": 5, "INT": 4, "RAW_DEF": 6, "HP": 50, "M_DEF": 8}},
            "Pelerin": {"id": "WL_C_24", "name": "Kabus Pelerini", "tooltip": "Temel Defans: 18. Fiziksel direnç.", "req_level": 24, "req_class": "WARLOCK", "stats": {"P_DEF": 8, "RAW_DEF": 18, "M_DEF": 10}},
            "Offhand": {"id": "WL_O_24", "name": "Gölge Kodeksi", "tooltip": "Temel Defans: 18, MP: 130. Mana ve FOC artışı.", "req_level": 24, "req_class": "WARLOCK", "stats": {"FOC": 8, "INT": 6, "RAW_DEF": 18, "MP": 130, "DEBUFF_SUCCESS": 3}}
        },
        "34": {
            "Silah": {"id": "WL_W_34", "name": "Ruh Toplayıcı Asa", "tooltip": "Temel Saldırı: 80. Lanetlerin gücü.", "req_level": 34, "req_class": "WARLOCK", "stats": {"INT": 16, "MAP_BONUS": 60, "FOC": 5, "RAW_ATK": 80, "M_CRIT_BONUS": 4}},
            "Kask": {"id": "WL_H_34", "name": "Hüküm Başlığı", "tooltip": "Temel Defans: 30, MP: 130. FOC odaklı.", "req_level": 34, "req_class": "WARLOCK", "stats": {"FOC": 12, "M_DEF": 25, "INT": 4, "RAW_DEF": 30, "MP": 130, "CSPD_BONUS": 2}},
            "Zırh": {"id": "WL_A_34", "name": "Cadı Cübbesi", "tooltip": "Temel Defans: 70, MP: 250. Yüksek M_DEF.", "req_level": 34, "req_class": "WARLOCK", "stats": {"INT": 10, "WIS": 8, "M_DEF": 50, "RAW_DEF": 70, "MP": 250, "SOUL_LEECH": 3}},
            "Pantolon": {"id": "WL_P_34", "name": "Veba Pantolonu", "tooltip": "Temel Defans: 45, MP: 250. Mana havuzu.", "req_level": 34, "req_class": "WARLOCK", "stats": {"FOC": 12, "M_DEF": 35, "RAW_DEF": 45, "MP": 250, "HP": 90}},
            "Eldiven": {"id": "WL_G_34", "name": "Sonsuz Lanet Eldiveni", "tooltip": "Temel Defans: 20. Debuff süresi.", "req_level": 34, "req_class": "WARLOCK", "stats": {"INT": 10, "DEBUFF_SUCCESS": 5, "RAW_DEF": 20, "MAP_BONUS": 15}},
            "Bileklik": {"id": "WL_WR_34", "name": "Varlık Bilekliği", "tooltip": "Temel Defans: 12, MP: 80. INT ve FOC artışı.", "req_level": 34, "req_class": "WARLOCK", "stats": {"INT": 8, "FOC": 7, "RAW_DEF": 12, "MP": 80, "M_DEF": 5}},
            "Kolye": {"id": "WL_N_34", "name": "Lanet Zinciri", "tooltip": "Temel Defans: 8, HP: 80. WIS ve INT.", "req_level": 34, "req_class": "WARLOCK", "stats": {"WIS": 7, "INT": 5, "RAW_DEF": 8, "HP": 80, "M_CRIT_BONUS": 1}},
            "Pelerin": {"id": "WL_C_34", "name": "Ölümün Kumaşı Pelerini", "tooltip": "Temel Defans: 25. Fiziksel direnç.", "req_level": 34, "req_class": "WARLOCK", "stats": {"P_DEF": 12, "RAW_DEF": 25, "M_DEF": 15}},
            "Offhand": {"id": "WL_O_34", "name": "Kara Büyü Kitabı", "tooltip": "Temel Defans: 25, MP: 180. Mana ve FOC artışı.", "req_level": 34, "req_class": "WARLOCK", "stats": {"FOC": 12, "INT": 8, "RAW_DEF": 25, "MP": 180, "DEBUFF_SUCCESS": 4}}
        },
        "42": {
            "Silah": {"id": "WL_W_42", "name": "Gölge Lordu Asası", "tooltip": "Temel Saldırı: 100. Lanetlerin gücü.", "req_level": 42, "req_class": "WARLOCK", "stats": {"INT": 22, "MAP_BONUS": 75, "FOC": 6, "RAW_ATK": 100, "M_CRIT_BONUS": 5}},
            "Kask": {"id": "WL_H_42", "name": "Cadı Miğferi", "tooltip": "Temel Defans: 40, MP: 180. FOC odaklı.", "req_level": 42, "req_class": "WARLOCK", "stats": {"FOC": 15, "M_DEF": 35, "INT": 5, "RAW_DEF": 40, "MP": 180, "CSPD_BONUS": 3}},
            "Zırh": {"id": "WL_A_42", "name": "Kabus Cüppesi", "tooltip": "Temel Defans: 90, MP: 350. Orta-üst düzey M_DEF.", "req_level": 42, "req_class": "WARLOCK", "stats": {"INT": 15, "WIS": 10, "M_DEF": 65, "RAW_DEF": 90, "MP": 350, "HP": 120, "SOUL_LEECH": 4}},
            "Pantolon": {"id": "WL_P_42", "name": "Gölge Tozu Pantolonu", "tooltip": "Temel Defans: 60, MP: 350. Mana havuzu.", "req_level": 42, "req_class": "WARLOCK", "stats": {"FOC": 15, "M_DEF": 45, "RAW_DEF": 60, "MP": 350, "HP": 120}},
            "Eldiven": {"id": "WL_G_42", "name": "Ruh Emici Eldiven", "tooltip": "Temel Defans: 25. Debuff süresi.", "req_level": 42, "req_class": "WARLOCK", "stats": {"INT": 15, "DEBUFF_SUCCESS": 6, "RAW_DEF": 25, "M_DEF_BONUS": 5}},
            "Bileklik": {"id": "WL_WR_42", "name": "Ölüm Bilekliği", "tooltip": "Temel Defans: 15, MP: 120. INT ve FOC artışı.", "req_level": 42, "req_class": "WARLOCK", "stats": {"INT": 10, "FOC": 9, "RAW_DEF": 15, "MP": 120, "DEBUFF_SUCCESS": 2}},
            "Kolye": {"id": "WL_N_42", "name": "Kara Enerji Kolyesi", "tooltip": "Temel Defans: 12, HP: 120. WIS ve INT.", "req_level": 42, "req_class": "WARLOCK", "stats": {"WIS": 9, "INT": 7, "RAW_DEF": 12, "HP": 120, "M_CRIT_BONUS": 2}},
            "Pelerin": {"id": "WL_C_42", "name": "Lanet Pelerini", "tooltip": "Temel Defans: 35. Fiziksel direnç.", "req_level": 42, "req_class": "WARLOCK", "stats": {"P_DEF": 15, "RAW_DEF": 35, "M_DEF": 20}},
            "Offhand": {"id": "WL_O_42", "name": "Gölge Hüküm Kitabı", "tooltip": "Temel Defans: 30, MP: 250. Mana ve FOC artışı.", "req_level": 42, "req_class": "WARLOCK", "stats": {"FOC": 15, "INT": 10, "RAW_DEF": 30, "MP": 250, "DEBUFF_SUCCESS": 5}}
        },
        "48": {
            "Silah": {"id": "WL_W_48", "name": "Karanlık Mühür Asa", "tooltip": "Temel Saldırı: 120. Lanetlerin gücü.", "req_level": 48, "req_class": "WARLOCK", "stats": {"INT": 25, "MAP_BONUS": 85, "FOC": 7, "RAW_ATK": 120, "M_CRIT_BONUS": 6}},
            "Kask": {"id": "WL_H_48", "name": "Kabus Başlığı", "tooltip": "Temel Defans: 50, MP: 220. FOC odaklı.", "req_level": 48, "req_class": "WARLOCK", "stats": {"FOC": 18, "M_DEF": 42, "INT": 6, "RAW_DEF": 50, "MP": 220, "CSPD_BONUS": 4}},
            "Zırh": {"id": "WL_A_48", "name": "Gölge Savaş Cübbesi", "tooltip": "Temel Defans: 110, MP: 450. Yüksek M_DEF.", "req_level": 48, "req_class": "WARLOCK", "stats": {"INT": 18, "WIS": 12, "M_DEF": 80, "RAW_DEF": 110, "MP": 450, "HP": 150, "SOUL_LEECH": 5}},
            "Pantolon": {"id": "WL_P_48", "name": "Sonsuz Lanet Pantolonu", "tooltip": "Temel Defans: 75, MP: 450. Mana havuzu.", "req_level": 48, "req_class": "WARLOCK", "stats": {"FOC": 18, "M_DEF": 55, "RAW_DEF": 75, "MP": 450, "HP": 150}},
            "Eldiven": {"id": "WL_G_48", "name": "Ruh Parçalayıcı Eldiven", "tooltip": "Temel Defans: 30. Debuff süresi.", "req_level": 48, "req_class": "WARLOCK", "stats": {"INT": 18, "DEBUFF_SUCCESS": 7, "RAW_DEF": 30, "M_CRIT_BONUS": 2}},
            "Bileklik": {"id": "WL_WR_48", "name": "Lanet Lordu Bilekliği", "tooltip": "Temel Defans: 18, MP: 150. INT ve FOC artışı.", "req_level": 48, "req_class": "WARLOCK", "stats": {"INT": 12, "FOC": 11, "RAW_DEF": 18, "MP": 150, "CSPD_BONUS": 3}},
            "Kolye": {"id": "WL_N_48", "name": "Karanlık Kalp Kolyesi", "tooltip": "Temel Defans: 15, HP: 150. WIS ve INT.", "req_level": 48, "req_class": "WARLOCK", "stats": {"WIS": 11, "INT": 9, "RAW_DEF": 15, "HP": 150, "MP_REGEN": 3}},
            "Pelerin": {"id": "WL_C_48", "name": "Kabus Lordu Pelerini", "tooltip": "Temel Defans: 40. Fiziksel direnç.", "req_level": 48, "req_class": "WARLOCK", "stats": {"P_DEF": 18, "RAW_DEF": 40, "M_DEF": 25}},
            "Offhand": {"id": "WL_O_48", "name": "Ebedi Lanet Kitabı", "tooltip": "Temel Defans: 40, MP: 300. Mana ve FOC artışı.", "req_level": 48, "req_class": "WARLOCK", "stats": {"FOC": 18, "INT": 12, "RAW_DEF": 40, "MP": 300, "DEBUFF_SUCCESS": 6}}
        },
        "54": {
            "Silah": {"id": "WL_W_54", "name": "Hüküm Asası", "tooltip": "Temel Saldırı: 140. Lanetlerin gücü.", "req_level": 54, "req_class": "WARLOCK", "stats": {"INT": 29, "MAP_BONUS": 95, "FOC": 8, "RAW_ATK": 140, "M_CRIT_BONUS": 7}},
            "Kask": {"id": "WL_H_54", "name": "Yüce Cadı Başlığı", "tooltip": "Temel Defans: 60, MP: 250. FOC odaklı.", "req_level": 54, "req_class": "WARLOCK", "stats": {"FOC": 22, "M_DEF": 50, "INT": 8, "RAW_DEF": 60, "MP": 250, "CSPD_BONUS": 5}},
            "Zırh": {"id": "WL_A_54", "name": "Karanlık Lord Cübbesi", "tooltip": "Temel Defans: 130, MP: 550. Maksimum M_DEF.", "req_level": 54, "req_class": "WARLOCK", "stats": {"INT": 22, "WIS": 15, "M_DEF": 95, "RAW_DEF": 130, "MP": 550, "HP": 200, "SOUL_LEECH": 6}},
            "Pantolon": {"id": "WL_P_54", "name": "Ruhani Gölge Pantolonu", "tooltip": "Temel Defans: 90, MP: 550. Mana havuzu.", "req_level": 54, "req_class": "WARLOCK", "stats": {"FOC": 22, "M_DEF": 65, "RAW_DEF": 90, "MP": 550, "HP": 180}},
            "Eldiven": {"id": "WL_G_54", "name": "Yüce Lanet Eldiveni", "tooltip": "Temel Defans: 35. Debuff süresi.", "req_level": 54, "req_class": "WARLOCK", "stats": {"INT": 22, "DEBUFF_SUCCESS": 8, "RAW_DEF": 35, "M_DEF": 10}},
            "Bileklik": {"id": "WL_WR_54", "name": "Veba Bilekliği", "tooltip": "Temel Defans: 22, MP: 180. INT ve FOC artışı.", "req_level": 54, "req_class": "WARLOCK", "stats": {"INT": 15, "FOC": 14, "RAW_DEF": 22, "MP": 180, "M_CRIT_BONUS": 3}},
            "Kolye": {"id": "WL_N_54", "name": "Lanet Zinciri", "tooltip": "Temel Defans: 20, HP: 200. WIS ve INT.", "req_level": 54, "req_class": "WARLOCK", "stats": {"WIS": 14, "INT": 12, "RAW_DEF": 20, "HP": 200, "MP": 250}},
            "Pelerin": {"id": "WL_C_54", "name": "Hüküm Pelerini", "tooltip": "Temel Defans: 50. Fiziksel direnç.", "req_level": 54, "req_class": "WARLOCK", "stats": {"P_DEF": 22, "RAW_DEF": 50, "M_DEF": 30}},
            "Offhand": {"id": "WL_O_54", "name": "Karanlık Kitap", "tooltip": "Temel Defans: 50, MP: 350. Mana ve FOC artışı.", "req_level": 54, "req_class": "WARLOCK", "stats": {"FOC": 22, "INT": 15, "RAW_DEF": 50, "MP": 350, "DEBUFF_SUCCESS": 7}}
        },
        "66": {
            "Silah": {"id": "WL_W_66", "name": "Sonsuz Karanlık Asa", "tooltip": "Temel Saldırı: 160. Lanetlerin gücü.", "req_level": 66, "req_class": "WARLOCK", "stats": {"INT": 35, "MAP_BONUS": 110, "FOC": 9, "RAW_ATK": 160, "M_CRIT_BONUS": 8}},
            "Kask": {"id": "WL_H_66", "name": "İlahi Lanet Başlığı", "tooltip": "Temel Defans: 75, MP: 300. FOC odaklı.", "req_level": 66, "req_class": "WARLOCK", "stats": {"FOC": 25, "M_DEF": 60, "INT": 10, "RAW_DEF": 75, "MP": 300, "HP": 250}},
            "Zırh": {"id": "WL_A_66", "name": "Ebedi Gölge Cübbesi", "tooltip": "Temel Defans: 150, MP: 650. Maksimum M_DEF.", "req_level": 66, "req_class": "WARLOCK", "stats": {"INT": 25, "WIS": 18, "M_DEF": 110, "RAW_DEF": 150, "MP": 650, "HP": 250, "SOUL_LEECH": 8}},
            "Pantolon": {"id": "WL_P_66", "name": "Ruhani Gölge Pantolonu", "tooltip": "Temel Defans: 110, MP: 650. Mana havuzu.", "req_level": 66, "req_class": "WARLOCK", "stats": {"FOC": 25, "M_DEF": 75, "RAW_DEF": 110, "MP": 650, "HP": 200}},
            "Eldiven": {"id": "WL_G_66", "name": "Varlık Eldiveni", "tooltip": "Temel Defans: 40. Debuff süresi.", "req_level": 66, "req_class": "WARLOCK", "stats": {"INT": 25, "DEBUFF_SUCCESS": 9, "RAW_DEF": 40, "CSPD_BONUS": 3}},
            "Bileklik": {"id": "WL_WR_66", "name": "Kudret Bilekliği", "tooltip": "Temel Defans: 30, MP: 250. INT ve FOC artışı.", "req_level": 66, "req_class": "WARLOCK", "stats": {"INT": 18, "FOC": 16, "RAW_DEF": 30, "MP": 250, "DEBUFF_SUCCESS": 3}},
            "Kolye": {"id": "WL_N_66", "name": "Sonsuz Lanet Kolyesi", "tooltip": "Temel Defans: 25, HP: 300. WIS ve INT.", "req_level": 66, "req_class": "WARLOCK", "stats": {"WIS": 17, "INT": 15, "RAW_DEF": 25, "HP": 300, "M_DEF": 40}},
            "Pelerin": {"id": "WL_C_66", "name": "Veba Lordu Pelerini", "tooltip": "Temel Defans: 60. Fiziksel direnç.", "req_level": 66, "req_class": "WARLOCK", "stats": {"P_DEF": 26, "RAW_DEF": 60, "M_DEF": 35}},
            "Offhand": {"id": "WL_O_66", "name": "Yüce Gölge Kitabı", "tooltip": "Temel Defans: 60, MP: 450. Mana ve FOC artışı.", "req_level": 66, "req_class": "WARLOCK", "stats": {"FOC": 28, "INT": 18, "RAW_DEF": 60, "MP": 450, "DEBUFF_SUCCESS": 8}}
        },
        "75": {
            "Silah": {"id": "WL_W_75", "name": "Ruh Emici Asa", "tooltip": "Temel Saldırı: 180. Lanetlerin süresini uzatır.", "req_level": 75, "req_class": "WARLOCK", "stats": {"INT": 40, "FOC": 20, "MAP_BONUS": 125, "RAW_ATK": 180, "DEBUFF_SUCCESS": 10, "M_CRIT_BONUS": 8}},
            "Kask": {"id": "WL_H_75", "name": "Gölge Hükümdarı Miğferi", "tooltip": "Temel Defans: 90, MP: 400. FOC ve büyü kritik.", "req_level": 75, "req_class": "WARLOCK", "stats": {"INT": 20, "FOC": 15, "M_DEF": 70, "RAW_DEF": 90, "CSPD_BONUS": 4, "MP": 400, "MP_REGEN": 10}},
            "Zırh": {"id": "WL_A_75", "name": "Gölge Pact Cübbesi", "tooltip": "Temel Defans: 170, HP: 350. Can çalma ve büyü direnci.", "req_level": 75, "req_class": "WARLOCK", "stats": {"INT": 25, "WIS": 15, "M_DEF": 130, "RAW_DEF": 170, "SOUL_LEECH": 8, "HP": 350, "MP": 800}},
            "Pantolon": {"id": "WL_P_75", "name": "Karanlık Örgü Pantolon", "tooltip": "Temel Defans: 120, MP: 500. Maksimum M_DEF.", "req_level": 75, "req_class": "WARLOCK", "stats": {"FOC": 20, "VIT": 10, "M_DEF": 85, "RAW_DEF": 120, "MP": 500, "HP": 250}},
            "Eldiven": {"id": "WL_G_75", "name": "Lanetleme Eldiveni", "tooltip": "Temel Defans: 50. DoT hasarını artırır.", "req_level": 75, "req_class": "WARLOCK", "stats": {"INT": 25, "FOC": 15, "CSPD_BONUS": 5, "RAW_DEF": 50, "M_CRIT_BONUS": 4}},
            "Bileklik": {"id": "WL_WR_75", "name": "Kabus Bilekliği", "tooltip": "Temel Defans: 40, MP: 300. FOC ve debuff.", "req_level": 75, "req_class": "WARLOCK", "stats": {"FOC": 20, "DEBUFF_SUCCESS": 12, "RAW_DEF": 40, "MP": 300, "M_DEF": 10}},
            "Kolye": {"id": "WL_N_75", "name": "Ruh Zinciri Kolyesi", "tooltip": "Temel Defans: 30, HP: 300. INT ve WIS.", "req_level": 75, "req_class": "WARLOCK", "stats": {"INT": 15, "WIS": 15, "MP": 400, "RAW_DEF": 30, "HP": 300, "SOUL_LEECH": 4}},
            "Pelerin": {"id": "WL_C_75", "name": "Ruh Avcısı Pelerini", "tooltip": "Temel Defans: 75. Büyü savunması.", "req_level": 75, "req_class": "WARLOCK", "stats": {"WIS": 15, "M_DEF": 50, "RAW_DEF": 75, "P_DEF": 35}},
            "Offhand": {"id": "WL_O_75", "name": "Lanetler Kitabı", "tooltip": "Temel Defans: 70, MP: 550. Debuff gücünü ve mana havuzunu artırır.", "req_level": 75, "req_class": "WARLOCK", "stats": {"FOC": 35, "INT": 15, "DEBUFF_SUCCESS": 15, "RAW_DEF": 70, "MP": 550, "M_DEF": 25}}
        },
    },

    # ------------------------------------------------------------------------------------------------------
    # 8. CLERIC (WIS/FOC/VIT Odaklı - Kumaş Zırh/Asa + Offhand)
    # ------------------------------------------------------------------------------------------------------
    "CLERIC": {
        "1": {
            "Silah": {"id": "CL_W_1", "name": "Kutsanmış Dal", "tooltip": "Temel Saldırı: 10. Temel iyileştirme gücü.", "req_level": 1, "req_class": "CLERIC", "stats": {"WIS": 2, "HEAL_BONUS": 5, "RAW_ATK": 10, "CSPD_BONUS": 1}},
            "Kask": {"id": "CL_H_1", "name": "Basit Başlık", "tooltip": "Temel Defans: 3, MP: 10. Temel FOC.", "req_level": 1, "req_class": "CLERIC", "stats": {"FOC": 1, "M_DEF": 1, "RAW_DEF": 3, "MP": 10}},
            "Zırh": {"id": "CL_A_1", "name": "Beyaz Cüppe", "tooltip": "Temel Defans: 7, MP: 20. Temel WIS.", "req_level": 1, "req_class": "CLERIC", "stats": {"WIS": 1, "VIT": 1, "M_DEF": 2, "RAW_DEF": 7, "MP": 20, "HP": 10}},
            "Pantolon": {"id": "CL_P_1", "name": "Hafif Pantolon", "tooltip": "Temel Defans: 4, MP: 15. Temel M_DEF.", "req_level": 1, "req_class": "CLERIC", "stats": {"FOC": 1, "M_DEF": 1, "RAW_DEF": 4, "MP": 15}},
            "Eldiven": {"id": "CL_G_1", "name": "Şifa Eldiveni", "tooltip": "Temel Defans: 2. Temel WIS.", "req_level": 1, "req_class": "CLERIC", "stats": {"WIS": 1, "CSPD_BONUS": 1, "RAW_DEF": 2, "HEAL_BONUS": 1}},
            "Bileklik": {"id": "CL_WR_1", "name": "Inanç Bilekliği", "tooltip": "Temel Defans: 1, MP: 5. Temel FOC.", "req_level": 1, "req_class": "CLERIC", "stats": {"FOC": 1, "RAW_DEF": 1, "MP": 5}},
            "Kolye": {"id": "CL_N_1", "name": "İlahi Sembol", "tooltip": "Temel Defans: 1, HP: 15. Temel VIT.", "req_level": 1, "req_class": "CLERIC", "stats": {"VIT": 1, "RAW_DEF": 1, "HP": 15}},
            "Pelerin": {"id": "CL_C_1", "name": "İyilik Pelerini", "tooltip": "Temel Defans: 3. Temel P_DEF.", "req_level": 1, "req_class": "CLERIC", "stats": {"P_DEF": 1, "RAW_DEF": 3, "M_DEF": 1}},
            "Offhand": {"id": "CL_O_1", "name": "Küçük İncil", "tooltip": "Temel Defans: 4, MP: 15. Temel iyileştirme.", "req_level": 1, "req_class": "CLERIC", "stats": {"WIS": 1, "HEAL_BONUS": 1, "RAW_DEF": 4, "MP": 15}}
        },
        "9": {
            "Silah": {"id": "CL_W_9", "name": "Işık Asa", "tooltip": "Temel Saldırı: 25. Gelişmiş şifa gücü.", "req_level": 9, "req_class": "CLERIC", "stats": {"WIS": 5, "HEAL_BONUS": 15, "FOC": 1, "RAW_ATK": 25, "CSPD_BONUS": 1}},
            "Kask": {"id": "CL_H_9", "name": "İlahi Başlık", "tooltip": "Temel Defans: 8, MP: 40. Temel FOC.", "req_level": 9, "req_class": "CLERIC", "stats": {"FOC": 3, "M_DEF": 5, "WIS": 1, "RAW_DEF": 8, "MP": 40}},
            "Zırh": {"id": "CL_A_9", "name": "Mavi Cüppe", "tooltip": "Temel Defans: 20, HP: 30. Daha iyi M_DEF.", "req_level": 9, "req_class": "CLERIC", "stats": {"WIS": 3, "VIT": 2, "M_DEF": 12, "RAW_DEF": 20, "HP": 30, "MP": 30}},
            "Pantolon": {"id": "CL_P_9", "name": "Temiz Pantolon", "tooltip": "Temel Defans: 15, HP: 50. Temel HP.", "req_level": 9, "req_class": "CLERIC", "stats": {"FOC": 4, "M_DEF": 8, "RAW_DEF": 15, "HP": 50, "MP": 30}},
            "Eldiven": {"id": "CL_G_9", "name": "Şefkat Eldiveni", "tooltip": "Temel Defans: 5. Şifa gücü artışı.", "req_level": 9, "req_class": "CLERIC", "stats": {"WIS": 3, "HEAL_BONUS": 5, "RAW_DEF": 5, "CSPD_BONUS": 2}},
            "Bileklik": {"id": "CL_WR_9", "name": "Kutsal Bileklik", "tooltip": "Temel Defans: 3, MP: 20. WIS ve FOC.", "req_level": 9, "req_class": "CLERIC", "stats": {"WIS": 2, "FOC": 1, "RAW_DEF": 3, "MP": 20}},
            "Kolye": {"id": "CL_N_9", "name": "Gümüş Tılsım", "tooltip": "Temel Defans: 2, HP: 30. Temel VIT/WIS.", "req_level": 9, "req_class": "CLERIC", "stats": {"VIT": 2, "WIS": 1, "RAW_DEF": 2, "HP": 30, "M_DEF": 3}},
            "Pelerin": {"id": "CL_C_9", "name": "İnanç Pelerini", "tooltip": "Temel Defans: 7. Temel P_DEF.", "req_level": 9, "req_class": "CLERIC", "stats": {"P_DEF": 3, "RAW_DEF": 7, "M_DEF": 5}},
            "Offhand": {"id": "CL_O_9", "name": "Küçük Mühür", "tooltip": "Temel Defans: 7, MP: 50. Mana ve şifa.", "req_level": 9, "req_class": "CLERIC", "stats": {"FOC": 3, "WIS": 2, "RAW_DEF": 7, "MP": 50, "HEAL_BONUS": 5}}
        },
        "18": {
            "Silah": {"id": "CL_W_18", "name": "Gümüş İşlemeli Asa", "tooltip": "Temel Saldırı: 45. Şifa gücü ve cast hızı.", "req_level": 18, "req_class": "CLERIC", "stats": {"WIS": 9, "HEAL_BONUS": 30, "FOC": 2, "RAW_ATK": 45, "CSPD_BONUS": 2}},
            "Kask": {"id": "CL_H_18", "name": "Ruhani Başlık", "tooltip": "Temel Defans: 15, MP: 70. FOC odaklı.", "req_level": 18, "req_class": "CLERIC", "stats": {"FOC": 6, "M_DEF": 12, "WIS": 2, "RAW_DEF": 15, "MP": 70, "HP_REGEN": 1}},
            "Zırh": {"id": "CL_A_18", "name": "Işık Cübbesi", "tooltip": "Temel Defans: 35, HP: 60. Orta M_DEF.", "req_level": 18, "req_class": "CLERIC", "stats": {"WIS": 6, "VIT": 4, "M_DEF": 25, "RAW_DEF": 35, "HP": 60, "MP": 60}},
            "Pantolon": {"id": "CL_P_18", "name": "Kutsal Kumaş Pantolon", "tooltip": "Temel Defans: 25, MP: 100. Mana havuzu.", "req_level": 18, "req_class": "CLERIC", "stats": {"FOC": 8, "M_DEF": 18, "RAW_DEF": 25, "MP": 100, "HP": 40}},
            "Eldiven": {"id": "CL_G_18", "name": "Merhamet Eli Eldiveni", "tooltip": "Temel Defans: 10. Şifa gücü artışı.", "req_level": 18, "req_class": "CLERIC", "stats": {"WIS": 5, "HEAL_BONUS": 15, "RAW_DEF": 10, "CSPD_BONUS": 3}},
            "Bileklik": {"id": "CL_WR_18", "name": "İlahi Işık Bilekliği", "tooltip": "Temel Defans: 5, MP: 40. WIS ve FOC.", "req_level": 18, "req_class": "CLERIC", "stats": {"WIS": 4, "FOC": 3, "RAW_DEF": 5, "MP": 40, "HEAL_BONUS": 5}},
            "Kolye": {"id": "CL_N_18", "name": "Şifa Tılsımı", "tooltip": "Temel Defans: 4, HP: 30. WIS ve VIT.", "req_level": 18, "req_class": "CLERIC", "stats": {"WIS": 3, "VIT": 3, "RAW_DEF": 4, "HP": 30, "M_DEF": 5}},
            "Pelerin": {"id": "CL_C_18", "name": "Aydınlık Pelerin", "tooltip": "Temel Defans: 12. Fiziksel direnç.", "req_level": 18, "req_class": "CLERIC", "stats": {"P_DEF": 6, "RAW_DEF": 12, "M_DEF": 8}},
            "Offhand": {"id": "CL_O_18", "name": "Büyük İncil", "tooltip": "Temel Defans: 12, MP: 90. Mana ve şifa.", "req_level": 18, "req_class": "CLERIC", "stats": {"FOC": 6, "WIS": 4, "RAW_DEF": 12, "MP": 90, "HEAL_BONUS": 10}}
        },
        "24": {
            "Silah": {"id": "CL_W_24", "name": "Koruma Asası", "tooltip": "Temel Saldırı: 60. Şifa gücü ve cast hızı.", "req_level": 24, "req_class": "CLERIC", "stats": {"WIS": 12, "HEAL_BONUS": 40, "FOC": 3, "RAW_ATK": 60, "CSPD_BONUS": 3}},
            "Kask": {"id": "CL_H_24", "name": "Ruhani Miğfer", "tooltip": "Temel Defans: 22, MP: 100. FOC odaklı.", "req_level": 24, "req_class": "CLERIC", "stats": {"FOC": 8, "M_DEF": 18, "WIS": 3, "RAW_DEF": 22, "MP": 100, "HP": 50}},
            "Zırh": {"id": "CL_A_24", "name": "Koruma Cübbesi", "tooltip": "Temel Defans: 50, HP: 80. Yüksek M_DEF.", "req_level": 24, "req_class": "CLERIC", "stats": {"WIS": 8, "VIT": 6, "M_DEF": 35, "RAW_DEF": 50, "HP": 80, "MP": 80, "HP_REGEN": 2}},
            "Pantolon": {"id": "CL_P_24", "name": "Şifa Pantolonu", "tooltip": "Temel Defans: 35, MP: 150. Mana havuzu.", "req_level": 24, "req_class": "CLERIC", "stats": {"FOC": 10, "M_DEF": 25, "RAW_DEF": 35, "MP": 150, "HP": 60}},
            "Eldiven": {"id": "CL_G_24", "name": "Hızlı Şifa Eldiveni", "tooltip": "Temel Defans: 15. Şifa gücü artışı.", "req_level": 24, "req_class": "CLERIC", "stats": {"WIS": 7, "HEAL_BONUS": 20, "RAW_DEF": 15, "CSPD_BONUS": 4}},
            "Bileklik": {"id": "CL_WR_24", "name": "Aydınlanma Bilekliği", "tooltip": "Temel Defans: 10, MP: 60. WIS ve FOC.", "req_level": 24, "req_class": "CLERIC", "stats": {"WIS": 6, "FOC": 4, "RAW_DEF": 10, "MP": 60, "HEAL_BONUS": 15}},
            "Kolye": {"id": "CL_N_24", "name": "İlahi Güç Kolyesi", "tooltip": "Temel Defans: 6, HP: 50. WIS ve VIT.", "req_level": 24, "req_class": "CLERIC", "stats": {"WIS": 4, "VIT": 5, "RAW_DEF": 6, "HP": 50, "M_DEF": 8}},
            "Pelerin": {"id": "CL_C_24", "name": "Kutsal Pelerin", "tooltip": "Temel Defans: 18. Fiziksel direnç.", "req_level": 24, "req_class": "CLERIC", "stats": {"P_DEF": 8, "RAW_DEF": 18, "M_DEF": 10}},
            "Offhand": {"id": "CL_O_24", "name": "Mühürlü Kitap", "tooltip": "Temel Defans: 18, MP: 130. Mana ve şifa.", "req_level": 24, "req_class": "CLERIC", "stats": {"FOC": 8, "WIS": 6, "RAW_DEF": 18, "MP": 130, "HEAL_BONUS": 20}}
        },
        "34": {
            "Silah": {"id": "CL_W_34", "name": "Kutsal Güç Asa", "tooltip": "Temel Saldırı: 80. Şifa gücü ve cast hızı.", "req_level": 34, "req_class": "CLERIC", "stats": {"WIS": 16, "HEAL_BONUS": 60, "FOC": 4, "RAW_ATK": 80, "CSPD_BONUS": 4}},
            "Kask": {"id": "CL_H_34", "name": "Yüce Başlık", "tooltip": "Temel Defans: 30, MP: 130. FOC odaklı.", "req_level": 34, "req_class": "CLERIC", "stats": {"FOC": 12, "M_DEF": 25, "WIS": 4, "RAW_DEF": 30, "MP": 130, "HP": 90, "M_DEF_BONUS": 5}},
            "Zırh": {"id": "CL_A_34", "name": "Şifa Cübbesi", "tooltip": "Temel Defans: 70, HP: 120. Yüksek M_DEF.", "req_level": 34, "req_class": "CLERIC", "stats": {"WIS": 10, "VIT": 8, "M_DEF": 50, "RAW_DEF": 70, "HP": 120, "MP": 120, "HP_REGEN": 3}},
            "Pantolon": {"id": "CL_P_34", "name": "İlahi Kumaş Pantolon", "tooltip": "Temel Defans: 45, MP: 250. Mana havuzu.", "req_level": 34, "req_class": "CLERIC", "stats": {"FOC": 12, "M_DEF": 35, "RAW_DEF": 45, "MP": 250, "HP": 80}},
            "Eldiven": {"id": "CL_G_34", "name": "Sonsuz Şifa Eldiveni", "tooltip": "Temel Defans: 20. Şifa gücü artışı.", "req_level": 34, "req_class": "CLERIC", "stats": {"WIS": 10, "HEAL_BONUS": 30, "RAW_DEF": 20, "CSPD_BONUS": 5}},
            "Bileklik": {"id": "CL_WR_34", "name": "Ruh Bilekliği", "tooltip": "Temel Defans: 12, MP: 80. WIS ve FOC.", "req_level": 34, "req_class": "CLERIC", "stats": {"WIS": 8, "FOC": 6, "RAW_DEF": 12, "MP": 80, "HEAL_BONUS": 25}},
            "Kolye": {"id": "CL_N_34", "name": "Koruyucu Kolye", "tooltip": "Temel Defans: 8, HP: 80. WIS ve VIT.", "req_level": 34, "req_class": "CLERIC", "stats": {"WIS": 5, "VIT": 7, "RAW_DEF": 8, "HP": 80, "M_DEF": 12}},
            "Pelerin": {"id": "CL_C_34", "name": "Merhamet Pelerini", "tooltip": "Temel Defans: 25. Fiziksel direnç.", "req_level": 34, "req_class": "CLERIC", "stats": {"P_DEF": 12, "RAW_DEF": 25, "M_DEF": 15}},
            "Offhand": {"id": "CL_O_34", "name": "Şifa Kitabı", "tooltip": "Temel Defans: 25, MP: 180. Mana ve şifa.", "req_level": 34, "req_class": "CLERIC", "stats": {"FOC": 12, "WIS": 8, "RAW_DEF": 25, "MP": 180, "HEAL_BONUS": 30}}
        },
        "42": {
            "Silah": {"id": "CL_W_42", "name": "Kadim Şifa Asası", "tooltip": "Temel Saldırı: 100. Şifa gücü ve cast hızı.", "req_level": 42, "req_class": "CLERIC", "stats": {"WIS": 22, "HEAL_BONUS": 75, "FOC": 5, "RAW_ATK": 100, "CSPD_BONUS": 5}},
            "Kask": {"id": "CL_H_42", "name": "İlahi Taç", "tooltip": "Temel Defans: 40, MP: 180. FOC odaklı.", "req_level": 42, "req_class": "CLERIC", "stats": {"FOC": 15, "M_DEF": 35, "WIS": 5, "RAW_DEF": 40, "MP": 180, "HP": 120}},
            "Zırh": {"id": "CL_A_42", "name": "Ustalar Cübbesi", "tooltip": "Temel Defans: 90, HP: 160. Orta-üst düzey M_DEF.", "req_level": 42, "req_class": "CLERIC", "stats": {"WIS": 15, "VIT": 10, "M_DEF": 65, "RAW_DEF": 90, "HP": 160, "MP": 200, "HP_REGEN": 5}},
            "Pantolon": {"id": "CL_P_42", "name": "Ruhani Pantolon", "tooltip": "Temel Defans: 60, MP: 350. Mana havuzu.", "req_level": 42, "req_class": "CLERIC", "stats": {"FOC": 15, "M_DEF": 45, "RAW_DEF": 60, "MP": 350, "HP": 120}},
            "Eldiven": {"id": "CL_G_42", "name": "İlahi El Eldiveni", "tooltip": "Temel Defans: 25. Şifa gücü artışı.", "req_level": 42, "req_class": "CLERIC", "stats": {"WIS": 15, "HEAL_BONUS": 40, "RAW_DEF": 25, "CSPD_BONUS": 6}},
            "Bileklik": {"id": "CL_WR_42", "name": "Uyum Bilekliği", "tooltip": "Temel Defans: 15, MP: 120. WIS ve FOC.", "req_level": 42, "req_class": "CLERIC", "stats": {"WIS": 10, "FOC": 8, "RAW_DEF": 15, "MP": 120, "HEAL_BONUS": 35}},
            "Kolye": {"id": "CL_N_42", "name": "Yaşam Ağacı Kolyesi", "tooltip": "Temel Defans: 12, HP: 120. WIS ve VIT.", "req_level": 42, "req_class": "CLERIC", "stats": {"WIS": 7, "VIT": 9, "RAW_DEF": 12, "HP": 120, "M_DEF": 20}},
            "Pelerin": {"id": "CL_C_42", "name": "Şefkat Pelerini", "tooltip": "Temel Defans: 35. Fiziksel direnç.", "req_level": 42, "req_class": "CLERIC", "stats": {"P_DEF": 15, "RAW_DEF": 35, "M_DEF": 20}},
            "Offhand": {"id": "CL_O_42", "name": "Kutsal Kalp", "tooltip": "Temel Defans: 30, MP: 250. Mana ve şifa.", "req_level": 42, "req_class": "CLERIC", "stats": {"FOC": 15, "WIS": 10, "RAW_DEF": 30, "MP": 250, "HEAL_BONUS": 40}}
        },
        "48": {
            "Silah": {"id": "CL_W_48", "name": "Gök Işığı Asa", "tooltip": "Temel Saldırı: 120. Şifa gücü ve cast hızı.", "req_level": 48, "req_class": "CLERIC", "stats": {"WIS": 25, "HEAL_BONUS": 85, "FOC": 6, "RAW_ATK": 120, "CSPD_BONUS": 6, "M_CRIT_BONUS": 1}},
            "Kask": {"id": "CL_H_48", "name": "Ebedi Başlık", "tooltip": "Temel Defans: 50, MP: 220. FOC odaklı.", "req_level": 48, "req_class": "CLERIC", "stats": {"FOC": 18, "M_DEF": 42, "WIS": 6, "RAW_DEF": 50, "MP": 220, "HP": 150, "HP_REGEN": 6}},
            "Zırh": {"id": "CL_A_48", "name": "Yüce Şifa Cübbesi", "tooltip": "Temel Defans: 110, HP: 200. Yüksek M_DEF.", "req_level": 48, "req_class": "CLERIC", "stats": {"WIS": 18, "VIT": 12, "M_DEF": 80, "RAW_DEF": 110, "HP": 200, "MP": 250}},
            "Pantolon": {"id": "CL_P_48", "name": "Işık Pantolonu", "tooltip": "Temel Defans: 75, MP: 450. Mana havuzu.", "req_level": 48, "req_class": "CLERIC", "stats": {"FOC": 18, "M_DEF": 55, "RAW_DEF": 75, "MP": 450, "HP": 150}},
            "Eldiven": {"id": "CL_G_48", "name": "İlahi Güç Eldiveni", "tooltip": "Temel Defans: 30. Şifa gücü artışı.", "req_level": 48, "req_class": "CLERIC", "stats": {"WIS": 18, "HEAL_BONUS": 50, "RAW_DEF": 30, "CSPD_BONUS": 7}},
            "Bileklik": {"id": "CL_WR_48", "name": "Yüce Şifa Bilekliği", "tooltip": "Temel Defans: 18, MP: 150. WIS ve FOC.", "req_level": 48, "req_class": "CLERIC", "stats": {"WIS": 12, "FOC": 10, "RAW_DEF": 18, "MP": 150, "HEAL_BONUS": 40}},
            "Kolye": {"id": "CL_N_48", "name": "Mübarek Kolye", "tooltip": "Temel Defans: 15, HP: 150. WIS ve VIT.", "req_level": 48, "req_class": "CLERIC", "stats": {"WIS": 9, "VIT": 11, "RAW_DEF": 15, "HP": 150, "M_DEF": 25}},
            "Pelerin": {"id": "CL_C_48", "name": "Gölge Kutsal Pelerin", "tooltip": "Temel Defans: 40. Fiziksel direnç.", "req_level": 48, "req_class": "CLERIC", "stats": {"P_DEF": 18, "RAW_DEF": 40, "M_DEF": 25}},
            "Offhand": {"id": "CL_O_48", "name": "Kutsal Mühür", "tooltip": "Temel Defans: 40, MP: 300. Mana ve şifa.", "req_level": 48, "req_class": "CLERIC", "stats": {"FOC": 18, "WIS": 12, "RAW_DEF": 40, "MP": 300, "HEAL_BONUS": 50}}
        },
        "54": {
            "Silah": {"id": "CL_W_54", "name": "Mistik Işık Asa", "tooltip": "Temel Saldırı: 140. Şifa gücü ve cast hızı.", "req_level": 54, "req_class": "CLERIC", "stats": {"WIS": 29, "HEAL_BONUS": 95, "FOC": 7, "RAW_ATK": 140, "CSPD_BONUS": 7, "M_DEF": 45}},
            "Kask": {"id": "CL_H_54", "name": "Işık Taç", "tooltip": "Temel Defans: 60, MP: 250. FOC odaklı.", "req_level": 54, "req_class": "CLERIC", "stats": {"FOC": 22, "M_DEF": 50, "WIS": 8, "RAW_DEF": 60, "MP": 250, "HP": 200, "HP_REGEN": 8}},
            "Zırh": {"id": "CL_A_54", "name": "Sonsuz Şifa Cübbesi", "tooltip": "Temel Defans: 130, HP: 250. Maksimum M_DEF.", "req_level": 54, "req_class": "CLERIC", "stats": {"WIS": 22, "VIT": 15, "M_DEF": 95, "RAW_DEF": 130, "HP": 250, "MP": 350}},
            "Pantolon": {"id": "CL_P_54", "name": "Kutsal Enerji Pantolonu", "tooltip": "Temel Defans: 90, MP: 550. Mana havuzu.", "req_level": 54, "req_class": "CLERIC", "stats": {"FOC": 22, "M_DEF": 65, "RAW_DEF": 90, "MP": 550, "HP": 180}},
            "Eldiven": {"id": "CL_G_54", "name": "Yüce Şefkat Eldiveni", "tooltip": "Temel Defans: 35. Şifa gücü artışı.", "req_level": 54, "req_class": "CLERIC", "stats": {"WIS": 22, "HEAL_BONUS": 60, "RAW_DEF": 35, "CSPD_BONUS": 8}},
            "Bileklik": {"id": "CL_WR_54", "name": "Mistik Bileklik", "tooltip": "Temel Defans: 22, MP: 180. WIS ve FOC.", "req_level": 54, "req_class": "CLERIC", "stats": {"WIS": 15, "FOC": 12, "RAW_DEF": 22, "MP": 180, "HEAL_BONUS": 55}},
            "Kolye": {"id": "CL_N_54", "name": "Mistik Işık Kolyesi", "tooltip": "Temel Defans: 20, HP: 200. WIS ve VIT.", "req_level": 54, "req_class": "CLERIC", "stats": {"WIS": 12, "VIT": 14, "RAW_DEF": 20, "HP": 200, "M_DEF": 30}},
            "Pelerin": {"id": "CL_C_54", "name": "İlahi Koruma Pelerini", "tooltip": "Temel Defans: 50. Fiziksel direnç.", "req_level": 54, "req_class": "CLERIC", "stats": {"P_DEF": 22, "RAW_DEF": 50, "M_DEF": 30}},
            "Offhand": {"id": "CL_O_54", "name": "Sonsuz Hikmet", "tooltip": "Temel Defans: 50, MP: 350. Mana ve şifa.", "req_level": 54, "req_class": "CLERIC", "stats": {"FOC": 22, "WIS": 15, "RAW_DEF": 50, "MP": 350, "HEAL_BONUS": 65}}
        },
        "66": {
            "Silah": {"id": "CL_W_66", "name": "Ebedi Işık Asa", "tooltip": "Temel Saldırı: 160. Şifa gücü ve cast hızı.", "req_level": 66, "req_class": "CLERIC", "stats": {"WIS": 35, "HEAL_BONUS": 110, "FOC": 8, "RAW_ATK": 160, "CSPD_BONUS": 9, "M_CRIT_BONUS": 2}},
            "Kask": {"id": "CL_H_66", "name": "Yüce Ruhani Taç", "tooltip": "Temel Defans: 75, MP: 300. FOC odaklı.", "req_level": 66, "req_class": "CLERIC", "stats": {"FOC": 25, "M_DEF": 60, "WIS": 10, "RAW_DEF": 75, "MP": 300, "HP": 250, "HP_REGEN": 10}},
            "Zırh": {"id": "CL_A_66", "name": "Ebedi İnanç Cübbesi", "tooltip": "Temel Defans: 150, HP: 300. Maksimum M_DEF.", "req_level": 66, "req_class": "CLERIC", "stats": {"WIS": 25, "VIT": 18, "M_DEF": 110, "RAW_DEF": 150, "HP": 300, "MP": 450}},
            "Pantolon": {"id": "CL_P_66", "name": "İlahi Işık Pantolonu", "tooltip": "Temel Defans: 110, MP: 650. Mana havuzu.", "req_level": 66, "req_class": "CLERIC", "stats": {"FOC": 25, "M_DEF": 75, "RAW_DEF": 110, "MP": 650, "HP": 200}},
            "Eldiven": {"id": "CL_G_66", "name": "Tanrısal Dokunuş Eldiveni", "tooltip": "Temel Defans: 40. Şifa gücü artışı.", "req_level": 66, "req_class": "CLERIC", "stats": {"WIS": 25, "HEAL_BONUS": 75, "RAW_DEF": 40, "CSPD_BONUS": 10}},
            "Bileklik": {"id": "CL_WR_66", "name": "Usta Şifa Bilekliği", "tooltip": "Temel Defans: 30, MP: 250. WIS ve FOC.", "req_level": 66, "req_class": "CLERIC", "stats": {"WIS": 18, "FOC": 15, "RAW_DEF": 30, "MP": 250, "HEAL_BONUS": 70}},
            "Kolye": {"id": "CL_N_66", "name": "Tanrının Kalbi Kolyesi", "tooltip": "Temel Defans: 25, HP: 250. WIS ve VIT.", "req_level": 66, "req_class": "CLERIC", "stats": {"WIS": 15, "VIT": 17, "RAW_DEF": 25, "HP": 250, "M_DEF": 40}},
            "Pelerin": {"id": "CL_C_66", "name": "Sonsuz Işık Pelerini", "tooltip": "Temel Defans: 60. Fiziksel direnç.", "req_level": 66, "req_class": "CLERIC", "stats": {"P_DEF": 26, "RAW_DEF": 60, "M_DEF": 35}},
            "Offhand": {"id": "CL_O_66", "name": "Kudret Kitabı", "tooltip": "Temel Defans: 60, MP: 450. Mana ve şifa.", "req_level": 66, "req_class": "CLERIC", "stats": {"FOC": 28, "WIS": 18, "RAW_DEF": 60, "MP": 450, "HEAL_BONUS": 80}}
        },
        "75": {
            "Silah": {"id": "CL_W_75", "name": "İlahi Işık Asası", "tooltip": "Temel Saldırı: 180. Maksimum iyileştirme gücü ve hızı.", "req_level": 75, "req_class": "CLERIC", "stats": {"WIS": 50, "FOC": 15, "HEAL_BONUS": 150, "RAW_ATK": 180, "CSPD_BONUS": 12, "M_CRIT_BONUS": 3}},
            "Kask": {"id": "CL_H_75", "name": "Kutsal Işık Tacı", "tooltip": "Temel Defans: 90, MP: 400. WIS ve mana yenilenmesi.", "req_level": 75, "req_class": "CLERIC", "stats": {"WIS": 20, "FOC": 15, "M_DEF": 70, "RAW_DEF": 90, "MP": 400, "HP": 300, "MP_REGEN": 15}},
            "Zırh": {"id": "CL_A_75", "name": "Kutsanmış Cübbe", "tooltip": "Temel Defans: 170, HP: 350. Dayanıklılık ve büyü savunması.", "req_level": 75, "req_class": "CLERIC", "stats": {"WIS": 25, "VIT": 15, "M_DEF": 130, "RAW_DEF": 170, "HP_REGEN": 10, "HP": 350, "MP": 600}},
            "Pantolon": {"id": "CL_P_75", "name": "İlahi Örgü Pantolon", "tooltip": "Temel Defans: 120, MP: 500. Sağlık ve büyü savunması.", "req_level": 75, "req_class": "CLERIC", "stats": {"FOC": 15, "VIT": 10, "M_DEF": 85, "RAW_DEF": 120, "MP": 500, "HP": 250}},
            "Eldiven": {"id": "CL_G_75", "name": "Merhamet Eldiveni", "tooltip": "Temel Defans: 50. İyileştirme gücünü artırır.", "req_level": 75, "req_class": "CLERIC", "stats": {"WIS": 30, "FOC": 15, "HEAL_BONUS": 20, "RAW_DEF": 50, "CSPD_BONUS": 10}},
            "Bileklik": {"id": "CL_WR_75", "name": "Aydınlanma Bilekliği", "tooltip": "Temel Defans: 40, MP: 300. WIS ve FOC.", "req_level": 75, "req_class": "CLERIC", "stats": {"WIS": 25, "FOC": 20, "RAW_DEF": 40, "MP": 300, "HEAL_BONUS": 100}},
            "Kolye": {"id": "CL_N_75", "name": "Saf Kalp Kolyesi", "tooltip": "Temel Defans: 30, HP: 300. WIS ve HP.", "req_level": 75, "req_class": "CLERIC", "stats": {"WIS": 18, "VIT": 12, "MP": 450, "RAW_DEF": 30, "HP": 300, "M_DEF": 25}},
            "Pelerin": {"id": "CL_C_75", "name": "Şefkat Pelerini", "tooltip": "Temel Defans: 75. Büyü direnci.", "req_level": 75, "req_class": "CLERIC", "stats": {"VIT": 12, "M_DEF": 50, "RAW_DEF": 75, "P_DEF": 35}},
            "Offhand": {"id": "CL_O_75", "name": "Mübarek Kitap", "tooltip": "Temel Defans: 70, MP: 550. Mana yenilenmesi ve iyileştirme gücü.", "req_level": 75, "req_class": "CLERIC", "stats": {"WIS": 35, "MP_REGEN": 15, "HEAL_BONUS": 25, "RAW_DEF": 70, "MP": 550, "FOC": 10}}
        },
    },

    # ------------------------------------------------------------------------------------------------------
    # 9. NECROMANCER (INT/FOC/WIS Odaklı - Kumaş Zırh/Asa + Offhand)
    # ------------------------------------------------------------------------------------------------------
    "NECROMANCER": {
        "1": {
            "Silah": {"id": "N_W_1", "name": "Kemik Asa", "tooltip": "Temel Saldırı: 11. Temel minyon gücü.", "req_level": 1, "req_class": "NECROMANCER", "stats": {"INT": 2, "MAP_BONUS": 4, "RAW_ATK": 11, "SUMMON_ATK_BONUS": 1}},
            "Kask": {"id": "N_H_1", "name": "Kafatası Başlık", "tooltip": "Temel Defans: 3, MP: 10. Temel FOC.", "req_level": 1, "req_class": "NECROMANCER", "stats": {"FOC": 1, "M_DEF": 1, "RAW_DEF": 3, "MP": 10}},
            "Zırh": {"id": "N_A_1", "name": "Ölü Giysisi", "tooltip": "Temel Defans: 8, MP: 20. Temel INT/WIS.", "req_level": 1, "req_class": "NECROMANCER", "stats": {"INT": 1, "WIS": 1, "M_DEF": 3, "RAW_DEF": 8, "MP": 20, "P_DEF": 1}},
            "Pantolon": {"id": "N_P_1", "name": "Hortlak Pantolon", "tooltip": "Temel Defans: 5, MP: 15. Temel FOC.", "req_level": 1, "req_class": "NECROMANCER", "stats": {"FOC": 1, "M_DEF": 2, "RAW_DEF": 5, "MP": 15}},
            "Eldiven": {"id": "N_G_1", "name": "Ruh Eldiveni", "tooltip": "Temel Defans: 2. Temel INT.", "req_level": 1, "req_class": "NECROMANCER", "stats": {"INT": 1, "SUMMON_ATK_BONUS": 1, "RAW_DEF": 2, "CSPD_BONUS": 1}},
            "Bileklik": {"id": "N_WR_1", "name": "Zombi Bilekliği", "tooltip": "Temel Defans: 1, MP: 5. Temel FOC.", "req_level": 1, "req_class": "NECROMANCER", "stats": {"FOC": 1, "RAW_DEF": 1, "MP": 5}},
            "Kolye": {"id": "N_N_1", "name": "Mezar Taşı", "tooltip": "Temel Defans: 1. Temel INT.", "req_level": 1, "req_class": "NECROMANCER", "stats": {"INT": 1, "RAW_DEF": 1, "HP": 5}},
            "Pelerin": {"id": "N_C_1", "name": "Sis Pelerini", "tooltip": "Temel Defans: 3. Temel M_DEF.", "req_level": 1, "req_class": "NECROMANCER", "stats": {"M_DEF": 1, "RAW_DEF": 3, "P_DEF": 1}},
            "Offhand": {"id": "N_O_1", "name": "Ceset Torbası", "tooltip": "Temel Defans: 4, MP: 15. Temel minyon gücü.", "req_level": 1, "req_class": "NECROMANCER", "stats": {"INT": 1, "SUMMON_ATK_BONUS": 1, "RAW_DEF": 4, "MP": 15}}
        },
        "9": {
            "Silah": {"id": "N_W_9", "name": "Paslı Kemik Asa", "tooltip": "Temel Saldırı: 23. Gelişmiş minyon gücü.", "req_level": 9, "req_class": "NECROMANCER", "stats": {"INT": 5, "MAP_BONUS": 12, "RAW_ATK": 23, "SUMMON_ATK_BONUS": 3, "M_CRIT_BONUS": 1}},
            "Kask": {"id": "N_H_9", "name": "Gölge Başlık", "tooltip": "Temel Defans: 8, MP: 40. Temel FOC.", "req_level": 9, "req_class": "NECROMANCER", "stats": {"FOC": 3, "M_DEF": 5, "INT": 1, "RAW_DEF": 8, "MP": 40}},
            "Zırh": {"id": "N_A_9", "name": "Ruh Sargısı", "tooltip": "Temel Defans: 20, MP: 70. Daha iyi M_DEF.", "req_level": 9, "req_class": "NECROMANCER", "stats": {"INT": 3, "WIS": 2, "M_DEF": 12, "RAW_DEF": 20, "MP": 70, "SUMMON_HP_BONUS": 10}},
            "Pantolon": {"id": "N_P_9", "name": "Zombi Pantolonu", "tooltip": "Temel Defans: 15, MP: 50. Temel MP.", "req_level": 9, "req_class": "NECROMANCER", "stats": {"FOC": 4, "M_DEF": 8, "RAW_DEF": 15, "MP": 50, "HP": 30}},
            "Eldiven": {"id": "N_G_9", "name": "Gölge Eldiveni", "tooltip": "Temel Defans: 5. Minyon saldırısı.", "req_level": 9, "req_class": "NECROMANCER", "stats": {"INT": 3, "SUMMON_ATK_BONUS": 5, "RAW_DEF": 5, "CSPD_BONUS": 1}},
            "Bileklik": {"id": "N_WR_9", "name": "Ölüm Bilekliği", "tooltip": "Temel Defans: 3, MP: 20. INT ve FOC.", "req_level": 9, "req_class": "NECROMANCER", "stats": {"INT": 2, "FOC": 2, "RAW_DEF": 3, "MP": 20, "M_DEF": 2}},
            "Kolye": {"id": "N_N_9", "name": "Lanetli Tılsım", "tooltip": "Temel Defans: 2, MP: 30. Temel INT/WIS.", "req_level": 9, "req_class": "NECROMANCER", "stats": {"WIS": 2, "INT": 1, "RAW_DEF": 2, "MP": 30, "M_DEF": 3}},
            "Pelerin": {"id": "N_C_9", "name": "Ruh Pelerini", "tooltip": "Temel Defans: 7. Temel P_DEF.", "req_level": 9, "req_class": "NECROMANCER", "stats": {"P_DEF": 3, "RAW_DEF": 7, "M_DEF": 5}},
            "Offhand": {"id": "N_O_9", "name": "Ruh Taşı", "tooltip": "Temel Defans: 7, MP: 50. Mana ve minyon.", "req_level": 9, "req_class": "NECROMANCER", "stats": {"FOC": 3, "SUMMON_ATK_BONUS": 2, "RAW_DEF": 7, "MP": 50}}
        },
        "18": {
            "Silah": {"id": "N_W_18", "name": "Minyon Çağıran Asa", "tooltip": "Temel Saldırı: 42. Minyon gücü ve büyü hasarı.", "req_level": 18, "req_class": "NECROMANCER", "stats": {"INT": 9, "MAP_BONUS": 25, "RAW_ATK": 42, "SUMMON_ATK_BONUS": 8, "M_CRIT_BONUS": 2}},
            "Kask": {"id": "N_H_18", "name": "Kemik Miğfer", "tooltip": "Temel Defans: 15, MP: 70. FOC odaklı.", "req_level": 18, "req_class": "NECROMANCER", "stats": {"FOC": 6, "M_DEF": 12, "INT": 2, "RAW_DEF": 15, "MP": 70, "SUMMON_HP_BONUS": 15}},
            "Zırh": {"id": "N_A_18", "name": "Hortlak Cübbesi", "tooltip": "Temel Defans: 35, MP: 120. Orta M_DEF.", "req_level": 18, "req_class": "NECROMANCER", "stats": {"INT": 6, "WIS": 4, "M_DEF": 25, "RAW_DEF": 35, "MP": 120, "SOUL_LEECH": 1}},
            "Pantolon": {"id": "N_P_18", "name": "Ruhani Pantolon", "tooltip": "Temel Defans: 25, MP: 100. Mana havuzu.", "req_level": 18, "req_class": "NECROMANCER", "stats": {"FOC": 8, "M_DEF": 18, "RAW_DEF": 25, "MP": 100, "HP": 40}},
            "Eldiven": {"id": "N_G_18", "name": "Varlık Eldiveni", "tooltip": "Temel Defans: 10. Minyon saldırısı.", "req_level": 18, "req_class": "NECROMANCER", "stats": {"INT": 5, "SUMMON_ATK_BONUS": 10, "RAW_DEF": 10, "CSPD_BONUS": 2}},
            "Bileklik": {"id": "N_WR_18", "name": "İskelet Bilekliği", "tooltip": "Temel Defans: 5, MP: 40. INT ve FOC.", "req_level": 18, "req_class": "NECROMANCER", "stats": {"INT": 4, "FOC": 4, "RAW_DEF": 5, "MP": 40, "M_DEF": 5}},
            "Kolye": {"id": "N_N_18", "name": "Ruh Zinciri", "tooltip": "Temel Defans: 4, HP: 30. WIS ve INT.", "req_level": 18, "req_class": "NECROMANCER", "stats": {"WIS": 4, "INT": 3, "RAW_DEF": 4, "HP": 30, "M_DEF": 5}},
            "Pelerin": {"id": "N_C_18", "name": "Karanlık Pelerin", "tooltip": "Temel Defans: 12. Fiziksel direnç.", "req_level": 18, "req_class": "NECROMANCER", "stats": {"P_DEF": 6, "RAW_DEF": 12, "M_DEF": 8}},
            "Offhand": {"id": "N_O_18", "name": "Kemik Kitabı", "tooltip": "Temel Defans: 12, MP: 90. Mana ve minyon.", "req_level": 18, "req_class": "NECROMANCER", "stats": {"FOC": 6, "SUMMON_ATK_BONUS": 5, "RAW_DEF": 12, "MP": 90, "SUMMON_HP_BONUS": 20}}
        },
        "24": {
            "Silah": {"id": "N_W_24", "name": "Veba Asası", "tooltip": "Temel Saldırı: 60. Minyon gücü ve büyü hasarı.", "req_level": 24, "req_class": "NECROMANCER", "stats": {"INT": 12, "MAP_BONUS": 35, "RAW_ATK": 60, "SUMMON_ATK_BONUS": 12, "M_CRIT_BONUS": 3}},
            "Kask": {"id": "N_H_24", "name": "Kabus Başlığı", "tooltip": "Temel Defans: 22, MP: 100. FOC odaklı.", "req_level": 24, "req_class": "NECROMANCER", "stats": {"FOC": 8, "M_DEF": 18, "INT": 3, "RAW_DEF": 22, "MP": 100, "SUMMON_HP_BONUS": 20}},
            "Zırh": {"id": "N_A_24", "name": "Karanlık Cübbe", "tooltip": "Temel Defans: 50, MP: 180. Yüksek M_DEF.", "req_level": 24, "req_class": "NECROMANCER", "stats": {"INT": 8, "WIS": 6, "M_DEF": 35, "RAW_DEF": 50, "MP": 180, "SOUL_LEECH": 2}},
            "Pantolon": {"id": "N_P_24", "name": "Ölü Adamın Pantolonu", "tooltip": "Temel Defans: 35, MP: 150. Mana havuzu.", "req_level": 24, "req_class": "NECROMANCER", "stats": {"FOC": 10, "M_DEF": 25, "RAW_DEF": 35, "MP": 150, "HP": 60}},
            "Eldiven": {"id": "N_G_24", "name": "Kemik Eldiveni", "tooltip": "Temel Defans: 15. Minyon saldırısı.", "req_level": 24, "req_class": "NECROMANCER", "stats": {"INT": 7, "SUMMON_ATK_BONUS": 15, "RAW_DEF": 15, "CSPD_BONUS": 3}},
            "Bileklik": {"id": "N_WR_24", "name": "Hortlak Bilekliği", "tooltip": "Temel Defans: 10, MP: 60. INT ve FOC.", "req_level": 24, "req_class": "NECROMANCER", "stats": {"INT": 6, "FOC": 4, "RAW_DEF": 10, "MP": 60, "SUMMON_ATK_BONUS": 3}},
            "Kolye": {"id": "N_N_24", "name": "Lanet Mührü", "tooltip": "Temel Defans: 6, HP: 50. WIS ve INT.", "req_level": 24, "req_class": "NECROMANCER", "stats": {"WIS": 5, "INT": 4, "RAW_DEF": 6, "HP": 50, "M_DEF": 8}},
            "Pelerin": {"id": "N_C_24", "name": "Sis Lordu Pelerini", "tooltip": "Temel Defans: 18. Fiziksel direnç.", "req_level": 24, "req_class": "NECROMANCER", "stats": {"P_DEF": 8, "RAW_DEF": 18, "M_DEF": 10}},
            "Offhand": {"id": "N_O_24", "name": "Varlık Tılsımı", "tooltip": "Temel Defans: 18, MP: 130. Mana ve minyon.", "req_level": 24, "req_class": "NECROMANCER", "stats": {"FOC": 8, "SUMMON_ATK_BONUS": 8, "RAW_DEF": 18, "MP": 130, "SUMMON_HP_BONUS": 30}}
        },
        "34": {
            "Silah": {"id": "N_W_34", "name": "Ruh Lordu Asa", "tooltip": "Temel Saldırı: 80. Minyon gücü ve büyü hasarı.", "req_level": 34, "req_class": "NECROMANCER", "stats": {"INT": 16, "MAP_BONUS": 50, "RAW_ATK": 80, "SUMMON_ATK_BONUS": 18, "M_CRIT_BONUS": 4}},
            "Kask": {"id": "N_H_34", "name": "Hayalet Miğferi", "tooltip": "Temel Defans: 30, MP: 130. FOC odaklı.", "req_level": 34, "req_class": "NECROMANCER", "stats": {"FOC": 12, "M_DEF": 25, "INT": 4, "RAW_DEF": 30, "MP": 130, "SUMMON_HP_BONUS": 30}},
            "Zırh": {"id": "N_A_34", "name": "Ruhani Zırh", "tooltip": "Temel Defans: 70, MP: 250. Yüksek M_DEF.", "req_level": 34, "req_class": "NECROMANCER", "stats": {"INT": 10, "WIS": 8, "M_DEF": 50, "RAW_DEF": 70, "MP": 250, "SOUL_LEECH": 3, "HP": 100}},
            "Pantolon": {"id": "N_P_34", "name": "Minyon Pantolonu", "tooltip": "Temel Defans: 45, MP: 250. Mana havuzu.", "req_level": 34, "req_class": "NECROMANCER", "stats": {"FOC": 12, "M_DEF": 35, "RAW_DEF": 45, "MP": 250, "HP": 90}},
            "Eldiven": {"id": "N_G_34", "name": "Minyon Çağırıcı Eldiven", "tooltip": "Temel Defans: 20. Minyon saldırısı.", "req_level": 34, "req_class": "NECROMANCER", "stats": {"INT": 10, "SUMMON_ATK_BONUS": 22, "RAW_DEF": 20, "CSPD_BONUS": 4}},
            "Bileklik": {"id": "N_WR_34", "name": "Minyon Bilekliği", "tooltip": "Temel Defans: 12, MP: 80. INT ve FOC.", "req_level": 34, "req_class": "NECROMANCER", "stats": {"INT": 8, "FOC": 6, "RAW_DEF": 12, "MP": 80, "SUMMON_ATK_BONUS": 5}},
            "Kolye": {"id": "N_N_34", "name": "Veba Kolyesi", "tooltip": "Temel Defans: 8, HP: 80. WIS ve INT.", "req_level": 34, "req_class": "NECROMANCER", "stats": {"WIS": 7, "INT": 5, "RAW_DEF": 8, "HP": 80, "M_DEF": 12}},
            "Pelerin": {"id": "N_C_34", "name": "Gölge Lordu Pelerini", "tooltip": "Temel Defans: 25. Fiziksel direnç.", "req_level": 34, "req_class": "NECROMANCER", "stats": {"P_DEF": 12, "RAW_DEF": 25, "M_DEF": 15}},
            "Offhand": {"id": "N_O_34", "name": "Lanetli Kitap", "tooltip": "Temel Defans: 25, MP: 180. Mana ve minyon.", "req_level": 34, "req_class": "NECROMANCER", "stats": {"FOC": 12, "SUMMON_ATK_BONUS": 12, "RAW_DEF": 25, "MP": 180, "SUMMON_HP_BONUS": 50}}
        },
        "42": {
            "Silah": {"id": "N_W_42", "name": "Sonsuz Ölüm Asa", "tooltip": "Temel Saldırı: 100. Minyon gücü ve büyü hasarı.", "req_level": 42, "req_class": "NECROMANCER", "stats": {"INT": 22, "MAP_BONUS": 65, "RAW_ATK": 100, "SUMMON_ATK_BONUS": 25, "M_CRIT_BONUS": 5}},
            "Kask": {"id": "N_H_42", "name": "Gölge Lordu Miğferi", "tooltip": "Temel Defans: 40, MP: 180. FOC odaklı.", "req_level": 42, "req_class": "NECROMANCER", "stats": {"FOC": 15, "M_DEF": 35, "INT": 5, "RAW_DEF": 40, "MP": 180, "SUMMON_HP_BONUS": 40}},
            "Zırh": {"id": "N_A_42", "name": "Lich Giysisi", "tooltip": "Temel Defans: 90, MP: 350. Orta-üst düzey M_DEF.", "req_level": 42, "req_class": "NECROMANCER", "stats": {"INT": 15, "WIS": 10, "M_DEF": 65, "RAW_DEF": 90, "MP": 350, "HP": 120, "SOUL_LEECH": 4}},
            "Pantolon": {"id": "N_P_42", "name": "Varlık Pantolonu", "tooltip": "Temel Defans: 60, MP: 350. Mana havuzu.", "req_level": 42, "req_class": "NECROMANCER", "stats": {"FOC": 15, "M_DEF": 45, "RAW_DEF": 60, "MP": 350, "HP": 120}},
            "Eldiven": {"id": "N_G_42", "name": "Ruh Emici Eldiven", "tooltip": "Temel Defans: 25. Minyon saldırısı.", "req_level": 42, "req_class": "NECROMANCER", "stats": {"INT": 15, "SUMMON_ATK_BONUS": 30, "RAW_DEF": 25, "CSPD_BONUS": 5}},
            "Bileklik": {"id": "N_WR_42", "name": "Ruhani Bilekliği", "tooltip": "Temel Defans: 15, MP: 120. INT ve FOC.", "req_level": 42, "req_class": "NECROMANCER", "stats": {"INT": 10, "FOC": 8, "RAW_DEF": 15, "MP": 120, "SUMMON_ATK_BONUS": 7}},
            "Kolye": {"id": "N_N_42", "name": "Ölümün Nefesi Kolyesi", "tooltip": "Temel Defans: 12, HP: 120. WIS ve INT.", "req_level": 42, "req_class": "NECROMANCER", "stats": {"WIS": 9, "INT": 7, "RAW_DEF": 12, "HP": 120, "M_DEF": 20}},
            "Pelerin": {"id": "N_C_42", "name": "Hayalet Pelerini", "tooltip": "Temel Defans: 35. Fiziksel direnç.", "req_level": 42, "req_class": "NECROMANCER", "stats": {"P_DEF": 15, "RAW_DEF": 35, "M_DEF": 20}},
            "Offhand": {"id": "N_O_42", "name": "Gölge Kitabı", "tooltip": "Temel Defans: 30, MP: 250. Mana ve minyon.", "req_level": 42, "req_class": "NECROMANCER", "stats": {"FOC": 15, "SUMMON_ATK_BONUS": 18, "RAW_DEF": 30, "MP": 250, "SUMMON_HP_BONUS": 70}}
        },
        "48": {
            "Silah": {"id": "N_W_48", "name": "Ebedi Kış Asası", "tooltip": "Temel Saldırı: 120. Minyon gücü ve büyü hasarı.", "req_level": 48, "req_class": "NECROMANCER", "stats": {"INT": 25, "MAP_BONUS": 75, "RAW_ATK": 120, "SUMMON_ATK_BONUS": 32, "M_CRIT_BONUS": 6}},
            "Kask": {"id": "N_H_48", "name": "Lich Başlığı", "tooltip": "Temel Defans: 50, MP: 220. FOC odaklı.", "req_level": 48, "req_class": "NECROMANCER", "stats": {"FOC": 18, "M_DEF": 42, "INT": 6, "RAW_DEF": 50, "MP": 220, "SUMMON_HP_BONUS": 50}},
            "Zırh": {"id": "N_A_48", "name": "Lich Lordu Giysisi", "tooltip": "Temel Defans: 110, MP: 450. Yüksek M_DEF.", "req_level": 48, "req_class": "NECROMANCER", "stats": {"INT": 18, "WIS": 12, "M_DEF": 80, "RAW_DEF": 110, "MP": 450, "HP": 150, "SOUL_LEECH": 5}},
            "Pantolon": {"id": "N_P_48", "name": "Karanlık Enerji Pantolonu", "tooltip": "Temel Defans: 75, MP: 450. Mana havuzu.", "req_level": 48, "req_class": "NECROMANCER", "stats": {"FOC": 18, "M_DEF": 55, "RAW_DEF": 75, "MP": 450, "HP": 150}},
            "Eldiven": {"id": "N_G_48", "name": "Yüce Hortlak Eldiveni", "tooltip": "Temel Defans: 30. Minyon saldırısı.", "req_level": 48, "req_class": "NECROMANCER", "stats": {"INT": 18, "SUMMON_ATK_BONUS": 38, "RAW_DEF": 30, "CSPD_BONUS": 6}},
            "Bileklik": {"id": "N_WR_48", "name": "Ruhani Çağrı Bilekliği", "tooltip": "Temel Defans: 18, MP: 150. INT ve FOC.", "req_level": 48, "req_class": "NECROMANCER", "stats": {"INT": 12, "FOC": 10, "RAW_DEF": 18, "MP": 150, "SUMMON_ATK_BONUS": 10}},
            "Kolye": {"id": "N_N_48", "name": "Kara Büyü Kolyesi", "tooltip": "Temel Defans: 15, HP: 150. WIS ve INT.", "req_level": 48, "req_class": "NECROMANCER", "stats": {"WIS": 11, "INT": 9, "RAW_DEF": 15, "HP": 150, "MP_REGEN": 3}},
            "Pelerin": {"id": "N_C_48", "name": "Ölümsüz Pelerin", "tooltip": "Temel Defans: 40. Fiziksel direnç.", "req_level": 48, "req_class": "NECROMANCER", "stats": {"P_DEF": 18, "RAW_DEF": 40, "M_DEF": 25}},
            "Offhand": {"id": "N_O_48", "name": "Ruhani Kodeks", "tooltip": "Temel Defans: 40, MP: 300. Mana ve minyon.", "req_level": 48, "req_class": "NECROMANCER", "stats": {"FOC": 18, "SUMMON_ATK_BONUS": 25, "RAW_DEF": 40, "MP": 300, "SUMMON_HP_BONUS": 90}}
        },
        "54": {
            "Silah": {"id": "N_W_54", "name": "Kara Mühür Asa", "tooltip": "Temel Saldırı: 140. Minyon gücü ve büyü hasarı.", "req_level": 54, "req_class": "NECROMANCER", "stats": {"INT": 29, "MAP_BONUS": 85, "RAW_ATK": 140, "SUMMON_ATK_BONUS": 45, "M_CRIT_BONUS": 7}},
            "Kask": {"id": "N_H_54", "name": "Yüce Necromancer Başlığı", "tooltip": "Temel Defans: 60, MP: 250. FOC odaklı.", "req_level": 54, "req_class": "NECROMANCER", "stats": {"FOC": 22, "M_DEF": 50, "INT": 8, "RAW_DEF": 60, "MP": 250, "SUMMON_HP_BONUS": 60}},
            "Zırh": {"id": "N_A_54", "name": "Ruh Çağırıcı Cübbesi", "tooltip": "Temel Defans: 130, MP: 550. Maksimum M_DEF.", "req_level": 54, "req_class": "NECROMANCER", "stats": {"INT": 22, "WIS": 15, "M_DEF": 95, "RAW_DEF": 130, "MP": 550, "HP": 200, "SOUL_LEECH": 6}},
            "Pantolon": {"id": "N_P_54", "name": "Lich Pantolonu", "tooltip": "Temel Defans: 90, MP: 550. Mana havuzu.", "req_level": 54, "req_class": "NECROMANCER", "stats": {"FOC": 22, "M_DEF": 65, "RAW_DEF": 90, "MP": 550, "HP": 180}},
            "Eldiven": {"id": "N_G_54", "name": "Lich Eli Eldiveni", "tooltip": "Temel Defans: 35. Minyon saldırısı.", "req_level": 54, "req_class": "NECROMANCER", "stats": {"INT": 22, "SUMMON_ATK_BONUS": 50, "RAW_DEF": 35, "CSPD_BONUS": 7}},
            "Bileklik": {"id": "N_WR_54", "name": "Ebedi Bileklik", "tooltip": "Temel Defans: 22, MP: 180. INT ve FOC.", "req_level": 54, "req_class": "NECROMANCER", "stats": {"INT": 15, "FOC": 12, "RAW_DEF": 22, "MP": 180, "SUMMON_ATK_BONUS": 15}},
            "Kolye": {"id": "N_N_54", "name": "Ölümün Kalbi", "tooltip": "Temel Defans: 20, HP: 200. WIS ve INT.", "req_level": 54, "req_class": "NECROMANCER", "stats": {"WIS": 14, "INT": 12, "RAW_DEF": 20, "HP": 200, "MP": 250}},
            "Pelerin": {"id": "N_C_54", "name": "Yüce Sis Pelerini", "tooltip": "Temel Defans: 50. Fiziksel direnç.", "req_level": 54, "req_class": "NECROMANCER", "stats": {"P_DEF": 22, "RAW_DEF": 50, "M_DEF": 30}},
            "Offhand": {"id": "N_O_54", "name": "Ölüm Mührü", "tooltip": "Temel Defans: 50, MP: 350. Mana ve minyon.", "req_level": 54, "req_class": "NECROMANCER", "stats": {"FOC": 22, "SUMMON_ATK_BONUS": 32, "RAW_DEF": 50, "MP": 350, "SUMMON_HP_BONUS": 120}}
        },
        "66": {
            "Silah": {"id": "N_W_66", "name": "Karanlığın Hükmü Asa", "tooltip": "Temel Saldırı: 160. Minyon gücü ve büyü hasarı.", "req_level": 66, "req_class": "NECROMANCER", "stats": {"INT": 35, "MAP_BONUS": 95, "RAW_ATK": 160, "SUMMON_ATK_BONUS": 55, "M_CRIT_BONUS": 8}},
            "Kask": {"id": "N_H_66", "name": "Ruhani Lord Başlığı", "tooltip": "Temel Defans: 75, MP: 300. FOC odaklı.", "req_level": 66, "req_class": "NECROMANCER", "stats": {"FOC": 25, "M_DEF": 60, "INT": 10, "RAW_DEF": 75, "MP": 300, "HP": 250, "SUMMON_HP_BONUS": 80}},
            "Zırh": {"id": "N_A_66", "name": "Ebedi Çağrı Cübbesi", "tooltip": "Temel Defans: 150, MP: 650. Maksimum M_DEF.", "req_level": 66, "req_class": "NECROMANCER", "stats": {"INT": 25, "WIS": 18, "M_DEF": 110, "RAW_DEF": 150, "MP": 650, "HP": 250, "SOUL_LEECH": 10}},
            "Pantolon": {"id": "N_P_66", "name": "Minyon Lordu Pantolonu", "tooltip": "Temel Defans: 110, MP: 650. Mana havuzu.", "req_level": 66, "req_class": "NECROMANCER", "stats": {"FOC": 25, "M_DEF": 75, "RAW_DEF": 110, "MP": 650, "HP": 200}},
            "Eldiven": {"id": "N_G_66", "name": "Ölümün Eli Eldiveni", "tooltip": "Temel Defans: 40. Minyon saldırısı.", "req_level": 66, "req_class": "NECROMANCER", "stats": {"INT": 25, "SUMMON_ATK_BONUS": 65, "RAW_DEF": 40, "CSPD_BONUS": 8}},
            "Bileklik": {"id": "N_WR_66", "name": "Lich Bilekliği", "tooltip": "Temel Defans: 30, MP: 250. INT ve FOC.", "req_level": 66, "req_class": "NECROMANCER", "stats": {"INT": 18, "FOC": 16, "RAW_DEF": 30, "MP": 250, "SUMMON_ATK_BONUS": 20}},
            "Kolye": {"id": "N_N_66", "name": "Ebedi Lanet Kolyesi", "tooltip": "Temel Defans: 25, HP: 300. WIS ve INT.", "req_level": 66, "req_class": "NECROMANCER", "stats": {"WIS": 17, "INT": 15, "RAW_DEF": 25, "HP": 300, "M_DEF": 40}},
            "Pelerin": {"id": "N_C_66", "name": "Sonsuz Gölge Pelerini", "tooltip": "Temel Defans: 60. Fiziksel direnç.", "req_level": 66, "req_class": "NECROMANCER", "stats": {"P_DEF": 26, "RAW_DEF": 60, "M_DEF": 35}},
            "Offhand": {"id": "N_O_66", "name": "Yüce Kemik Kitabı", "tooltip": "Temel Defans: 60, MP: 450. Mana ve minyon.", "req_level": 66, "req_class": "NECROMANCER", "stats": {"FOC": 28, "SUMMON_ATK_BONUS": 40, "RAW_DEF": 60, "MP": 450, "SUMMON_HP_BONUS": 150}}
        },
        "75": {
            "Silah": {"id": "N_W_75", "name": "Ebedi Kış Asası", "tooltip": "Temel Saldırı: 180. Minyonların gücünü artırır.", "req_level": 75, "req_class": "NECROMANCER", "stats": {"INT": 40, "FOC": 20, "MAP_BONUS": 110, "RAW_ATK": 180, "SUMMON_ATK_BONUS": 75, "M_CRIT_BONUS": 8}},
            "Kask": {"id": "N_H_75", "name": "Lich Miğferi", "tooltip": "Temel Defans: 90, MP: 400. INT ve FOC.", "req_level": 75, "req_class": "NECROMANCER", "stats": {"INT": 20, "FOC": 15, "M_DEF": 70, "RAW_DEF": 90, "MP": 400, "SUMMON_HP_BONUS": 100}},
            "Zırh": {"id": "N_A_75", "name": "Ölümün Örtüsü", "tooltip": "Temel Defans: 170, HP: 350. Summoner'ı korur ve diriltmeleri destekler.", "req_level": 75, "req_class": "NECROMANCER", "stats": {"INT": 25, "FOC": 15, "M_DEF": 130, "RAW_DEF": 170, "MP_REGEN": 10, "HP": 350, "MP": 800, "SOUL_LEECH": 12}},
            "Pantolon": {"id": "N_P_75", "name": "Ruhani Pantolon", "tooltip": "Temel Defans: 120, MP: 500. Minyon canı ve FOC.", "req_level": 75, "req_class": "NECROMANCER", "stats": {"FOC": 20, "VIT": 10, "SUMMON_HP_BONUS": 25, "RAW_DEF": 120, "MP": 500, "HP": 250}},
            "Eldiven": {"id": "N_G_75", "name": "Minyon Kontrol Eldiveni", "tooltip": "Temel Defans: 50. Minyon saldırısını ve cast hızını artırır.", "req_level": 75, "req_class": "NECROMANCER", "stats": {"INT": 25, "FOC": 15, "SUMMON_ATK_BONUS": 85, "RAW_DEF": 50, "CSPD_BONUS": 9}},
            "Bileklik": {"id": "N_WR_75", "name": "Diriliş Bilekliği", "tooltip": "Temel Defans: 40, MP: 300. Summon canı ve FOC.", "req_level": 75, "req_class": "NECROMANCER", "stats": {"FOC": 20, "SUMMON_HP_BONUS": 30, "RAW_DEF": 40, "MP": 300, "INT": 10}},
            "Kolye": {"id": "N_N_75", "name": "Kemiklerin Efendisi Kolyesi", "tooltip": "Temel Defans: 30, HP: 300. INT ve WIS.", "req_level": 75, "req_class": "NECROMANCER", "stats": {"INT": 15, "WIS": 15, "HP": 350, "RAW_DEF": 30, "M_DEF": 25}},
            "Pelerin": {"id": "N_C_75", "name": "Veba Pelerini", "tooltip": "Temel Defans: 75. Büyü direnci.", "req_level": 75, "req_class": "NECROMANCER", "stats": {"WIS": 15, "M_DEF": 50, "RAW_DEF": 75, "P_DEF": 35}},
            "Offhand": {"id": "N_O_75", "name": "Kemik Tılsımı", "tooltip": "Temel Defans: 70, MP: 550. Minyon sayısını ve DoT gücünü destekler.", "req_level": 75, "req_class": "NECROMANCER", "stats": {"INT": 25, "FOC": 20, "SUMMON_ATK_BONUS": 50, "RAW_DEF": 70, "MP": 550, "SUMMON_HP_BONUS": 150}}
        },
    },
    
    # ------------------------------------------------------------------------------------------------------
    # 10. BARD (FOC/WIS/DEX Odaklı - Kumaş Zırh/Enstrüman + Offhand)
    # ------------------------------------------------------------------------------------------------------
    "BARD": {
        "1": {
            "Silah": {"id": "BA_W_1", "name": "Basit Lir", "tooltip": "Temel Saldırı: 10. Temel destek.", "req_level": 1, "req_class": "BARD", "stats": {"FOC": 2, "HEAL_BONUS": 3, "RAW_ATK": 10, "CSPD_BONUS": 1}},
            "Kask": {"id": "BA_H_1", "name": "Tüy Başlık", "tooltip": "Temel Defans: 3, MP: 10. Temel DEX.", "req_level": 1, "req_class": "BARD", "stats": {"DEX": 1, "M_DEF": 1, "RAW_DEF": 3, "MP": 10}},
            "Zırh": {"id": "BA_A_1", "name": "Gezgin Cübbesi", "tooltip": "Temel Defans: 7, MP: 20. Temel FOC/DEX.", "req_level": 1, "req_class": "BARD", "stats": {"FOC": 1, "DEX": 1, "M_DEF": 2, "RAW_DEF": 7, "MP": 20, "P_DEF": 1}},
            "Pantolon": {"id": "BA_P_1", "name": "Esnek Pantolon", "tooltip": "Temel Defans: 4. Temel DEX.", "req_level": 1, "req_class": "BARD", "stats": {"DEX": 1, "P_DEF": 1, "RAW_DEF": 4}},
            "Eldiven": {"id": "BA_G_1", "name": "Ritim Eldiveni", "tooltip": "Temel Defans: 2. Temel FOC.", "req_level": 1, "req_class": "BARD", "stats": {"FOC": 1, "CSPD_BONUS": 1, "RAW_DEF": 2, "HEAL_BONUS": 1}},
            "Bileklik": {"id": "BA_WR_1", "name": "Müzisyen Bilekliği", "tooltip": "Temel Defans: 1, MP: 5. Temel FOC.", "req_level": 1, "req_class": "BARD", "stats": {"FOC": 1, "RAW_DEF": 1, "MP": 5}},
            "Kolye": {"id": "BA_N_1", "name": "Nota Tılsımı", "tooltip": "Temel Defans: 1, HP: 5. Temel WIS.", "req_level": 1, "req_class": "BARD", "stats": {"WIS": 1, "RAW_DEF": 1, "HP": 5}},
            "Pelerin": {"id": "BA_C_1", "name": "Desenli Pelerin", "tooltip": "Temel Defans: 3. Temel kaçınma.", "req_level": 1, "req_class": "BARD", "stats": {"EVASION_BONUS": 1, "RAW_DEF": 3, "M_DEF": 1}},

        },
        "9": {
            "Silah": {"id": "BA_W_9", "name": "Telleri Gergin Lir", "tooltip": "Temel Saldırı: 25. Gelişmiş destek.", "req_level": 9, "req_class": "BARD", "stats": {"FOC": 5, "HEAL_BONUS": 10, "DEX": 1, "RAW_ATK": 25, "CSPD_BONUS": 2}},
            "Kask": {"id": "BA_H_9", "name": "Ritim Başlığı", "tooltip": "Temel Defans: 8, MP: 40. Temel DEX.", "req_level": 9, "req_class": "BARD", "stats": {"DEX": 3, "M_DEF": 5, "FOC": 1, "RAW_DEF": 8, "MP": 40, "EVASION_BONUS": 1}},
            "Zırh": {"id": "BA_A_9", "name": "Uyum Cübbesi", "tooltip": "Temel Defans: 20, HP: 30. Daha iyi M_DEF.", "req_level": 9, "req_class": "BARD", "stats": {"FOC": 3, "DEX": 2, "M_DEF": 10, "RAW_DEF": 20, "HP": 30, "MP": 30}},
            "Pantolon": {"id": "BA_P_9", "name": "Hızlı Pantolon", "tooltip": "Temel Defans: 15, HP: 20. Temel DEX/FOC.", "req_level": 9, "req_class": "BARD", "stats": {"DEX": 4, "P_DEF": 6, "RAW_DEF": 15, "HP": 20, "EVASION_BONUS": 1}},
            "Eldiven": {"id": "BA_G_9", "name": "Hızlı Ritim Eldiveni", "tooltip": "Temel Defans: 5. Cast hızı artışı.", "req_level": 9, "req_class": "BARD", "stats": {"FOC": 3, "CSPD_BONUS": 2, "RAW_DEF": 5, "HEAL_BONUS": 3}},
            "Bileklik": {"id": "BA_WR_9", "name": "Melodi Bilekliği", "tooltip": "Temel Defans: 3, MP: 20. WIS ve FOC.", "req_level": 9, "req_class": "BARD", "stats": {"WIS": 2, "FOC": 1, "RAW_DEF": 3, "MP": 20}},
            "Kolye": {"id": "BA_N_9", "name": "Müzik Taşı", "tooltip": "Temel Defans: 2, MP: 30. Temel WIS/FOC.", "req_level": 9, "req_class": "BARD", "stats": {"WIS": 2, "FOC": 1, "RAW_DEF": 2, "MP": 30, "M_DEF": 3}},
            "Pelerin": {"id": "BA_C_9", "name": "Uyum Pelerini", "tooltip": "Temel Defans: 7. Kaçınma ve hız.", "req_level": 9, "req_class": "BARD", "stats": {"EVASION_BONUS": 2, "RAW_DEF": 7, "P_DEF": 3}},
            "Offhand": {"id": "BA_O_9", "name": "Hafif Flüt", "tooltip": "Temel Defans: 7, MP: 50. Mana ve destek.", "req_level": 9, "req_class": "BARD", "stats": {"FOC": 3, "WIS": 2, "RAW_DEF": 7, "MP": 50, "HEAL_BONUS": 5}}
        },
        "18": {
            "Silah": {"id": "BA_W_18", "name": "Gezgin Liri", "tooltip": "Temel Saldırı: 45. Destek ve hız.", "req_level": 18, "req_class": "BARD", "stats": {"FOC": 9, "HEAL_BONUS": 25, "CSPD_BONUS": 3, "RAW_ATK": 45, "DEX": 3}},
            "Kask": {"id": "BA_H_18", "name": "Usta Başlık", "tooltip": "Temel Defans: 15, MP: 70. DEX ve kaçınma.", "req_level": 18, "req_class": "BARD", "stats": {"DEX": 6, "M_DEF": 12, "FOC": 2, "RAW_DEF": 15, "MP": 70, "EVASION_BONUS": 2}},
            "Zırh": {"id": "BA_A_18", "name": "Senfoni Cübbesi", "tooltip": "Temel Defans: 35, HP: 60. Orta M_DEF.", "req_level": 18, "req_class": "BARD", "stats": {"FOC": 6, "DEX": 4, "M_DEF": 20, "RAW_DEF": 35, "HP": 60, "MP": 60}},
            "Pantolon": {"id": "BA_P_18", "name": "Esnek Kumaş Pantolon", "tooltip": "Temel Defans: 25, HP: 40. Hız ve kaçınma.", "req_level": 18, "req_class": "BARD", "stats": {"DEX": 8, "P_DEF": 15, "RAW_DEF": 25, "HP": 40, "EVASION_BONUS": 3}},
            "Eldiven": {"id": "BA_G_18", "name": "Mistik Eldiven", "tooltip": "Temel Defans: 10. Cast hızı artışı.", "req_level": 18, "req_class": "BARD", "stats": {"FOC": 5, "CSPD_BONUS": 3, "RAW_DEF": 10, "HEAL_BONUS": 8}},
            "Bileklik": {"id": "BA_WR_18", "name": "Melodi Bilekliği", "tooltip": "Temel Defans: 5, MP: 40. WIS ve FOC.", "req_level": 18, "req_class": "BARD", "stats": {"WIS": 4, "FOC": 3, "RAW_DEF": 5, "MP": 40}},
            "Kolye": {"id": "BA_N_18", "name": "Ritim Kolyesi", "tooltip": "Temel Defans: 4, HP: 30. WIS ve DEX.", "req_level": 18, "req_class": "BARD", "stats": {"WIS": 3, "DEX": 3, "RAW_DEF": 4, "HP": 30, "M_DEF": 5}},
            "Pelerin": {"id": "BA_C_18", "name": "Hızlı Seyahat Pelerini", "tooltip": "Temel Defans: 12. Kaçınma ve hız.", "req_level": 18, "req_class": "BARD", "stats": {"EVASION_BONUS": 3, "RAW_DEF": 12, "M_DEF": 8}},
            "Offhand": {"id": "BA_O_18", "name": "Uyum Flütü", "tooltip": "Temel Defans: 12, MP: 90. Mana ve destek.", "req_level": 18, "req_class": "BARD", "stats": {"FOC": 6, "WIS": 4, "RAW_DEF": 12, "MP": 90, "HEAL_BONUS": 10}}
        },
        "24": {
            "Silah": {"id": "BA_W_24", "name": "Büyülü Lir", "tooltip": "Temel Saldırı: 60. Destek ve hız.", "req_level": 24, "req_class": "BARD", "stats": {"FOC": 12, "HEAL_BONUS": 35, "CSPD_BONUS": 4, "RAW_ATK": 60, "DEX": 5}},
            "Kask": {"id": "BA_H_24", "name": "Ritim Ustası Başlığı", "tooltip": "Temel Defans: 22, MP: 100. DEX ve kaçınma.", "req_level": 24, "req_class": "BARD", "stats": {"DEX": 8, "M_DEF": 15, "FOC": 3, "RAW_DEF": 22, "MP": 100, "EVASION_BONUS": 3}},
            "Zırh": {"id": "BA_A_24", "name": "Gölge Cübbesi", "tooltip": "Temel Defans: 50, HP: 80. Yüksek M_DEF.", "req_level": 24, "req_class": "BARD", "stats": {"FOC": 8, "DEX": 6, "M_DEF": 30, "RAW_DEF": 50, "HP": 80, "MP": 80, "EVASION_BONUS": 4}},
            "Pantolon": {"id": "BA_P_24", "name": "Çeviklik Pantolonu", "tooltip": "Temel Defans: 35, HP: 50. Hız ve kaçınma.", "req_level": 24, "req_class": "BARD", "stats": {"DEX": 10, "P_DEF": 20, "RAW_DEF": 35, "HP": 50, "EVASION_BONUS": 3}},
            "Eldiven": {"id": "BA_G_24", "name": "Senfoni Eldiveni", "tooltip": "Temel Defans: 15. Cast hızı artışı.", "req_level": 24, "req_class": "BARD", "stats": {"FOC": 7, "CSPD_BONUS": 4, "RAW_DEF": 15, "HEAL_BONUS": 12}},
            "Bileklik": {"id": "BA_WR_24", "name": "Uyum Bilekliği", "tooltip": "Temel Defans: 10, MP: 60. WIS ve FOC.", "req_level": 24, "req_class": "BARD", "stats": {"WIS": 5, "FOC": 4, "RAW_DEF": 10, "MP": 60, "DEX": 2}},
            "Kolye": {"id": "BA_N_24", "name": "Kutsal Nota Kolyesi", "tooltip": "Temel Defans: 6, HP: 40. WIS ve DEX.", "req_level": 24, "req_class": "BARD", "stats": {"WIS": 4, "DEX": 4, "RAW_DEF": 6, "HP": 40, "FOC": 2}},
            "Pelerin": {"id": "BA_C_24", "name": "Hızlı Seyahat Pelerini", "tooltip": "Temel Defans: 18. Kaçınma ve hız.", "req_level": 24, "req_class": "BARD", "stats": {"EVASION_BONUS": 4, "RAW_DEF": 18, "M_DEF": 10}},
            "Offhand": {"id": "BA_O_24", "name": "Mistik Flüt", "tooltip": "Temel Defans: 18, MP: 130. Mana ve destek.", "req_level": 24, "req_class": "BARD", "stats": {"FOC": 8, "WIS": 6, "RAW_DEF": 18, "MP": 130, "HEAL_BONUS": 15}}
        },
        "34": {
            "Silah": {"id": "BA_W_34", "name": "Sonsuz Ritim Liri", "tooltip": "Temel Saldırı: 80. Destek ve hız.", "req_level": 34, "req_class": "BARD", "stats": {"FOC": 16, "HEAL_BONUS": 50, "CSPD_BONUS": 5, "RAW_ATK": 80, "DEX": 7}},
            "Kask": {"id": "BA_H_34", "name": "Gölge Başlığı", "tooltip": "Temel Defans: 30, MP: 130. DEX ve kaçınma.", "req_level": 34, "req_class": "BARD", "stats": {"DEX": 12, "M_DEF": 20, "FOC": 4, "RAW_DEF": 30, "MP": 130, "EVASION_BONUS": 4}},
            "Zırh": {"id": "BA_A_34", "name": "Ritim Cübbesi", "tooltip": "Temel Defans: 70, HP: 120. Yüksek M_DEF.", "req_level": 34, "req_class": "BARD", "stats": {"FOC": 10, "DEX": 8, "M_DEF": 40, "RAW_DEF": 70, "HP": 120, "MP": 120, "EVASION_BONUS": 5}},
            "Pantolon": {"id": "BA_P_34", "name": "Hız Pantolonu", "tooltip": "Temel Defans: 45, HP: 80. Hız ve kaçınma.", "req_level": 34, "req_class": "BARD", "stats": {"DEX": 14, "P_DEF": 30, "RAW_DEF": 45, "HP": 80, "EVASION_BONUS": 4}},
            "Eldiven": {"id": "BA_G_34", "name": "Mistik Ritim Eldiveni", "tooltip": "Temel Defans: 20. Cast hızı artışı.", "req_level": 34, "req_class": "BARD", "stats": {"FOC": 9, "CSPD_BONUS": 5, "RAW_DEF": 20, "HEAL_BONUS": 18}},
            "Bileklik": {"id": "BA_WR_34", "name": "Enerji Bilekliği", "tooltip": "Temel Defans: 12, MP: 80. WIS ve FOC.", "req_level": 34, "req_class": "BARD", "stats": {"WIS": 6, "FOC": 7, "RAW_DEF": 12, "MP": 80, "DEX": 3}},
            "Kolye": {"id": "BA_N_34", "name": "Müzik Lordu Kolyesi", "tooltip": "Temel Defans: 8, HP: 80. WIS ve DEX.", "req_level": 34, "req_class": "BARD", "stats": {"WIS": 5, "DEX": 6, "RAW_DEF": 8, "HP": 80, "M_DEF": 12}},
            "Pelerin": {"id": "BA_C_34", "name": "Enerji Pelerini", "tooltip": "Temel Defans: 25. Kaçınma ve hız.", "req_level": 34, "req_class": "BARD", "stats": {"EVASION_BONUS": 5, "RAW_DEF": 25, "M_DEF": 15}},
            "Offhand": {"id": "BA_O_34", "name": "Ritüel Flütü", "tooltip": "Temel Defans: 25, MP: 180. Mana ve destek.", "req_level": 34, "req_class": "BARD", "stats": {"FOC": 12, "WIS": 8, "RAW_DEF": 25, "MP": 180, "HEAL_BONUS": 25}}
        },
        "42": {
            "Silah": {"id": "BA_W_42", "name": "Kahraman Liri", "tooltip": "Temel Saldırı: 100. Destek ve hız.", "req_level": 42, "req_class": "BARD", "stats": {"FOC": 22, "HEAL_BONUS": 70, "CSPD_BONUS": 6, "RAW_ATK": 100, "DEX": 10}},
            "Kask": {"id": "BA_H_42", "name": "Ruhani Başlık", "tooltip": "Temel Defans: 40, MP: 180. DEX ve kaçınma.", "req_level": 42, "req_class": "BARD", "stats": {"DEX": 15, "M_DEF": 25, "FOC": 5, "RAW_DEF": 40, "MP": 180, "EVASION_BONUS": 5}},
            "Zırh": {"id": "BA_A_42", "name": "Mistik Cübbe", "tooltip": "Temel Defans: 90, HP: 160. Orta-üst M_DEF.", "req_level": 42, "req_class": "BARD", "stats": {"FOC": 15, "DEX": 10, "M_DEF": 55, "RAW_DEF": 90, "HP": 160, "MP": 200, "EVASION_BONUS": 6}},
            "Pantolon": {"id": "BA_P_42", "name": "Uyum Pantolonu", "tooltip": "Temel Defans: 60, HP: 100. Hız ve kaçınma.", "req_level": 42, "req_class": "BARD", "stats": {"DEX": 18, "P_DEF": 40, "RAW_DEF": 60, "HP": 100, "EVASION_BONUS": 5}},
            "Eldiven": {"id": "BA_G_42", "name": "Yüce Ritim Eldiveni", "tooltip": "Temel Defans: 25. Cast hızı artışı.", "req_level": 42, "req_class": "BARD", "stats": {"FOC": 12, "CSPD_BONUS": 6, "RAW_DEF": 25, "HEAL_BONUS": 25}},
            "Bileklik": {"id": "BA_WR_42", "name": "Senfoni Bilekliği", "tooltip": "Temel Defans: 15, MP: 120. WIS ve FOC.", "req_level": 42, "req_class": "BARD", "stats": {"WIS": 8, "FOC": 10, "RAW_DEF": 15, "MP": 120, "DEX": 4}},
            "Kolye": {"id": "BA_N_42", "name": "Ruhani Melodi Kolyesi", "tooltip": "Temel Defans: 12, HP: 120. WIS ve DEX.", "req_level": 42, "req_class": "BARD", "stats": {"WIS": 7, "DEX": 9, "RAW_DEF": 12, "HP": 120, "M_DEF": 20}},
            "Pelerin": {"id": "BA_C_42", "name": "Uyum Pelerini", "tooltip": "Temel Defans: 35. Kaçınma ve hız.", "req_level": 42, "req_class": "BARD", "stats": {"EVASION_BONUS": 6, "RAW_DEF": 35, "M_DEF": 20}},
            "Offhand": {"id": "BA_O_42", "name": "Mistik Enstrüman", "tooltip": "Temel Defans: 30, MP: 250. Mana ve destek.", "req_level": 42, "req_class": "BARD", "stats": {"FOC": 15, "WIS": 10, "RAW_DEF": 30, "MP": 250, "HEAL_BONUS": 35}}
        },
        "48": {
            "Silah": {"id": "BA_W_48", "name": "Ruh Çağırıcı Lir", "tooltip": "Temel Saldırı: 120. Destek ve hız.", "req_level": 48, "req_class": "BARD", "stats": {"FOC": 25, "HEAL_BONUS": 85, "CSPD_BONUS": 7, "RAW_ATK": 120, "DEX": 12}},
            "Kask": {"id": "BA_H_48", "name": "Efsane Başlığı", "tooltip": "Temel Defans: 50, MP: 220. DEX ve kaçınma.", "req_level": 48, "req_class": "BARD", "stats": {"DEX": 18, "M_DEF": 30, "FOC": 6, "RAW_DEF": 50, "MP": 220, "EVASION_BONUS": 6}},
            "Zırh": {"id": "BA_A_48", "name": "Ruhani Uyum Cübbesi", "tooltip": "Temel Defans: 110, HP: 200. Yüksek M_DEF.", "req_level": 48, "req_class": "BARD", "stats": {"FOC": 18, "DEX": 12, "M_DEF": 65, "RAW_DEF": 110, "HP": 200, "MP": 250, "EVASION_BONUS": 7}},
            "Pantolon": {"id": "BA_P_48", "name": "Mistik Dizlik", "tooltip": "Temel Defans: 75, HP: 120. Hız ve kaçınma.", "req_level": 48, "req_class": "BARD", "stats": {"DEX": 22, "P_DEF": 45, "RAW_DEF": 75, "HP": 120, "EVASION_BONUS": 6}},
            "Eldiven": {"id": "BA_G_48", "name": "Ebedi Ritim Eldiveni", "tooltip": "Temel Defans: 30. Cast hızı artışı.", "req_level": 48, "req_class": "BARD", "stats": {"FOC": 15, "CSPD_BONUS": 7, "RAW_DEF": 30, "HEAL_BONUS": 35}},
            "Bileklik": {"id": "BA_WR_48", "name": "Ritim Lordu Bilekliği", "tooltip": "Temel Defans: 18, MP: 150. WIS ve FOC.", "req_level": 48, "req_class": "BARD", "stats": {"WIS": 10, "FOC": 12, "RAW_DEF": 18, "MP": 150, "DEX": 5}},
            "Kolye": {"id": "BA_N_48", "name": "Efsanevi Nota Kolyesi", "tooltip": "Temel Defans: 15, HP: 150. WIS ve DEX.", "req_level": 48, "req_class": "BARD", "stats": {"WIS": 9, "DEX": 11, "RAW_DEF": 15, "HP": 150, "FOC": 4}},
            "Pelerin": {"id": "BA_C_48", "name": "Yüce Seyahat Pelerini", "tooltip": "Temel Defans: 40. Kaçınma ve hız.", "req_level": 48, "req_class": "BARD", "stats": {"EVASION_BONUS": 7, "RAW_DEF": 40, "M_DEF": 25}},
            "Offhand": {"id": "BA_O_48", "name": "Yüce Flüt", "tooltip": "Temel Defans: 40, MP: 300. Mana ve destek.", "req_level": 48, "req_class": "BARD", "stats": {"FOC": 18, "WIS": 12, "RAW_DEF": 40, "MP": 300, "HEAL_BONUS": 50}}
        },
        "54": {
            "Silah": {"id": "BA_W_54", "name": "Yüce Melodi Liri", "tooltip": "Temel Saldırı: 140. Destek ve hız.", "req_level": 54, "req_class": "BARD", "stats": {"FOC": 29, "HEAL_BONUS": 100, "CSPD_BONUS": 8, "RAW_ATK": 140, "DEX": 15}},
            "Kask": {"id": "BA_H_54", "name": "Melodi Tacı", "tooltip": "Temel Defans: 60, MP: 250. DEX ve kaçınma.", "req_level": 54, "req_class": "BARD", "stats": {"DEX": 22, "M_DEF": 35, "FOC": 8, "RAW_DEF": 60, "MP": 250, "EVASION_BONUS": 7}},
            "Zırh": {"id": "BA_A_54", "name": "Mistik Uyum Cübbesi", "tooltip": "Temel Defans: 130, HP: 250. Maksimum M_DEF.", "req_level": 54, "req_class": "BARD", "stats": {"FOC": 22, "DEX": 15, "M_DEF": 75, "RAW_DEF": 130, "HP": 250, "MP": 350, "EVASION_BONUS": 8}},
            "Pantolon": {"id": "BA_P_54", "name": "Sonsuz Esneklik Pantolonu", "tooltip": "Temel Defans: 90, HP: 180. Hız ve kaçınma.", "req_level": 54, "req_class": "BARD", "stats": {"DEX": 26, "P_DEF": 50, "RAW_DEF": 90, "HP": 180, "EVASION_BONUS": 7}},
            "Eldiven": {"id": "BA_G_54", "name": "Kutsal Uyum Eldiveni", "tooltip": "Temel Defans: 35. Cast hızı artışı.", "req_level": 54, "req_class": "BARD", "stats": {"FOC": 18, "CSPD_BONUS": 8, "RAW_DEF": 35, "HEAL_BONUS": 45}},
            "Bileklik": {"id": "BA_WR_54", "name": "Mistik Ritim Bilekliği", "tooltip": "Temel Defans: 22, MP: 180. WIS ve FOC.", "req_level": 54, "req_class": "BARD", "stats": {"WIS": 12, "FOC": 15, "RAW_DEF": 22, "MP": 180, "DEX": 6}},
            "Kolye": {"id": "BA_N_54", "name": "Yüce Melodi Kolyesi", "tooltip": "Temel Defans: 20, HP: 200. WIS ve DEX.", "req_level": 54, "req_class": "BARD", "stats": {"WIS": 11, "DEX": 14, "RAW_DEF": 20, "HP": 200, "FOC": 5}},
            "Pelerin": {"id": "BA_C_54", "name": "Ruhani Yol Pelerini", "tooltip": "Temel Defans: 50. Kaçınma ve hız.", "req_level": 54, "req_class": "BARD", "stats": {"EVASION_BONUS": 8, "RAW_DEF": 50, "M_DEF": 30}},
            "Offhand": {"id": "BA_O_54", "name": "Sonsuz Nota", "tooltip": "Temel Defans: 50, MP: 350. Mana ve destek.", "req_level": 54, "req_class": "BARD", "stats": {"FOC": 22, "WIS": 15, "RAW_DEF": 50, "MP": 350, "HEAL_BONUS": 60}}
        },
        "66": {
            "Silah": {"id": "BA_W_66", "name": "Ebedi Senfoni Liri", "tooltip": "Temel Saldırı: 160. Destek ve hız.", "req_level": 66, "req_class": "BARD", "stats": {"FOC": 35, "HEAL_BONUS": 120, "CSPD_BONUS": 9, "RAW_ATK": 160, "DEX": 18}},
            "Kask": {"id": "BA_H_66", "name": "Sonsuz Uyum Başlığı", "tooltip": "Temel Defans: 75, MP: 300. DEX ve kaçınma.", "req_level": 66, "req_class": "BARD", "stats": {"DEX": 25, "M_DEF": 40, "FOC": 10, "RAW_DEF": 75, "MP": 300, "EVASION_BONUS": 8}},
            "Zırh": {"id": "BA_A_66", "name": "İlahi Ritim Cübbesi", "tooltip": "Temel Defans: 150, HP: 300. Maksimum M_DEF.", "req_level": 66, "req_class": "BARD", "stats": {"FOC": 25, "DEX": 18, "M_DEF": 85, "RAW_DEF": 150, "HP": 300, "MP": 450, "EVASION_BONUS": 9}},
            "Pantolon": {"id": "BA_P_66", "name": "Ebedi Hız Pantolonu", "tooltip": "Temel Defans: 110, HP: 200. Hız ve kaçınma.", "req_level": 66, "req_class": "BARD", "stats": {"DEX": 30, "P_DEF": 60, "RAW_DEF": 110, "HP": 200, "EVASION_BONUS": 8}},
            "Eldiven": {"id": "BA_G_66", "name": "Tanrısal Ritim Eldiveni", "tooltip": "Temel Defans: 40. Cast hızı artışı.", "req_level": 66, "req_class": "BARD", "stats": {"FOC": 22, "CSPD_BONUS": 9, "RAW_DEF": 40, "HEAL_BONUS": 60}},
            "Bileklik": {"id": "BA_WR_66", "name": "Uyum Lordu Bilekliği", "tooltip": "Temel Defans: 30, MP: 250. WIS ve FOC.", "req_level": 66, "req_class": "BARD", "stats": {"WIS": 15, "FOC": 18, "RAW_DEF": 30, "MP": 250, "DEX": 8}},
            "Kolye": {"id": "BA_N_66", "name": "İlahi Nota Kolyesi", "tooltip": "Temel Defans: 25, HP: 250. WIS ve DEX.", "req_level": 66, "req_class": "BARD", "stats": {"WIS": 14, "DEX": 17, "RAW_DEF": 25, "HP": 250, "FOC": 8}},
            "Pelerin": {"id": "BA_C_66", "name": "Sonsuz Melodi Pelerini", "tooltip": "Temel Defans: 60. Kaçınma ve hız.", "req_level": 66, "req_class": "BARD", "stats": {"EVASION_BONUS": 9, "RAW_DEF": 60, "M_DEF": 35}},
            "Offhand": {"id": "BA_O_66", "name": "Ebedi Flüt", "tooltip": "Temel Defans: 60, MP: 450. Mana ve destek.", "req_level": 66, "req_class": "BARD", "stats": {"FOC": 28, "WIS": 18, "RAW_DEF": 60, "MP": 450, "HEAL_BONUS": 75}}
        },
        "75": {
            "Silah": {"id": "BA_W_75", "name": "Mücadele Liri", "tooltip": "Temel Saldırı: 180. Tüm takıma güç verir.", "req_level": 75, "req_class": "BARD", "stats": {"FOC": 40, "WIS": 20, "HEAL_BONUS": 150, "RAW_ATK": 180, "CSPD_BONUS": 10, "DEX": 5}},
            "Kask": {"id": "BA_H_75", "name": "Uyum Başlığı", "tooltip": "Temel Defans: 90, MP: 400. FOC ve DEX.", "req_level": 75, "req_class": "BARD", "stats": {"FOC": 25, "DEX": 15, "M_DEF": 50, "RAW_DEF": 90, "MP": 400, "EVASION_BONUS": 4}},
            "Zırh": {"id": "BA_A_75", "name": "Uyum Cübbesi", "tooltip": "Temel Defans: 170, HP: 350. Hız ve kaçınmayı destekler.", "req_level": 75, "req_class": "BARD", "stats": {"FOC": 30, "DEX": 20, "M_DEF": 100, "RAW_DEF": 170, "EVASION_BONUS": 10, "HP": 350, "MP": 600}},
            "Pantolon": {"id": "BA_P_75", "name": "Akortlu Pantolon", "tooltip": "Temel Defans: 120, HP: 250. DEX ve FOC.", "req_level": 75, "req_class": "BARD", "stats": {"DEX": 25, "FOC": 15, "P_DEF": 70, "RAW_DEF": 120, "HP": 250, "EVASION_BONUS": 9}},
            "Eldiven": {"id": "BA_G_75", "name": "Senfoni Eldiveni", "tooltip": "Temel Defans: 50. Cast hızı ve destek gücü.", "req_level": 75, "req_class": "BARD", "stats": {"FOC": 25, "WIS": 15, "CSPD_BONUS": 10, "RAW_DEF": 50, "HEAL_BONUS": 20}},
            "Bileklik": {"id": "BA_WR_75", "name": "Melodi Bilekliği", "tooltip": "Temel Defans: 40, MP: 300. WIS ve FOC.", "req_level": 75, "req_class": "BARD", "stats": {"WIS": 20, "FOC": 20, "RAW_DEF": 40, "MP": 300, "DEX": 10}},
            "Kolye": {"id": "BA_N_75", "name": "Efsanevi Nota Kolyesi", "tooltip": "Temel Defans: 30, HP: 300. Tüm destek statları.", "req_level": 75, "req_class": "BARD", "stats": {"FOC": 15, "WIS": 18, "DEX": 15, "RAW_DEF": 30, "HP": 300, "M_DEF": 25}},
            "Pelerin": {"id": "BA_C_75", "name": "Ritim Pelerini", "tooltip": "Temel Defans: 75. Çeviklik ve M_DEF.", "req_level": 75, "req_class": "BARD", "stats": {"DEX": 12, "M_DEF": 40, "RAW_DEF": 75, "P_DEF": 30, "EVASION_BONUS": 10}},
            "Offhand": {"id": "BA_O_75", "name": "Ritim Flütü", "tooltip": "Temel Defans: 70, MP: 550. Şarkı etkilerini artırır.", "req_level": 75, "req_class": "BARD", "stats": {"FOC": 35, "WIS": 15, "DEX": 10, "RAW_DEF": 70, "MP": 550, "HEAL_BONUS": 25}}
        },
    },

    # ------------------------------------------------------------------------------------------------------
    # 11. RANGER (DEX/FOC/VIT Odaklı - Hafif Zırh/Yay + Offhand)
    # ------------------------------------------------------------------------------------------------------
    "RANGER": {
        "1": {
            "Silah": {"id": "R_W_1", "name": "Basit Yay", "tooltip": "Temel Saldırı: 15. Temel DEX.", "req_level": 1, "req_class": "RANGER", "stats": {"DEX": 3, "PAP_BONUS": 5, "RAW_ATK": 15, "P_CRIT_BONUS": 1}},
            "Kask": {"id": "R_H_1", "name": "Deri Kafa Bandı", "tooltip": "Temel Defans: 4, HP: 10. Temel DEX.", "req_level": 1, "req_class": "RANGER", "stats": {"DEX": 1, "P_DEF": 1, "RAW_DEF": 4, "HP": 10}},
            "Zırh": {"id": "R_A_1", "name": "Avcı Yeleği", "tooltip": "Temel Defans: 9, HP: 20. Temel DEX/VIT.", "req_level": 1, "req_class": "RANGER", "stats": {"DEX": 1, "VIT": 1, "P_DEF": 2, "RAW_DEF": 9, "HP": 20, "EVASION_BONUS": 1}},
            "Pantolon": {"id": "R_P_1", "name": "Hafif Pantolon", "tooltip": "Temel Defans: 6. Temel DEX.", "req_level": 1, "req_class": "RANGER", "stats": {"DEX": 1, "P_DEF": 1, "RAW_DEF": 6}},
            "Eldiven": {"id": "R_G_1", "name": "Okçu Eldiveni", "tooltip": "Temel Defans: 3. Temel isabet.", "req_level": 1, "req_class": "RANGER", "stats": {"DEX": 1, "FOC": 1, "RAW_DEF": 3, "ASPD_BONUS": 1}},
            "Bileklik": {"id": "R_WR_1", "name": "Basit Bileklik", "tooltip": "Temel Defans: 2, MP: 5. Temel FOC.", "req_level": 1, "req_class": "RANGER", "stats": {"FOC": 1, "RAW_DEF": 2, "MP": 5}},
            "Kolye": {"id": "R_N_1", "name": "Hayvan Dişi", "tooltip": "Temel Defans: 1, HP: 15. Temel VIT.", "req_level": 1, "req_class": "RANGER", "stats": {"VIT": 1, "RAW_DEF": 1, "HP": 15}},
            "Pelerin": {"id": "R_C_1", "name": "Kamufle Pelerin", "tooltip": "Temel Defans: 3. Temel kaçınma.", "req_level": 1, "req_class": "RANGER", "stats": {"EVASION_BONUS": 1, "RAW_DEF": 3, "M_DEF": 1}},
            "Offhand": {"id": "R_O_1", "name": "Ok Kılıfı", "tooltip": "Temel Saldırı: 5. Temel saldırı gücü.", "req_level": 1, "req_class": "RANGER", "stats": {"DEX": 1, "PAP_BONUS": 1, "RAW_ATK": 5}}
        },
        "9": {
            "Silah": {"id": "R_W_9", "name": "Sert Ağaç Yay", "tooltip": "Temel Saldırı: 30. Gelişmiş DEX.", "req_level": 9, "req_class": "RANGER", "stats": {"DEX": 5, "PAP_BONUS": 15, "VIT": 1, "RAW_ATK": 30, "ASPD_BONUS": 2}},
            "Kask": {"id": "R_H_9", "name": "Avcı Başlığı", "tooltip": "Temel Defans: 12, HP: 30. DEX/VIT.", "req_level": 9, "req_class": "RANGER", "stats": {"DEX": 3, "P_DEF": 5, "FOC": 1, "RAW_DEF": 12, "HP": 30}},
            "Zırh": {"id": "R_A_9", "name": "Hafif Deri Zırh", "tooltip": "Temel Defans: 25, HP: 60. Kaçınma odaklı.", "req_level": 9, "req_class": "RANGER", "stats": {"DEX": 3, "VIT": 5, "P_DEF": 10, "RAW_DEF": 25, "HP": 60, "EVASION_BONUS": 2}},
            "Pantolon": {"id": "R_P_9", "name": "Hız Pantolonu", "tooltip": "Temel Defans: 18, HP: 40. Hız ve kaçınma.", "req_level": 9, "req_class": "RANGER", "stats": {"DEX": 4, "P_DEF": 6, "RAW_DEF": 18, "HP": 40, "EVASION_BONUS": 1}},
            "Eldiven": {"id": "R_G_9", "name": "Isabet Eldiveni", "tooltip": "Temel Defans: 8. Kritik şansı.", "req_level": 9, "req_class": "RANGER", "stats": {"DEX": 3, "P_CRIT_BONUS": 1, "RAW_DEF": 8, "ASPD_BONUS": 2}},
            "Bileklik": {"id": "R_WR_9", "name": "Okçu Bilekliği", "tooltip": "Temel Defans: 4, MP: 20. DEX ve FOC.", "req_level": 9, "req_class": "RANGER", "stats": {"DEX": 2, "FOC": 1, "RAW_DEF": 4, "MP": 20}},
            "Kolye": {"id": "R_N_9", "name": "Göz Tılsımı", "tooltip": "Temel Defans: 2, HP: 20. Temel FOC.", "req_level": 9, "req_class": "RANGER", "stats": {"FOC": 2, "VIT": 1, "RAW_DEF": 2, "HP": 20, "DEX": 1}},
            "Pelerin": {"id": "R_C_9", "name": "Gizlilik Pelerini", "tooltip": "Temel Defans: 5. Kaçınma ve hız.", "req_level": 9, "req_class": "RANGER", "stats": {"EVASION_BONUS": 2, "RAW_DEF": 5, "M_DEF": 3}},
            "Offhand": {"id": "R_O_9", "name": "Uçuş Ok Kılıfı", "tooltip": "Temel Saldırı: 10. Temel saldırı gücü.", "req_level": 9, "req_class": "RANGER", "stats": {"DEX": 3, "PAP_BONUS": 3, "RAW_ATK": 10, "ASPD_BONUS": 1}}
        },
        "18": {
            "Silah": {"id": "R_W_18", "name": "Kısa Yay", "tooltip": "Temel Saldırı: 50. Hafif hasar artışı.", "req_level": 18, "req_class": "RANGER", "stats": {"DEX": 9, "PAP_BONUS": 30, "VIT": 2, "RAW_ATK": 50, "P_CRIT_BONUS": 2}},
            "Kask": {"id": "R_H_18", "name": "Gözcü Başlığı", "tooltip": "Temel Defans: 22, MP: 40. FOC odaklı.", "req_level": 18, "req_class": "RANGER", "stats": {"FOC": 6, "P_DEF": 10, "DEX": 2, "RAW_DEF": 22, "MP": 40, "EVASION_BONUS": 1}},
            "Zırh": {"id": "R_A_18", "name": "Av Zırhı", "tooltip": "Temel Defans: 45, HP: 80. Fiziksel/Büyü dengesi.", "req_level": 18, "req_class": "RANGER", "stats": {"DEX": 5, "VIT": 10, "P_DEF": 20, "M_DEF": 5, "RAW_DEF": 45, "HP": 80, "EVASION_BONUS": 3}},
            "Pantolon": {"id": "R_P_18", "name": "Çeviklik Dizliği", "tooltip": "Temel Defans: 30, HP: 50. Hız ve kaçınma.", "req_level": 18, "req_class": "RANGER", "stats": {"DEX": 8, "P_DEF": 15, "RAW_DEF": 30, "HP": 50, "EVASION_BONUS": 2}},
            "Eldiven": {"id": "R_G_18", "name": "Hızlı Nişancı Eldiveni", "tooltip": "Temel Defans: 15. Saldırı hızı artışı.", "req_level": 18, "req_class": "RANGER", "stats": {"DEX": 5, "ASPD_BONUS": 3, "RAW_DEF": 15, "P_CRIT_BONUS": 2}},
            "Bileklik": {"id": "R_WR_18", "name": "Isabet Bilekliği", "tooltip": "Temel Defans: 8, MP: 50. DEX ve FOC.", "req_level": 18, "req_class": "RANGER", "stats": {"DEX": 4, "FOC": 3, "RAW_DEF": 8, "MP": 50}},
            "Kolye": {"id": "R_N_18", "name": "Avcı Kolyesi", "tooltip": "Temel Defans: 4, HP: 50. DEX ve VIT.", "req_level": 18, "req_class": "RANGER", "stats": {"DEX": 3, "VIT": 3, "RAW_DEF": 4, "HP": 50, "P_DEF": 5}},
            "Pelerin": {"id": "R_C_18", "name": "Gölge Pelerini", "tooltip": "Temel Defans: 12. Kaçınma ve hız.", "req_level": 18, "req_class": "RANGER", "stats": {"EVASION_BONUS": 3, "RAW_DEF": 12, "M_DEF": 8}},
            "Offhand": {"id": "R_O_18", "name": "Gözcü Kılıfı", "tooltip": "Temel Saldırı: 15. Temel saldırı gücü.", "req_level": 18, "req_class": "RANGER", "stats": {"DEX": 5, "PAP_BONUS": 8, "RAW_ATK": 15, "FOC": 2}}
        },
        "24": {
            "Silah": {"id": "R_W_24", "name": "Demir Yay", "tooltip": "Temel Saldırı: 70. Hafif hasar artışı.", "req_level": 24, "req_class": "RANGER", "stats": {"DEX": 12, "PAP_BONUS": 40, "VIT": 3, "RAW_ATK": 70, "P_CRIT_BONUS": 3, "ASPD_BONUS": 2}},
            "Kask": {"id": "R_H_24", "name": "Nişancı Başlığı", "tooltip": "Temel Defans: 30, MP: 70. FOC odaklı.", "req_level": 24, "req_class": "RANGER", "stats": {"FOC": 8, "P_DEF": 15, "DEX": 3, "RAW_DEF": 30, "MP": 70, "EVASION_BONUS": 2}},
            "Zırh": {"id": "R_A_24", "name": "Sert Deri Zırh", "tooltip": "Temel Defans: 60, HP: 120. Fiziksel/Büyü dengesi.", "req_level": 24, "req_class": "RANGER", "stats": {"DEX": 7, "VIT": 14, "P_DEF": 30, "M_DEF": 10, "RAW_DEF": 60, "HP": 120, "EVASION_BONUS": 4}},
            "Pantolon": {"id": "R_P_24", "name": "Hızlı Kaçınma Pantolonu", "tooltip": "Temel Defans: 40, HP: 70. Hız ve kaçınma.", "req_level": 24, "req_class": "RANGER", "stats": {"DEX": 10, "P_DEF": 20, "RAW_DEF": 40, "HP": 70, "EVASION_BONUS": 3}},
            "Eldiven": {"id": "R_G_24", "name": "Kritik Atış Eldiveni", "tooltip": "Temel Defans: 20. Kritik şansı.", "req_level": 24, "req_class": "RANGER", "stats": {"DEX": 7, "P_CRIT_BONUS": 2, "RAW_DEF": 20, "ASPD_BONUS": 3}},
            "Bileklik": {"id": "R_WR_24", "name": "Hız Bilekliği", "tooltip": "Temel Defans: 12, MP: 80. DEX ve FOC.", "req_level": 24, "req_class": "RANGER", "stats": {"DEX": 6, "FOC": 4, "RAW_DEF": 12, "MP": 80, "ASPD_BONUS": 1}},
            "Kolye": {"id": "R_N_24", "name": "Hedef Kolyesi", "tooltip": "Temel Defans: 6, HP: 80. DEX ve VIT.", "req_level": 24, "req_class": "RANGER", "stats": {"DEX": 4, "VIT": 4, "RAW_DEF": 6, "HP": 80, "FOC": 2}},
            "Pelerin": {"id": "R_C_24", "name": "Sessiz Pelerin", "tooltip": "Temel Defans: 15. Kaçınma ve hız.", "req_level": 24, "req_class": "RANGER", "stats": {"EVASION_BONUS": 4, "RAW_DEF": 15, "M_DEF": 10}},
            "Offhand": {"id": "R_O_24", "name": "Okçu Kılıfı", "tooltip": "Temel Saldırı: 20. Temel saldırı gücü.", "req_level": 24, "req_class": "RANGER", "stats": {"DEX": 8, "PAP_BONUS": 12, "RAW_ATK": 20, "P_CRIT_BONUS": 1}}
        },
        "34": {
            "Silah": {"id": "R_W_34", "name": "Gelişmiş Yay", "tooltip": "Temel Saldırı: 90. Hafif hasar artışı.", "req_level": 34, "req_class": "RANGER", "stats": {"DEX": 16, "PAP_BONUS": 60, "VIT": 4, "RAW_ATK": 90, "P_CRIT_BONUS": 4, "ASPD_BONUS": 3}},
            "Kask": {"id": "R_H_34", "name": "Usta Nişancı Başlığı", "tooltip": "Temel Defans: 40, MP: 100. FOC odaklı.", "req_level": 34, "req_class": "RANGER", "stats": {"FOC": 12, "P_DEF": 20, "DEX": 4, "RAW_DEF": 40, "MP": 100, "EVASION_BONUS": 2}},
            "Zırh": {"id": "R_A_34", "name": "Gelişmiş Av Zırhı", "tooltip": "Temel Defans: 85, HP: 180. Fiziksel/Büyü dengesi.", "req_level": 34, "req_class": "RANGER", "stats": {"DEX": 10, "VIT": 18, "P_DEF": 40, "M_DEF": 15, "RAW_DEF": 85, "HP": 180, "EVASION_BONUS": 5}},
            "Pantolon": {"id": "R_P_34", "name": "Gölge Dizliği", "tooltip": "Temel Defans: 60, HP: 100. Hız ve kaçınma.", "req_level": 34, "req_class": "RANGER", "stats": {"DEX": 14, "P_DEF": 30, "RAW_DEF": 60, "HP": 100, "EVASION_BONUS": 4}},
            "Eldiven": {"id": "R_G_34", "name": "Süper Nişancı Eldiveni", "tooltip": "Temel Defans: 30. Kritik şansı.", "req_level": 34, "req_class": "RANGER", "stats": {"DEX": 9, "P_CRIT_BONUS": 3, "RAW_DEF": 30, "ASPD_BONUS": 4}},
            "Bileklik": {"id": "R_WR_34", "name": "Nişancı Bilekliği", "tooltip": "Temel Defans: 18, MP: 120. DEX ve FOC.", "req_level": 34, "req_class": "RANGER", "stats": {"DEX": 8, "FOC": 6, "RAW_DEF": 18, "MP": 120, "P_DEF": 5}},
            "Kolye": {"id": "R_N_34", "name": "Avcı Lordu Kolyesi", "tooltip": "Temel Defans: 10, HP: 120. DEX ve VIT.", "req_level": 34, "req_class": "RANGER", "stats": {"DEX": 6, "VIT": 6, "RAW_DEF": 10, "HP": 120, "P_CRIT_BONUS": 1}},
            "Pelerin": {"id": "R_C_34", "name": "Gölge Hızı Pelerini", "tooltip": "Temel Defans: 22. Kaçınma ve hız.", "req_level": 34, "req_class": "RANGER", "stats": {"EVASION_BONUS": 5, "RAW_DEF": 22, "M_DEF": 15}},
            "Offhand": {"id": "R_O_34", "name": "Hız Ok Kılıfı", "tooltip": "Temel Saldırı: 30. Temel saldırı gücü.", "req_level": 34, "req_class": "RANGER", "stats": {"DEX": 12, "PAP_BONUS": 18, "RAW_ATK": 30, "ASPD_BONUS": 2}}
        },
        "42": {
            "Silah": {"id": "R_W_42", "name": "Uzun Menzilli Yay", "tooltip": "Temel Saldırı: 110. Hafif hasar artışı.", "req_level": 42, "req_class": "RANGER", "stats": {"DEX": 22, "PAP_BONUS": 75, "VIT": 5, "RAW_ATK": 110, "P_CRIT_BONUS": 5, "ASPD_BONUS": 4}},
            "Kask": {"id": "R_H_42", "name": "Av Lordu Başlığı", "tooltip": "Temel Defans: 55, MP: 150. FOC odaklı.", "req_level": 42, "req_class": "RANGER", "stats": {"FOC": 15, "P_DEF": 25, "DEX": 5, "RAW_DEF": 55, "MP": 150, "EVASION_BONUS": 3}},
            "Zırh": {"id": "R_A_42", "name": "Mistik Av Zırhı", "tooltip": "Temel Defans: 110, HP: 250. Fiziksel/Büyü dengesi.", "req_level": 42, "req_class": "RANGER", "stats": {"DEX": 15, "VIT": 22, "P_DEF": 55, "M_DEF": 20, "RAW_DEF": 110, "HP": 250, "EVASION_BONUS": 6}},
            "Pantolon": {"id": "R_P_42", "name": "Ruhani Dizlik", "tooltip": "Temel Defans: 80, HP: 150. Hız ve kaçınma.", "req_level": 42, "req_class": "RANGER", "stats": {"DEX": 18, "P_DEF": 40, "RAW_DEF": 80, "HP": 150, "EVASION_BONUS": 5}},
            "Eldiven": {"id": "R_G_42", "name": "Ebedi Nişancı Eldiveni", "tooltip": "Temel Defans: 40. Kritik şansı.", "req_level": 42, "req_class": "RANGER", "stats": {"DEX": 12, "P_CRIT_BONUS": 4, "RAW_DEF": 40, "ASPD_BONUS": 5}},
            "Bileklik": {"id": "R_WR_42", "name": "Yüce Bileklik", "tooltip": "Temel Defans: 25, MP: 150. DEX ve FOC.", "req_level": 42, "req_class": "RANGER", "stats": {"DEX": 10, "FOC": 8, "RAW_DEF": 25, "MP": 150, "P_CRIT_BONUS": 1}},
            "Kolye": {"id": "R_N_42", "name": "Yüce Av Kolyesi", "tooltip": "Temel Defans: 15, HP: 200. DEX ve VIT.", "req_level": 42, "req_class": "RANGER", "stats": {"DEX": 8, "VIT": 8, "HP": 200, "RAW_DEF": 15, "FOC": 4}},
            "Pelerin": {"id": "R_C_42", "name": "Gölge Hızı Pelerini", "tooltip": "Temel Defans: 30. Kaçınma ve hız.", "req_level": 42, "req_class": "RANGER", "stats": {"EVASION_BONUS": 6, "RAW_DEF": 30, "M_DEF": 20}},
            "Offhand": {"id": "R_O_42", "name": "Yüce Ok Kılıfı", "tooltip": "Temel Saldırı: 40. Temel saldırı gücü.", "req_level": 42, "req_class": "RANGER", "stats": {"DEX": 15, "PAP_BONUS": 25, "RAW_ATK": 40, "ASPD_BONUS": 3}}
        },
        "48": {
            "Silah": {"id": "R_W_48", "name": "Ruhani Yay", "tooltip": "Temel Saldırı: 130. Hafif hasar artışı.", "req_level": 48, "req_class": "RANGER", "stats": {"DEX": 25, "PAP_BONUS": 85, "VIT": 6, "RAW_ATK": 130, "P_CRIT_BONUS": 6, "ASPD_BONUS": 5}},
            "Kask": {"id": "R_H_48", "name": "Ebedi Başlık", "tooltip": "Temel Defans: 65, MP: 200. FOC odaklı.", "req_level": 48, "req_class": "RANGER", "stats": {"FOC": 18, "P_DEF": 30, "DEX": 6, "RAW_DEF": 65, "MP": 200, "EVASION_BONUS": 4}},
            "Zırh": {"id": "R_A_48", "name": "Efsanevi Av Zırhı", "tooltip": "Temel Defans: 130, HP: 300. Fiziksel/Büyü dengesi.", "req_level": 48, "req_class": "RANGER", "stats": {"DEX": 18, "VIT": 25, "P_DEF": 65, "M_DEF": 25, "RAW_DEF": 130, "HP": 300, "EVASION_BONUS": 7}},
            "Pantolon": {"id": "R_P_48", "name": "Avcı Taytı", "tooltip": "Temel Defans: 100, HP: 180. Hız ve kaçınma.", "req_level": 48, "req_class": "RANGER", "stats": {"DEX": 22, "P_DEF": 45, "RAW_DEF": 100, "HP": 180, "EVASION_BONUS": 6}},
            "Eldiven": {"id": "R_G_48", "name": "Hüküm Eldiveni", "tooltip": "Temel Defans: 50. Kritik şansı.", "req_level": 48, "req_class": "RANGER", "stats": {"DEX": 15, "P_CRIT_BONUS": 4, "RAW_DEF": 50, "ASPD_BONUS": 6}},
            "Bileklik": {"id": "R_WR_48", "name": "Ebedi Bileklik", "tooltip": "Temel Defans: 35, MP: 200. DEX ve FOC.", "req_level": 48, "req_class": "RANGER", "stats": {"DEX": 12, "FOC": 10, "RAW_DEF": 35, "MP": 200, "P_DEF": 8}},
            "Kolye": {"id": "R_N_48", "name": "Efsanevi Diş Kolyesi", "tooltip": "Temel Defans: 20, HP: 250. DEX ve VIT.", "req_level": 48, "req_class": "RANGER", "stats": {"DEX": 10, "VIT": 10, "HP": 250, "RAW_DEF": 20, "FOC": 5}},
            "Pelerin": {"id": "R_C_48", "name": "Ruhani Pelerin", "tooltip": "Temel Defans: 40. Kaçınma ve hız.", "req_level": 48, "req_class": "RANGER", "stats": {"EVASION_BONUS": 7, "RAW_DEF": 40, "M_DEF": 25}},
            "Offhand": {"id": "R_O_48", "name": "Mistik Ok Kılıfı", "tooltip": "Temel Saldırı: 50. Temel saldırı gücü.", "req_level": 48, "req_class": "RANGER", "stats": {"DEX": 18, "PAP_BONUS": 32, "RAW_ATK": 50, "P_CRIT_BONUS": 2}}
        },
        "54": {
            "Silah": {"id": "R_W_54", "name": "Gölge Yay", "tooltip": "Temel Saldırı: 150. Hafif hasar artışı.", "req_level": 54, "req_class": "RANGER", "stats": {"DEX": 29, "PAP_BONUS": 95, "VIT": 7, "RAW_ATK": 150, "P_CRIT_BONUS": 7, "ASPD_BONUS": 6}},
            "Kask": {"id": "R_H_54", "name": "Sonsuz Başlık", "tooltip": "Temel Defans: 80, MP: 250. FOC odaklı.", "req_level": 54, "req_class": "RANGER", "stats": {"FOC": 22, "P_DEF": 35, "DEX": 8, "RAW_DEF": 80, "MP": 250, "EVASION_BONUS": 5}},
            "Zırh": {"id": "R_A_54", "name": "Gölge Av Zırhı", "tooltip": "Temel Defans: 150, HP: 350. Fiziksel/Büyü dengesi.", "req_level": 54, "req_class": "RANGER", "stats": {"DEX": 22, "VIT": 28, "P_DEF": 75, "M_DEF": 30, "RAW_DEF": 150, "HP": 350, "EVASION_BONUS": 8}},
            "Pantolon": {"id": "R_P_54", "name": "Sonsuz Hız Pantolonu", "tooltip": "Temel Defans: 120, HP: 220. Hız ve kaçınma.", "req_level": 54, "req_class": "RANGER", "stats": {"DEX": 26, "P_DEF": 50, "RAW_DEF": 120, "HP": 220, "EVASION_BONUS": 7}},
            "Eldiven": {"id": "R_G_54", "name": "Yüce Kritik Eldiveni", "tooltip": "Temel Defans: 60. Kritik şansı.", "req_level": 54, "req_class": "RANGER", "stats": {"DEX": 18, "P_CRIT_BONUS": 5, "RAW_DEF": 60, "ASPD_BONUS": 7}},
            "Bileklik": {"id": "R_WR_54", "name": "Hüküm Bilekliği", "tooltip": "Temel Defans: 45, MP: 250. DEX ve FOC.", "req_level": 54, "req_class": "RANGER", "stats": {"DEX": 15, "FOC": 12, "RAW_DEF": 45, "MP": 250, "P_DEF": 12}},
            "Kolye": {"id": "R_N_54", "name": "Sonsuz Av Kolyesi", "tooltip": "Temel Defans: 25, HP: 300. DEX ve VIT.", "req_level": 54, "req_class": "RANGER", "stats": {"DEX": 12, "VIT": 12, "HP": 300, "RAW_DEF": 25, "FOC": 6}},
            "Pelerin": {"id": "R_C_54", "name": "Ebedi Gölge Pelerini", "tooltip": "Temel Defans: 50. Kaçınma ve hız.", "req_level": 54, "req_class": "RANGER", "stats": {"EVASION_BONUS": 8, "RAW_DEF": 50, "M_DEF": 30}},
            "Offhand": {"id": "R_O_54", "name": "Gölge Ok Kılıfı", "tooltip": "Temel Saldırı: 60. Temel saldırı gücü.", "req_level": 54, "req_class": "RANGER", "stats": {"DEX": 22, "PAP_BONUS": 40, "RAW_ATK": 60, "P_CRIT_BONUS": 3}}
        },
        "66": {
            "Silah": {"id": "R_W_66", "name": "Kadim Yay", "tooltip": "Temel Saldırı: 170. Hafif hasar artışı.", "req_level": 66, "req_class": "RANGER", "stats": {"DEX": 35, "PAP_BONUS": 110, "VIT": 8, "RAW_ATK": 170, "P_CRIT_BONUS": 8, "ASPD_BONUS": 7}},
            "Kask": {"id": "R_H_66", "name": "Yüce Başlık", "tooltip": "Temel Defans: 100, MP: 300. FOC odaklı.", "req_level": 66, "req_class": "RANGER", "stats": {"FOC": 25, "P_DEF": 40, "DEX": 10, "RAW_DEF": 100, "MP": 300, "EVASION_BONUS": 6}},
            "Zırh": {"id": "R_A_66", "name": "Ebedi Av Zırhı", "tooltip": "Temel Defans: 180, HP: 400. Fiziksel/Büyü dengesi.", "req_level": 66, "req_class": "RANGER", "stats": {"DEX": 25, "VIT": 32, "P_DEF": 85, "M_DEF": 35, "RAW_DEF": 180, "HP": 400, "EVASION_BONUS": 9}},
            "Pantolon": {"id": "R_P_66", "name": "İlahi Hız Pantolonu", "tooltip": "Temel Defans: 140, HP: 280. Hız ve kaçınma.", "req_level": 66, "req_class": "RANGER", "stats": {"DEX": 30, "P_DEF": 60, "RAW_DEF": 140, "HP": 280, "EVASION_BONUS": 8}},
            "Eldiven": {"id": "R_G_66", "name": "Tanrısal Nişancı Eldiveni", "tooltip": "Temel Defans: 70. Kritik şansı.", "req_level": 66, "req_class": "RANGER", "stats": {"DEX": 22, "P_CRIT_BONUS": 5, "RAW_DEF": 70, "ASPD_BONUS": 8}},
            "Bileklik": {"id": "R_WR_66", "name": "Yüce Nişancı Bilekliği", "tooltip": "Temel Defans: 55, MP: 300. DEX ve FOC.", "req_level": 66, "req_class": "RANGER", "stats": {"DEX": 18, "FOC": 15, "RAW_DEF": 55, "MP": 300, "P_DEF": 15}},
            "Kolye": {"id": "R_N_66", "name": "Ebedi Av Kolyesi", "tooltip": "Temel Defans: 35, HP: 350. DEX ve VIT.", "req_level": 66, "req_class": "RANGER", "stats": {"DEX": 15, "VIT": 15, "HP": 350, "RAW_DEF": 35, "FOC": 8}},
            "Pelerin": {"id": "R_C_66", "name": "İlahi Gölge Pelerini", "tooltip": "Temel Defans: 60. Kaçınma ve hız.", "req_level": 66, "req_class": "RANGER", "stats": {"EVASION_BONUS": 9, "RAW_DEF": 60, "M_DEF": 35}},
            "Offhand": {"id": "R_O_66", "name": "Ebedi Ok Kılıfı", "tooltip": "Temel Saldırı: 70. Temel saldırı gücü.", "req_level": 66, "req_class": "RANGER", "stats": {"DEX": 25, "PAP_BONUS": 50, "RAW_ATK": 70, "ASPD_BONUS": 4}}
        },
        "75": {
            "Silah": {"id": "R_W_75", "name": "Rüzgarın Fısıltısı Yayı", "tooltip": "Temel Saldırı: 200. Süper hızlı atışlar.", "req_level": 75, "req_class": "RANGER", "stats": {"DEX": 45, "VIT": 10, "PAP_BONUS": 130, "RAW_ATK": 200, "ASPD_BONUS": 12, "P_CRIT_BONUS": 10}},
            "Kask": {"id": "R_H_75", "name": "Avcı Kapüşonu", "tooltip": "Temel Defans: 120, HP: 300. Nişanı ve kritik şansı artırır.", "req_level": 75, "req_class": "RANGER", "stats": {"DEX": 20, "FOC": 10, "P_DEF": 50, "RAW_DEF": 120, "HP": 300, "P_CRIT_BONUS": 3}},
            "Zırh": {"id": "R_A_75", "name": "Gölge Derisi Zırh", "tooltip": "Temel Defans: 220, HP: 500. Yüksek kaçınma değeri.", "req_level": 75, "req_class": "RANGER", "stats": {"DEX": 25, "VIT": 15, "P_DEF": 90, "RAW_DEF": 220, "EVASION_BONUS": 10, "HP": 500, "M_DEF": 40}},
            "Pantolon": {"id": "R_P_75", "name": "Çeviklik Taytı", "tooltip": "Temel Defans: 160, HP: 350. Hareket hızını destekler.", "req_level": 75, "req_class": "RANGER", "stats": {"DEX": 30, "VIT": 10, "P_DEF": 70, "RAW_DEF": 160, "HP": 350, "EVASION_BONUS": 9}},
            "Eldiven": {"id": "R_G_75", "name": "Tetikçi Eldiveni", "tooltip": "Temel Defans: 85. Kritik vuruş şansı sağlar.", "req_level": 75, "req_class": "RANGER", "stats": {"DEX": 30, "P_CRIT_BONUS": 6, "RAW_DEF": 85, "ASPD_BONUS": 5}},
            "Bileklik": {"id": "R_WR_75", "name": "Nişancı Bilekliği", "tooltip": "Temel Defans: 65, MP: 400. İsabet oranını artırır.", "req_level": 75, "req_class": "RANGER", "stats": {"DEX": 20, "FOC": 15, "RAW_DEF": 65, "MP": 400, "PAP_BONUS": 10}},
            "Kolye": {"id": "R_N_75", "name": "Kurt Dişi Kolyesi", "tooltip": "Temel Defans: 45, HP: 400. Saf saldırı gücü ve dayanıklılık.", "req_level": 75, "req_class": "RANGER", "stats": {"DEX": 18, "VIT": 12, "HP": 400, "RAW_DEF": 45, "P_DEF": 25}},
            "Pelerin": {"id": "R_C_75", "name": "Orman Hayaleti Pelerini", "tooltip": "Temel Defans: 75. Gizlilik yeteneklerini destekler.", "req_level": 75, "req_class": "RANGER", "stats": {"DEX": 15, "P_DEF": 40, "RAW_DEF": 75, "M_DEF": 35, "EVASION_BONUS": 10}},
            "Offhand": {"id": "R_O_75", "name": "Zehirli Ok Kılıfı", "tooltip": "Temel Saldırı: 80. Ek hasar ve kritik şansı.", "req_level": 75, "req_class": "RANGER", "stats": {"DEX": 35, "P_CRIT_BONUS": 6, "FOC": 15, "RAW_ATK": 80, "ASPD_BONUS": 4}}
        },
    },

    # ------------------------------------------------------------------------------------------------------
    # 12. WARDEN (DEX/STR/VIT Odaklı - Orta Zırh/Mızrak + Offhand)
    # ------------------------------------------------------------------------------------------------------
    "WARDEN": {
        "1": {
            "Silah": {"id": "WA_W_1", "name": "Avcı Mızrağı", "tooltip": "Temel Saldırı: 15. Temel STR/DEX.", "req_level": 1, "req_class": "WARDEN", "stats": {"STR": 1, "DEX": 1, "PAP_BONUS": 5, "RAW_ATK": 15, "PET_ATK_BONUS": 1}},
            "Kask": {"id": "WA_H_1", "name": "Savaş Başlığı", "tooltip": "Temel Defans: 5, HP: 10. Temel VIT.", "req_level": 1, "req_class": "WARDEN", "stats": {"VIT": 1, "P_DEF": 1, "RAW_DEF": 5, "HP": 10}},
            "Zırh": {"id": "WA_A_1", "name": "Orta Deri Zırh", "tooltip": "Temel Defans: 10, HP: 20. Temel koruma.", "req_level": 1, "req_class": "WARDEN", "stats": {"DEX": 1, "VIT": 1, "P_DEF": 2, "RAW_DEF": 10, "HP": 20}},
            "Pantolon": {"id": "WA_P_1", "name": "Hafif Pantolon", "tooltip": "Temel Defans: 7. Temel DEX.", "req_level": 1, "req_class": "WARDEN", "stats": {"DEX": 1, "P_DEF": 1, "RAW_DEF": 7}},
            "Eldiven": {"id": "WA_G_1", "name": "Hayvan Pençesi", "tooltip": "Temel Defans: 4. Temel STR.", "req_level": 1, "req_class": "WARDEN", "stats": {"STR": 1, "P_DEF": 1, "RAW_DEF": 4, "ASPD_BONUS": 1}},
            "Bileklik": {"id": "WA_WR_1", "name": "Pet Tılsımı", "tooltip": "Temel Defans: 2. Temel pet gücü.", "req_level": 1, "req_class": "WARDEN", "stats": {"PET_ATK_BONUS": 1, "RAW_DEF": 2, "DEX": 1}},
            "Kolye": {"id": "WA_N_1", "name": "Klan Sembolü", "tooltip": "Temel Defans: 1, HP: 15. Temel VIT.", "req_level": 1, "req_class": "WARDEN", "stats": {"VIT": 1, "RAW_DEF": 1, "HP": 15}},
            "Pelerin": {"id": "WA_C_1", "name": "Klan Pelerini", "tooltip": "Temel Defans: 3. Temel P_DEF.", "req_level": 1, "req_class": "WARDEN", "stats": {"P_DEF": 1, "RAW_DEF": 3, "M_DEF": 1}},
            "Offhand": {"id": "WA_O_1", "name": "Pet Düdüğü", "tooltip": "Temel Defans: 4. Temel pet gücü.", "req_level": 1, "req_class": "WARDEN", "stats": {"PET_ATK_BONUS": 1, "RAW_DEF": 4}}
        },
        "9": {
            "Silah": {"id": "WA_W_9", "name": "Sert Ağaç Mızrak", "tooltip": "Temel Saldırı: 30. Gelişmiş hasar/pet.", "req_level": 9, "req_class": "WARDEN", "stats": {"STR": 3, "DEX": 3, "PAP_BONUS": 15, "RAW_ATK": 30, "PET_ATK_BONUS": 3}},
            "Kask": {"id": "WA_H_9", "name": "Avcı Başlığı", "tooltip": "Temel Defans: 15, HP: 30. Temel DEX/VIT.", "req_level": 9, "req_class": "WARDEN", "stats": {"DEX": 3, "P_DEF": 5, "VIT": 1, "RAW_DEF": 15, "HP": 30}},
            "Zırh": {"id": "WA_A_9", "name": "Perçinli Deri Zırh", "tooltip": "Temel Defans: 30, HP: 60. Orta koruma.", "req_level": 9, "req_class": "WARDEN", "stats": {"DEX": 3, "VIT": 5, "P_DEF": 10, "RAW_DEF": 30, "HP": 60, "EVASION_BONUS": 1}},
            "Pantolon": {"id": "WA_P_9", "name": "Avcı Pantolonu", "tooltip": "Temel Defans: 20, HP: 40. DEX/P_DEF.", "req_level": 9, "req_class": "WARDEN", "stats": {"DEX": 4, "P_DEF": 6, "RAW_DEF": 20, "HP": 40}},
            "Eldiven": {"id": "WA_G_9", "name": "Hızlı Pençe Eldiven", "tooltip": "Temel Defans: 10. Saldırı hızı artışı.", "req_level": 9, "req_class": "WARDEN", "stats": {"STR": 3, "ASPD_BONUS": 2, "RAW_DEF": 10, "P_CRIT_BONUS": 1}},
            "Bileklik": {"id": "WA_WR_9", "name": "Klan Bilekliği", "tooltip": "Temel Defans: 5, HP: 20. Temel pet gücü.", "req_level": 9, "req_class": "WARDEN", "stats": {"STR": 2, "PET_ATK_BONUS": 4, "RAW_DEF": 5, "HP": 20}},
            "Kolye": {"id": "WA_N_9", "name": "Alfa Dişi", "tooltip": "Temel Defans: 3, HP: 50. Temel VIT/STR.", "req_level": 9, "req_class": "WARDEN", "stats": {"VIT": 2, "STR": 1, "RAW_DEF": 3, "HP": 50}},
            "Pelerin": {"id": "WA_C_9", "name": "Orman Pelerini", "tooltip": "Temel Defans: 5. Temel kaçınma.", "req_level": 9, "req_class": "WARDEN", "stats": {"EVASION_BONUS": 2, "RAW_DEF": 5, "M_DEF": 3}},
            "Offhand": {"id": "WA_O_9", "name": "Eğitim Kitabı", "tooltip": "Temel Defans: 10, HP: 10. Pet gücü/HP.", "req_level": 9, "req_class": "WARDEN", "stats": {"PET_ATK_BONUS": 5, "PET_HP_BONUS": 10, "RAW_DEF": 10}}
        },
        "18": {
            "Silah": {"id": "WA_W_18", "name": "Demir Mızrak", "tooltip": "Temel Saldırı: 50. Gelişmiş hasar/pet.", "req_level": 18, "req_class": "WARDEN", "stats": {"STR": 5, "DEX": 5, "PAP_BONUS": 30, "RAW_ATK": 50, "PET_ATK_BONUS": 8, "P_CRIT_BONUS": 1}},
            "Kask": {"id": "WA_H_18", "name": "Gözcü Miğferi", "tooltip": "Temel Defans: 25, HP: 50. DEX/VIT.", "req_level": 18, "req_class": "WARDEN", "stats": {"DEX": 6, "P_DEF": 10, "VIT": 2, "RAW_DEF": 25, "HP": 50, "M_DEF": 5}},
            "Zırh": {"id": "WA_A_18", "name": "Hayvan Postu Zırh", "tooltip": "Temel Defans: 55, HP: 100. Hibrit koruma.", "req_level": 18, "req_class": "WARDEN", "stats": {"DEX": 5, "VIT": 10, "P_DEF": 20, "RAW_DEF": 55, "PET_HP_BONUS": 20, "HP": 100, "EVASION_BONUS": 2}},
            "Pantolon": {"id": "WA_P_18", "name": "Esnek Dizlik", "tooltip": "Temel Defans: 35, HP: 60. Hız ve kaçınma.", "req_level": 18, "req_class": "WARDEN", "stats": {"DEX": 8, "P_DEF": 15, "RAW_DEF": 35, "HP": 60, "EVASION_BONUS": 2}},
            "Eldiven": {"id": "WA_G_18", "name": "Avcı Eldiveni", "tooltip": "Temel Defans: 18. Saldırı hızı artışı.", "req_level": 18, "req_class": "WARDEN", "stats": {"STR": 5, "ASPD_BONUS": 3, "RAW_DEF": 18, "P_CRIT_BONUS": 2}},
            "Bileklik": {"id": "WA_WR_18", "name": "Pet Arkadaş Bilekliği", "tooltip": "Temel Defans: 10, HP: 30. Pet gücü/HP.", "req_level": 18, "req_class": "WARDEN", "stats": {"STR": 4, "PET_ATK_BONUS": 10, "RAW_DEF": 10, "HP": 30, "P_DEF": 5}},
            "Kolye": {"id": "WA_N_18", "name": "Yoldaş Kolyesi", "tooltip": "Temel Defans: 5, HP: 60. VIT ve STR/DEX.", "req_level": 18, "req_class": "WARDEN", "stats": {"VIT": 3, "DEX": 3, "RAW_DEF": 5, "HP": 60, "STR": 1}},
            "Pelerin": {"id": "WA_C_18", "name": "Gölge Pelerini", "tooltip": "Temel Defans: 12. Kaçınma ve hız.", "req_level": 18, "req_class": "WARDEN", "stats": {"EVASION_BONUS": 3, "RAW_DEF": 12, "M_DEF": 8}},
            "Offhand": {"id": "WA_O_18", "name": "Ruhani Düdük", "tooltip": "Temel Defans: 20, HP: 25. Pet gücü/HP.", "req_level": 18, "req_class": "WARDEN", "stats": {"PET_ATK_BONUS": 12, "PET_HP_BONUS": 25, "RAW_DEF": 20, "DEX": 3}}
        },
        "24": {
            "Silah": {"id": "WA_W_24", "name": "Koruma Mızrağı", "tooltip": "Temel Saldırı: 70. Gelişmiş hasar/pet.", "req_level": 24, "req_class": "WARDEN", "stats": {"STR": 7, "DEX": 7, "PAP_BONUS": 40, "RAW_ATK": 70, "PET_ATK_BONUS": 12, "P_CRIT_BONUS": 2}},
            "Kask": {"id": "WA_H_24", "name": "Savaş Lordu Başlığı", "tooltip": "Temel Defans: 35, HP: 70. DEX/VIT.", "req_level": 24, "req_class": "WARDEN", "stats": {"DEX": 8, "P_DEF": 15, "VIT": 3, "RAW_DEF": 35, "HP": 70, "M_DEF": 8}},
            "Zırh": {"id": "WA_A_24", "name": "Sert Post Zırh", "tooltip": "Temel Defans: 80, HP: 150. Hibrit koruma.", "req_level": 24, "req_class": "WARDEN", "stats": {"DEX": 7, "VIT": 14, "P_DEF": 30, "RAW_DEF": 80, "PET_HP_BONUS": 40, "HP": 150, "EVASION_BONUS": 4}},
            "Pantolon": {"id": "WA_P_24", "name": "Savaşçı Dizliği", "tooltip": "Temel Defans: 50, HP: 90. Hız ve kaçınma.", "req_level": 24, "req_class": "WARDEN", "stats": {"DEX": 10, "P_DEF": 20, "RAW_DEF": 50, "HP": 90, "EVASION_BONUS": 3}},
            "Eldiven": {"id": "WA_G_24", "name": "Gölge Pençe Eldiven", "tooltip": "Temel Defans: 25. Saldırı hızı artışı.", "req_level": 24, "req_class": "WARDEN", "stats": {"STR": 7, "ASPD_BONUS": 4, "RAW_DEF": 25, "P_CRIT_BONUS": 3}},
            "Bileklik": {"id": "WA_WR_24", "name": "Alfa Bilekliği", "tooltip": "Temel Defans: 15, HP: 50. Pet gücü/HP.", "req_level": 24, "req_class": "WARDEN", "stats": {"DEX": 6, "PET_ATK_BONUS": 15, "RAW_DEF": 15, "HP": 50, "STR": 2}},
            "Kolye": {"id": "WA_N_24", "name": "Gölge Avı Kolyesi", "tooltip": "Temel Defans: 8, HP: 80. VIT ve STR/DEX.", "req_level": 24, "req_class": "WARDEN", "stats": {"VIT": 4, "DEX": 4, "RAW_DEF": 8, "HP": 80, "STR": 1}},
            "Pelerin": {"id": "WA_C_24", "name": "Hızlı Koşu Pelerini", "tooltip": "Temel Defans: 20. Kaçınma ve hız.", "req_level": 24, "req_class": "WARDEN", "stats": {"EVASION_BONUS": 4, "RAW_DEF": 20, "M_DEF": 10}},
            "Offhand": {"id": "WA_O_24", "name": "Avcı Kılıfı", "tooltip": "Temel Defans: 30, HP: 40. Pet gücü/HP.", "req_level": 24, "req_class": "WARDEN", "stats": {"PET_ATK_BONUS": 20, "PET_HP_BONUS": 50, "RAW_DEF": 30, "DEX": 5}}
        },
        "34": {
            "Silah": {"id": "WA_W_34", "name": "Ejderha Mızrağı", "tooltip": "Temel Saldırı: 90. Gelişmiş hasar/pet.", "req_level": 34, "req_class": "WARDEN", "stats": {"STR": 10, "DEX": 10, "PAP_BONUS": 60, "RAW_ATK": 90, "PET_ATK_BONUS": 18, "P_CRIT_BONUS": 3}},
            "Kask": {"id": "WA_H_34", "name": "Ejderha Başlığı", "tooltip": "Temel Defans: 45, HP: 90. DEX/VIT.", "req_level": 34, "req_class": "WARDEN", "stats": {"DEX": 12, "P_DEF": 20, "VIT": 4, "RAW_DEF": 45, "HP": 90, "M_DEF": 12}},
            "Zırh": {"id": "WA_A_34", "name": "Runik Post Zırh", "tooltip": "Temel Defans: 110, HP: 180. Hibrit koruma.", "req_level": 34, "req_class": "WARDEN", "stats": {"DEX": 10, "VIT": 18, "P_DEF": 40, "RAW_DEF": 110, "PET_HP_BONUS": 60, "HP": 180, "EVASION_BONUS": 5}},
            "Pantolon": {"id": "WA_P_34", "name": "Gölge Koşusu Pantolonu", "tooltip": "Temel Defans: 70, HP: 120. Hız ve kaçınma.", "req_level": 34, "req_class": "WARDEN", "stats": {"DEX": 14, "P_DEF": 30, "RAW_DEF": 70, "HP": 120, "EVASION_BONUS": 4}},
            "Eldiven": {"id": "WA_G_34", "name": "Ejderha Dokunuşu", "tooltip": "Temel Defans: 35. Saldırı hızı artışı.", "req_level": 34, "req_class": "WARDEN", "stats": {"STR": 10, "ASPD_BONUS": 5, "RAW_DEF": 35, "P_CRIT_BONUS": 4}},
            "Bileklik": {"id": "WA_WR_34", "name": "Ruhani Bileklik", "tooltip": "Temel Defans: 20, HP: 70. Pet gücü/HP.", "req_level": 34, "req_class": "WARDEN", "stats": {"DEX": 8, "PET_ATK_BONUS": 25, "RAW_DEF": 20, "HP": 70, "STR": 3}},
            "Kolye": {"id": "WA_N_34", "name": "Vahşi Yaşam Kolyesi", "tooltip": "Temel Defans: 12, HP: 120. VIT ve STR/DEX.", "req_level": 34, "req_class": "WARDEN", "stats": {"VIT": 6, "DEX": 6, "RAW_DEF": 12, "HP": 120, "STR": 2}},
            "Pelerin": {"id": "WA_C_34", "name": "Gölge Gezgin Pelerini", "tooltip": "Temel Defans: 25. Kaçınma ve hız.", "req_level": 34, "req_class": "WARDEN", "stats": {"EVASION_BONUS": 5, "RAW_DEF": 25, "M_DEF": 15}},
            "Offhand": {"id": "WA_O_34", "name": "Mistik Kılıf", "tooltip": "Temel Defans: 40, HP: 70. Pet gücü/HP.", "req_level": 34, "req_class": "WARDEN", "stats": {"PET_ATK_BONUS": 30, "PET_HP_BONUS": 80, "RAW_DEF": 40, "DEX": 8}}
        },
        "42": {
            "Silah": {"id": "WA_W_42", "name": "Ruh Mızrağı", "tooltip": "Temel Saldırı: 110. Gelişmiş hasar/pet.", "req_level": 42, "req_class": "WARDEN", "stats": {"STR": 14, "DEX": 14, "PAP_BONUS": 75, "RAW_ATK": 110, "PET_ATK_BONUS": 25, "P_CRIT_BONUS": 4}},
            "Kask": {"id": "WA_H_42", "name": "Vahşi Lord Başlığı", "tooltip": "Temel Defans: 60, HP: 150. DEX/VIT.", "req_level": 42, "req_class": "WARDEN", "stats": {"DEX": 15, "P_DEF": 25, "VIT": 5, "RAW_DEF": 60, "HP": 150, "ASPD_BONUS": 1}},
            "Zırh": {"id": "WA_A_42", "name": "Yüce Av Zırhı", "tooltip": "Temel Defans: 140, HP: 250. Hibrit koruma.", "req_level": 42, "req_class": "WARDEN", "stats": {"DEX": 15, "VIT": 22, "P_DEF": 55, "RAW_DEF": 140, "PET_HP_BONUS": 80, "HP": 250, "EVASION_BONUS": 6}},
            "Pantolon": {"id": "WA_P_42", "name": "Vahşi Hız Pantolonu", "tooltip": "Temel Defans: 90, HP: 150. Hız ve kaçınma.", "req_level": 42, "req_class": "WARDEN", "stats": {"DEX": 18, "P_DEF": 40, "RAW_DEF": 90, "HP": 150, "EVASION_BONUS": 5}},
            "Eldiven": {"id": "WA_G_42", "name": "Yüce Pençe Eldiven", "tooltip": "Temel Defans: 45. Saldırı hızı artışı.", "req_level": 42, "req_class": "WARDEN", "stats": {"STR": 14, "ASPD_BONUS": 6, "RAW_DEF": 45, "P_CRIT_BONUS": 5}},
            "Bileklik": {"id": "WA_WR_42", "name": "Ruhani Pet Bilekliği", "tooltip": "Temel Defans: 25, HP: 100. Pet gücü/HP.", "req_level": 42, "req_class": "WARDEN", "stats": {"DEX": 10, "PET_ATK_BONUS": 35, "RAW_DEF": 25, "HP": 100, "STR": 5}},
            "Kolye": {"id": "WA_N_42", "name": "Savaş Lordu Kolyesi", "tooltip": "Temel Defans: 15, HP: 200. VIT ve STR/DEX.", "req_level": 42, "req_class": "WARDEN", "stats": {"VIT": 8, "DEX": 8, "RAW_DEF": 15, "HP": 200, "STR": 4}},
            "Pelerin": {"id": "WA_C_42", "name": "Hızlı Gölge Pelerini", "tooltip": "Temel Defans: 30. Kaçınma ve hız.", "req_level": 42, "req_class": "WARDEN", "stats": {"EVASION_BONUS": 6, "RAW_DEF": 30, "M_DEF": 20}},
            "Offhand": {"id": "WA_O_42", "name": "Usta Eğitici Kitabı", "tooltip": "Temel Defans: 50, HP: 120. Pet gücü/HP.", "req_level": 42, "req_class": "WARDEN", "stats": {"PET_ATK_BONUS": 40, "PET_HP_BONUS": 120, "RAW_DEF": 50, "DEX": 10}}
        },
        "48": {
            "Silah": {"id": "WA_W_48", "name": "Sonsuz Av Mızrağı", "tooltip": "Temel Saldırı: 130. Gelişmiş hasar/pet.", "req_level": 48, "req_class": "WARDEN", "stats": {"STR": 17, "DEX": 17, "PAP_BONUS": 85, "RAW_ATK": 130, "PET_ATK_BONUS": 32, "P_CRIT_BONUS": 5}},
            "Kask": {"id": "WA_H_48", "name": "Gölge Avcısı Miğferi", "tooltip": "Temel Defans: 75, HP: 200. DEX/VIT.", "req_level": 48, "req_class": "WARDEN", "stats": {"DEX": 18, "P_DEF": 30, "VIT": 6, "RAW_DEF": 75, "HP": 200, "ASPD_BONUS": 2}},
            "Zırh": {"id": "WA_A_48", "name": "Ebedi Post Zırh", "tooltip": "Temel Defans: 170, HP: 300. Hibrit koruma.", "req_level": 48, "req_class": "WARDEN", "stats": {"DEX": 18, "VIT": 25, "P_DEF": 65, "RAW_DEF": 170, "PET_HP_BONUS": 100, "HP": 300, "EVASION_BONUS": 7}},
            "Pantolon": {"id": "WA_P_48", "name": "Gölge Koşucusu Pantolonu", "tooltip": "Temel Defans: 110, HP: 180. Hız ve kaçınma.", "req_level": 48, "req_class": "WARDEN", "stats": {"DEX": 22, "P_DEF": 45, "RAW_DEF": 110, "HP": 180, "EVASION_BONUS": 6}},
            "Eldiven": {"id": "WA_G_48", "name": "Av Lordu Eldiveni", "tooltip": "Temel Defans: 55. Saldırı hızı artışı.", "req_level": 48, "req_class": "WARDEN", "stats": {"STR": 17, "ASPD_BONUS": 7, "RAW_DEF": 55, "P_CRIT_BONUS": 6}},
            "Bileklik": {"id": "WA_WR_48", "name": "Yüce Alfa Bilekliği", "tooltip": "Temel Defans: 35, HP: 120. Pet gücü/HP.", "req_level": 48, "req_class": "WARDEN", "stats": {"DEX": 12, "PET_ATK_BONUS": 45, "RAW_DEF": 35, "HP": 120, "STR": 7}},
            "Kolye": {"id": "WA_N_48", "name": "Ruhani Yoldaş Kolyesi", "tooltip": "Temel Defans: 20, HP: 250. VIT ve STR/DEX.", "req_level": 48, "req_class": "WARDEN", "stats": {"VIT": 10, "DEX": 10, "RAW_DEF": 20, "HP": 250, "STR": 5}},
            "Pelerin": {"id": "WA_C_48", "name": "Doğa Ruhu Pelerini", "tooltip": "Temel Defans: 40. Kaçınma ve hız.", "req_level": 48, "req_class": "WARDEN", "stats": {"EVASION_BONUS": 7, "RAW_DEF": 40, "M_DEF": 25}},
            "Offhand": {"id": "WA_O_48", "name": "Ejderha Düdüğü", "tooltip": "Temel Defans: 65, HP: 150. Pet gücü/HP.", "req_level": 48, "req_class": "WARDEN", "stats": {"PET_ATK_BONUS": 50, "PET_HP_BONUS": 150, "RAW_DEF": 65, "DEX": 12}}
        },
        "54": {
            "Silah": {"id": "WA_W_54", "name": "Yüce Koruma Mızrağı", "tooltip": "Temel Saldırı: 150. Gelişmiş hasar/pet.", "req_level": 54, "req_class": "WARDEN", "stats": {"STR": 21, "DEX": 21, "PAP_BONUS": 95, "RAW_ATK": 150, "PET_ATK_BONUS": 40, "P_CRIT_BONUS": 6}},
            "Kask": {"id": "WA_H_54", "name": "Sonsuz Avcı Başlığı", "tooltip": "Temel Defans: 90, HP: 250. DEX/VIT.", "req_level": 54, "req_class": "WARDEN", "stats": {"DEX": 22, "P_DEF": 35, "VIT": 8, "RAW_DEF": 90, "HP": 250, "ASPD_BONUS": 3}},
            "Zırh": {"id": "WA_A_54", "name": "Mistik Post Zırh", "tooltip": "Temel Defans: 200, HP: 350. Hibrit koruma.", "req_level": 54, "req_class": "WARDEN", "stats": {"DEX": 22, "VIT": 28, "P_DEF": 75, "RAW_DEF": 200, "PET_HP_BONUS": 125, "HP": 350, "EVASION_BONUS": 8}},
            "Pantolon": {"id": "WA_P_54", "name": "Ebedi Hız Pantolonu", "tooltip": "Temel Defans: 130, HP: 220. Hız ve kaçınma.", "req_level": 54, "req_class": "WARDEN", "stats": {"DEX": 26, "P_DEF": 50, "RAW_DEF": 130, "HP": 220, "EVASION_BONUS": 7}},
            "Eldiven": {"id": "WA_G_54", "name": "Yüce Alfa Eldiveni", "tooltip": "Temel Defans: 65. Saldırı hızı artışı.", "req_level": 54, "req_class": "WARDEN", "stats": {"STR": 21, "ASPD_BONUS": 8, "RAW_DEF": 65, "P_CRIT_BONUS": 7}},
            "Bileklik": {"id": "WA_WR_54", "name": "Sonsuz Pet Bilekliği", "tooltip": "Temel Defans: 50, HP: 150. Pet gücü/HP.", "req_level": 54, "req_class": "WARDEN", "stats": {"DEX": 15, "PET_ATK_BONUS": 55, "RAW_DEF": 50, "HP": 150, "VIT": 5}},
            "Kolye": {"id": "WA_N_54", "name": "Kadim Klan Kolyesi", "tooltip": "Temel Defans: 25, HP: 300. VIT ve STR/DEX.", "req_level": 54, "req_class": "WARDEN", "stats": {"VIT": 12, "DEX": 12, "RAW_DEF": 25, "HP": 300, "STR": 6}},
            "Pelerin": {"id": "WA_C_54", "name": "Av Lordu Pelerini", "tooltip": "Temel Defans: 50. Kaçınma ve hız.", "req_level": 54, "req_class": "WARDEN", "stats": {"EVASION_BONUS": 8, "RAW_DEF": 50, "M_DEF": 30}},
            "Offhand": {"id": "WA_O_54", "name": "Ruhani Çağrı Kitabı", "tooltip": "Temel Defans: 80, HP: 220. Pet gücü/HP.", "req_level": 54, "req_class": "WARDEN", "stats": {"PET_ATK_BONUS": 60, "PET_HP_BONUS": 180, "RAW_DEF": 80, "DEX": 15}}
        },
        "66": {
            "Silah": {"id": "WA_W_66", "name": "Ebedi Muhafız Mızrağı", "tooltip": "Temel Saldırı: 170. Maksimum hasar/pet.", "req_level": 66, "req_class": "WARDEN", "stats": {"STR": 25, "DEX": 25, "PAP_BONUS": 110, "RAW_ATK": 170, "PET_ATK_BONUS": 50, "P_CRIT_BONUS": 7}},
            "Kask": {"id": "WA_H_66", "name": "Yüce Warden Miğferi", "tooltip": "Temel Defans: 110, HP: 300. DEX/VIT.", "req_level": 66, "req_class": "WARDEN", "stats": {"DEX": 25, "P_DEF": 40, "VIT": 10, "RAW_DEF": 110, "HP": 300, "ASPD_BONUS": 4}},
            "Zırh": {"id": "WA_A_66", "name": "İlahi Koruma Zırhı", "tooltip": "Temel Defans: 230, HP: 400. Maksimum hibrit koruma.", "req_level": 66, "req_class": "WARDEN", "stats": {"DEX": 25, "VIT": 32, "P_DEF": 85, "RAW_DEF": 230, "PET_HP_BONUS": 150, "HP": 400, "EVASION_BONUS": 9}},
            "Pantolon": {"id": "WA_P_66", "name": "Uyum Dizliği", "tooltip": "Temel Defans: 150, HP: 280. Hız ve kaçınma.", "req_level": 66, "req_class": "WARDEN", "stats": {"DEX": 30, "P_DEF": 60, "RAW_DEF": 150, "HP": 280, "EVASION_BONUS": 8}},
            "Eldiven": {"id": "WA_G_66", "name": "Ebedi Pençe Eldiveni", "tooltip": "Temel Defans: 75. Saldırı hızı artışı.", "req_level": 66, "req_class": "WARDEN", "stats": {"STR": 25, "ASPD_BONUS": 9, "RAW_DEF": 75, "P_CRIT_BONUS": 8}},
            "Bileklik": {"id": "WA_WR_66", "name": "Sonsuz Denge Bilekliği", "tooltip": "Temel Defans: 60, HP: 150. Pet gücü/HP.", "req_level": 66, "req_class": "WARDEN", "stats": {"DEX": 18, "PET_ATK_BONUS": 65, "RAW_DEF": 60, "HP": 150, "VIT": 8}},
            "Kolye": {"id": "WA_N_66", "name": "Doğa Uyum Kolyesi", "tooltip": "Temel Defans: 35, HP: 350. VIT ve STR/DEX.", "req_level": 66, "req_class": "WARDEN", "stats": {"VIT": 15, "DEX": 15, "RAW_DEF": 35, "HP": 350, "STR": 8}},
            "Pelerin": {"id": "WA_C_66", "name": "Ruhani Av Pelerini", "tooltip": "Temel Defans: 70. Kaçınma ve hız.", "req_level": 66, "req_class": "WARDEN", "stats": {"EVASION_BONUS": 9, "RAW_DEF": 70, "M_DEF": 35}},
            "Offhand": {"id": "WA_O_66", "name": "Yüce Eğitici Kitabı", "tooltip": "Temel Defans: 100, HP: 280. Pet gücü/HP.", "req_level": 66, "req_class": "WARDEN", "stats": {"PET_ATK_BONUS": 75, "PET_HP_BONUS": 220, "RAW_DEF": 100, "DEX": 18}}
        },
        "75": {
            "Silah": {"id": "WA_W_75", "name": "Vahşi Hüküm Mızrağı", "tooltip": "Temel Saldırı: 200. Hem Warden hem petine maksimum saldırı gücü sağlar.", "req_level": 75, "req_class": "WARDEN", "stats": {"STR": 30, "DEX": 30, "PAP_BONUS": 125, "RAW_ATK": 200, "PET_ATK_BONUS": 80, "P_CRIT_BONUS": 8}},
            "Kask": {"id": "WA_H_75", "name": "Doğa Lordu Başlığı", "tooltip": "Temel Defans: 130, HP: 400. Dayanıklılık ve saldırı hızı.", "req_level": 75, "req_class": "WARDEN", "stats": {"DEX": 15, "VIT": 15, "P_DEF": 50, "RAW_DEF": 130, "ASPD_BONUS": 4, "HP": 400, "M_DEF": 40}},
            "Zırh": {"id": "WA_A_75", "name": "Kadim Muhafız Zırhı", "tooltip": "Temel Defans: 250, HP: 500. Petin hayatta kalma şansını artırır.", "req_level": 75, "req_class": "WARDEN", "stats": {"DEX": 20, "VIT": 30, "P_DEF": 100, "RAW_DEF": 250, "PET_HP_BONUS": 250, "HP": 500, "EVASION_BONUS": 10}},
            "Pantolon": {"id": "WA_P_75", "name": "Klan Dizliği", "tooltip": "Temel Defans: 170, HP: 350. Fiziksel savunma ve kaçınma.", "req_level": 75, "req_class": "WARDEN", "stats": {"DEX": 25, "VIT": 15, "P_DEF": 70, "RAW_DEF": 170, "HP": 350, "EVASION_BONUS": 9}},
            "Eldiven": {"id": "WA_G_75", "name": "Ebedi Av Eldiveni", "tooltip": "Temel Defans: 90. Kritik vuruş şansı ve saldırı hızı.", "req_level": 75, "req_class": "WARDEN", "stats": {"STR": 20, "DEX": 15, "P_CRIT_BONUS": 5, "RAW_DEF": 90, "ASPD_BONUS": 5}},
            "Bileklik": {"id": "WA_WR_75", "name": "Alfa Güç Bilekliği", "tooltip": "Temel Defans: 70, HP: 200. Pet ve Warden'a saf güç.", "req_level": 75, "req_class": "WARDEN", "stats": {"STR": 15, "DEX": 15, "PET_ATK_BONUS": 90, "RAW_DEF": 70, "HP": 200, "VIT": 10}},
            "Kolye": {"id": "WA_N_75", "name": "Vahşi Denge Kolyesi", "tooltip": "Temel Defans: 45, HP: 400. Tüm fiziksel statlar ve HP.", "req_level": 75, "req_class": "WARDEN", "stats": {"STR": 12, "DEX": 12, "VIT": 10, "HP": 400, "RAW_DEF": 45, "P_DEF": 25}},
            "Pelerin": {"id": "WA_C_75", "name": "Ruhani Uyum Pelerini", "tooltip": "Temel Defans: 85. Savunma ve kaçınma dengesi.", "req_level": 75, "req_class": "WARDEN", "stats": {"VIT": 10, "EVASION_BONUS": 10, "P_DEF": 40, "RAW_DEF": 85, "M_DEF": 35}},
            "Offhand": {"id": "WA_O_75", "name": "Yüce Av Kitabı", "tooltip": "Temel Defans: 110, HP: 350. Petin saldırı gücü ve HP'sini maksimize eder.", "req_level": 75, "req_class": "WARDEN", "stats": {"PET_ATK_BONUS": 100, "PET_HP_BONUS": 300, "RAW_DEF": 110, "DEX": 15, "STR": 10}}
        },
    },

    # ------------------------------------------------------------------------------------------------------
    # 13. POTIONS (Tüm Sınıflar İçin İksirler/Potlar)
    # ------------------------------------------------------------------------------------------------------
    "POTIONS": {
        "LOW_LEVEL": {
            "HP_POTION_S": {"id": "P_HP_S", "name": "Küçük Can İksiri", "tooltip": "Hafif yaraları iyileştirir.", "req_level": 1, "stats": {"HP_REGEN_VALUE": 100, "COOLDOWN": 5000}},
            "HP_POTION_M": {"id": "P_HP_M", "name": "Orta Can İksiri", "tooltip": "Orta dereceli yaraları iyileştirir.", "req_level": 15, "stats": {"HP_REGEN_VALUE": 250, "COOLDOWN": 5000}},
            "MP_POTION_S": {"id": "P_MP_S", "name": "Küçük Mana İksiri", "tooltip": "Hafif mana geri kazanımı.", "req_level": 1, "stats": {"MP_REGEN_VALUE": 50, "COOLDOWN": 5000}},
            "MP_POTION_M": {"id": "P_MP_M", "name": "Orta Mana İksiri", "tooltip": "Orta dereceli mana geri kazanımı.", "req_level": 15, "stats": {"MP_REGEN_VALUE": 125, "COOLDOWN": 5000}},
            "DEFENSE_POTION_S": {"id": "P_DEF_S", "name": "Küçük Savunma İksiri", "tooltip": "Geçici fiziksel savunma sağlar.", "req_level": 10, "stats": {"P_DEF_BONUS": 5, "DURATION": 60000, "COOLDOWN": 300000}},
            "ATTACK_POTION_S": {"id": "P_ATK_S", "name": "Küçük Saldırı İksiri", "tooltip": "Geçici saldırı gücü sağlar.", "req_level": 10, "stats": {"PAP_BONUS": 10, "MAP_BONUS": 10, "DURATION": 60000, "COOLDOWN": 300000}}
        },
        "MID_LEVEL": {
            "HP_POTION_L": {"id": "P_HP_L", "name": "Büyük Can İksiri", "tooltip": "Ciddi yaraları hızla iyileştirir.", "req_level": 30, "stats": {"HP_REGEN_VALUE": 500, "COOLDOWN": 4000}},
            "MP_POTION_L": {"id": "P_MP_L", "name": "Büyük Mana İksiri", "tooltip": "Ciddi mana geri kazanımı.", "req_level": 30, "stats": {"MP_REGEN_VALUE": 250, "COOLDOWN": 4000}},
            "DEFENSE_POTION_M": {"id": "P_DEF_M", "name": "Orta Savunma İksiri", "tooltip": "Geçici fiziksel ve büyü savunması sağlar.", "req_level": 35, "stats": {"P_DEF_BONUS": 15, "M_DEF_BONUS": 15, "DURATION": 120000, "COOLDOWN": 300000}},
            "ATTACK_POTION_M": {"id": "P_ATK_M", "name": "Orta Saldırı İksiri", "tooltip": "Geçici saldırı gücü sağlar.", "req_level": 35, "stats": {"PAP_BONUS": 25, "MAP_BONUS": 25, "DURATION": 120000, "COOLDOWN": 300000}},
            "SPEED_POTION_M": {"id": "P_SPD_M", "name": "Hız İksiri", "tooltip": "Geçici saldırı ve cast hızını artırır.", "req_level": 25, "stats": {"ASPD_BONUS": 5, "CSPD_BONUS": 5, "DURATION": 90000, "COOLDOWN": 300000}},
            "CRITICAL_POTION_M": {"id": "P_CRIT_M", "name": "Kritik İksir", "tooltip": "Geçici kritik şansı sağlar.", "req_level": 25, "stats": {"P_CRIT_BONUS": 3, "M_CRIT_BONUS": 3, "DURATION": 90000, "COOLDOWN": 300000}}
        },
        "HIGH_LEVEL": {
            "HP_POTION_XL": {"id": "P_HP_XL", "name": "Yüce Can İksiri", "tooltip": "Çok ciddi yaraları anında iyileştirir.", "req_level": 50, "stats": {"HP_REGEN_VALUE": 1000, "COOLDOWN": 3000}},
            "MP_POTION_XL": {"id": "P_MP_XL", "name": "Yüce Mana İksiri", "tooltip": "Büyük ölçüde mana geri kazanımı.", "req_level": 50, "stats": {"MP_REGEN_VALUE": 500, "COOLDOWN": 3000}},
            "DEFENSE_POTION_L": {"id": "P_DEF_L", "name": "Büyük Savunma İksiri", "tooltip": "Yüksek fiziksel ve büyü savunması sağlar.", "req_level": 55, "stats": {"P_DEF_BONUS": 30, "M_DEF_BONUS": 30, "DURATION": 180000, "COOLDOWN": 300000}},
            "ATTACK_POTION_L": {"id": "P_ATK_L", "name": "Büyük Saldırı İksiri", "tooltip": "Yüksek oranda saldırı gücü sağlar.", "req_level": 55, "stats": {"PAP_BONUS": 50, "MAP_BONUS": 50, "DURATION": 180000, "COOLDOWN": 300000}},
            "SPEED_POTION_L": {"id": "P_SPD_L", "name": "İlahi Hız İksiri", "tooltip": "Maksimum saldırı ve cast hızını artırır.", "req_level": 45, "stats": {"ASPD_BONUS": 10, "CSPD_BONUS": 10, "DURATION": 120000, "COOLDOWN": 300000}},
            "CRITICAL_POTION_L": {"id": "P_CRIT_L", "name": "Yüce Kritik İksir", "tooltip": "Maksimum kritik şansı sağlar.", "req_level": 45, "stats": {"P_CRIT_BONUS": 5, "M_CRIT_BONUS": 5, "DURATION": 120000, "COOLDOWN": 300000}},
            "RESIST_POTION_L": {"id": "P_RES_L", "name": "Direniş İksiri", "tooltip": "Tüm element dirençlerini artırır.", "req_level": 60, "stats": {"RESIST_ALL": 10, "DURATION": 180000, "COOLDOWN": 300000}}
        },
    },

}

# Class kodlarını düzgün göstermek için map
const CLASS_CODE_TO_DISPLAY := {
    "DRUID": "Druid",
    "BERSERKER": "Berserker",
    "ELEMENTALIST": "Elementalist",
    "MONK": "Monk",
    "CRUSADER": "Crusader",
    "WARDEN": "Warden",
    "DRAGON_KNIGHT": "Dragon Knight",
    "WARLOCK": "Warlock",
    "CLERIC": "Cleric",
    "BARD": "Bard",
    "NECROMANCER": "Necromancer",
    "RANGER": "Ranger",
}

# Stat label’ları – senin DB’deki tüm statlar
const STAT_LABELS := {
    "STR": "STR",
    "DEX": "DEX",
    "INT": "INT",
    "WIS": "WIS",
    "VIT": "VIT",

    "RAW_ATK": "Saldırı",
    "RAW_DEF": "Savunma",
    "HP": "HP",
    "MP": "MP",

    "PAP_BONUS": "Fiziksel Saldırı %",
    "MAP_BONUS": "Büyü Saldırısı %",
    "P_DEF": "Fiziksel Defans",
    "M_DEF": "Büyü Defansı",
    "PEN_P": "Zırh Delme %",
    "M_PEN_P": "Büyü Delme %",

    "CRIT_RATE": "Kritik Oran %",
    "CRIT_DMG": "Kritik Hasar %",
    "ASPD_BONUS": "Saldırı Hızı %",
    "MSPD_BONUS": "Hareket Hızı %",

    "LIFESTEAL": "Can Çalma %",
    "MANASTEAL": "Mana Çalma %",
    "BLOCK_P": "Blok Oranı %",
    "PARRY_P": "Savuşturma Oranı %",
    "DODGE_P": "Kaçınma Oranı %",
    "HIT_RATE": "İsabet Oranı %",
    "RESIST_STUN": "Sersemletme Direnci %",
    "RESIST_SLOW": "Yavaşlatma Direnci %",
    "RESIST_ROOT": "Sabitlenme Direnci %",
    "RESIST_SILENCE": "Sessizlik Direnci %",
    "RESIST_POISON": "Zehre Direnç %",
    "RESIST_BLEED": "Kanama Direnci %",
    "RESIST_CURSE": "Lanet Direnci %",
    "HEAL_BONUS": "İyileştirme Gücü %",
    "BUFF_DURATION": "Buff Süresi %",
    "DEBUFF_DURATION": "Debuff Süresi %",
    "COOLDOWN_REDUCTION": "CD Azaltma %",
    "GOLD_BONUS": "Altın Kazancı %",
    "DROP_BONUS": "Düşüş Oranı %",

    # vs… (DB’de ne varsa ekleyebilirsin)
}

# --- YENİ EKLENTİ: DİNAMİK FİYATLANDIRMA ---

# Eşya türüne göre fiyat çarpanı (ID'deki harflere göre)
const SLOT_MULTIPLIERS = {
    "W": 5.0,  # Silahlar en pahalı
    "A": 4.5,  # Zırh (Gövde)
    "H": 3.5,  # Kask
    "P": 3.0,  # Pantolon
    "O": 3.0,  # Offhand (Kalkan/Kitap vb.)
    "G": 2.5,  # Eldiven
    "N": 2.0,  # Kolye
    "WR": 1.5, # Bileklik
    "C": 1.0   # Pelerin (En ucuz)
}

# Statların altın cinsinden ham değeri
const STAT_VALUES = {
    "STR": 2.5, "DEX": 2.5, "VIT": 2.0, "INT": 2.5, "WIS": 2.5, "FOC": 2.5,
    "HP": 0.1, "MP": 0.1,
    "RAW_ATK": 0.5, "RAW_DEF": 0.3,
    "PAP_BONUS": 5.0, "MAP_BONUS": 5.0,
    "P_DEF": 1.0, "M_DEF": 1.0,
    "P_CRIT_BONUS": 10.0, "M_CRIT_BONUS": 10.0,
    "ASPD_BONUS": 8.0, "CSPD_BONUS": 8.0,
    "LIFESTEAL": 20.0, "HEAL_BONUS": 5.0,
    "SUMMON_ATK_BONUS": 8.0, "SUMMON_HP_BONUS": 0.2
}
# ----------------------------------------------

# Tooltip’te statları hangi sırayla göstermek istiyorsan
const STAT_ORDER := [
    "STR", "DEX", "INT", "WIS", "VIT",
    "RAW_ATK", "RAW_DEF", "HP", "MP",
    "PAP_BONUS", "MAP_BONUS", "P_DEF", "M_DEF",
    "CRIT_RATE", "CRIT_DMG",
    "ASPD_BONUS", "MSPD_BONUS",
    "LIFESTEAL", "MANASTEAL",
    "HIT_RATE", "DODGE_P", "BLOCK_P", "PARRY_P",
    "HEAL_BONUS",
    "BUFF_DURATION", "DEBUFF_DURATION",
    "COOLDOWN_REDUCTION",
    "GOLD_BONUS", "DROP_BONUS",
]

var _rng := RandomNumberGenerator.new()



func _ready() -> void:
    _rng.randomize()
    # varsa başka ready kodların burada kalsın
    pass


# -----------------------------------------------------
#  YARDIMCI: ITEM NORMALİZE
# -----------------------------------------------------
func normalize_item(item: Dictionary) -> Dictionary:
    var out: Dictionary = item.duplicate(true)

    if not out.has("req_level"):
        out["req_level"] = 1
    if not out.has("req_class"):
        out["req_class"] = ""

    return out


# -----------------------------------------------------
#  STAT SATIRI FORMATLAMA
# -----------------------------------------------------
func format_stat_line(key: String, value: Variant) -> String:
    var label: String = STAT_LABELS.get(key, key)
    # Yüzdelik gibi görünen bazı statlar % ile bitsin
    var as_string := ""
    if typeof(value) == TYPE_FLOAT or typeof(value) == TYPE_INT:
        var v: float = float(value)
        # Tam sayı gibiyse int göster
        if abs(v - roundf(v)) < 0.001:
            as_string = str(int(roundf(v)))
        else:
            as_string = str(round(v * 100.0) / 100.0)
    else:
        as_string = str(value)

    # Bazı statlar %’lik
    if key.ends_with("_BONUS") or key.ends_with("_P") or key.ends_with("_RATE") or key.ends_with("_DMG"):
        return "%s: %s%%" % [label, as_string]
    else:
        return "%s: %s" % [label, as_string]


# -----------------------------------------------------
#  TOOLTIP OLUŞTURMA
# -----------------------------------------------------
func format_tooltip(item: Dictionary) -> String:
    var it: Dictionary = normalize_item(item)
    var lines: Array[String] = []

    # 1) İSİM
    var name_str: String = str(it.get("name", "")).strip_edges()
    if name_str != "":
        lines.append(name_str)

    # 2) AÇIKLAMA
    var desc_str: String = str(it.get("tooltip", "")).strip_edges()
    if desc_str != "":
        lines.append(desc_str)

    # 3) GEREKSİNİMLER
    var req_level: int = int(it.get("req_level", 1))
    var req_class_raw: String = str(it.get("req_class", "")).to_upper()
    var req_parts: Array[String] = []

    if req_level > 1:
        req_parts.append("Seviye: %d" % req_level)

    if req_class_raw != "":
        var display_class: String = CLASS_CODE_TO_DISPLAY.get(req_class_raw, req_class_raw.capitalize())
        req_parts.append("Sınıf: %s" % display_class)

    if req_parts.size() > 0:
        lines.append("Gereksinimler: " + " | ".join(req_parts))

    # 4) STATLAR
    var stats = it.get("stats", {})
    if stats is Dictionary and stats.size() > 0:
        if lines.size() > 0:
            lines.append("") # boş satır

        if STAT_ORDER.size() > 0:
            for key in STAT_ORDER:
                if stats.has(key):
                    lines.append(format_stat_line(key, stats[key]))

        # artakalan statlar
        for key in stats.keys():
            if key in STAT_ORDER:
                continue
            lines.append(format_stat_line(key, stats[key]))

    return "\n".join(lines)


# -----------------------------------------------------
#  ITEM ÇEKME (class_name, level, slot)
# -----------------------------------------------------
func get_item(p_class_name: String, level: int, slot: String) -> Dictionary:
    # class_name: "Druid" gibi geliyor → kod’a çevir
    var cname_up: String = str(p_class_name).to_upper()
    # Senin DB’inde sınıflar muhtemelen DRUID, BERSERKER vs
    # Eğer ana map’lerin ismi bu şekildeyse direkt kullanıyoruz.
    if not ITEM_DATABASE.has(cname_up):
        return {}

    # level’e en yakın uygun seti bulmak için basit yaklaşım:
    var class_block: Dictionary = ITEM_DATABASE[cname_up]
    # class_block → { "1": { "Silah": {...}, ... }, "42": {...}, ... } gibi bir yapıysa
    # sen kendi yapına göre burayı revize edebilirsin.
    # Şu anda sen zaten level bazlı kendi içinde organize ettiysen,
    # slot içinden direkt seçebilirsin. Basit yol:
    var best_item: Dictionary = {}
    var best_req: int = -1

    for k in class_block.keys():
        var set_dict = class_block[k]
        if set_dict is Dictionary and set_dict.has(slot):
            var candidate: Dictionary = set_dict[slot]
            var norm := normalize_item(candidate)
            var req_level: int = int(norm.get("req_level", 1))
            if req_level <= level and req_level > best_req:
                best_req = req_level
                best_item = norm

    return best_item.duplicate(true)


# -----------------------------------------------------
#  RANDOM ITEM (DEBUG)
# -----------------------------------------------------
func get_random_item_for_class(p_class_name: String, level: int) -> Dictionary:
    # class_name: "Druid", "BERSERKER" vs.
    # level: oyuncu seviyesi

    var cname := str(p_class_name).to_upper()

    if not ITEM_DATABASE.has(cname):
        push_warning("ItemDB.get_random_item_for_class: bilinmeyen sınıf: %s" % cname)
        return {}

    var pool: Array = []

    # ITEM_DATABASE yapısının:
    # ITEM_DATABASE["DRUID"] -> { "Set_01": { "Silah": {...}, "Kask": {...}, ... }, "Set_02": {...}, ... }
    # şeklinde olduğunu varsayıyorum.
    var class_data = ITEM_DATABASE[cname]

    for set_key in class_data.keys():
        var set_block = class_data[set_key]
        if not (set_block is Dictionary):
            continue

        for slot_key in set_block.keys():
            var item = set_block[slot_key]
            if not (item is Dictionary):
                continue

            var req_lvl := int(item.get("req_level", 1))
            var req_cls := str(item.get("req_class", "")).to_upper()

            # Level ve class şartını kontrol et
            if req_lvl <= level and (req_cls == "" or req_cls == cname):
                pool.append(item)

    if pool.is_empty():
        push_warning("ItemDB.get_random_item_for_class: %s için (lvl %d) uygun item bulunamadı." % [cname, level])
        return {}

    var idx := _rng.randi_range(0, pool.size() - 1)
    return pool[idx].duplicate(true)


# --- YENİ FONKSİYON: EŞYA FİYATI HESAPLAMA ---

# Bir eşya sözlüğünü alır ve ona bir "Alış Fiyatı" hesaplar
func get_item_price(item_data: Dictionary) -> int:
    if item_data.is_empty():
        return 0

    # 1. Adım: Seviyeye göre temel fiyat
    var base_price: float = float(item_data.get("req_level", 1)) * 5.0

    # 2. Adım: Statların toplam değerini hesapla
    var stat_price: float = 0.0
    var stats: Dictionary = item_data.get("stats", {})
    for stat_key in stats:
        var stat_value: float = float(stats[stat_key])
        var value_multiplier: float = float(STAT_VALUES.get(stat_key, 1.0))
        stat_price += (stat_value * value_multiplier)

    # 3. Adım: Slot çarpanını bul (ID'den yola çıkarak)
    var slot_multiplier: float = 1.0
    var id_str: String = item_data.get("id", "")
    if not id_str.is_empty():
        var parts: Array = id_str.split("_")
        if parts.size() == 3:
            var slot_code: String = parts[1] # "B_W_1" -> "W"
            slot_multiplier = float(SLOT_MULTIPLIERS.get(slot_code, 1.0))

    # 4. Adım: Nihai fiyatı hesapla
    # (Temel Fiyat + Stat Değeri) * Slot Çarpanı
    var final_price: int = int((base_price + stat_price) * slot_multiplier)

    # Fiyatın en az 1 Altın olmasını sağla
    return max(1, final_price)
