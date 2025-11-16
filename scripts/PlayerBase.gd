extends CharacterBody2D
class_name PlayerBase


# --- YETENEK VERİTABANI ---
const SKILL_DATABASE = {
    "vine_whip": { "cost": 15, "cd": 4.0, "base_dmg": 65, "scale_stat": "INT", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "Slow 40%" },
    "rejuvenate": { "cost": 20, "cd": 8.0, "base_dmg": 30, "scale_stat": "WIS", "scale_ratio": 0.50, "is_damage": false, "is_heal": true, "effect": "HoT" },
    "entangle_roots": { "cost": 25, "cd": 12.0, "base_dmg": 20, "scale_stat": "INT", "scale_ratio": 0.30, "is_damage": true, "is_heal": false, "effect": "Root 1.5s + DoT" },
    "poison_spores": { "cost": 30, "cd": 15.0, "base_dmg": 22, "scale_stat": "INT", "scale_ratio": 0.35, "is_damage": true, "is_heal": false, "effect": "AoE DoT + Heal Reduce" },
    "spirit_link": { "cost": 40, "cd": 30.0, "base_dmg": 0, "scale_stat": "WIS", "scale_ratio": 0.30, "is_damage": false, "is_heal": true, "effect": "Damage Share + Self Heal" },
    "thorn_armor": { "cost": 25, "cd": 20.0, "base_dmg": 18, "scale_stat": "INT", "scale_ratio": 0.25, "is_damage": false, "is_heal": false, "effect": "Thorns" },
    "seed_shot": { "cost": 10, "cd": 2.0, "base_dmg": 45, "scale_stat": "INT", "scale_ratio": 0.50, "is_damage": true, "is_heal": false, "effect": "Mini Patlama" },
    "bloom_field": { "cost": 35, "cd": 18.0, "base_dmg": 28, "scale_stat": "WIS", "scale_ratio": 0.45, "is_damage": false, "is_heal": true, "effect": "AoE HoT + Slow" },
    "rot_pulse": { "cost": 45, "cd": 25.0, "base_dmg": 90, "scale_stat": "INT", "scale_ratio": 0.80, "is_damage": true, "is_heal": false, "effect": "AoE DoT + Atk Reduce" },
    "natures_grasp": { "cost": 30, "cd": 15.0, "base_dmg": 40, "scale_stat": "INT", "scale_ratio": 0.40, "is_damage": true, "is_heal": false, "effect": "Dash + Root 1s" },
    "rage_slash": { "cost": 0, "cd": 4.0, "base_dmg": 110, "scale_stat": "STR", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Yüksek Hasar" },
    "frenzied_combo": { "cost": 10, "cd": 6.0, "base_dmg": 55, "scale_stat": "STR", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "3 Vuruş + Stun Şansı" },
    "war_cry": { "cost": 0, "cd": 15.0, "base_dmg": 0, "scale_stat": "STR", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Debuff_AtkDef" },
    "bloodletting": { "cost": 0, "cd": 25.0, "base_dmg": 0, "scale_stat": "STR", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Buff_Atk" },
    "earth_splitter": { "cost": 15, "cd": 10.0, "base_dmg": 95, "scale_stat": "STR", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "AoE + Zayıf Sersemletme" },
    "unyielding_strike": { "cost": 20, "cd": 12.0, "base_dmg": 95, "scale_stat": "STR", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "Zırh Delme 30%" },
    "berserk_charge": { "cost": 0, "cd": 8.0, "base_dmg": 80, "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Dash + Yere Serme" },
    "bone_breaker": { "cost": 25, "cd": 18.0, "base_dmg": 150, "scale_stat": "STR", "scale_ratio": 1.60, "is_damage": true, "is_heal": false, "effect": "Yüksek Burst + Zırh Kırma 25%" },
    "adrenal_surge": { "cost": 0, "cd": 30.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Buff_AtkSpeed" },
    "reckless_fury": { "cost": 15, "cd": 15.0, "base_dmg": 60, "scale_stat": "STR", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Döner Alan Hasarı" },
    "fire_bolt": { "cost": 12, "cd": 3.0, "base_dmg": 85, "scale_stat": "INT", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "Burn DoT" },
    "frost_shard": { "cost": 15, "cd": 4.0, "base_dmg": 70, "scale_stat": "INT", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Slow 40%" },
    "lightning_arc": { "cost": 20, "cd": 5.0, "base_dmg": 65, "scale_stat": "INT", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "3 Hedefe Sıçrar" },
    "stone_spike": { "cost": 25, "cd": 6.0, "base_dmg": 90, "scale_stat": "INT", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Hat Üzeri AoE" },
    "flame_vortex": { "cost": 30, "cd": 10.0, "base_dmg": 35, "scale_stat": "INT", "scale_ratio": 0.40, "is_damage": true, "is_heal": false, "effect": "Yerde Ateş Alanı" },
    "ice_barrier": { "cost": 35, "cd": 18.0, "base_dmg": 150, "scale_stat": "WIS", "scale_ratio": 1.20, "is_damage": false, "is_heal": false, "effect": "Kalkan" },
    "thunder_step": { "cost": 40, "cd": 15.0, "base_dmg": 60, "scale_stat": "INT", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Teleport + Hasar" },
    "meteor_fall": { "cost": 60, "cd": 45.0, "base_dmg": 160, "scale_stat": "INT", "scale_ratio": 1.80, "is_damage": true, "is_heal": false, "effect": "Geniş AoE Burst" },
    "magma_burst": { "cost": 45, "cd": 20.0, "base_dmg": 120, "scale_stat": "INT", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Noktasal Patlama" },
    "elemental_surge": { "cost": 50, "cd": 60.0, "base_dmg": 0, "scale_stat": "INT", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Element Hasarını Artır" },
    "spirit_jab": { "cost": 5, "cd": 1.5, "base_dmg": 55, "scale_stat": "DEX", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Hızlı Vuruş" },
    "palm_of_serenity": { "cost": 10, "cd": 4.0, "base_dmg": 70, "scale_stat": "DEX", "scale_ratio": 0.80, "is_damage": true, "is_heal": false, "effect": "Geri İtiş" },
    "chi_wave": { "cost": 15, "cd": 5.0, "base_dmg": 60, "scale_stat": "FOC", "scale_ratio": 0.90, "is_damage": true, "is_heal": true, "effect": "Hat Hasarı + Küçük Heal" },
    "fist_of_the_dawn": { "cost": 20, "cd": 10.0, "base_dmg": 90, "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Ağır Vuruş Bonusu" },
    "meditation": { "cost": 0, "cd": 30.0, "base_dmg": 0, "scale_stat": "WIS", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "HP/MP Kanal" },
    "iron_body": { "cost": 25, "cd": 18.0, "base_dmg": 0, "scale_stat": "VIT", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Buff_PDef" },
    "cyclone_kick": { "cost": 15, "cd": 6.0, "base_dmg": 65, "scale_stat": "DEX", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "360 Derece AoE" },
    "spirit_step": { "cost": 20, "cd": 12.0, "base_dmg": 40, "scale_stat": "FOC", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "Gölge Adımı + Hasar" },
    "pressure_point": { "cost": 10, "cd": 8.0, "base_dmg": 50, "scale_stat": "DEX", "scale_ratio": 0.50, "is_damage": true, "is_heal": false, "effect": "Düşman Atk Düşürme" },
    "way_of_the_lotus": { "cost": 30, "cd": 45.0, "base_dmg": 0, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Chi Tüketimi Bonusu" },
    "holy_strike": { "cost": 10, "cd": 3.0, "base_dmg": 70, "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Kutsal Hasar" },
    "shield_bash": { "cost": 15, "cd": 6.0, "base_dmg": 55, "scale_stat": "STR", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "Stun 0.8s" },
    "divine_guard": { "cost": 25, "cd": 18.0, "base_dmg": 0, "scale_stat": "WIS", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "DMG Paylaşımı" },
    "purge_evil": { "cost": 20, "cd": 10.0, "base_dmg": 40, "scale_stat": "STR", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Negatif Etki Temizleme" },
    "radiant_slash": { "cost": 15, "cd": 5.0, "base_dmg": 85, "scale_stat": "STR", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "Yay Şeklinde AoE" },
    "sanctified_ground": { "cost": 30, "cd": 15.0, "base_dmg": 20, "scale_stat": "WIS", "scale_ratio": 0.40, "is_damage": false, "is_heal": true, "effect": "AoE Heal/Zayıflatma" },
    "vow_of_valor": { "cost": 35, "cd": 25.0, "base_dmg": 0, "scale_stat": "STR", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Buff_AtkDef" },
    "light_of_retribution": { "cost": 0, "cd": 60.0, "base_dmg": 120, "scale_stat": "STR", "scale_ratio": 0.0, "is_damage": true, "is_heal": false, "effect": "Low HP Patlaması" },
    "hammer_of_conviction": { "cost": 25, "cd": 18.0, "base_dmg": 140, "scale_stat": "STR", "scale_ratio": 1.50, "is_damage": true, "is_heal": false, "effect": "Zırh Kırma 25%" },
    "aegis_of_faith": { "cost": 40, "cd": 45.0, "base_dmg": 0, "scale_stat": "VIT", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "DMG Reduce" },
    "summon_companion": { "cost": 40, "cd": 30.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Kurt/Ayı/Kartal Çağır" },
    "ferocity_strike": { "cost": 10, "cd": 4.0, "base_dmg": 80, "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Mini Stun" },
    "wild_pounce": { "cost": 15, "cd": 8.0, "base_dmg": 75, "scale_stat": "STR", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "Sıçrayış + Hasar" },
    "call_of_the_wild": { "cost": 25, "cd": 20.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Pet Atk/Hız Buff" },
    "warden_camouflage": { "cost": 0, "cd": 15.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Gizlilik + Crit Şansı" },
    "entangling_shot": { "cost": 20, "cd": 10.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Alan Slow" },
    "beast_roar": { "cost": 25, "cd": 15.0, "base_dmg": 0, "scale_stat": "STR", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Düşman Def Düşürme + Pet Atk" },
    "twin_fang": { "cost": 15, "cd": 6.0, "base_dmg": 60, "scale_stat": "STR", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Warden + Pet Ortak Vuruş" },
    "guardian_of_the_forest": { "cost": 50, "cd": 40.0, "base_dmg": 0, "scale_stat": "VIT", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Toprak Golemi Çağır" },
    "primal_focus": { "cost": 30, "cd": 35.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Warden Atk + Pet Hasar Buff" },
    "flame_strike": { "cost": 15, "cd": 4.0, "base_dmg": 90, "scale_stat": "STR", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Burn DoT" },
    "winged_leap": { "cost": 25, "cd": 8.0, "base_dmg": 100, "scale_stat": "STR", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "AoE Zıplama" },
    "draconic_roar": { "cost": 20, "cd": 12.0, "base_dmg": 0, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Stun 0.8s + Atk Düşürme" },
    "molten_guard": { "cost": 30, "cd": 20.0, "base_dmg": 20, "scale_stat": "VIT", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "DMG Reduce + Thorns" },
    "dragon_breath": { "cost": 40, "cd": 15.0, "base_dmg": 135, "scale_stat": "STR", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Koni Şeklinde Hasar" },
    "flame_ward": { "cost": 35, "cd": 18.0, "base_dmg": 0, "scale_stat": "STR", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Ateş Duvarı" },
    "scale_slam": { "cost": 10, "cd": 5.0, "base_dmg": 80, "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Geri İtiş" },
    "infernal_charge": { "cost": 25, "cd": 10.0, "base_dmg": 95, "scale_stat": "STR", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Çizgisel Atak" },
    "ember_rebirth": { "cost": 0, "cd": 90.0, "base_dmg": 0, "scale_stat": "VIT", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Ölümü Atlama" },
    "heart_of_the_dragon": { "cost": 50, "cd": 60.0, "base_dmg": 0, "scale_stat": "VIT", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Atk/Direnç Buff" },
    "dark_bolt": { "cost": 15, "cd": 3.0, "base_dmg": 80, "scale_stat": "INT", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "Temel Büyü Hasarı" },
    "curse_of_agony": { "cost": 25, "cd": 8.0, "base_dmg": 140, "scale_stat": "INT", "scale_ratio": 1.50, "is_damage": true, "is_heal": false, "effect": "Artan DoT" },
    "soul_drain": { "cost": 30, "cd": 10.0, "base_dmg": 45, "scale_stat": "INT", "scale_ratio": 0.70, "is_damage": true, "is_heal": true, "effect": "Kanal + Can Emme" },
    "abyssal_grasp": { "cost": 20, "cd": 6.0, "base_dmg": 50, "scale_stat": "INT", "scale_ratio": 0.0, "is_damage": true, "is_heal": false, "effect": "Root 1.2s" },
    "infernal_summon": { "cost": 40, "cd": 25.0, "base_dmg": 25, "scale_stat": "INT", "scale_ratio": 0.30, "is_damage": true, "is_heal": false, "effect": "İblis Çağır" },
    "shadow_veil": { "cost": 0, "cd": 18.0, "base_dmg": 0, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "DMG Reduce + Görünmezlik" },
    "hex_of_weakness": { "cost": 20, "cd": 12.0, "base_dmg": 0, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Atk/Def Düşürme" },
    "hellfire_orb": { "cost": 35, "cd": 15.0, "base_dmg": 120, "scale_stat": "INT", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Alan Patlaması" },
    "soul_rift": { "cost": 45, "cd": 20.0, "base_dmg": 100, "scale_stat": "INT", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "Çekim Alanı + Patlama" },
    "demonic_ascension": { "cost": 60, "cd": 70.0, "base_dmg": 0, "scale_stat": "INT", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Büyü Hasarı/Leech Buff" },
    "holy_light": { "cost": 25, "cd": 4.0, "base_dmg": 100, "scale_stat": "WIS", "scale_ratio": 1.30, "is_damage": false, "is_heal": true, "effect": "Anlık Tek Hedef Heal" },
    "purify": { "cost": 15, "cd": 6.0, "base_dmg": 40, "scale_stat": "WIS", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Negatif Etki Temizle + Kalkan" },
    "radiant_wave": { "cost": 30, "cd": 8.0, "base_dmg": 70, "scale_stat": "WIS", "scale_ratio": 0.90, "is_damage": false, "is_heal": true, "effect": "Yakın AoE Heal" },
    "sacred_bond": { "cost": 35, "cd": 20.0, "base_dmg": 0, "scale_stat": "WIS", "scale_ratio": 0.50, "is_damage": false, "is_heal": true, "effect": "DMG Paylaşımı + Self Heal" },
    "blessing_of_valor": { "cost": 40, "cd": 30.0, "base_dmg": 0, "scale_stat": "WIS", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Buff_AtkDef" },
    "angelic_barrier": { "cost": 45, "cd": 25.0, "base_dmg": 180, "scale_stat": "WIS", "scale_ratio": 1.40, "is_damage": false, "is_heal": false, "effect": "Kalkan" },
    "revive": { "cost": 100, "cd": 120.0, "base_dmg": 0, "scale_stat": "WIS", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Ölü Diriltme" },
    "beacon_of_hope": { "cost": 30, "cd": 18.0, "base_dmg": 30, "scale_stat": "WIS", "scale_ratio": 0.50, "is_damage": false, "is_heal": true, "effect": "AoE HoT" },
    "hymn_of_serenity": { "cost": 20, "cd": 15.0, "base_dmg": 0, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Takım MP Regen Buff" },
    "judgment_of_light": { "cost": 25, "cd": 7.0, "base_dmg": 80, "scale_stat": "INT", "scale_ratio": 0.0, "is_damage": true, "is_heal": true, "effect": "Hasar + Yakın Heal" },
    "song_of_courage": { "cost": 10, "cd": 5.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Buff_Atk" },
    "requiem_of_weakness": { "cost": 15, "cd": 8.0, "base_dmg": 0, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Debuff_Atk" },
    "melody_of_healing": { "cost": 20, "cd": 6.0, "base_dmg": 35, "scale_stat": "WIS", "scale_ratio": 0.60, "is_damage": false, "is_heal": true, "effect": "AoE HoT" },
    "rhythm_of_agility": { "cost": 15, "cd": 10.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Buff_AtkSpeed" },
    "dissonant_chord": { "cost": 20, "cd": 8.0, "base_dmg": 60, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": true, "is_heal": false, "effect": "Cast Kesme + Hasar" },
    "resonant_shield": { "cost": 30, "cd": 18.0, "base_dmg": 120, "scale_stat": "FOC", "scale_ratio": 1.20, "is_damage": false, "is_heal": false, "effect": "Takım Kalkanı" },
    "ballad_of_bravery": { "cost": 0, "cd": 25.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Buff_AtkDef" },
    "dirge_of_shadows": { "cost": 25, "cd": 15.0, "base_dmg": 0, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Debuff_Crit" },
    "aria_of_restoration": { "cost": 10, "cd": 5.0, "base_dmg": 0, "scale_stat": "WIS", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Takım MP Regen Buff" },
    "crescendo_finale": { "cost": 50, "cd": 60.0, "base_dmg": 120, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": true, "is_heal": false, "effect": "Final Vuruşu + Kalkan" },
    "bone_spear": { "cost": 20, "cd": 4.0, "base_dmg": 95, "scale_stat": "INT", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Delici Hasar" },
    "soul_rot": { "cost": 30, "cd": 8.0, "base_dmg": 160, "scale_stat": "INT", "scale_ratio": 1.70, "is_damage": true, "is_heal": false, "effect": "Yüksek DoT" },
    "raise_skeletons": { "cost": 40, "cd": 25.0, "base_dmg": 0, "scale_stat": "INT", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Minion Çağır" },
    "death_coil": { "cost": 25, "cd": 6.0, "base_dmg": 80, "scale_stat": "INT", "scale_ratio": 1.00, "is_damage": true, "is_heal": true, "effect": "Kanal + Can Emme" },
    "bone_prison": { "cost": 30, "cd": 15.0, "base_dmg": 0, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "2s Kafes" },
    "corpse_explosion": { "cost": 35, "cd": 10.0, "base_dmg": 120, "scale_stat": "INT", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "AoE Ceset Patlaması" },
    "wraith_form": { "cost": 0, "cd": 18.0, "base_dmg": 0, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Temas Hasar Bağışıklığı" },
    "plague_field": { "cost": 45, "cd": 15.0, "base_dmg": 140, "scale_stat": "INT", "scale_ratio": 1.50, "is_damage": true, "is_heal": false, "effect": "AoE DoT + Heal Reduce" },
    "summon_abomination": { "cost": 50, "cd": 40.0, "base_dmg": 100, "scale_stat": "INT", "scale_ratio": 1.20, "is_damage": false, "is_heal": false, "effect": "Tank Minion Çağır" },
    "ritual_of_sacrifice": { "cost": 0, "cd": 60.0, "base_dmg": 70, "scale_stat": "INT", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Minionları Patlat + Self Buff" },
    "power_shot": { "cost": 15, "cd": 4.0, "base_dmg": 105, "scale_stat": "DEX", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "Zırh Delme 20%" },
    "multi_arrow": { "cost": 10, "cd": 3.0, "base_dmg": 45, "scale_stat": "DEX", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "3 Ok" },
    "explosive_trap": { "cost": 25, "cd": 10.0, "base_dmg": 120, "scale_stat": "DEX", "scale_ratio": 1.30, "is_damage": true, "is_heal": false, "effect": "Trap AoE + Burn" },
    "poison_arrow": { "cost": 15, "cd": 5.0, "base_dmg": 90, "scale_stat": "DEX", "scale_ratio": 0.80, "is_damage": true, "is_heal": false, "effect": "DoT" },
    "evasive_roll": { "cost": 0, "cd": 6.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Kaçınma + DMG Bağışıklığı" },
    "falcon_mark": { "cost": 30, "cd": 15.0, "base_dmg": 0, "scale_stat": "FOC", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Hedef İşaretle + DMG Artışı" },
    "windstep": { "cost": 20, "cd": 10.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Hareket/Atk Speed Buff" },
    "piercing_volley": { "cost": 25, "cd": 8.0, "base_dmg": 70, "scale_stat": "DEX", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "3 Ardışık Delici Ok" },
    "ranger_camouflage": { "cost": 0, "cd": 20.0, "base_dmg": 0, "scale_stat": "DEX", "scale_ratio": 0.0, "is_damage": false, "is_heal": false, "effect": "Gizlilik + Crit Şansı" },
    "arrow_storm": { "cost": 40, "cd": 30.0, "base_dmg": 40, "scale_stat": "DEX", "scale_ratio": 0.50, "is_damage": true, "is_heal": false, "effect": "Geniş AoE Ok Yağmuru" },
}

# --- YETENEK COOLDOWN YÖNETİMİ ---
var active_cooldowns: Dictionary = {}

# --- SİNYALLER ---
signal health_updated(current_hp, max_hp)
signal experience_updated(current_xp, max_xp)
signal level_updated(new_level)
signal mana_updated(current_mp, max_mp)
signal stats_updated(stats_payload)
signal skill_executed(skill_id, value, is_heal, effect, target_or_position)
signal invisibility_changed(is_now_invisible)
signal gold_updated(new_gold_amount)

# --- STATLAR (TEMEL DEĞERLER) ---
var base_health: int = 80
var base_mana: int = 30
var hp_per_level: int = 10
var mp_per_level: int = 5
var str: int = 10
var dex: int = 10
var vit: int = 10
var intel: int = 10
var wis: int = 10
var foc: int = 10

var level: int = 1
var current_health: int = 100
var current_mana: int = 50
var experience: int = 0
var experience_to_next_level: int = 100
var manual_points_available: int = 0 

# --- HESAPLANMIŞ (COMPUTED) STATLAR ---
var computed_max_health: int = 100
var computed_max_mana: int = 50
var computed_physical_attack_power: int = 10 
var computed_magical_attack_power: int = 10  
var computed_healing_power: int = 10       
var computed_pdef_percent: float = 0.0
var computed_mdef_percent: float = 0.0
var computed_evasion: float = 0.0
var computed_aspd_bonus: float = 0.0
var computed_cspd_bonus: float = 0.0
var computed_pcrit_chance: float = 0.0
var computed_mcrit_chance: float = 0.0
var computed_hp_regen: float = 0.0
var computed_mp_regen: float = 0.0
var computed_debuff_resist: float = 0.0
var computed_debuff_success: float = 0.0
var computed_dmg_reduction: float = 0.0
var computed_thorns_base_dmg: int = 0
var computed_thorns_scale_stat: String = ""
var computed_thorns_scale_ratio: float = 0.0
var global_potion_cooldown_time: float = 0.0

# --- TALENT'LARDAN GELEN YENİ STATLAR BURAYA ---
var computed_pcrit_damage: float = 150.0
var computed_mcrit_damage: float = 150.0
var computed_heal_crit_bonus: float = 0.0
var computed_block_chance: float = 0.0
var computed_mana_cost_reduction: float = 0.0
var computed_skill_cooldown_reduction: float = 0.0
var computed_buff_debuff_duration: float = 0.0
var computed_armor_penetration: float = 0.0
# --- YENİ STATLARIN SONU ---

var class_id: int = 0 
var is_invisible: bool = false

var equipped_items: Dictionary = {}
var equipment_bonus_stats: Dictionary = {}

# --- YENİ TALENT BONUS SÖZLÜĞÜ ---
var talent_bonus_stats: Dictionary = {}

# --- YENİ DOT/HOT/BUFF SİSTEMİ ---
var active_statuses: Dictionary = {} # DoT, HoT ve Buff/Debuff'ları tutar

func _ready():
    #
    # MMO mantığı: runtime PlayerBase karakteri,
    # PlayerData'daki kalıcı veriye göre ayağa kalkar.
    #
    var pd = PlayerData  # Autoload singleton

    # Class
    class_id = pd.character_class_id

    # Level & XP
    level = pd.character_level
    experience = pd.experience
    experience_to_next_level = pd.experience_to_next_level
    manual_points_available = pd.manual_points_available

    # Temel statlar
    if pd.stats is Dictionary:
        str   = pd.stats.get("STR", str)
        dex   = pd.stats.get("DEX", dex)
        vit   = pd.stats.get("VIT", vit)
        intel = pd.stats.get("INT", intel)
        wis   = pd.stats.get("WIS", wis)
        foc   = pd.stats.get("FOC", foc)

    # --- GÜNCELLENDİ: Önce Talent'ları yükle ---
    update_talent_bonuses() # Statları hesaplamadan ÖNCE talent bonuslarını yükle
    
    recalculate_derived_stats() # Artık talent bonusları hazır
    
    set_health(computed_max_health)
    set_mana(computed_max_mana)

    add_to_group("player_character")

    # HUD’a altın bilgisini gönder
    gold_updated.emit(PlayerData.gold)


func _process(delta):
    # Cooldown'ları yönet
    var keys_to_remove: Array = []
    for skill_id in active_cooldowns.keys():
        active_cooldowns[skill_id] -= delta
        if active_cooldowns[skill_id] <= 0:
            keys_to_remove.append(skill_id)

    for skill_id in keys_to_remove:
        active_cooldowns.erase(skill_id)
        
    _tick_statuses(delta) # Player'ın HoT/DoT ve Buff/Debuff'larını işle
    
    # Global iksir cooldown’u
    if global_potion_cooldown_time > 0.0:
        global_potion_cooldown_time -= delta
        if global_potion_cooldown_time < 0.0:
             global_potion_cooldown_time = 0.0
  
    # HUD BuffPanel güncellemesi
    var hud = get_tree().get_first_node_in_group("hud")
    if hud and hud.has_method("update_buff_panel"):
        hud.update_buff_panel(active_statuses, SKILL_DATABASE, class_id)


# ============================
#  PlayerData SENKRON FONKSİYONU
# ============================
func _sync_to_player_data() -> void:
    var pd = PlayerData

    pd.character_level = level
    pd.experience = experience
    pd.experience_to_next_level = experience_to_next_level
    pd.manual_points_available = manual_points_available

    if pd.stats is Dictionary:
        pd.stats["STR"] = str
        pd.stats["DEX"] = dex
        pd.stats["VIT"] = vit
        pd.stats["INT"] = intel
        pd.stats["WIS"] = wis
        pd.stats["FOC"] = foc


# YENİ FONKSİYON: Player'ın HoT/DoT ve Buff/Debuff'larını Uygular
func _tick_statuses(delta):
    var keys_to_remove: Array = []
    var needs_recalc := false
    
    for skill_id in active_statuses.keys():
        var status = active_statuses[skill_id]
    
        status.time_left -= delta
        
        # DoT/HoT ise tick'leri uygula
        if status.has("is_dot_hot"):
            status.next_tick -= delta
            if status.next_tick <= 0.0:
                var value = int(round(status.value_per_tick))
            
                # --- DÜZELTME 1: Bu blok 1 seviye geri çekildi ---
                if status.is_heal:
                    call("heal", value, Color.GREEN)
                else:
                    call("take_damage", value, Color("#9900CC"), null)
            
                # --- DÜZELTME 2: Bu satır 1 seviye geri çekildi ---
                status.next_tick = status.tick_rate
        
        # Süresi biteni kaldır
        if status.time_left <= 0.0:
            keys_to_remove.append(skill_id)
            if status.has("is_buff"):
                needs_recalc = true

    for skill_id in keys_to_remove:
        active_statuses.erase(skill_id)
        
    # --- DÜZELTME 3: Bu blok 'for' döngüsünün DIŞINA alındı ---
    if needs_recalc:
        recalculate_derived_stats()
        print("Buff sona erdi, statlar yeniden hesaplandı.")
        

# YENİ FONKSİYON: HoT/DoT etkisini Player'a uygulamak için
func apply_status_effect(skill_id: String, total_value: float, duration: float, tick_rate: float, is_heal: bool):
    if not is_instance_valid(self):
        return
    
    var num_ticks = ceil(duration / tick_rate)
    if num_ticks == 0:
        num_ticks = 1
    var value_per_tick = total_value / num_ticks

    active_statuses[skill_id] = {
        "is_dot_hot": true,
        "value_per_tick": value_per_tick,
        "time_left": duration,
        "tick_rate": tick_rate,
        "next_tick": tick_rate,
        "is_heal": is_heal
    }
    print("PLAYER HoT/DoT BAŞLATILDI: ", skill_id, " (Toplam Değer: ", total_value, ")")


# YENİ FONKSİYON: Buff/Debuff etkisini Player'a uygulamak için
func apply_buff_debuff(skill_id: String, duration: float, effect_type: String, stats_to_save: Dictionary = {}):
  
    if not is_instance_valid(self):
        return

    var buff_value := 0
    if SKILL_DATABASE.has(skill_id):
        buff_value = SKILL_DATABASE[skill_id].base_dmg

    active_statuses[skill_id] = {
        "is_buff": true,
        "time_left": duration,
        "effect_type": effect_type,
        "value": buff_value,
        "potion_stats": stats_to_save
    }
    recalculate_derived_stats()
    print("PLAYER BUFF BAŞLATILDI: ", skill_id)
    

# --- EKSİK FONKSİYONLAR (HoT/DoT için) ---
func heal(amount: int, damage_color: Color):
    if current_health <= 0:
        return

    set_health(current_health + amount)
    spawn_damage_number(amount, damage_color)
    print("PLAYER HoT Aldı: ", amount, ". Yeni Can: ", current_health)


func take_damage(amount: int, damage_color: Color, attacker = null):
    if current_health <= 0:
        return
    
    set_health(current_health - amount)
    spawn_damage_number(amount, damage_color)
    print("PLAYER DoT Aldı: ", amount, ". Kalan Can: ", current_health)
    

func spawn_damage_number(amount, color):
    if get_parent().has_method("spawn_damage_number_on_effect_layer"):
        get_parent().spawn_damage_number_on_effect_layer(amount, color, global_position + Vector2(0, -35))
    else:
        print("HATA: PlayerBase'in ebeveyninde 'spawn_damage_number_on_effect_layer' fonksiyonu bulunamadı!")


# --------------------------------------------------
# --- GÜVENLİ GÜNCELLEME FONKSİYONLARI (SETTERS) ---
# --------------------------------------------------
func set_health(new_health):
    current_health = clampi(new_health, 0, computed_max_health)
    health_updated.emit(current_health, computed_max_health)


func set_mana(new_mana):
    var old_mana = current_mana
    current_mana = clampi(new_mana, 0, computed_max_mana)
    if old_mana != current_mana:
        print("MANA GÜNCELLEMESİ: %d -> %d (Max: %d)" % [old_mana, current_mana, computed_max_mana])
    mana_updated.emit(current_mana, computed_max_mana)


func set_experience(new_xp):
    experience = new_xp
    experience_updated.emit(experience, experience_to_next_level)


func set_experience_to_next_level(new_max_xp):
    experience_to_next_level = new_max_xp
    experience_updated.emit(experience, experience_to_next_level)


func set_level(new_level):
    level = new_level
    level_updated.emit(level)
  

# ------------------------
# --- STAT SİSTEMİ ÇEKİRDEĞİ
# ------------------------
func add_experience(amount: int):
    set_experience(experience + amount)
    print("Tecrübe Kazanıldı: ", amount, ". Toplam XP: ", experience, " / ", experience_to_next_level)
    
    while experience >= experience_to_next_level:
        var remaining_xp = experience - experience_to_next_level
        set_experience(remaining_xp)
        level_up()

    _sync_to_player_data()


func increase_stat(stat_name: String):
    if manual_points_available <= 0:
        print("HATA: Harcanacak stat puanı yok!")
        return

    manual_points_available -= 1
    
    match stat_name:
        "STR": str += 1
        "DEX": dex += 1
        "VIT": vit += 1
        "INT": intel += 1
        "WIS": wis += 1
        "FOC": foc += 1
            
    recalculate_derived_stats()
    _sync_to_player_data()
    
    
# =======================================================================
# --- YENİ TALENT GÜNCELLEME FONKSİYONU ---
# =======================================================================
# TalentManager tarafından çağrılacak
func update_talent_bonuses() -> void:
    print("PlayerBase: Yetenek bonusları güncelleniyor...")
    talent_bonus_stats.clear()
    
    # TalentManager'dan bu sınıf için öğrenilmiş tüm yetenekleri al
    var learned: Dictionary = TalentManager.learned_talents.get(PlayerData.character_class_name, {})
    
    for talent_id in learned.keys():
        var rank: int = learned[talent_id].get("rank", 0)
        if rank <= 0:
            continue
            
        # O yeteneğin veritabanı girdisini al
        var data: Dictionary = TalentManager.get_talent_data(PlayerData.character_class_name, talent_id)
        if data.is_empty():
            continue
            
        # "effects" sözlüğünü al
        var effects: Dictionary = data.get("effects", {})
        if effects.is_empty():
            continue
            
        # Efektleri işle
        for stat_key in effects.keys():
            var value_per_rank: float = effects[stat_key]
            var total_value: float = value_per_rank * rank
            
            # Bonusu ekle
            if talent_bonus_stats.has(stat_key):
                talent_bonus_stats[stat_key] += total_value
            else:
                talent_bonus_stats[stat_key] = total_value
                
    print("Hesaplanan yetenek bonusları: ", talent_bonus_stats)
    
    # Statları yeniden hesapla
    recalculate_derived_stats()


# --- YENİ TALENT BONUS FONKSİYONU ---
# (recalculate_derived_stats'in çağırdığı eksik fonksiyon bu)
func get_talent_bonus(stat_name: String) -> float:
    var key_str := stat_name
    if talent_bonus_stats.has(key_str):
        return float(talent_bonus_stats[key_str])
    return 0.0

# =======================================================================
# --- ANA STAT HESAPLAMA FONKSİYONU (GÜNCELLENDİ) ---
# =======================================================================
func recalculate_derived_stats():
    var old_max_hp = computed_max_health
    var old_max_mp = computed_max_mana
    
    # --- GÖRÜNMEZLİK KONTROLÜ ---
    var was_invisible = is_invisible
    is_invisible = false
  
    # --- 1. ADIM: TEMEL + EQUIP + TALENT STATLARI TOPLA ---
    var total_str = str + get_equipment_bonus("STR") + get_talent_bonus("STR")
    var total_dex = dex + get_equipment_bonus("DEX") + get_talent_bonus("DEX")
    var total_vit = vit + get_equipment_bonus("VIT") + get_talent_bonus("VIT")
    var total_intel = intel + get_equipment_bonus("INT") + get_talent_bonus("INT")
    var total_wis = wis + get_equipment_bonus("WIS") + get_talent_bonus("WIS")
    var total_foc = foc + get_equipment_bonus("FOC") + get_talent_bonus("FOC")
  
    # --- 2. ADIM: HP / MP (YÜZDELİK BONUSLAR EKLENDİ) ---
    var base_hp = (base_health + (hp_per_level * (level - 1))) + (total_vit * 18) + (total_str * 4) + get_equipment_bonus("HP") + get_talent_bonus("HP")
    var hp_percent_bonus = 1.0 + (get_equipment_bonus("HP_PERCENT") + get_talent_bonus("HP_PERCENT")) / 100.0
    computed_max_health = int(base_hp * hp_percent_bonus)

    var base_mp = (base_mana + (mp_per_level * (level - 1))) + (total_foc * 15) + (total_intel * 5) + get_equipment_bonus("MP") + get_talent_bonus("MP")
    var mp_percent_bonus = 1.0 + (get_equipment_bonus("MP_PERCENT") + get_talent_bonus("MP_PERCENT")) / 100.0
    computed_max_mana = int(base_mp * mp_percent_bonus)
    
    # --- 3. ADIM: PAP / MAP / HEAL POWER ---
    match class_id:
        1, 4, 5, 6: # Berserker, Crusader, Warden, Dragon Knight
            computed_physical_attack_power = total_str * 1.3 + total_dex * 0.4
        11, 3:       # Ranger, Monk
            computed_physical_attack_power = total_dex * 1.3 + total_str * 0.4
        _:
            computed_physical_attack_power = total_str * 0.8 + total_dex * 0.4
    
    computed_magical_attack_power = total_intel * 1.2 + total_foc * 0.5 + total_wis * 0.3
    computed_healing_power = total_wis * 1.2 + total_intel * 0.3

    var raw_weapon_damage = get_equipment_bonus("RAW_ATK") + get_talent_bonus("RAW_ATK")
    computed_physical_attack_power += raw_weapon_damage
    computed_magical_attack_power += raw_weapon_damage
    
    # --- 4. ADIM: DEFANSLAR ---
    var raw_armor_defense = get_equipment_bonus("RAW_DEF") + get_talent_bonus("RAW_DEF")
    var pdef_rating = (total_vit * 1.0) + (total_str * 0.2) + raw_armor_defense
    var mdef_rating = (total_wis * 1.0) + (total_intel * 0.2) + raw_armor_defense
    
    computed_pdef_percent = clamp(pdef_rating * 0.6 + get_equipment_bonus("P_DEF") + get_talent_bonus("P_DEF"), 0.0, 75.0)
    computed_mdef_percent = clamp(mdef_rating * 0.6 + get_equipment_bonus("M_DEF") + get_talent_bonus("M_DEF"), 0.0, 75.0)
    
    print("DEF HESAP → PDEF_RATING:", pdef_rating, " => ", computed_pdef_percent, "%  | MDEF_RATING:", mdef_rating, " => ", computed_mdef_percent, "%")
    
    # --- 5. ADIM: DİĞER TÜREV STATLAR (YENİLER EKLENDİ) ---
    computed_evasion       = total_dex * 0.08 + get_equipment_bonus("EVASION_BONUS") + get_talent_bonus("EVASION_BONUS")
    computed_aspd_bonus    = total_dex * 0.2  + get_equipment_bonus("ASPD_BONUS") + get_talent_bonus("ASPD_BONUS")
    computed_cspd_bonus    = total_foc * 0.2  + get_equipment_bonus("CSPD_BONUS") + get_talent_bonus("CSPD_BONUS")
    computed_pcrit_chance  = 5.0 + (total_dex * 0.1) + get_equipment_bonus("P_CRIT_BONUS") + get_talent_bonus("P_CRIT_BONUS")
    computed_mcrit_chance  = 5.0 + (total_foc * 0.1) + get_equipment_bonus("M_CRIT_BONUS") + get_talent_bonus("M_CRIT_BONUS")
    computed_hp_regen      = 5.0 + (total_vit * 0.5) + get_equipment_bonus("HP_REGEN") + get_talent_bonus("HP_REGEN")
    computed_mp_regen      = 5.0 + (total_wis * 0.7) + get_equipment_bonus("MP_REGEN") + get_talent_bonus("MP_REGEN")
    computed_debuff_resist = total_wis * 0.1 + get_equipment_bonus("DEBUFF_RESIST") + get_talent_bonus("DEBUFF_RESIST")
    computed_debuff_success = total_foc * 0.1
    
    # YENİ EKLENEN STATLAR
    computed_pcrit_damage = 150.0 + get_equipment_bonus("P_CRIT_DAMAGE") + get_talent_bonus("P_CRIT_DAMAGE")
    computed_mcrit_damage = 150.0 + get_equipment_bonus("M_CRIT_DAMAGE") + get_talent_bonus("M_CRIT_DAMAGE")
    computed_heal_crit_bonus = 0.0 + get_equipment_bonus("HEAL_CRIT_BONUS") + get_talent_bonus("HEAL_CRIT_BONUS")
    computed_block_chance = 0.0 + get_equipment_bonus("BLOCK_CHANCE") + get_talent_bonus("BLOCK_CHANCE")
    computed_mana_cost_reduction = 0.0 + get_equipment_bonus("MANA_COST_REDUCTION") + get_talent_bonus("MANA_COST_REDUCTION")
    computed_skill_cooldown_reduction = 0.0 + get_equipment_bonus("CDR") + get_talent_bonus("CDR")
    computed_buff_debuff_duration = 0.0 + get_equipment_bonus("BUFF_DURATION") + get_talent_bonus("BUFF_DURATION")
    computed_armor_penetration = 0.0 + get_equipment_bonus("P_PIERCE") + get_talent_bonus("P_PIERCE")

    # YÜZDELİK PAP/MAP/HEAL BONUSLARI
    computed_physical_attack_power += get_equipment_bonus("PAP_BONUS") + get_talent_bonus("PAP_BONUS")
    computed_magical_attack_power  += get_equipment_bonus("MAP_BONUS") + get_talent_bonus("MAP_BONUS")
    
    var pap_percent_bonus = 1.0 + (get_equipment_bonus("PAP_PERCENT") + get_talent_bonus("PAP_PERCENT")) / 100.0
    computed_physical_attack_power *= pap_percent_bonus
    
    var map_percent_bonus = 1.0 + (get_equipment_bonus("MAP_PERCENT") + get_talent_bonus("MAP_PERCENT")) / 100.0
    computed_magical_attack_power *= map_percent_bonus

    computed_healing_power *= (1.0 + ((get_equipment_bonus("HEAL_BONUS") + get_talent_bonus("HEAL_BONUS")) / 100.0))

    # --- 6. ADIM: BUFF TEMİZLE & UYGULA ---
    computed_dmg_reduction = 0.0
    computed_thorns_base_dmg = 0
    computed_thorns_scale_stat = ""
    computed_thorns_scale_ratio = 0.0

    for skill_id in active_statuses:
        var status = active_statuses[skill_id]
        if status.has("is_buff"):
            # Potion buff’ları
            if status.effect_type.begins_with("Potion_") and status.has("potion_stats"):
                var pot_stats: Dictionary = status.potion_stats
                
                match status.effect_type:
                    "Potion_Atk_Buff":
                        computed_physical_attack_power += pot_stats.get("PAP_BONUS", 0.0)
                        computed_magical_attack_power  += pot_stats.get("MAP_BONUS", 0.0)
                    "Potion_Def_Buff":
                        computed_pdef_percent += pot_stats.get("P_DEF_BONUS", 0.0)
                        computed_mdef_percent += pot_stats.get("M_DEF_BONUS", 0.0)
                    "Potion_Speed_Buff":
                        computed_aspd_bonus += pot_stats.get("ASPD_BONUS", 0.0)
                        computed_cspd_bonus += pot_stats.get("CSPD_BONUS", 0.0)
                    "Potion_Crit_Buff":
                        computed_pcrit_chance += pot_stats.get("P_CRIT_BONUS", 0.0)
                        computed_mcrit_chance += pot_stats.get("M_CRIT_BONUS", 0.0)
                    "Potion_Resist_Buff":
                        var resist_val = pot_stats.get("RESIST_ALL", 0.0)
                        computed_debuff_resist += resist_val 
                        computed_pdef_percent  += pot_stats.get("P_DEF_BONUS", 0.0)
                        computed_mdef_percent  += pot_stats.get("M_DEF_BONUS", 0.0)
            
            match status.effect_type:
                "Buff_Atk":
                    computed_physical_attack_power *= 1.2
                "Buff_PDef":
                    computed_pdef_percent += 15.0
                "Buff_AtkSpeed":
                    computed_aspd_bonus += 20.0
                "DMG Reduce":
                    computed_dmg_reduction += 0.35
                "DMG Reduce + Thorns":
                    computed_dmg_reduction += 0.30
                    computed_thorns_base_dmg = 20
                    computed_thorns_scale_stat = "VIT"
                    computed_thorns_scale_ratio = 0.0
                "DMG Reduce + Görünmezlik":
                    computed_dmg_reduction += 0.40
                    is_invisible = true
                "Thorns":
                    computed_thorns_base_dmg = 18
                    computed_thorns_scale_stat = "INT"
                    computed_thorns_scale_ratio = 0.25
                "Gizlilik + Crit Şansı":
                    computed_pcrit_chance += 25.0
                    is_invisible = true
                "Buff_AtkDef":
                    computed_physical_attack_power *= 1.15
                    computed_pdef_percent += 10.0
                    computed_mdef_percent += 10.0
                "Element Hasarını Artır":
                    computed_magical_attack_power *= 1.25
                "Atk/Direnç Buff":
                    computed_physical_attack_power *= 1.10
                    computed_pdef_percent += 15.0
                    computed_mdef_percent += 15.0
                "Büyü Hasarı/Leech Buff":
                    computed_magical_attack_power *= 1.20
                "Takım MP Regen Buff":
                    computed_mp_regen *= 1.5
                "Hareket/Atk Speed Buff":
                    computed_aspd_bonus += 15.0
                "Ölümü Atlama":
                    pass
                "Temas Hasar Bağışıklığı":
                    pass
                "Kaçınma + DMG Bağışıklığı":
                    pass

    computed_dmg_reduction = clamp(computed_dmg_reduction, 0.0, 0.8)

    # --- 7. ADIM: Can/Mana barlarını koru ---
    if computed_max_health > old_max_hp:
        set_health(current_health + (computed_max_health - old_max_hp))
    else:
        set_health(current_health)
        
    if computed_max_mana > old_max_mp:
        set_mana(current_mana + (computed_max_mana - old_max_mp))
    else:
        set_mana(current_mana)

    # --- 8. ADIM: Görünmezlik sinyali ---
    if is_invisible != was_invisible:
        invisibility_changed.emit(is_invisible)
        print("Görünmezlik durumu değişti: ", is_invisible)
        
    # --- 9. ADIM: HUD’a stat paketini gönder (GÜNCELLENDİ) ---
    var stats_payload = {
        "level": level,
        "hp": current_health, "max_hp": computed_max_health,
        "mp": current_mana, "max_mp": computed_max_mana,
        "xp": experience, "max_xp": experience_to_next_level,
        "points_available": manual_points_available,
        "str": total_str, "dex": total_dex, "vit": total_vit,
        "int": total_intel, "wis": total_wis, "foc": total_foc,
        "pap": computed_physical_attack_power,
        "map": computed_magical_attack_power,
        "healp": computed_healing_power,
        "pcrit": computed_pcrit_chance,
        "mcrit": computed_mcrit_chance,
        "pdef": computed_pdef_percent,
        "mdef": computed_mdef_percent,
        "evasion": computed_evasion,
        "aspd": computed_aspd_bonus,
        "cspd": computed_cspd_bonus,
        "hp_regen": computed_hp_regen,
        "mp_regen": computed_mp_regen,
        "debuff_resist": computed_debuff_resist,
        "debuff_success": computed_debuff_success,
        
        # YENİ EKLENEN STATLAR
        "pcrit_dmg": computed_pcrit_damage,
        "mcrit_dmg": computed_mcrit_damage,
        "heal_crit": computed_heal_crit_bonus,
        "block": computed_block_chance,
        "mana_reduc": computed_mana_cost_reduction,
        "cdr": computed_skill_cooldown_reduction,
        "buff_dur": computed_buff_debuff_duration,
        "p_pierce": computed_armor_penetration,
    }
    stats_updated.emit(stats_payload)


func level_up():
    set_level(level + 1)
    
    # 1. Stat Puanları (Mevcut sistemin)
    manual_points_available += 5
    print("SEVİYE ATLADIN! Harcanabilir 5 STAT puanı kazandın!")
    
    # --- YENİ EKLENEN YETENEK PUANI SİSTEMİ ---
    # (5. seviyeden 75. seviyeye kadar her seviyede 1 puan)
    if level >= 5 and level <= 75:
        # TalentManager (Autoload) üzerinden puanı ekle
        # PlayerData'dan (Autoload) hangi sınıf olduğunu öğrenir
        TalentManager.add_talent_points(PlayerData.character_class_name, 1)
        print("YETENEK PUANI KAZANDIN! (Mevcut Puan: %d)" % TalentManager.get_available_points(PlayerData.character_class_name))
    # --- YENİ KODUN SONU ---

    # Stat artışları (bu kısım aynı kalır)
    match class_id:
        0: # Druid
            intel += 1; wis += 1; foc += 1; vit += 1
        1: # Berserker
            str += 2; vit += 1
            if level % 2 == 1: wis += 1
            else: dex += 1
        2: # Elementalist
            intel += 2; foc += 1
            if level % 2 == 1: wis += 1
            else: vit += 1
        3: # Monk
            dex += 1; vit += 1; foc += 1; wis += 1
        4: # Crusader
            vit += 2; wis += 1
            if level % 2 == 1: foc += 1
            else: str += 1
        5: # Warden
            str += 1; dex += 1; vit += 1; foc += 1
        6: # Dragon Knight
            vit += 2; str += 1
            if level % 2 == 1: wis += 1
            else: foc += 1
        7: # Warlock
            intel += 2; foc += 1
            if level % 2 == 1: wis += 1
            else: vit += 1
        8: # Cleric
            wis += 2; vit += 1
            if level % 2 == 1: intel += 1
            else: foc += 1
        9: # Bard
            foc += 2; wis += 1
            if level % 2 == 1: dex += 1
            else: vit += 1
        10: # Necromancer
            intel += 2; foc += 1
            if level % 2 == 1: wis += 1
            else: vit += 1
        11: # Ranger
            dex += 2; vit += 1
            if level % 2 == 1: str += 1
            else: foc += 1
        _:
            print("HATA: Seviye atlama için class_id tanınmıyor!")

    set_experience_to_next_level(int(experience_to_next_level * 1.5))
    recalculate_derived_stats()
    set_health(computed_max_health)
    set_mana(computed_max_mana)

    _sync_to_player_data()


# -----------------------------
# --- YETENEK KONTROL VE KULLANIM (GÜNCELLENDİ)
# -----------------------------
func can_cast_skill(skill_id: String) -> bool:
    var skill_data = SKILL_DATABASE.get(skill_id)
    
    if skill_data == null:
        print("HATA: Bilinmeyen Yetenek ID'si: ", skill_id)
        return false

    if active_cooldowns.has(skill_id):
        return false
    
    # YENİ: Mana Cost Reduction
    var mana_cost = skill_data.cost * (1.0 - (computed_mana_cost_reduction / 100.0))
      
    if current_mana < mana_cost:
        return false
        
    return true


func start_skill_cooldown(skill_id: String):
    var skill_data = SKILL_DATABASE.get(skill_id)
    if skill_data != null:
        # YENİ: Mana Cost Reduction
        var mana_cost = skill_data.cost * (1.0 - (computed_mana_cost_reduction / 100.0))
        set_mana(current_mana - mana_cost)
        
        # YENİ: Cooldown Reduction
        var final_cooldown = skill_data.cd * (1.0 - (computed_skill_cooldown_reduction / 100.0))
        active_cooldowns[skill_id] = final_cooldown
        

# İstenen temel stat değerini döndürür
func _get_stat_value(stat_name: String) -> float:
    # GÜNCELLEME: Artık talent bonusları ana toplamaya dahil edildiği için
    # bu fonksiyonu değiştirmeye gerek yok, total statları kullanıyor.
    var total_str = str + get_equipment_bonus("STR") + get_talent_bonus("STR")
    var total_dex = dex + get_equipment_bonus("DEX") + get_talent_bonus("DEX")
    var total_vit = vit + get_equipment_bonus("VIT") + get_talent_bonus("VIT")
    var total_intel = intel + get_equipment_bonus("INT") + get_talent_bonus("INT")
    var total_wis = wis + get_equipment_bonus("WIS") + get_talent_bonus("WIS")
    var total_foc = foc + get_equipment_bonus("FOC") + get_talent_bonus("FOC")
    
    match stat_name:
        "STR": return float(total_str)
        "DEX": return float(total_dex)
        "VIT": return float(total_vit)
        "INT": return float(total_intel)
        "WIS": return float(total_wis)
        "FOC": return float(total_foc)
        _: return 0.0


# Yeteneğin temel hasar/iyileştirme değerini hesaplar
func _calculate_skill_value(skill_id: String) -> float:
    var skill_data = SKILL_DATABASE.get(skill_id)
    if skill_data == null:
         return 0.0

    var base_value: float = float(skill_data.base_dmg)
    var scale_stat: String = skill_data.scale_stat
    var scale_ratio: float = skill_data.scale_ratio

    var scaling_value: float = _get_stat_value(scale_stat)
    var final_value: float = base_value + (scaling_value * scale_ratio)

    var is_heal: bool = false
    if "is_heal" in skill_data:
        is_heal = skill_data.is_heal

    if is_heal:
        # YENİ: Heal Crit (Talent'lardan gelen)
        var heal_crit_chance = computed_mcrit_chance + computed_heal_crit_bonus
        if randf() * 100.0 < heal_crit_chance:
            final_value *= (computed_mcrit_damage / 100.0) # Şimdilik M.Crit Dmg kullansın
            print("İyileştirme Kritik Vuruşu!")
            
        final_value *= (1.0 + computed_healing_power / 100.0)
    else:
        var is_physical := (scale_stat == "STR" or scale_stat == "DEX" or scale_stat == "VIT")
        var atk_power: float = 0.0
        if is_physical:
            atk_power = float(computed_physical_attack_power)
            # YENİ: Fiziksel Kritik
            if randf() * 100.0 < computed_pcrit_chance:
                final_value *= (computed_pcrit_damage / 100.0)
                print("Fiziksel Kritik Vuruş!")
        else:
            atk_power = float(computed_magical_attack_power)
            # YENİ: Büyüsel Kritik
            if randf() * 100.0 < computed_mcrit_chance:
                final_value *= (computed_mcrit_damage / 100.0)
                print("Büyüsel Kritik Vuruş!")
        
        final_value *= (1.0 + atk_power / 100.0)

    return final_value


# --- GÜNCELLENMİŞ EXECUTE_SKILL FONKSİYONU ---
func execute_skill(skill_id: String, target_or_position = null):
    var skill_data = SKILL_DATABASE.get(skill_id)
    
    if skill_data == null:
        print("HATA: Yetenek ID'si SKILL_DATABASE'de bulunamadı: ", skill_id)
        return
      
    if not can_cast_skill(skill_id):
        if active_cooldowns.has(skill_id):
            print("YETENEK KULLANILAMADI: %s - Cooldown'da (Kalan: %.1fs)" % [skill_id, active_cooldowns[skill_id]])
        elif current_mana < (skill_data.cost * (1.0 - (computed_mana_cost_reduction / 100.0))):
            print("YETENEK KULLANILAMADI: %s - Yetersiz Mana (%d / %d Gerekli)" % [skill_id, current_mana, skill_data.cost])
        return

    start_skill_cooldown(skill_id)
    
    var computed_value: float = _calculate_skill_value(skill_id)
    var is_heal: bool = skill_data.is_heal if "is_heal" in skill_data else false
    var effect_desc: String = skill_data.effect
    
    # YENİ: Buff Süresi
    var final_duration_mod = 1.0 + (computed_buff_debuff_duration / 100.0)
    
    # --- YENİ EKLENEN BECERİ MANTIĞI ---
    # Bu blok, "HoT", "Buff_Atk" gibi KENDİMİZE UYGULANAN etkileri ele alır.
    # Hasar/Debuff sinyalleri (Slow, Burn DoT) hala emitlenecek.
    
    # KENDİNE UYGULANAN EFEKTLER
    match effect_desc:
        "HoT":
            # Druid: Rejuvenate
            apply_status_effect(skill_id, computed_value, 12.0 * final_duration_mod, 3.0, true)
        "AoE HoT":
            # Druid: Bloom Field, Cleric: Beacon of Hope, Bard: Melody of Healing
            apply_status_effect(skill_id, computed_value, 9.0 * final_duration_mod, 1.5, true)
        "Buff_Atk":
            # Berserker: Bloodletting, Bard: Song of Courage
            apply_buff_debuff(skill_id, 10.0 * final_duration_mod, "Buff_Atk")
        "Buff_AtkSpeed":
            # Berserker: Adrenal Surge, Bard: Rhythm of Agility
            apply_buff_debuff(skill_id, 8.0 * final_duration_mod, "Buff_AtkSpeed")
        "Thorns":
            # Druid: Thorn Armor
            apply_buff_debuff(skill_id, 30.0 * final_duration_mod, "Thorns")
        "Buff_PDef":
            # Monk: Iron Body
            apply_buff_debuff(skill_id, 10.0 * final_duration_mod, "Buff_PDef")
        "Buff_AtkDef":
            # Crusader: Vow of Valor, Bard: Ballad of Bravery
            apply_buff_debuff(skill_id, 10.0 * final_duration_mod, "Buff_AtkDef")
        "DMG Reduce":
            # Crusader: Aegis of Faith
            apply_buff_debuff(skill_id, 8.0 * final_duration_mod, "DMG Reduce")
        "DMG Reduce + Thorns":
            # Dragon Knight: Molten Guard
            apply_buff_debuff(skill_id, 10.0 * final_duration_mod, "DMG Reduce + Thorns")
        "DMG Reduce + Görünmezlik":
            # Warlock: Shadow Veil
            apply_buff_debuff(skill_id, 4.0 * final_duration_mod, "DMG Reduce + Görünmezlik")
        "Gizlilik + Crit Şansı":
            # Warden: warden_camouflage, Ranger: ranger_camouflage
            apply_buff_debuff(skill_id, 10.0 * final_duration_mod, "Gizlilik + Crit Şansı")
        "Element Hasarını Artır":
            # Elementalist: Elemental Surge
            apply_buff_debuff(skill_id, 10.0 * final_duration_mod, "Element Hasarını Artır")
        "Büyü Hasarı/Leech Buff":
            # Warlock: Demonic Ascension
            apply_buff_debuff(skill_id, 15.0 * final_duration_mod, "Büyü Hasarı/Leech Buff")
        "Takım MP Regen Buff":
            # Cleric: Hymn of Serenity, Bard: Aria of Restoration
            apply_buff_debuff(skill_id, 8.0 * final_duration_mod, "Takım MP Regen Buff")
        "Hareket/Atk Speed Buff":
            # Ranger: Windstep
            apply_buff_debuff(skill_id, 10.0 * final_duration_mod, "Hareket/Atk Speed Buff")
        "Ölümü Atlama":
            # Dragon Knight: Ember Rebirth
            apply_buff_debuff(skill_id, 5.0 * final_duration_mod, "Ölümü Atlama")
        "Temas Hasar Bağışıklığı":
            # Necromancer: Wraith Form
            apply_buff_debuff(skill_id, 3.0 * final_duration_mod, "Temas Hasar Bağışıklığı")
        "Kaçınma + DMG Bağışıklığı":
            # Ranger: Evasive Roll
            apply_buff_debuff(skill_id, 0.5 * final_duration_mod, "Kaçınma + DMG Bağışıklığı")
        "Atk/Direnç Buff":
            # Dragon Knight: Heart of the Dragon
            apply_buff_debuff(skill_id, 15.0 * final_duration_mod, "Atk/Direnç Buff")
        "Anlık Tek Hedef Heal":
            # Cleric: Holy Light
            call("heal", computed_value, Color.GREEN)

    # --- YENİ MANTIĞIN SONU ---
    
    
    # BU LİSTE ARTIK GEREKLİ DEĞİL (Şimdilik tutabiliriz ama match bloğu daha iyi)
    var SELF_TARGET_EFFECTS = [
        "rejuvenate", "spirit_link", "thorn_armor", "bloom_field",
        "bloodletting", "adrenal_surge",
        "ice_barrier", "elemental_surge",
        "meditation", "iron_body", "way_of_the_lotus",
        "divine_guard", "purge_evil", "sanctified_ground", "vow_of_valor", "aegis_of_faith",
        "summon_companion", "call_of_the_wild", "warden_camouflage", "guardian_of_the_forest", "primal_focus",
        "molten_guard", "flame_ward", "ember_rebirth", "heart_of_the_dragon",
        "soul_drain", "infernal_summon", "shadow_veil", "demonic_ascension",
        "holy_light", "purify", "radiant_wave", "sacred_bond", "blessing_of_valor", "angelic_barrier", "beacon_of_hope", "hymn_of_serenity",
        "song_of_courage", "melody_of_healing", "rhythm_of_agility", "resonant_shield", "ballad_of_bravery", "aria_of_restoration",
        "raise_skeletons", "death_coil", "wraith_form", "summon_abomination", "ritual_of_sacrifice",
        "evasive_roll", "windstep", "ranger_camouflage"
    ]
    
    # Sinyali her zaman yayınla.
    # "EffectManager" (veya World) sinyali aldığında hedefin kim olduğuna bakar.
    # Eğer hedef "self" ise ve etki "HoT" ise, EffectManager hedefin (yani PlayerBase'in)
    # apply_status_effect fonksiyonunu çağırır.
    # Eğer hedef "enemy" ise ve etki "Burn DoT" ise,
    # EffectManager hedefin (yani EnemyBase'in) apply_status_effect fonksiyonunu çağırır.
    
    # Bu yüzden SELF_TARGET_EFFECTS'e GEREK YOK.
    
    if target_or_position == null:
        # Eğer hedef belirtilmemişse (veya skillbar'dan geliyorsa),
        # ve yetenek kendine uygulanabilen bir şeyse (HoT/Buff gibi), hedefi "self" yap.
        if is_heal or effect_desc.begins_with("Buff_") or effect_desc.contains("HoT") or effect_desc.contains("DMG Reduce"):
            skill_executed.emit(skill_id, computed_value, is_heal, effect_desc, self)
        else:
            # Hedefsiz bir saldırı yeteneği (örneğin bir projectile)
            skill_executed.emit(skill_id, computed_value, is_heal, effect_desc, target_or_position)
    else:
        # Hedef belliyse (düşmana tıklandıysa) sinyali o hedefle yayınla
        skill_executed.emit(skill_id, computed_value, is_heal, effect_desc, target_or_position)


# =====================================================
#  EQUIPMENT → STAT SİSTEMİ
# =====================================================
func set_equipment_from_inventory(equipped_dict: Dictionary) -> void:
    equipped_items.clear()

    for key in equipped_dict.keys():
        var k: String = str(key)
        var itm = equipped_dict[key]
        if itm is Dictionary and not itm.is_empty():
            equipped_items[k] = itm.duplicate(true)

    _recalculate_equipment_stats()


func _recalculate_equipment_stats() -> void:
    equipment_bonus_stats.clear()

    for itm in equipped_items.values():
        if itm == null:
            continue
        if not (itm is Dictionary):
            continue

        var stats: Dictionary = itm.get("stats", {})
        if not (stats is Dictionary):
            continue

        for s_key in stats.keys():
            var key_str: String = str(s_key)
            var raw_val = stats[s_key]
            var val: float = 0.0
 
            if typeof(raw_val) == TYPE_INT or typeof(raw_val) == TYPE_FLOAT:
                val = float(raw_val)
            else:
                continue

            if equipment_bonus_stats.has(key_str):
                equipment_bonus_stats[key_str] = float(equipment_bonus_stats[key_str]) + val
            else:
                equipment_bonus_stats[key_str] = val

    recalculate_derived_stats()


func get_equipment_bonus(stat_name: String) -> float:
    var key_str := stat_name
    if equipment_bonus_stats.has(key_str):
        return float(equipment_bonus_stats[key_str])
    return 0.0


func get_total_with_equipment(stat_name: String, base_value: float) -> float:
    return base_value + get_equipment_bonus(stat_name)


# --- YENİ ALTIN FONKSİYONLARI ---
func add_gold(amount: int) -> void:
    if amount <= 0:
        return
    PlayerData.gold += amount
    gold_updated.emit(PlayerData.gold)
    print("Altın kazanıldı: +%d. Toplam: %d" % [amount, PlayerData.gold])


func spend_gold(amount: int) -> bool:
    if amount <= 0:
        return false

    if PlayerData.gold >= amount:
        PlayerData.gold -= amount
        gold_updated.emit(PlayerData.gold)
        print("Altın harcandı: -%d. Kalan: %d" % [amount, PlayerData.gold])
        return true
    else:
        print("HATA: Yetersiz altın! Gereken: %d, Mevcut: %d" % [amount, PlayerData.gold])
        return false


# --- İKSİR KULLANIMI ---
func use_potion_item(item_data: Dictionary) -> bool:
    var req_class_val := str(item_data.get("req_class", "")).to_upper()
    var id_str := str(item_data.get("id", ""))

    if req_class_val != "POTIONS" and not id_str.begins_with("P_"):
        return false

    var stats: Dictionary = item_data.get("stats", {})
    var cooldown_ms: int = int(stats.get("COOLDOWN", 0))

    if cooldown_ms > 0 and global_potion_cooldown_time > 0.0:
        var hud = get_tree().get_first_node_in_group("hud")
        if hud and hud.has_method("show_loot_alert_text"):
             hud.show_loot_alert_text("Bekleme süresinde: %.1f sn" % global_potion_cooldown_time)
        return false

    if stats.has("HP_REGEN_VALUE"):
        var heal_amount: int = int(stats["HP_REGEN_VALUE"])
        call("heal", heal_amount, Color.GREEN)
        
    if stats.has("MP_REGEN_VALUE"):
        var mana_restore: int = int(stats["MP_REGEN_VALUE"])
        set_mana(current_mana + mana_restore)
        
    var duration_ms: int = int(stats.get("DURATION", 0))
    if duration_ms > 0:
        var duration_s: float = float(duration_ms) / 1000.0
        var pot_id = item_data.get("id")
        
        var buff_type = ""
        if stats.has("PAP_BONUS") or stats.has("MAP_BONUS"):
            buff_type = "Potion_Atk_Buff"
        elif stats.has("P_DEF_BONUS") or stats.has("M_DEF_BONUS"):
             buff_type = "Potion_Def_Buff"
        elif stats.has("ASPD_BONUS") or stats.has("CSPD_BONUS"):
            buff_type = "Potion_Speed_Buff"
        elif stats.has("P_CRIT_BONUS") or stats.has("M_CRIT_BONUS"):
            buff_type = "Potion_Crit_Buff"
        elif stats.has("RESIST_ALL"):
            buff_type = "Potion_Resist_Buff"
        
        if buff_type != "" and pot_id != null:
             apply_buff_debuff(pot_id, duration_s, buff_type, stats)
        
    if cooldown_ms > 0:
        global_potion_cooldown_time = float(cooldown_ms) / 100.0
        
    return true
    

# ================================
#  BASIC ATTACK SİSTEMİ YARDIMCILARI
# ================================
func is_melee_basic_attacker() -> bool:
    match class_id:
        1, 3, 4, 5, 6:
            return true
        _:
            return false


func is_ranged_basic_attacker() -> bool:
    return not is_melee_basic_attacker()


func get_basic_attack_config() -> Dictionary:
    var cfg := {}

    if is_ranged_basic_attacker():
        cfg["type"] = "ranged"
        cfg["max_range"] = 400.0
        cfg["aoe_radius"] = 96.0
        cfg["cone_angle"] = deg_to_rad(96.0)
    else:
        cfg["type"] = "melee"
        cfg["max_range"] = 140.0
        cfg["aoe_radius"] = 180.0
        cfg["cone_angle"] = deg_to_rad(180.0)

    return cfg


func compute_basic_attack_damage() -> int:
    var pap := float(computed_physical_attack_power)
    var map := float(computed_magical_attack_power)
    var base := 0.0

    match class_id:
        0:
            base = pap * 0.4 + map * 0.6
        2, 7, 8, 9, 10, 11:
            base = map
        _:
            base = pap

    var level_bonus := float(level) * 2.0
    return int(round(base + level_bonus))


func find_basic_attack_targets(
        origin: Vector2,
        direction: Vector2,
        preferred_target: Node2D = null
    ) -> Array:
    var results: Array = []

    var dir := direction
    if dir == Vector2.ZERO:
        dir = Vector2(0, 1)
    var dir_norm := dir.normalized()

    var cfg := get_basic_attack_config()
    var max_range: float = cfg["max_range"]
    var aoe_radius: float = cfg["aoe_radius"]
    var cone_angle: float = cfg["cone_angle"]
    var type_str := String(cfg["type"])

    var enemies: Array = get_tree().get_nodes_in_group("enemies")
    if enemies.is_empty():
        return results

    var max_range_sq := max_range * max_range
    var cone_half_cos := cos(cone_angle * 0.5)

    if type_str == "ranged" and preferred_target != null and is_instance_valid(preferred_target):
        if preferred_target.is_in_group("enemies") and preferred_target is Node2D:
            # --- KAPSAM (SCOPE) HATASI DÜZELTMESİ BURADA ---
            # Değişkenler (target_node, to_t vb.) artık doğru if bloğunun içinde
            var target_node := preferred_target as Node2D
            var to_t := target_node.global_position - origin
            var dist_sq_t := to_t.length_squared()
            
            if dist_sq_t <= max_range_sq:
                var to_t_norm := to_t.normalized()
                if dir_norm.dot(to_t_norm) >= cone_half_cos:
                    results.append(target_node)
                    return results
            # --- DÜZELTME SONU ---

    if type_str == "ranged":
        var best_enemy: Node2D = null
        var best_dist_sq := max_range_sq + 1.0

        for e in enemies:
            if not (e is Node2D):
                continue

            var enemy_node := e as Node2D
            var to_enemy := enemy_node.global_position - origin
            var dist_sq := to_enemy.length_squared()
            if dist_sq > max_range_sq:
                continue

            var to_norm := to_enemy.normalized()
            if dir_norm.dot(to_norm) < cone_half_cos:
                continue

            if dist_sq < best_dist_sq:
                best_dist_sq = dist_sq
                best_enemy = enemy_node

        if best_enemy != null:
            results.append(best_enemy)
    else:
        var max_radius_sq := aoe_radius * aoe_radius

        for e in enemies:
            if not (e is Node2D):
                continue

            var enemy_node := e as Node2D
            var to_enemy := enemy_node.global_position - origin
            var dist_sq := to_enemy.length_squared()
            if dist_sq > max_radius_sq:
                continue

            var to_norm := to_enemy.normalized()
            if dir_norm.dot(to_norm) < cone_half_cos:
                continue

            results.append(enemy_node)

    return results
