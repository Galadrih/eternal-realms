extends Node
class_name talent_database

# =====================================================================
# TALENT VERİTABANI
# =====================================================================
# Bu dosya, tüm sınıfların yetenek ağacı verilerini tutar. 
# TalentManager (Autoload) tarafından oyun başında yüklenir. 
#
# YAPI:
# "ClassName": {
#   "talent_id": {
#     "name": "Görünen Ad",
#     "path": "A", "B", veya "C" (Hangi yolda olduğu),
#     "pos": Vector2(x, y) (Ağaçtaki görsel konumu - Sütun, Satır),
#     "max_points": 5 (Maksimum rütbe),
#     "required_level": 10 (Gereken oyuncu seviyesi),
#     "required_points": 3 (Bu yolda harcanmış olması gereken puan),
#     "type": "passive", "skill_mod", "stat", "ultimate" (Türü),
#     "description": "Açıklama metni",
#     "effects": { "STAT_KEY": value_per_rank } (PlayerBase'in anlayacağı stat)
#   },
#   ...
# }
# =====================================================================

const TALENTS : Dictionary = {

    # =====================================================================
    # DRUID
    # =====================================================================
    "Druid": {
        # 🌳 Path A: Path of the Grove (Koruluk Yolu) - 7 Talent
        "nourish": {
            "name": "Nourish",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5, 
            "required_level": 5,
            "required_points": 0,
            "type": "passive", 
            "description": "Pasif Life Bloom yeteneğinizin verdiği \"Bloom\" etkisinin (alınan iyileştirmeleri artırma) bonusunu [%2/4/6/8/10] artırır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "attunement": {
            "name": "Attunement",
            "path": "A",
            "pos": Vector2(1, 2),
            "max_points": 5,
            "required_level": 10,
            "required_points": 3,
            "type": "stat", 
            "description": "Karakterinize [+2/4/6/8/10] Bilgelik (WIS) ekler.", 
            "effects": { "WIS": 2 }
        },
        "natural_insight": {
            "name": "Natural Insight",
            "path": "A",
            "pos": Vector2(1, 3),
            "max_points": 5,
            "required_level": 18,
            "required_points": 10,
            "type": "passive", 
            "description": "Tüm iyileştirme büyülerinizin Mana bedelini [%2/4/6/8/10] azaltır.", 
            "effects": { "MANA_COST_REDUCTION": 2 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "soothing_presence": {
            "name": "Soothing Presence",
            "path": "A",
            "pos": Vector2(1, 4),
            "max_points": 5,
            "required_level": 26,
            "required_points": 20,
            "type": "passive", 
            "description": "Tüm iyileştirme yeteneklerinizin Kritik Vurma Şansını [%1/2/3/4/5] artırır.", 
            "effects": { "HEAL_CRIT_BONUS": 1 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "swiftmend": {
            "name": "Swiftmend",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 35,
            "required_points": 30,
            "type": "skill_mod", 
            "description": "Rejuvenate yeteneğiniz artık hedefe uygulandığı anda, toplam periyodik iyileştirme miktarının [%10/15/20/25/30]'u kadar anlık iyileştirme yapar." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "symbiotic_ward": {
            "name": "Symbiotic Ward",
            "path": "A",
            "pos": Vector2(1, 6),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "passive", 
            "description": "Spirit Link aktifken, hem siz hem de bağlı hedef [%1/2/3/4/5] ek Hasar Azaltma (Damage Reduction) kazanırsınız.", 
            "effects": { "DMG_REDUCTION": 1 } # UYARI: Bu stat PlayerBase'de pasif olarak desteklenmiyor!
        },
        "essence_of_the_forest": {
            "name": "Essence of the Forest",
            "path": "A",
            "pos": Vector2(1, 7),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate", 
            "description": "Bloom Field alanı içindeki müttefikler, aldıkları iyileştirme başına [%10/20/30/40/50] şansla üzerlerindeki bir adet Zehir (Poison) veya Hastalık (Disease) etkisinden kurtulur." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },

        # 🍄 Path B: Path of Decay (Çürüme Yolu) - 7 Talent
        "deep_roots": {
            "name": "Deep Roots",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "skill_mod", 
            "description": "Entangle Roots yeteneğinizin sabitleme (Root) süresini [%5/10/15/20/25] artırır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "corrosive_touch": {
            "name": "Corrosive Touch",
            "path": "B",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive", 
            "description": "Periyodik hasar (DoT) yetenekleriniz kritik vurduğunda, hedefin aldığı iyileştirme miktarını 3 saniyeliğine [%5/10/15/20/25] azaltır." 
            # EFEKT: Proc (Kritik vurunca) -> PlayerBase.gd içinde uygulanmalı
        },
        "creeping_rot": {
            "name": "Creeping Rot",
            "path": "B",
            "pos": Vector2(4, 3), # Şemaya göre düzeltildi (Corrosive'in yanı)
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive", 
            "description": "Tüm periyodik hasar (DoT) yeteneklerinizin toplam süresini [%4/8/12/16/20] artırır (Toplam hasarı artırır)." 
            # EFEKT: UYARI: Bu stat (DOT_DURATION) PlayerBase'de desteklenmiyor!
        },
        "furious_grove": {
            "name": "Furious Grove",
            "path": "B",
            "pos": Vector2(3, 4),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "passive", 
            "description": "Pasif Nature's Fury yeteneğinizin 5 yük yerine [5/4/4/3/3] yükte tetiklenmesini sağlar." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "parasitic_spores": {
            "name": "Parasitic Spores",
            "path": "B",
            "pos": Vector2(3, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "passive", 
            "description": "Periyodik hasar (DoT) yeteneklerinizin verdiği her hasar tik'inin (damage tick) [%0.5/1/1.5/2/2.5] şansla size Mana yenilemesi sağlar." 
            # EFEKT: Proc (Tick başına) -> PlayerBase.gd içinde uygulanmalı
        },
        "lingering_toxins": {
            "name": "Lingering Toxins",
            "path": "B",
            "pos": Vector2(3, 6),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "passive", 
            "description": "DoT hasarınızdan etkilenen hedeflerin Büyü Direnci [%1/2/3/4/5] azalır." 
            # EFEKT: Düşmana Debuff -> PlayerBase.gd içinde uygulanmalı
        },
        "plaguebringer": {
            "name": "Plaguebringer",
            "path": "B",
            "pos": Vector2(3, 7),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate", 
            "description": "Poison Spores veya Rot Pulse etkisi altındaki bir düşman öldüğünde, bu DoT etkileri [%20/40/60/80/100] şansla en yakındaki düşmana sıçrar (kalan süreleriyle)." 
            # EFEKT: Proc (Ölüm anında) -> PlayerBase.gd içinde uygulanmalı
        },

        # 🌿 Path C: Path of the Wild (Vahşi Doğa Yolu) - 6 Talent
        "primal_instinct": {
            "name": "Primal Instinct",
            "path": "C",
            "pos": Vector2(5, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat", 
            "description": "Karakterinize [+2/4/6/8/10] Zeka (INT) ekler.", 
            "effects": { "INT": 2 }
        },
        "hardened_bark": {
            "name": "Hardened Bark",
            "path": "C",
            "pos": Vector2(4, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive", 
            "description": "Aldığınız fiziksel hasarı [%1/2/3/4/5]% azaltır.", 
            "effects": { "P_DEF": 1 }
        },
        "natural_vigor": {
            "name": "Natural Vigor",
            "path": "C",
            "pos": Vector2(6, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive", 
            "description": "Maksimum Can (HP) ve Mana (MP) miktarınızı [%1/2/3/4/5]% artırır.", 
            "effects": { "HP_PERCENT": 1, "MP_PERCENT": 1 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "thorns": {
            "name": "Thorns",
            "path": "C",
            "pos": Vector2(5, 4),
            "max_points": 5,
            "required_level": 30,
            "required_points": 25,
            "type": "passive", 
            "description": "Size vuran yakın dövüş (melee) saldırganları, sizin Zeka (INT) değerinizin [%5/10/15/20/25]'i kadar Doğa hasarı alır. (Thorn Armor ile birlikte çalışır).", 
            # EFEKT: Thorns -> PlayerBase.gd içinde uygulanmalı (Aktif buff değil, pasif thorns)
        },
        "explosive_seed": {
            "name": "Explosive Seed",
            "path": "C",
            "pos": Vector2(5, 5),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "skill_mod", 
            "description": "Seed Shot yeteneğiniz artık hedefe çarptığında durmaz; hedefi delip geçer ve en fazla [1/1/2/2/3] hedefe kadar vurabilir." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "wrath_of_the_wild": {
            "name": "Wrath of the Wild",
            "path": "C",
            "pos": Vector2(5, 7),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate", 
            "description": "Nature's Grasp (Atılma) kullandıktan sonraki 5 saniye boyunca, tüm Doğa hasarı veren yetenekleriniz (Vine Whip, Seed Shot vb.) [%4/8/12/16/20]% daha fazla hasar verir." 
            # EFEKT: Proc (Yetenek sonrası) -> PlayerBase.gd içinde uygulanmalı
        }
    },

    # =====================================================================
    # BERSERKER
    # =====================================================================
    "Berserker": {
        # ⚔️ Path A: Path of Fury (Öfke Yolu) - 7 Talent
        "precision": {
            "name": "Precision",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5, 
            "required_level": 5,
            "required_points": 0,
            "type": "stat", 
            "description": "Karakterinize [+2/4/6/8/10] Çeviklik (DEX) ekler.", 
            "effects": { "DEX": 2 }
        },
        "sunder": {
            "name": "Sunder",
            "path": "A",
            "pos": Vector2(1, 2),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive", 
            "description": "Tüm fiziksel saldırılarınız, hedefin zırhını 5 saniyeliğine [%1/2/3/4/5] azaltan bir debuff uygulama şansı verir (3 kez birikir)." 
            # EFEKT: Proc (Saldırı anında) -> PlayerBase.gd içinde uygulanmalı
        },
        "executioner": {
            "name": "Executioner",
            "path": "A",
            "pos": Vector2(1, 3),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "passive", 
            "description": "Canı %35'in altındaki hedeflere karşı tüm fiziksel hasarınızı [%2/4/6/8/10] artırır." 
            # EFEKT: Koşullu Hasar -> PlayerBase.gd içinde uygulanmalı
        },
        "shatter_defenses": {
            "name": "Shatter Defenses",
            "path": "A",
            "pos": Vector2(0, 4),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "skill_mod", 
            "description": "Unyielding Strike ve Bone Breaker tarafından uygulanan zırh kırma etkilerinin süresini [%10/20/30/40/50] artırır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "titans_grip": {
            "name": "Titan's Grip",
            "path": "A",
            "pos": Vector2(2, 4),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "stat", 
            "description": "Karakterinize [+2/4/6/8/10] Güç (STR) ekler.", 
            "effects": { "STR": 2 }
        },
        "overwhelm": {
            "name": "Overwhelm",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 55,
            "required_points": 50,
            "type": "passive", 
            "description": "Tüm fiziksel hasarlarınızın Kritik Hasar (Crit Damage) çarpanını [%5/10/15/20/25] artırır.", 
            "effects": { "P_CRIT_DAMAGE": 5 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "deep_wounds": {
            "name": "Deep Wounds",
            "path": "A",
            "pos": Vector2(1, 6),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate", 
            "description": "Kritik vuruşlarınız (Crit hits), hedefin 6 saniye boyunca (STR değerinize göre ölçeklenen) fiziksel hasar almasına neden olan Kanama (Bleed) etkisi uygular." 
            # EFEKT: Proc (Kritik vurunca) -> PlayerBase.gd içinde uygulanmalı
        },

        # 🩸 Path B: Path of Blood (Kan Yolu) - 7 Talent
        "iron_will": {
            "name": "Iron Will",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive", 
            "description": "Pasif Iron Will yeteneğinizin sağladığı (Stun/Slow/Knockback) etkilerini azaltma miktarını [%2/4/6/8/10] daha artırır (Maks %35'e çıkar).", 
            "effects": { "DEBUFF_RESIST": 2 } # PlayerBase'deki "computed_debuff_resist"i kullanır
        },
        "toughness": {
            "name": "Toughness",
            "path": "B",
            "pos": Vector2(3, 2),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "stat", 
            "description": "Karakterinize [+2/4/6/8/10] Canlılık (VIT) ekler.", 
            "effects": { "VIT": 2 }
        },
        "thirst_for_battle": {
            "name": "Thirst for Battle",
            "path": "B",
            "pos": Vector2(3, 3),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "passive", 
            "description": "Pasif Blood Rush yeteneğiniz tetiklendiğinde verdiği saldırı ve hareket hızı bonusunu [%2/4/6/8/10] artırır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "sanguine_strength": {
            "name": "Sanguine Strength",
            "path": "B",
            "pos": Vector2(2, 4),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "passive", 
            "description": "Canınız %50'nin altındayken, toplam Güç (STR) miktarınız [%2/4/6/8/10] artar."
            # EFEKT: Koşullu Stat -> PlayerBase.gd içinde uygulanmalı
        },
        "bloodied_vigor": {
            "name": "Bloodied Vigor",
            "path": "B",
            "pos": Vector2(4, 4),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "skill_mod", 
            "description": "Bloodletting yeteneğinin feda ettiği Max HP bedelini [%0.5/1/1.5/2/2.5]% azaltır (Maks %5.5'e düşürür)." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "endless_rage": {
            "name": "Endless Rage",
            "path": "B",
            "pos": Vector2(3, 5),
            "max_points": 5,
            "required_level": 55,
            "required_points": 50,
            "type": "passive", 
            "description": "Pasif Blood Rush yeteneğinizin tetiklenme eşiğini artırır. Artık canınız [%37/39/41/43/45] altına düştüğünde tetiklenir." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "boiling_blood": {
            "name": "Boiling Blood",
            "path": "B",
            "pos": Vector2(3, 6),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate", 
            "description": "Pasif Blood Rush aktifken, verdiğiniz tüm hasarın [%1/2/3/4/5]'i kadar Can Çalma (Lifesteal) kazanırsınız."
            # EFEKT: Koşullu Stat -> PlayerBase.gd içinde uygulanmalı
        },

        # 🛡️ Path C: Path of the Warlord (Savaş Lordu Yolu) - 6 Talent
        "battle_hardened": {
            "name": "Battle Hardened",
            "path": "C",
            "pos": Vector2(5, 2),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive", 
            "description": "Toplam Fiziksel Savunmanızı (Armor) [%2/4/6/8/10] artırır.", 
            "effects": { "P_DEF": 2 }
        },
        "concussive_force": {
            "name": "Concussive Force",
            "path": "C",
            "pos": Vector2(5, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Frenzied Combo yeteneğinin son vuruşunun sersemletme (stun) şansını [%2/4/6/8/10] artırır (Maks %40'a çıkar)." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "reverberating_cry": {
            "name": "Reverberating Cry",
            "path": "C",
            "pos": Vector2(5, 4),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "skill_mod", 
            "description": "War Cry yeteneğinin hem dostlara verdiği buff'ın hem de düşmana verdiği debuff'ın süresini [%10/20/30/40/50] artırır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "rampage": {
            "name": "Rampage",
            "path": "C",
            "pos": Vector2(5, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "passive", 
            "description": "Bir düşmanı öldürdüğünüzde, 5 saniyeliğine [%3/6/9/12/15] hareket hızı kazanırsınız." 
            # EFEKT: Proc (Ölüm anında) -> PlayerBase.gd içinde uygulanmalı
        },
        "wide_swings": {
            "name": "Wide Swings",
            "path": "C",
            "pos": Vector2(5, 6),
            "max_points": 5,
            "required_level": 45,
            "required_points": 40,
            "type": "passive", 
            "description": "War Cry, Earth Splitter ve Reckless Fury yeteneklerinin etki alanını (AoE) [%3/6/9/12/15] genişletir." 
            # EFEKT: UYARI: Bu stat (AOE_RADIUS) PlayerBase'de desteklenmiyor!
        },
        "demoralizing_presence": {
            "name": "Demoralizing Presence",
            "path": "C",
            "pos": Vector2(5, 7),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate", 
            "description": "War Cry yeteneğiniz artık düşmanları [%10/15/20/25/30] yavaşlatır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        }
    },

    # =====================================================================
    # ELEMENTALIST
    # =====================================================================
    "Elementalist": {
        # 🔥 Path A: Path of the Inferno (Cehennem Yolu) - 7 Talent
        "pyromancy": {
            "name": "Pyromancy",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5, 
            "required_level": 5,
            "required_points": 0,
            "type": "passive", 
            "description": "Tüm Ateş hasarı veren büyülerin hasarını [%1/2/3/4/5] artırır.", 
            "effects": { "FIRE_DAMAGE": 1 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "conflagration": {
            "name": "Conflagration",
            "path": "A",
            "pos": Vector2(0, 2),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive", 
            "description": "Tüm Ateş büyülerinizin Alan Etki (AoE) yarıçapını [%2/4/6/8/10] artırır.", 
            # EFEKT: UYARI: Bu stat (AOE_RADIUS) PlayerBase'de desteklenmiyor!
        },
        "wildfire": {
            "name": "Wildfire",
            "path": "A",
            "pos": Vector2(2, 2),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive", 
            "description": "Tüm Ateş büyülerinizin Kritik Vuruş Şansını [%1/2/3/4/5] artırır.", 
            "effects": { "M_CRIT_BONUS": 1 }
        },
        "eruption": {
            "name": "Eruption",
            "path": "A",
            "pos": Vector2(1, 3),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "skill_mod", 
            "description": "Magma Burst yeteneğinizin 3 saniyelik zemin DoT'u (Periyodik Hasarı) artık hedefleri [%10/15/20/25/30] yavaşlatır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "prismatic_focus": {
            "name": "Prismatic Focus",
            "path": "A",
            "pos": Vector2(0, 4),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "passive", 
            "description": "Pasif Elemental Harmony yeteneğinizin verdiği %20'lik hasar bonusunu [%2/4/6/8/10] artırır (Maks %30'a çıkar)." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "resonance": {
            "name": "Resonance",
            "path": "A",
            "pos": Vector2(2, 4),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "passive", 
            "description": "Pasif Elemental Harmony tetiklendiğinde, 3 saniyeliğine Büyü Kullanma Hızınızı (Cast Speed) [%1/2/3/4/5] artırır.",
            "effects": { "CSPD_BONUS": 1 }
        },
        "apocalypse": {
            "name": "Apocalypse",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate", 
            "description": "Meteor Fall yeteneğiniz, çarptığı yerde [2/3/4/5/6] saniye süren bir Flame Vortex alanı bırakır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },

        # ❄️ Path B: Path of the Frost (Ayaz Yolu) - 7 Talent
        "permafrost": {
            "name": "Permafrost",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive", 
            "description": "Frost Shard ve diğer yeteneklerden gelen tüm Yavaşlatma (Slow) etkilerinin gücünü [%4/8/12/16/20] artırır.", 
            # EFEKT: UYARI: Bu stat (SLOW_POWER) PlayerBase'de desteklenmiyor!
        },
        "wardens_attunement": {
            "name": "Warden's Attunement",
            "path": "B",
            "pos": Vector2(3, 2),
            "max_points": 5,
            "required_level": 10,
            "required_points": 3,
            "type": "stat", 
            "description": "Karakterinize [+2/4/6/8/10] Bilgelik (WIS) ekler.", 
            "effects": { "WIS": 2 }
        },
        "spiked_earth": {
            "name": "Spiked Earth",
            "path": "B",
            "pos": Vector2(4, 2),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod", 
            "description": "Stone Spike yeteneğinizden hasar alan hedefler, 2 saniyeliğine [%3/6/9/12/15] daha fazla Büyü Hasarı alır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "arctic_shield": {
            "name": "Arctic Shield",
            "path": "B",
            "pos": Vector2(3, 3),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "skill_mod", 
            "description": "Ice Barrier yeteneğinizin sağladığı kalkan miktarını [%4/8/12/16/20] artırır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "cryomancers_vigor": {
            "name": "Cryomancer's Vigor",
            "path": "B",
            "pos": Vector2(3, 4),
            "max_points": 5,
            "required_level": 38,
            "required_points": 32,
            "type": "passive", 
            "description": "Maksimum Mana (MP) miktarınızı [%2/4/6/8/10] artırır.", 
            "effects": { "MP_PERCENT": 2 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "elemental_ward": {
            "name": "Elemental Ward",
            "path": "B",
            "pos": Vector2(3, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "skill_mod", 
            "description": "Elemental Surge aktifken, tüm elementlere karşı [%2/4/6/8/10] ek Direnç kazanırsınız." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "winters_grasp": {
            "name": "Winter's Grasp",
            "path": "B",
            "pos": Vector2(3, 6),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate", 
            "description": "Ice Barrier kalkanınız kırıldığında veya süresi dolduğunda, yakındaki düşmanlara kalkanın toplam değerinin [%10/20/30/40/50]'u kadar Buz hasarı vererek patlar ve onları 2 saniye Yavaşlatır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },

        # ⚡ Path C: Path of the Storm (Fırtına Yolu) - 6 Talent
        "chain_reaction": {
            "name": "Chain Reaction",
            "path": "C",
            "pos": Vector2(5, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive", 
            "description": "Lightning Arc yeteneğinizin sıçrama mesafesini [%5/10/15/20/25] artırır.", 
            # EFEKT: UYARI: Bu stat (SKILL_RANGE) PlayerBase'de desteklenmiyor!
        },
        "static_flow": {
            "name": "Static Flow",
            "path": "C",
            "pos": Vector2(5, 2),
            "max_points": 5,
            "required_level": 22,
            "required_points": 15,
            "type": "passive", 
            "description": "Pasif Arcane Flow yeteneğinizin verdiği Büyü Kullanma Hızı (Cast Speed) yüklerinin (stack) süresini [0.5/1/1.5/2/2.5] saniye uzatır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "blink": {
            "name": "Blink",
            "path": "C",
            "pos": Vector2(5, 3),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "skill_mod", 
            "description": "Thunder Step yeteneğinizin bekleme süresini (Cooldown) [%4/8/12/16/20] azaltır." 
            # EFEKT: UYARI: Bu stat (SKILL_COOLDOWN) PlayerBase'de desteklenmiyor!
        },
        "superconductor": {
            "name": "Superconductor",
            "path": "C",
            "pos": Vector2(5, 4),
            "max_points": 5,
            "required_level": 35,
            "required_points": 30,
            "type": "skill_mod", 
            "description": "Lightning Arc yeteneğiniz, [%10/20/30/40/50] şansla 3 yerine 4 hedefe sıçrar." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "residual_charge": {
            "name": "Residual Charge",
            "path": "C",
            "pos": Vector2(5, 5),
            "max_points": 5,
            "required_level": 38,
            "required_points": 32,
            "type": "skill_mod", 
            "description": "Thunder Step yeteneğinizin varış noktasında verdiği hasarı [%5/10/15/20/25]% artırır." 
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "overload": {
            "name": "Overload",
            "path": "C",
            "pos": Vector2(5, 6),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate", 
            "description": "Tüm Yıldırım (Lightning) büyülerinize [%1/2/3/4/5] Kritik Vuruş Şansı ekler ve kritik vuruşlarınız hedefleri 1 saniyeliğine %15 yavaşlatır.", 
            "effects": { "M_CRIT_BONUS": 1 }
        }
    },

# =====================================================================
    # MONK
    # =====================================================================
    "Monk": {
        # 🧘 Path A: Path of the Flowing Spirit (Akan Ruh Yolu) - 7 Talent
        "flowing_chi": {
            "name": "Flowing Chi",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Odak (FOC) ekler.",
            "effects": { "FOC": 2 }
        },
        "spiritual_reach": {
            "name": "Spiritual Reach",
            "path": "A",
            "pos": Vector2(0, 3),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "passive",
            "description": "FOC (Odak) niteliğinizden güç alan yeteneklerin (örn: Chi Wave, Spirit Step) menzilini [%5/10/15/20/25] artırır."
            # EFEKT: UYARI: Bu stat (SKILL_RANGE) PlayerBase'de desteklenmiyor!
        },
        "calm_spirit": {
            "name": "Calm Spirit",
            "path": "A",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Bilgelik (WIS) ekler.",
            "effects": { "WIS": 2 }
        },
        "unending_stream": {
            "name": "Unending Stream",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 38,
            "required_points": 32,
            "type": "passive",
            "description": "Pasif Inner Balance'ın maksimum \"Chi\" yükü kapasitesini [1/1/2/2/3] artırır (Maks 8 yüke çıkar)."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "chi_conduit": {
            "name": "Chi Conduit",
            "path": "A",
            "pos": Vector2(0, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "passive",
            "description": "Chi üreten yetenekleriniz (örn: Spirit Jab) [%5/10/15/20/25] şansla 1 yerine 2 Chi yükü kazandırır."
            # EFEKT: Proc (Yetenek kullanımı) -> PlayerBase.gd içinde uygulanmalı
        },
        "lotus_petal": {
            "name": "Lotus Petal",
            "path": "A",
            "pos": Vector2(1, 7),
            "max_points": 5,
            "required_level": 55,
            "required_points": 50,
            "type": "skill_mod",
            "description": "Way of the Lotus aktifken Chi tüketimiyle kazanılan ek hasar/heal bonusunu [%4/8/12/16/20] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "ascension": {
            "name": "Ascension",
            "path": "A",
            "pos": Vector2(1, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Way of the Lotus aktifken, harcadığınız her Chi yükü, 3 saniye boyunca tüm hasarınızı ve iyileştirmenizi [%0.5/1/1.5/2/2.5] artırır (Birikir)."
            # EFEKT: Proc (Yetenek kullanımı) -> PlayerBase.gd içinde uygulanmalı
        },

        # 🏔️ Path B: Path of the Iron Mountain (Demir Dağ Yolu) - 7 Talent
        "resilient_stance": {
            "name": "Resilient Stance",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Canlılık (VIT) ekler.",
            "effects": { "VIT": 2 }
        },
        "hardened_physique": {
            "name": "Hardened Physique",
            "path": "B",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Iron Body yeteneğinin verdiği fiziksel hasar azaltmayı [%1/2/3/4/5] artırır (Maks %30'a çıkar)."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "still_mind": {
            "name": "Still Mind",
            "path": "B",
            "pos": Vector2(4, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Pasif Tranquil Mind'ın tetiklenmesi için gereken \"hasar almama\" süresini [0.5/1/1.5/2/2.5] saniye azaltır (Minimum 2.5 saniyeye düşer)."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "deeper_meditation": {
            "name": "Deeper Meditation",
            "path": "B",
            "pos": Vector2(3, 4),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "skill_mod",
            "description": "Meditation yeteneğinin kanal süresini [%5/10/15/20/25] hızlandırır (Aynı miktarı daha hızlı doldurur)."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "mountain_s_poise": {
            "name": "Mountain's Poise",
            "path": "B",
            "pos": Vector2(3, 5),
            "max_points": 5,
            "required_level": 45,
            "required_points": 40,
            "type": "passive",
            "description": "Geri İtme (Knockback) ve Yavaşlatma (Slow) etkilerine karşı [%5/10/15/20/25] direnç kazandırır.",
            "effects": { "DEBUFF_RESIST": 5 } # PlayerBase'deki "computed_debuff_resist"i kullanır
        },
        "reflective_defense": {
            "name": "Reflective Defense",
            "path": "B",
            "pos": Vector2(3, 6),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "skill_mod",
            "description": "Iron Body aktifken, size vuran saldırganlara alınan hasarın [%1/2/3/4/5]'i kadar (DEX'e göre ölçeklenen) hasar yansıtırsınız."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "adamant_will": {
            "name": "Adamant Will",
            "path": "B",
            "pos": Vector2(3, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Canınız %30'un altına düştüğünde, 6 saniye boyunca size (VIT'inize göre ölçeklenen) bir kalkan verir. Bu etki 60 saniyede bir tetiklenebilir."
            # EFEKT: Proc (Düşük can) -> PlayerBase.gd içinde uygulanmalı
        },

        # 🌅 Path C: Path of the Striking Dawn (Şafak Vuruşu Yolu) - 6 Talent
        "rapid_jabs": {
            "name": "Rapid Jabs",
            "path": "C",
            "pos": Vector2(5, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Çeviklik (DEX) ekler.",
            "effects": { "DEX": 2 }
        },
        "rising_storm": {
            "name": "Rising Storm",
            "path": "C",
            "pos": Vector2(5, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Cyclone Kick ve diğer yakın dövüş (melee) alan etkili yeteneklerinizin etki alanını [%5/10/15/20/25] genişletir."
            # EFEKT: UYARI: Bu stat (AOE_RADIUS) PlayerBase'de desteklenmiyor!
        },
        "crushing_palm": {
            "name": "Crushing Palm",
            "path": "C",
            "pos": Vector2(5, 4),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "passive",
            "description": "Tüm fiziksel yeteneklerinizin Kritik Vuruş Şansını [%1/2/3/4/5] artırır.",
            "effects": { "P_CRIT_BONUS": 1 }
        },
        "piercing_point": {
            "name": "Piercing Point",
            "path": "C",
            "pos": Vector2(5, 6),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "skill_mod",
            "description": "Pressure Point yeteneğinin hedefin saldırısını düşürme etkisini [%1/2/3/4/5]% artırır (Maks %20'ye çıkar)."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "momentum": {
            "name": "Momentum",
            "path": "C",
            "pos": Vector2(5, 7),
            "max_points": 5,
            "required_level": 55,
            "required_points": 50,
            "type": "passive",
            "description": "Spirit Step kullandıktan sonraki 3 saniye içinde yapacağınız bir sonraki saldırı veya yetenek [%5/10/15/20/25] daha fazla hasar verir."
            # EFEKT: Proc (Yetenek sonrası) -> PlayerBase.gd içinde uygulanmalı
        },
        "disrupting_touch": {
            "name": "Disrupting Touch",
            "path": "C",
            "pos": Vector2(5, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Chi yükü harcayan saldırılarınız (örn: Way of the Lotus ile güçlenen vuruşlar), [%10/20/30/40/50] şansla hedefin 0.5 saniyeliğine Büyü Kullanmasını (Cast) engeller (Interrupt)."
            # EFEKT: Proc (Yetenek kullanımı) -> PlayerBase.gd içinde uygulanmalı
        }
    },

    # =====================================================================
    # CRUSADER
    # =====================================================================
    "Crusader": {
        # 🛡️ Path A: Path of the Aegis (Kalkan Yolu) - 7 Talent
        "shield_mastery": {
            "name": "Shield Mastery",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Canlılık (VIT) ekler.",
            "effects": { "VIT": 2 }
        },
        "sacred_protection": {
            "name": "Sacred Protection",
            "path": "A",
            "pos": Vector2(0, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Pasif Sacred Protection'ın (Kalkan takılıyken) verdiği büyü hasarı azaltmasını %10'dan [%12/14/16/18/20]'ye çıkarır."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "bastion": {
            "name": "Bastion",
            "path": "A",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Kalkan ile Blok yapma (Block) şansınızı [%1/2/3/4/5] artırır.",
            "effects": { "BLOCK_CHANCE": 1 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "resilience": {
            "name": "Resilience",
            "path": "A",
            "pos": Vector2(1, 4),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "passive",
            "description": "Toplam Fiziksel ve Büyüsel Savunmanızı [%1/2/3/4/5] artırır.",
            "effects": { "P_DEF": 1, "M_DEF": 1 }
        },
        "unyielding_faith": {
            "name": "Unyielding Faith",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 35,
            "required_points": 30,
            "type": "skill_mod",
            "description": "Aegis of Faith yeteneğinizin bekleme süresini (Cooldown) [%4/8/12/16/20] azaltır."
            # EFEKT: UYARI: Bu stat (SKILL_COOLDOWN) PlayerBase'de desteklenmiyor!
        },
        "retaliation": {
            "name": "Retaliation",
            "path": "A",
            "pos": Vector2(1, 7),
            "max_points": 5,
            "required_level": 55,
            "required_points": 50,
            "type": "skill_mod",
            "description": "Light of Retribution'ın (Can %30 altına inince tetiklenen) patlama hasarını [%5/10/15/20/25] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "final_stand": {
            "name": "Final Stand",
            "path": "A",
            "pos": Vector2(1, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Canınız %30'un altına düştüğünde, 5 saniyeliğine tüm hasar alımını [%5/10/15/20/25] azaltır. Bu etki 60 saniyede bir tetiklenebilir."
            # EFEKT: Proc (Düşük can) -> PlayerBase.gd içinde uygulanmalı
        },

        # ⚔️ Path B: Path of Retribution (İntikam Yolu) - 7 Talent
        "righteous_might": {
            "name": "Righteous Might",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Güç (STR) ekler.",
            "effects": { "STR": 2 }
        },
        "burning_resolve": {
            "name": "Burning Resolve",
            "path": "B",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Pasif Light's Resolve'un 5 yükte verdiği ek kutsal ışıma hasarını [%10/20/30/40/50] artırır."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "holy_zeal": {
            "name": "Holy Zeal",
            "path": "B",
            "pos": Vector2(4, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Saldırı Hızınızı (Attack Speed) [%1/2/3/4/5] artırır.",
            "effects": { "ASPD_BONUS": 1 }
        },
        "shattering_blows": {
            "name": "Shattering Blows",
            "path": "B",
            "pos": Vector2(3, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "passive",
            "description": "Hammer of Conviction ve Holy Strike yeteneklerinizin Kritik Hasar (Crit Damage) çarpanını [%5/10/15/20/25] artırır.",
            "effects": { "P_CRIT_DAMAGE": 5 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "divine_judgement": {
            "name": "Divine Judgement",
            "path": "B",
            "pos": Vector2(3, 6),
            "max_points": 5,
            "required_level": 45,
            "required_points": 40,
            "type": "passive",
            "description": "Tüm Kutsal (Holy) hasar veren yeteneklerinizin Kritik Vuruş Şansını [%1/2/3/4/5] artırır.",
            "effects": { "M_CRIT_BONUS": 1 } # Kutsal hasarı "büyüsel" kabul ediyoruz
        },
        "retribution_aura": {
            "name": "Retribution Aura",
            "path": "B",
            "pos": Vector2(3, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "passive",
            "description": "Tüm Kutsal (Holy) hasarınızı [%1/2/3/4/5] artırır.",
            "effects": { "HOLY_DAMAGE": 1 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "divine_will_crusader": {
            "name": "Divine Will",
            "path": "B",
            "pos": Vector2(3, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Tüm Kutsal (Holy) hasar veren yeteneklerinizin Mana bedelini [%5/10/15/20/25] azaltır.",
            "effects": { "MANA_COST_REDUCTION": 5 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },

        # ✨ Path C: Path of the Vanguard (Öncü Yolu) - 6 Talent
        "devotion": {
            "name": "Devotion",
            "path": "C",
            "pos": Vector2(5, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Bilgelik (WIS) ekler.",
            "effects": { "WIS": 2 }
        },
        "hallowed_ground_crusader": {
            "name": "Hallowed Ground",
            "path": "C",
            "pos": Vector2(5, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Sanctified Ground alanının müttefiklere verdiği iyileştirme ve düşmanlara verdiği zayıflatma etkisini [%5/10/15/20/25] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "guardian_s_reach": {
            "name": "Guardian's Reach",
            "path": "C",
            "pos": Vector2(6, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Sanctified Ground, Vow of Valor ve Purge Evil gibi yeteneklerin etki alanını (AoE) [%5/10/15/20/25] genişletir."
            # EFEKT: UYARI: Bu stat (AOE_RADIUS) PlayerBase'de desteklenmiyor!
        },
        "spiritual_focus": {
            "name": "Spiritual Focus",
            "path": "C",
            "pos": Vector2(5, 5),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "passive",
            "description": "Vow of Valor ve Divine Guard gibi takım buff'larınızın ve debuff'larınızın süresini [%4/8/12/16/20] artırır."
            # EFEKT: UYARI: Bu stat (BUFF_DURATION) PlayerBase'de desteklenmiyor!
        },
        "purifying_light": {
            "name": "Purifying Light",
            "path": "C",
            "pos": Vector2(5, 7),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "skill_mod",
            "description": "Purge Evil artık temizlediği her negatif etki başına müttefike (WIS'e göre ölçeklenen) küçük bir miktar can iyileştirmesi yapar."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "aura_of_protection": {
            "name": "Aura of Protection",
            "path": "C",
            "pos": Vector2(5, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Yakınınızdaki (6 tile) müttefiklere (Crusader'ın toplam zırhının [%1/2/3/4/5]'i kadar) ek zırh sağlayan bir aura açar."
            # EFEKT: Aura -> PlayerBase.gd içinde uygulanmalı
        }
    },

    # =====================================================================
    # WARDEN
    # =====================================================================
    "Warden": {
        # 🐾 Path A: Path of the Beast (Hayvan Yolu) - 7 Talent
        "nature_s_bond": {
            "name": "Nature's Bond",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "skill_mod",
            "description": "Pasif Nature's Bond (Pet aktifken) Warden'a verdiği %10 can yenilemesi ve %10 fiziksel savunma bonusunu [%11/12/13/14/15]'e yükseltir.",
            "effects": { "HP_REGEN_PERCENT": 1, "P_DEF": 1 } # UYARI: HP_REGEN_PERCENT desteklenmiyor!
        },
        "animal_handler": {
            "name": "Animal Handler",
            "path": "A",
            "pos": Vector2(0, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Yoldaşınızın (Pet) verdiği tüm hasarı [%3/6/9/12/15] artırır."
            # EFEKT: UYARI: Bu stat (PET_DAMAGE) PlayerBase'de desteklenmiyor!
        },
        "primal_vigor": {
            "name": "Primal Vigor",
            "path": "A",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Yoldaşınızın (Pet) maksimum canını [%5/10/15/20/25] artırır."
            # EFEKT: UYARI: Bu stat (PET_HEALTH) PlayerBase'de desteklenmiyor!
        },
        "primal_focus": {
            "name": "Primal Focus",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "skill_mod",
            "description": "Primal Focus yeteneğinin verdiği Pet hasar bonusunu (%20) [%22/24/26/28/30] artırır ve Warden'ın aldığı ek hasar cezasını (%10) [%9/8/7/6/5] azaltır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "hunter_s_might": {
            "name": "Hunter's Might",
            "path": "A",
            "pos": Vector2(0, 6),
            "max_points": 5,
            "required_level": 30,
            "required_points": 25,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Güç (STR) ekler.",
            "effects": { "STR": 2 }
        },
        "pack_hunter": {
            "name": "Pack Hunter",
            "path": "A",
            "pos": Vector2(1, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "passive",
            "description": "Yoldaşınızın saldırdığı hedefe sizin yaptığınız fiziksel hasarı [%1D2/3/4/5] artırır."
            # EFEKT: Koşullu Hasar -> PlayerBase.gd içinde uygulanmalı
        },
        "alpha_s_command": {
            "name": "Alpha's Command",
            "path": "A",
            "pos": Vector2(1, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Call of the Wild veya Beast Roar kullandığınızda, Yoldaşınız 5 saniye boyunca %50 Kontrol (Stun, Slow vb.) direnci kazanır ve saldırıları hedefin zırhını [%2/4/6/8/10] deler."
            # EFEKT: Skill Mod (Pet) -> PlayerBase.gd içinde uygulanmalı
        },

        # 🌲 Path B: Path of the Trapper (Tuzakçı Yolu) - 7 Talent
        "survivalist": {
            "name": "Survivalist",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Canlılık (VIT) ekler.",
            "effects": { "VIT": 2 }
        },
        "earthen_bulwark": {
            "name": "Earthen Bulwark",
            "path": "B",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "skill_mod",
            "description": "Guardian of the Forest (Toprak Golemi) minyonunun canını [%10/20/30/40/50] artırır."
            # EFEKT: UYARI: Bu stat (PET_HEALTH) PlayerBase'de desteklenmiyor!
        },
        "thick_hide": {
            "name": "Thick Hide",
            "path": "B",
            "pos": Vector2(4, 3),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "passive",
            "description": "Toplam Fiziksel Zırhınızı [%2/4/6/8/10] artırır.",
            "effects": { "P_DEF": 2 }
        },
        "entrapping_soil": {
            "name": "Entrapping Soil",
            "path": "B",
            "pos": Vector2(3, 4),
            "max_points": 5,
            "required_level": 35,
            "required_points": 30,
            "type": "skill_mod",
            "description": "Entangling Shot yeteneğinizin yerdeki alanının süresini (4sn) [0.5/1/1.5/2/2.5] saniye artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "nature_s_grasp_warden": {
            "name": "Nature's Grasp",
            "path": "B",
            "pos": Vector2(3, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "passive",
            "description": "Entangling Shot ve Guardian of the Forest goleminden gelen Yavaşlatma (Slow) etkilerinin gücünü [%2/4/6/8/10] artırır."
            # EFEKT: UYARI: Bu stat (SLOW_POWER) PlayerBase'de desteklenmiyor!
        },
        "warden_s_fortitude": {
            "name": "Warden's Fortitude",
            "path": "B",
            "pos": Vector2(3, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "passive",
            "description": "Yoldaşınız (Pet/Golem) öldüğünde, 10 saniye boyunca [%3/6/9/12/15] Hasar Azaltma (Damage Reduction) kazanırsınız."
            # EFEKT: Proc (Pet ölümü) -> PlayerBase.gd içinde uygulanmalı
        },
        "ancient_vigor": {
            "name": "Ancient Vigor",
            "path": "B",
            "pos": Vector2(3, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Guardian of the Forest golem'i artık aktifken, Warden'ın maksimum canını [%1/2/3/4/5] artırır.",
            "effects": { "HP_PERCENT": 1 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },

        # 🏹 Path C: Path of the Stalker (İz Sürücü Yolu) - 6 Talent
        "keen_senses": {
            "name": "Keen Senses",
            "path": "C",
            "pos": Vector2(5, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Çeviklik (DEX) ekler.",
            "effects": { "DEX": 2 }
        },
        "stalker": {
            "name": "Stalker",
            "path": "C",
            "pos": Vector2(5, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Wild Pounce ve Ferocity Strike yeteneklerinizin Kritik Hasar (Crit Damage) çarpanını [%5/10/15/20/25] artırır.",
            "effects": { "P_CRIT_DAMAGE": 5 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "first_strike": {
            "name": "First Strike",
            "path": "C",
            "pos": Vector2(5, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "skill_mod",
            "description": "Camouflage (Gizlenme) etkisinden çıkarken yaptığınız saldırının verdiği %50 kritik şans bonusunu [%60/70/80/90/100]'e yükseltir."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "hunter_s_instinct": {
            "name": "Hunter's Instinct",
            "path": "C",
            "pos": Vector2(5, 6),
            "max_points": 5,
            "required_level": 45,
            "required_points": 40,
            "type": "skill_mod",
            "description": "Pasif Hunter's Instinct (%50 üzeri HP'li hedeflere kritik şans) bonusunu [%11/12/13/14/15]'e yükseltir."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "predator_s_cunning": {
            "name": "Predator's Cunning",
            "path": "C",
            "pos": Vector2(5, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "passive",
            "description": "Tüm fiziksel hasarınızı [%1/2/3/4/5] artırır.",
            "effects": { "PAP_PERCENT": 1 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "apex_predator": {
            "name": "Apex Predator",
            "path": "C",
            "pos": Vector2(5, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Camouflage aktifken, [1/1.5/2/2.5/3] saniye boyunca hareketsiz kalırsanız, gizlenmeden çıktığınız ilk saldırınız hedefin zırhını 5 saniye boyunca %25 yok sayar."
            # EFEKT: Proc (Koşullu) -> PlayerBase.gd içinde uygulanmalı
        }
    },

# =====================================================================
    # DRAGON KNIGHT
    # =====================================================================
    "Dragon Knight": {
        # 🛡️ Path A: Path of the Scale (Pul Yolu) - 7 Talent
        "iron_scales": {
            "name": "Iron Scales",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Canlılık (VIT) ekler.",
            "effects": { "VIT": 2 }
        },
        "scaled_resilience": {
            "name": "Scaled Resilience",
            "path": "A",
            "pos": Vector2(0, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Pasif Scaled Resilience'ın verdiği %10'luk Fiziksel ve Element hasar direncini [%11/12/13/14/15]'e yükseltir.",
            "effects": { "P_DEF": 1, "M_DEF": 1 } # Pasif skill mod olduğu için statlara ekliyoruz
        },
        "hardened_dk": {
            "name": "Hardened",
            "path": "A",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Toplam Fiziksel Zırhınızı (Armor) [%2/4/6/8/10] artırır.",
            "effects": { "P_DEF": 2 }
        },
        "dragon_s_blood": {
            "name": "Dragon's Blood",
            "path": "A",
            "pos": Vector2(1, 4),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "skill_mod",
            "description": "Pasif Dragon's Blood'un (darbe alınca tetiklenen) can yenileme miktarını [%10/20/30/40/50] artırır."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "reflective_guard": {
            "name": "Reflective Guard",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 35,
            "required_points": 30,
            "type": "skill_mod",
            "description": "Molten Guard aktifken, alınan hasarın %30'u yerine [%32/34/36/38/40]'ünü azaltır ve yansıtılan hasarı % artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "vigorous_heart": {
            "name": "Vigorous Heart",
            "path": "A",
            "pos": Vector2(1, 6),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "skill_mod",
            "description": "Heart of the Dragon yeteneğinin verdiği yenilenme hızını [%10/20/30/40/50] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "phoenix_vigor": {
            "name": "Phoenix Vigor",
            "path": "A",
            "pos": Vector2(1, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Ember Rebirth tetiklendiğinde (ölümden döndüğünüzde), %20 HP yerine [%22/24/26/28/30] HP ile dönersiniz ve 3 saniye boyunca %50 Hasar Azaltma kazanırsınız."
            # EFEKT: Ultimate Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },

        # 🔥 Path B: Path of the Inferno (Cehennem Yolu) - 7 Talent
        "burning_blood": {
            "name": "Burning Blood",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive",
            "description": "Flame Strike ve diğer yeteneklerden gelen tüm Yanma (Burn) etkilerinin periyodik hasarını (DoT) [%3/6/9/12/15] artırır."
            # EFEKT: UYARI: Bu stat (BURN_DAMAGE) PlayerBase'de desteklenmiyor!
        },
        "conflagration_dk": {
            "name": "Conflagration",
            "path": "B",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Dragon's Breath, Winged Leap ve Infernal Charge gibi Ateş hasarı veren yeteneklerin etki alanını (AoE) [%3/6/9/12/15] genişletir."
            # EFEKT: UYARI: Bu stat (AOE_RADIUS) PlayerBase'de desteklenmiyor!
        },
        "searing_heat": {
            "name": "Searing Heat",
            "path": "B",
            "pos": Vector2(4, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Güç (STR) ekler.",
            "effects": { "STR": 2 }
        },
        "lingering_flames": {
            "name": "Lingering Flames",
            "path": "B",
            "pos": Vector2(3, 4),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "passive",
            "description": "Flame Strike ve Flame Ward tarafından uygulanan Yanma (Burn) etkilerinin süresini [%10/20/30/40/50] artırır."
            # EFEKT: UYARI: Bu stat (DOT_DURATION) PlayerBase'de desteklenmiyor!
        },
        "mighty_draconian": {
            "name": "Mighty Draconian",
            "path": "B",
            "pos": Vector2(3, 6),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Odak (FOC) ekler.",
            "effects": { "FOC": 2 }
        },
        "heart_of_fire": {
            "name": "Heart of Fire",
            "path": "B",
            "pos": Vector2(3, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "passive",
            "description": "Tüm Ateş hasarınızı [%1/2/3/4/5] artırır."
            # EFEKT: UYARI: Bu stat (FIRE_DAMAGE) PlayerBase'de desteklenmiyor!
        },
        "inner_fire": {
            "name": "Inner Fire",
            "path": "B",
            "pos": Vector2(3, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Heart of the Dragon aktifken, tüm Ateş hasarı veren yetenekleriniz [%5/10/15/20/25] şansla hedefin Ateş direncini 3 saniyeliğine %10 kırar."
            # EFEKT: Proc (Yetenek kullanımı) -> PlayerBase.gd içinde uygulanmalı
        },

        # 🐲 Path C: Path of the Wyvern (Ejder Yolu) - 6 Talent
        "frightful_presence": {
            "name": "Frightful Presence",
            "path": "C",
            "pos": Vector2(5, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "skill_mod",
            "description": "Draconic Roar yeteneğinin verdiği %10'luk saldırı azaltma debuff'ını [%11/12/13/14/15]'e yükseltir."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "impacting_leap": {
            "name": "Impacting Leap",
            "path": "C",
            "pos": Vector2(5, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Winged Leap yeteneği artık iniş yaptığında düşmanları Geri İtmek (Pushback) yerine [%10/20/30/40/50] yavaşlatır (Daha iyi bir kontrol sağlar)."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "dragon_s_vigor": {
            "name": "Dragon's Vigor",
            "path": "C",
            "pos": Vector2(5, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "passive",
            "description": "Savaş dışındayken (5 saniye hasar alıp vermeyince) hareket hızınızı [%2/4/6/8/10] artırır."
            # EFEKT: UYARI: Bu stat (OOC_MOVE_SPEED) PlayerBase'de desteklenmiyor!
        },
        "rushing_fire": {
            "name": "Rushing Fire",
            "path": "C",
            "pos": Vector2(5, 6),
            "max_points": 5,
            "required_level": 45,
            "required_points": 40,
            "type": "skill_mod",
            "description": "Infernal Charge kullandıktan sonra 3 saniyeliğine [%5/10/15/20/25] hareket hızı kazanırsınız."
            # EFEKT: Proc (Yetenek sonrası) -> PlayerBase.gd içinde uygulanmalı
        },
        "winged_speed": {
            "name": "Winged Speed",
            "path": "C",
            "pos": Vector2(5, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "skill_mod",
            "description": "Winged Leap yeteneğinin bekleme süresini (Cooldown) [%4/8/12/16/20] azaltır."
            # EFEKT: UYARI: Bu stat (SKILL_COOLDOWN) PlayerBase'de desteklenmiyor!
        },
        "roaring_impact": {
            "name": "Roaring Impact",
            "path": "C",
            "pos": Vector2(5, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Draconic Roar yeteneğiniz, [%20/40/60/80/100] şansla hedeflerin 5 saniye boyunca Büyü Direncini %10 azaltır."
            # EFEKT: Proc (Yetenek kullanımı) -> PlayerBase.gd içinde uygulanmalı
        }
    },

    # =====================================================================
    # WARLOCK
    # =====================================================================
    "Warlock": {
        # 💀 Path A: Path of Affliction (Eziyet Yolu) - 7 Talent
        "prolonged_agony": {
            "name": "Prolonged Agony",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive",
            "description": "Tüm periyodik hasar (DoT) yeteneklerinizin toplam süresini [%5/10/15/20/25] artırır (Toplam hasarı artırır)."
            # EFEKT: UYARI: Bu stat (DOT_DURATION) PlayerBase'de desteklenmiyor!
        },
        "enfeebling_curse": {
            "name": "Enfeebling Curse",
            "path": "A",
            "pos": Vector2(0, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Hex of Weakness yeteneğinizin saldırı/defans düşürme etkisini (%12) [%12.5/13/13.5/14/14.5]'e yükseltir ve Büyü Direncini de %3 düşürür."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "focus_warlock": {
            "name": "Focus",
            "path": "A",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Odak (FOC) ekler.",
            "effects": { "FOC": 2 }
        },
        "draining_touch": {
            "name": "Draining Touch",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "skill_mod",
            "description": "Soul Drain yeteneğinizin Warlock'u iyileştirme miktarını [%5/10/15/20/25] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "pact_of_shadows_aff": {
            "name": "Pact of Shadows",
            "path": "A",
            "pos": Vector2(1, 6),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "passive",
            "description": "Pasif Pact of Shadows yeteneğinizin 5 yükte verdiği %30'luk güçlendirmeyi [%32/34/36/38/40] artırır."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "doomguard": {
            "name": "Doomguard",
            "path": "A",
            "pos": Vector2(1, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "passive",
            "description": "Periyodik hasar (DoT) yeteneklerinizin Kritik Vurma Şansı olur (Normal kritik şansınızın [%10/20/30/40/50]'u kadar)."
            # EFEKT: UYARI: Bu stat (DOT_CRIT_CHANCE) PlayerBase'de desteklenmiyor!
        },
        "contagion": {
            "name": "Contagion",
            "path": "A",
            "pos": Vector2(1, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Curse of Agony etkisi altındaki bir hedef öldüğünde, lanet [%20/40/60/80/100] şansla en yakındaki sağlıklı düşmana sıçrar."
            # EFEKT: Proc (Ölüm anında) -> PlayerBase.gd içinde uygulanmalı
        },

        # 👿 Path B: Path of Demonology (İblis Yolu) - 7 Talent
        "soul_leech": {
            "name": "Soul Leech",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "skill_mod",
            "description": "Pasif Soul Leech yeteneğinizin verdiği %8'lik can emme oranını [%8.5/9/9.5/10/10.5]'a yükseltir."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "demonic_fortitude": {
            "name": "Demonic Fortitude",
            "path": "B",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Infernal Summon ile çağrılan İblis'in canını ve hasarını [%5/10/15/20/25] artırır."
            # EFEKT: UYARI: Bu stat (PET_STATS) PlayerBase'de desteklenmiyor!
        },
        "shadow_inspiration": {
            "name": "Shadow Inspiration",
            "path": "B",
            "pos": Vector2(4, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Zeka (INT) ekler.",
            "effects": { "INT": 2 }
        },
        "will_to_live": {
            "name": "Will to Live",
            "path": "B",
            "pos": Vector2(3, 4),
            "max_points": 5,
            "required_level": 30,
            "required_points": 25,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Bilgelik (WIS) ekler.",
            "effects": { "WIS": 2 }
        },
        "lingering_veil": {
            "name": "Lingering Veil",
            "path": "B",
            "pos": Vector2(3, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "skill_mod",
            "description": "Shadow Veil yeteneğinizin süresini (4sn) [0.2/0.4/0.6/0.8/1] saniye artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "pact_of_shadows_demo": {
            "name": "Pact of Shadows",
            "path": "B",
            "pos": Vector2(3, 6),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "passive",
            "description": "Pasif Pact of Shadows yeteneğinizin 5 yükte verdiği %30'luk güçlendirmeyi [%32/34/36/38/40] artırır."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "demonic_vigor": {
            "name": "Demonic Vigor",
            "path": "B",
            "pos": Vector2(3, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Demonic Ascension formundayken, pasif Soul Leech'ten kazandığınız can emme iki katına çıkar [%10/20/30/40/50]."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },

        # 🔥 Path C: Path of Destruction (Yıkım Yolu) - 6 Talent
        "devouring_darkness": {
            "name": "Devouring Darkness",
            "path": "C",
            "pos": Vector2(5, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive",
            "description": "Tüm Gölge (Shadow) hasarı veren yeteneklerinizin Kritik Hasar (Crit Damage) çarpanını [%5/10/15/20/25] artırır.",
            "effects": { "M_CRIT_DAMAGE": 5 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "destructive_reach": {
            "name": "Destructive Reach",
            "path": "C",
            "pos": Vector2(5, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Dark Bolt ve Hellfire Orb yeteneklerinizin menzilini [%3/6/9/12/15] artırır."
            # EFEKT: UYARI: Bu stat (SKILL_RANGE) PlayerBase'de desteklenmiyor!
        },
        "accelerated_chaos": {
            "name": "Accelerated Chaos",
            "path": "C",
            "pos": Vector2(5, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "passive",
            "description": "Büyü Kullanma Hızınızı (Cast Speed) [%1/2/3/4/5] artırır.",
            "effects": { "CSPD_BONUS": 1 }
        },
        "pact_of_shadows_dest": {
            "name": "Pact of Shadows",
            "path": "C",
            "pos": Vector2(5, 6),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "passive",
            "description": "Pasif Pact of Shadows yeteneğinizin 5 yükte verdiği %30'luk güçlendirmeyi [%32/34/36/38/40] artırır."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "chaotic_energies": {
            "name": "Chaotic Energies",
            "path": "C",
            "pos": Vector2(5, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "passive",
            "description": "Tüm hasar veren büyülerin Kritik Vuruş Şansını [%1/2/3/4/5] artırır.",
            "effects": { "M_CRIT_BONUS": 1 }
        },
        "burning_shadows": {
            "name": "Burning Shadows",
            "path": "C",
            "pos": Vector2(5, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Gölge (Shadow) hasarıyla kritik vuruş yaptığınızda, hedefin 3 saniye boyunca (INT'inizin %X'i kadar) Ateş hasarı almasına neden olursunuz."
            # EFEKT: Proc (Kritik vurunca) -> PlayerBase.gd içinde uygulanmalı
        }
    },

    # =====================================================================
    # CLERIC
    # =====================================================================
    "Cleric": {
        # 🛡️ Path A: Path of Protection (Koruma Yolu) - 7 Talent
        "divine_focus": {
            "name": "Divine Focus",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Bilgelik (WIS) ekler.",
            "effects": { "WIS": 2 }
        },
        "sanctified_shell": {
            "name": "Sanctified Shell",
            "path": "A",
            "pos": Vector2(0, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Angelic Barrier yeteneğinizin sağladığı kalkan miktarını [%4/8/12/16/20] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "divine_grace": {
            "name": "Divine Grace",
            "path": "A",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Pasif Divine Grace'in verdiği %15 Hasar Azaltma (DR) bonusunun süresini [0.2/0.4/0.6/0.8/1] saniye artırır."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "purified_soul": {
            "name": "Purified Soul",
            "path": "A",
            "pos": Vector2(1, 4),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "skill_mod",
            "description": "Purify yeteneğiniz, artık temizlediği negatif etki başına hedefin üzerinde 3 saniye süren küçük bir İyileştirme (HoT) etkisi bırakır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "seraphic_boon": {
            "name": "Seraphic Boon",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 35,
            "required_points": 30,
            "type": "passive",
            "description": "Tüm iyileştirme yeteneklerinizin Kritik Vuruş Şansını [%1/2/3/4/5] artırır.",
            "effects": { "HEAL_CRIT_BONUS": 1 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "lights_benediction_prot": {
            "name": "Light's Benediction",
            "path": "A",
            "pos": Vector2(1, 6),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "passive",
            "description": "Pasif Light's Benediction'ın (5sn büyü atmayınca) verdiği %30'luk güçlendirmeyi [%32/34/36/38/40]'a yükseltir."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "archangels_mercy": {
            "name": "Archangel's Mercy",
            "path": "A",
            "pos": Vector2(1, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Angelic Barrier kalkanı kırıldığında veya süresi dolduğunda, hedef anında (Cleric'in WIS değerine göre ölçeklenen) [%10/20/30/40/50] oranında bir can iyileştirmesi kazanır."
            # EFEKT: Ultimate Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },

        # ✨ Path B: Path of Grace (Lütuf Yolu) - 7 Talent
        "spiritual_presence": {
            "name": "Spiritual Presence",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Odak (FOC) ekler.",
            "effects": { "FOC": 2 }
        },
        "enduring_blessings": {
            "name": "Enduring Blessings",
            "path": "B",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Blessing of Valor yeteneğinizin süresini [%10/20/30/40/50] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "clarity_of_mind": {
            "name": "Clarity of Mind",
            "path": "B",
            "pos": Vector2(4, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Maksimum Mana (MP) miktarınızı [%2/4/6/8/10] artırır.",
            "effects": { "MP_PERCENT": 2 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "harmonious_hymn": {
            "name": "Harmonious Hymn",
            "path": "B",
            "pos": Vector2(3, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "skill_mod",
            "description": "Hymn of Serenity artık takımın yanı sıra Cleric'in kendi Mana yenilenmesini de [%20/25/30/35/40]% artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "lights_benediction_grace": {
            "name": "Light's Benediction",
            "path": "B",
            "pos": Vector2(3, 6),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "passive",
            "description": "Pasif Light's Benediction'ın (5sn büyü atmayınca) verdiği %30'luk güçlendirmeyi [%32/34/36/38/40]'a yükseltir. (Bu yetenek ortak bir noktadadır)."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "bond_of_faith": {
            "name": "Bond of Faith",
            "path": "B",
            "pos": Vector2(3, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "skill_mod",
            "description": "Sacred Bond aktifken, Cleric'in (aktarılan hasardan) yaptığı %50'lik anlık iyileştirme miktarını [%55/60/65/70/75]'e yükseltir."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "divine_will_cleric": {
            "name": "Divine Will",
            "path": "B",
            "pos": Vector2(3, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Blessing of Valor ve Hymn of Serenity yeteneklerinin Mana bedelini [%10/20/30/40/50] azaltır ve bekleme sürelerini %10 kısaltır."
            # EFEKT: Ultimate Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },

        # ☀️ Path C: Path of Radiance (Işıma Yolu) - 6 Talent
        "sanctified_prayers": {
            "name": "Sanctified Prayers",
            "path": "C",
            "pos": Vector2(5, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive",
            "description": "Tüm iyileştirme yeteneklerinizin gücünü [%1/2/3/4/5] artırır.",
            "effects": { "HEAL_BONUS": 1 }
        },
        "holy_vigor": {
            "name": "Holy Vigor",
            "path": "C",
            "pos": Vector2(5, 2),
            "max_points": 5,
            "required_level": 15,
            "required_points": 8,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Canlılık (VIT) ekler.",
            "effects": { "VIT": 2 }
        },
        "radiant_dawn": {
            "name": "Radiant Dawn",
            "path": "C",
            "pos": Vector2(5, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Radiant Wave yeteneğinizin Mana bedelini [%3/6/9/12/15] azaltır."
            # EFEKT: UYARI: Bu stat (MANA_COST_REDUCTION) PlayerBase'de desteklenmiyor!
        },
        "hallowed_ground_cleric": {
            "name": "Hallowed Ground",
            "path": "C",
            "pos": Vector2(5, 5),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "skill_mod",
            "description": "Beacon of Hope yeteneğinizin etki alanının (AoE) yarıçapını [%5/10/15/20/25] artırır."
            # EFEKT: UYARI: Bu stat (AOE_RADIUS) PlayerBase'de desteklenmiyor!
        },
        "retributive_light": {
            "name": "Retributive Light",
            "path": "C",
            "pos": Vector2(5, 6),
            "max_points": 5,
            "required_level": 45,
            "required_points": 40,
            "type": "skill_mod",
            "description": "Judgment of Light yeteneğinizin Kutsal (Holy) hasarını [%5/10/15/20/25] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "reverence": {
            "name": "Reverence",
            "path": "C",
            "pos": Vector2(5, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Judgment of Light yeteneği artık yakındaki [%20/40/60/80/100] şansla ikinci bir müttefiğe daha (azalarak) iyileştirme sektirir."
            # EFEKT: Ultimate Skill Mod -> PlayerBase.gd içinde uygulanmalı
        }
    },

    # =====================================================================
    # BARD
    # =====================================================================
    "Bard": {
        # 🎶 Path A: Path of Harmony (Armoni Yolu) - 7 Talent
        "harmonic_purity": {
            "name": "Harmonic Purity",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Bilgelik (WIS) ekler.",
            "effects": { "WIS": 2 }
        },
        "soothing_melody": {
            "name": "Soothing Melody",
            "path": "A",
            "pos": Vector2(0, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Melody of Healing yeteneğinizin saniye başına iyileştirmesini [%5/10/15/20/25] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "toughness_bard": {
            "name": "Toughness",
            "path": "A",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Canlılık (VIT) ekler.",
            "effects": { "VIT": 2 }
        },
        "flowing_mana": {
            "name": "Flowing Mana",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "skill_mod",
            "description": "Aria of Restoration yeteneğinizin verdiği Mana yenilenme bonusunu (%50) [%55/60/65/70/75]'e yükseltir."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "resonant_barrier": {
            "name": "Resonant Barrier",
            "path": "A",
            "pos": Vector2(1, 6),
            "max_points": 5,
            "required_level": 45,
            "required_points": 40,
            "type": "skill_mod",
            "description": "Resonant Shield yeteneğinizin sağladığı kalkan miktarını [%4/8/12/16/20] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "coda_of_healing": {
            "name": "Coda of Healing",
            "path": "A",
            "pos": Vector2(1, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "skill_mod",
            "description": "Crescendo Finale patlaması, artık müttefiklere verdiği kalkanın [%10/20/30/40/50]'u kadar anlık Can iyileştirmesi de yapar."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "sanctuary_bard": {
            "name": "Sanctuary",
            "path": "A",
            "pos": Vector2(1, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Melody of Healing veya Aria of Restoration şarkısı aktifken, pasif Inspiring Presence'ın HP/MP yenileme etkisi [%10/20/30/40/50] artar."
            # EFEKT: Ultimate Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },

        # 🎼 Path B: Path of the Maestro (Maestro Yolu) - 7 Talent
        "tempo_keeper": {
            "name": "Tempo Keeper",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive",
            "description": "Song of Courage, Rhythm of Agility ve Ballad of Bravery gibi \"Şarkı\" (Song) olarak kabul edilen tüm buff'larınızın süresini [%5/10/15/20/25] artırır."
            # EFEKT: UYARI: Bu stat (BUFF_DURATION) PlayerBase'de desteklenmiyor!
        },
        "inspiring_presence": {
            "name": "Inspiring Presence",
            "path": "B",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Pasif Inspiring Presence'ın (hafif HP/MP regen) etki alanını [%10/20/30/40/50] genişletir."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "focused_mind": {
            "name": "Focused Mind",
            "path": "B",
            "pos": Vector2(4, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Odak (FOC) ekler.",
            "effects": { "FOC": 2 }
        },
        "swiftness": {
            "name": "Swiftness",
            "path": "B",
            "pos": Vector2(3, 4),
            "max_points": 5,
            "required_level": 30,
            "required_points": 25,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Çeviklik (DEX) ekler.",
            "effects": { "DEX": 2 }
        },
        "cadence": {
            "name": "Cadence",
            "path": "B",
            "pos": Vector2(3, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "skill_mod",
            "description": "Ballad of Bravery yeteneğinizin yük (stack) kazanma hızını (5sn) [4.8/4.6/4.4/4.2/4] saniyeye düşürür."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "harmony_of_battle": {
            "name": "Harmony of Battle",
            "path": "B",
            "pos": Vector2(3, 6),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "skill_mod",
            "description": "Pasif Harmony of Battle'ın bir şarkı (%5) ve iki şarkı (%8) için verdiği saldırı hızı bonusunu [%5.5/6/6.5/7/7.5] (tek şarkı) ve [%8.5/9/9.5/10/10.5] (iki şarkı) olarak artırır."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "encore": {
            "name": "Encore",
            "path": "B",
            "pos": Vector2(3, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Crescendo Finale kullandıktan sonra, [1/1.5/2/2.5/3] saniye boyunca bir sonraki şarkınızın (Song) Mana bedeli %0 olur ve bekleme süresi tetiklenmez."
            # EFEKT: Ultimate Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },

        # 🔉 Path C: Path of Resonance (Rezonans Yolu) - 6 Talent
        "lingering_note": {
            "name": "Lingering Note",
            "path": "C",
            "pos": Vector2(5, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive",
            "description": "Requiem of Weakness ve Dirge of Shadows gibi tüm \"Debuff\" şarkılarınızın süresini [%5/10/15/20/25] artırır."
            # EFEKT: UYARI: Bu stat (DEBUFF_DURATION) PlayerBase'de desteklenmiyor!
        },
        "disrupting_echo": {
            "name": "Disrupting Echo",
            "path": "C",
            "pos": Vector2(5, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Dissonant Chord yeteneğinizin etki alanını (AoE) [%5/10/15/20/25] genişletir."
            # EFEKT: UYARI: Bu stat (AOE_RADIUS) PlayerBase'de desteklenmiyor!
        },
        "echoing_discord": {
            "name": "Echoing Discord",
            "path": "C",
            "pos": Vector2(5, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "skill_mod",
            "description": "Dissonant Chord yeteneğinizin bekleme süresini (Cooldown) [%4/8/12/16/20] azaltır."
            # EFEKT: UYARI: Bu stat (SKILL_COOLDOWN) PlayerBase'de desteklenmiyor!
        },
        "shadow_s_pall": {
            "name": "Shadow's Pall",
            "path": "C",
            "pos": Vector2(5, 6),
            "max_points": 5,
            "required_level": 45,
            "required_points": 40,
            "type": "skill_mod",
            "description": "Dirge of Shadows yeteneğinizin düşmanın kritik şansını düşürme etkisini (%15) [%16/17/18/19/20]'ye yükseltir."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "coda_of_pain": {
            "name": "Coda of Pain",
            "path": "C",
            "pos": Vector2(5, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "skill_mod",
            "description": "Crescendo Finale patlamasının düşmanlara verdiği ses hasarını [%5/10/15/20/25] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "startling_tune": {
            "name": "Startling Tune",
            "path": "C",
            "pos": Vector2(5, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Dissonant Chord ile başarılı bir şekilde bir büyüyü engellerseniz (Interrupt), hedef 3 saniye boyunca Büyü Kullanma (Cast) hızını [%10/15/20/25/30] yavaşlatan bir debuff alır."
            # EFEKT: Proc (Interrupt) -> PlayerBase.gd içinde uygulanmalı
        }
    },

    # =====================================================================
    # NECROMANCER
    # =====================================================================
    "Necromancer": {
        # 💀 Path A: Path of the Grave (Mezar Yolu) - 7 Talent
        "undeath_s_vigor": {
            "name": "Undeath's Vigor",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive",
            "description": "Tüm minyonlarınızın (İskeletler ve Abomination) maksimum canını [%5/10/15/20/25] artırır."
            # EFEKT: UYARI: Bu stat (PET_HEALTH) PlayerBase'de desteklenmiyor!
        },
        "shepherd_s_might": {
            "name": "Shepherd's Might",
            "path": "A",
            "pos": Vector2(1, 2),
            "max_points": 5,
            "required_level": 15,
            "required_points": 8,
            "type": "passive",
            "description": "Tüm minyonlarınızın verdiği hasarı [%3/6/9/12/15] artırır."
            # EFEKT: UYARI: Bu stat (PET_DAMAGE) PlayerBase'de desteklenmiyor!
        },
        "endless_horde": {
            "name": "Endless Horde",
            "path": "A",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Raise Skeletons yeteneğinizin çağırdığı maksimum İskelet sayısını [1/1/2/2/3] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "abomination_s_might": {
            "name": "Abomination's Might",
            "path": "A",
            "pos": Vector2(1, 4),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "skill_mod",
            "description": "Summon Abomination'ın canını ve hasarını [%5/10/15/20/25] artırır ve artık düşmanlara hafif bir Yavaşlatma (Slow) uygular."
            # EFEKT: UYARI: Bu stat (PET_STATS) PlayerBase'de desteklenmiyor!
        },
        "grave_pact": {
            "name": "Grave Pact",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "skill_mod",
            "description": "Pasif Grave Pact'inizin (5 yükte) verdiği \"güçlü\" minyon bonusunu [%10/20/30/40/50] daha da güçlendirir."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "sacrificial_pact": {
            "name": "Sacrificial Pact",
            "path": "A",
            "pos": Vector2(1, 7),
            "max_points": 5,
            "required_level": 55,
            "required_points": 50,
            "type": "skill_mod",
            "description": "Ritual of Sacrifice kullandıktan sonra aldığınız %20'lik ek hasar cezasını [%18/16/14/12/10]'a düşürür."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "dead_cold": {
            "name": "Dead Cold",
            "path": "A",
            "pos": Vector2(1, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Minyonlarınızın (İskelet/Abomination) saldırıları, hedefleri [%10/20/30/40/50] şansla 2 saniyeliğine %20 Yavaşlatır."
            # EFEKT: Ultimate (Pet Proc) -> PlayerBase.gd içinde uygulanmalı
        },

        # 🔮 Path B: Path of the Unholy (Kutsal Olmayan Yol) - 7 Talent
        "unholy_vitality": {
            "name": "Unholy Vitality",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "skill_mod",
            "description": "Pasif Unholy Vitality'nin verdiği %6'lık can emme (Leech) oranını [%6.5/7/7.5/8/8.5]'e yükseltir."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "mastery_of_bone": {
            "name": "Mastery of Bone",
            "path": "B",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Bone Prison'un canını (kırılma eşiğini) [%10/20/30/40/50] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "reaping": {
            "name": "Reaping",
            "path": "B",
            "pos": Vector2(4, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Zeka (INT) ekler.",
            "effects": { "INT": 2 }
        },
        "wraith_s_evasion": {
            "name": "Wraith's Evasion",
            "path": "B",
            "pos": Vector2(3, 5),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "skill_mod",
            "description": "Wraith Form'un süresini (3sn) [0.2/0.4/0.6/0.8/1] saniye artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "dark_wisdom": {
            "name": "Dark Wisdom",
            "path": "B",
            "pos": Vector2(3, 6),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Bilgelik (WIS) ekler.",
            "effects": { "WIS": 2 }
        },
        "soul_siphon": {
            "name": "Soul Siphon",
            "path": "B",
            "pos": Vector2(3, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "skill_mod",
            "description": "Death Coil'in Necromancer'ı iyileştirme miktarını [%5/10/15/20/25] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "transfusion": {
            "name": "Transfusion",
            "path": "B",
            "pos": Vector2(3, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Death Coil artık minyonlarınızı da hedef alabilir ve onları anında (normal iyileştirme değerinin [%50/60/70/80/90]'ı kadar) iyileştirebilir."
            # EFEKT: Ultimate Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },

        # ☣️ Path C: Path of Rot (Çürüme Yolu) - 6 Talent
        "splintering": {
            "name": "Splintering",
            "path": "C",
            "pos": Vector2(5, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "skill_mod",
            "description": "Bone Spear artık [%20/40/60/80/100] şansla ilk hedeften sekerek yakındaki ikinci bir hedefe %50 hasarla vurur."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "lingering_rot": {
            "name": "Lingering Rot",
            "path": "C",
            "pos": Vector2(5, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Tüm periyodik hasar (DoT) yeteneklerinizin (Soul Rot, Plague Field) toplam süresini [%5/10/15/20/25] artırır (Toplam hasarı artırır)."
            # EFEKT: UYARI: Bu stat (DOT_DURATION) PlayerBase'de desteklenmiyor!
        },
        "pestilence": {
            "name": "Pestilence",
            "path": "C",
            "pos": Vector2(5, 5),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "skill_mod",
            "description": "Plague Field'in verdiği %25'lik iyileşme azaltma debuff'ını [%27/29/31/33/35]'e yükseltir."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "mastery_of_flesh": {
            "name": "Mastery of Flesh",
            "path": "C",
            "pos": Vector2(5, 6),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "skill_mod",
            "description": "Corpse Explosion'ın patlama alanını (AoE) [%5/10/15/20/25] genişletir."
            # EFEKT: UYARI: Bu stat (AOE_RADIUS) PlayerBase'de desteklenmiyor!
        },
        "dark_potency": {
            "name": "Dark Potency",
            "path": "C",
            "pos": Vector2(5, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "passive",
            "description": "Tüm Gölge (Shadow) ve DoT hasarınızı [%1/2/3/4/5] artırır."
            # EFEKT: UYARI: Bu stat (SHADOW_DAMAGE) PlayerBase'de desteklenmiyor!
        },
        "sudden_doom": {
            "name": "Sudden Doom",
            "path": "C",
            "pos": Vector2(5, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Soul Rot ve Plague Field gibi periyodik hasarlarınız, (normal kritik şansınızın [%10/20/30/40/50]'u oranında) Kritik Vuruş yapma şansı kazanır."
            # EFEKT: UYARI: Bu stat (DOT_CRIT_CHANCE) PlayerBase'de desteklenmiyor!
        }
    },

    # =====================================================================
    # RANGER
    # =====================================================================
    "Ranger": {
        # 🎯 Path A: Path of the Sniper (Keskin Nişancı Yolu) - 7 Talent
        "deadly_aim": {
            "name": "Deadly Aim",
            "path": "A",
            "pos": Vector2(1, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Çeviklik (DEX) ekler.",
            "effects": { "DEX": 2 }
        },
        "piercing_shots": {
            "name": "Piercing Shots",
            "path": "A",
            "pos": Vector2(0, 3),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "passive",
            "description": "Tüm ok (Arrow) atışlarınız, hedefin zırhının [%1/2/3/4/5]'ini yok sayar."
            # EFEKT: UYARI: Bu stat (ARMOR_PENETRATION) PlayerBase'de desteklenmiyor!
        },
        "hunter_s_focus": {
            "name": "Hunter's Focus",
            "path": "A",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 32,
            "required_points": 28,
            "type": "skill_mod",
            "description": "Pasif Hunter's Focus'un (sabit kalınca) %5 hasar yükünü kazanma hızını (1sn) [0.95/0.9/0.85/0.8/0.75] saniyeye düşürür (Daha hızlı yüklenir)."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "focused_volley": {
            "name": "Focused Volley",
            "path": "A",
            "pos": Vector2(1, 5),
            "max_points": 5,
            "required_level": 42,
            "required_points": 38,
            "type": "skill_mod",
            "description": "Piercing Volley yeteneğinizin verdiği hasarı [%3/6/9/12/15] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "eagle_eye": {
            "name": "Eagle Eye",
            "path": "A",
            "pos": Vector2(1, 6),
            "max_points": 5,
            "required_level": 45,
            "required_points": 40,
            "type": "passive",
            "description": "Falcon Mark yeteneğinizin menzilini ve süresini [%5/10/15/20/25] artırır."
            # EFEKT: UYARI: Bu stat (SKILL_RANGE / BUFF_DURATION) PlayerBase'de desteklenmiyor!
        },
        "lethal_precision": {
            "name": "Lethal Precision",
            "path": "A",
            "pos": Vector2(1, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "passive",
            "description": "Tüm fiziksel hasarlarınızın Kritik Hasar (Crit Damage) çarpanını [%5/10/15/20/25] artırır.",
            "effects": { "P_CRIT_DAMAGE": 5 } # UYARI: Bu stat PlayerBase'de desteklenmiyor!
        },
        "master_marksman": {
            "name": "Master Marksman",
            "path": "A",
            "pos": Vector2(1, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Hunter's Focus pasifinin maksimum yükü (%20 hasar) artık [%21/22/23/24/25]'e yükselir ve hareket ettiğinizde [1/1/2/2/3] yükü (hepsini değil) korursunuz."
            # EFEKT: Ultimate Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },

        # 🌲 Path B: Path of the Trapper (Tuzakçı Yolu) - 7 Talent
        "pathfinder": {
            "name": "Pathfinder",
            "path": "B",
            "pos": Vector2(3, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Odak (FOC) ekler.",
            "effects": { "FOC": 2 }
        },
        "quick_trapper": {
            "name": "Quick Trapper",
            "path": "B",
            "pos": Vector2(2, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "passive",
            "description": "Explosive Trap kurma animasyon hızını [%5/10/15/20/25] artırır."
            # EFEKT: UYARI: Bu stat (ASPD_BONUS değil, özel animasyon hızı) PlayerBase'de desteklenmiyor!
        },
        "lingering_poison": {
            "name": "Lingering Poison",
            "path": "B",
            "pos": Vector2(4, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Poison Arrow yeteneğinizin periyodik hasarının (DoT) toplam süresini [%10/20/30/40/50] artırır (Toplam hasarı artırır)."
            # EFEKT: UYARI: Bu stat (DOT_DURATION) PlayerBase'de desteklenmiyor!
        },
        "trapper_s_guile": {
            "name": "Trapper's Guile",
            "path": "B",
            "pos": Vector2(3, 4),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "passive",
            "description": "Explosive Trap yeteneğinizin bekleme süresini (Cooldown) [%3/6/9/12/15] azaltır."
            # EFEKT: UYARI: Bu stat (SKILL_COOLDOWN) PlayerBase'de desteklenmiyor!
        },
        "volatile_traps": {
            "name": "Volatile Traps",
            "path": "B",
            "pos": Vector2(3, 5),
            "max_points": 5,
            "required_level": 35,
            "required_points": 30,
            "type": "passive",
            "description": "Explosive Trap ve Arrow Storm yeteneklerinizin etki alanını (AoE) [%3/6/9/12/15] genişletir."
            # EFEKT: UYARI: Bu stat (AOE_RADIUS) PlayerBase'de desteklenmiyor!
        },
        "storm_s_eye": {
            "name": "Storm's Eye",
            "path": "B",
            "pos": Vector2(3, 7),
            "max_points": 5,
            "required_level": 55,
            "required_points": 50,
            "type": "skill_mod",
            "description": "Arrow Storm yeteneğinizin saniye başına vuran tik (tick) sayısını artırarak toplam hasarı [%4/8/12/16/20] artırır."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "true_aim": {
            "name": "True Aim",
            "path": "B",
            "pos": Vector2(3, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Tüm yeteneklerinizin Kritik Vuruş Şansını [%1/1.5/2/2.5/3] artırır. (Ortak talent).",
            # EFEKT: UYARI: Artış miktarı (0.5) PlayerBase'in çarpma mantığına uymuyor.
            "effects": { "P_CRIT_BONUS": 0.5, "M_CRIT_BONUS": 0.5 }
        },

        # 💨 Path C: Path of the Swift (Çevik Yol) - 6 Talent
        "quick_reflexes": {
            "name": "Quick Reflexes",
            "path": "C",
            "pos": Vector2(5, 1),
            "max_points": 5,
            "required_level": 5,
            "required_points": 0,
            "type": "passive",
            "description": "Saldırı Hızınızı (Attack Speed) [%1/2/3/4/5] artırır.",
            "effects": { "ASPD_BONUS": 1 }
        },
        "nature_s_reflex": {
            "name": "Nature's Reflex",
            "path": "C",
            "pos": Vector2(5, 3),
            "max_points": 5,
            "required_level": 20,
            "required_points": 12,
            "type": "skill_mod",
            "description": "Pasif Nature's Reflex'in (kritik hasarda kaçınma) bekleme süresini (15sn) [1/2/3/4/5] saniye azaltır."
            # EFEKT: Skill Mod (Pasif) -> PlayerBase.gd içinde uygulanmalı
        },
        "feather_step": {
            "name": "Feather Step",
            "path": "C",
            "pos": Vector2(5, 4),
            "max_points": 5,
            "required_level": 28,
            "required_points": 22,
            "type": "skill_mod",
            "description": "Windstep yeteneğinizin verdiği hareket ve saldırı hızı bonusunu (%15) [%16/17/18/19/20]'ye yükseltir."
            # EFEKT: Skill Mod -> PlayerBase.gd içinde uygulanmalı
        },
        "survivalist_ranger": {
            "name": "Survivalist",
            "path": "C",
            "pos": Vector2(5, 6),
            "max_points": 5,
            "required_level": 40,
            "required_points": 35,
            "type": "stat",
            "description": "Karakterinize [+2/4/6/8/10] Canlılık (VIT) ekler.",
            "effects": { "VIT": 2 }
        },
        "relentless_stride": {
            "name": "Relentless Stride",
            "path": "C",
            "pos": Vector2(5, 7),
            "max_points": 5,
            "required_level": 52,
            "required_points": 48,
            "type": "passive",
            "description": "Evasive Roll kullandıktan sonraki 3 saniye içinde yapacağınız bir sonraki ok atışı (Power Shot, Multi Arrow vb.) [%5/10/15/20/25] daha hızlı hareket eder ve zırh delmesi artar."
            # EFEKT: Proc (Yetenek sonrası) -> PlayerBase.gd içinde uygulanmalı
        },
        "evasive_tactics": {
            "name": "Evasive Tactics",
            "path": "C",
            "pos": Vector2(5, 8),
            "max_points": 5,
            "required_level": 60,
            "required_points": 55,
            "type": "ultimate",
            "description": "Evasive Roll yeteneğiniz artık [1/1/2/2/3] yük (charge) biriktirir (Ancak bekleme süresi %10 artar)."
            # EFEKT: Ultimate Skill Mod -> PlayerBase.gd içinde uygulanmalı
        }
    }
}


# =====================================================================
# VERİ ERİŞİM FONKSİYONLARI
# =====================================================================

static func get_all_talents() -> Dictionary:
    # TalentManager tarafından çağırılıyor
    return TALENTS


static func get_class_talents(class_id: String) -> Dictionary:
    # Sadece ilgili class'ın talent sözlüğü
    return TALENTS.get(class_id, {})


static func get_talent(class_id: String, talent_id: String) -> Dictionary:
    var class_tree = TALENTS.get(class_id, {})
    return class_tree.get(talent_id, {})
    
