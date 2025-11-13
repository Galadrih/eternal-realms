extends CharacterBody2D

# --- YETENEK VERİTABANI (snake_case ID'ler ile güncellendi) ---
const SKILL_DATABASE = {
# --- DRUID (0) - INT/WIS/FOC ---
    "vine_whip":          { "cost": 15, "cd": 4.0, "base_dmg": 65,  "scale_stat": "INT", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "Slow 40%" },
    "rejuvenate":         { "cost": 20, "cd": 8.0, "base_dmg": 30,  "scale_stat": "WIS", "scale_ratio": 0.50, "is_damage": false, "is_heal": true, "effect": "HoT" },
    "entangle_roots":     { "cost": 25, "cd": 12.0, "base_dmg": 20,  "scale_stat": "INT", "scale_ratio": 0.30, "is_damage": true, "is_heal": false, "effect": "Root 1.5s + DoT" },
    "poison_spores":      { "cost": 30, "cd": 15.0, "base_dmg": 22,  "scale_stat": "INT", "scale_ratio": 0.35, "is_damage": true, "is_heal": false, "effect": "AoE DoT + Heal Reduce" },
    "spirit_link":        { "cost": 40, "cd": 30.0, "base_dmg": 0,   "scale_stat": "WIS", "scale_ratio": 0.30, "is_damage": false, "is_heal": true, "effect": "Damage Share + Self Heal" },
    "thorn_armor":        { "cost": 25, "cd": 20.0, "base_dmg": 18,  "scale_stat": "INT", "scale_ratio": 0.25, "is_damage": true, "is_heal": false, "effect": "Thorns" },
    "seed_shot":          { "cost": 10, "cd": 2.0, "base_dmg": 45,  "scale_stat": "INT", "scale_ratio": 0.50, "is_damage": true, "is_heal": false, "effect": "Mini Patlama" },
    "bloom_field":        { "cost": 35, "cd": 18.0, "base_dmg": 28,  "scale_stat": "WIS", "scale_ratio": 0.45, "is_damage": false, "is_heal": true, "effect": "AoE HoT + Slow" },
    "rot_pulse":          { "cost": 45, "cd": 25.0, "base_dmg": 90,  "scale_stat": "INT", "scale_ratio": 0.80, "is_damage": true, "is_heal": false, "effect": "AoE DoT + Atk Reduce" },
    "natures_grasp":      { "cost": 30, "cd": 15.0, "base_dmg": 40,  "scale_stat": "INT", "scale_ratio": 0.40, "is_damage": true, "is_heal": false, "effect": "Dash + Root 1s" },
    
# --- BERSERKER (1) - STR/VIT/DEX ---
    "rage_slash":         { "cost": 0,  "cd": 4.0, "base_dmg": 110, "scale_stat": "STR", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Yüksek Hasar" },
    "frenzied_combo":     { "cost": 10, "cd": 6.0, "base_dmg": 55,  "scale_stat": "STR", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "3 Vuruş + Stun Şansı" },
    "war_cry":            { "cost": 0,  "cd": 15.0, "base_dmg": 0,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Debuff_AtkDef" },
    "bloodletting":       { "cost": 0,  "cd": 25.0, "base_dmg": 0,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Buff_Atk" },
    "earth_splitter":     { "cost": 15, "cd": 10.0, "base_dmg": 95,  "scale_stat": "STR", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "AoE + Zayıf Sersemletme" },
    "unyielding_strike":  { "cost": 20, "cd": 12.0, "base_dmg": 95,  "scale_stat": "STR", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "Zırh Delme 30%" },
    "berserk_charge":     { "cost": 0,  "cd": 8.0, "base_dmg": 80,  "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Dash + Yere Serme" },
    "bone_breaker":       { "cost": 25, "cd": 18.0, "base_dmg": 150, "scale_stat": "STR", "scale_ratio": 1.60, "is_damage": true, "is_heal": false, "effect": "Yüksek Burst + Zırh Kırma 25%" },
    "adrenal_surge":      { "cost": 0,  "cd": 30.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Buff_AtkSpeed" },
    "reckless_fury":      { "cost": 15, "cd": 15.0, "base_dmg": 60,  "scale_stat": "STR", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Döner Alan Hasarı" },

# --- ELEMENTALIST (2) - INT/FOC/WIS ---
    "fire_bolt":          { "cost": 12, "cd": 3.0, "base_dmg": 85,  "scale_stat": "INT", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "Burn DoT" },
    "frost_shard":        { "cost": 15, "cd": 4.0, "base_dmg": 70,  "scale_stat": "INT", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Slow 40%" },
    "lightning_arc":      { "cost": 20, "cd": 5.0, "base_dmg": 65,  "scale_stat": "INT", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "3 Hedefe Sıçrar" },
    "stone_spike":        { "cost": 25, "cd": 6.0, "base_dmg": 90,  "scale_stat": "INT", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Hat Üzeri AoE" },
    "flame_vortex":       { "cost": 30, "cd": 10.0, "base_dmg": 35,  "scale_stat": "INT", "scale_ratio": 0.40, "is_damage": true, "is_heal": false, "effect": "Yerde Ateş Alanı" },
    "ice_barrier":        { "cost": 35, "cd": 18.0, "base_dmg": 150, "scale_stat": "WIS", "scale_ratio": 1.20, "is_damage": false, "is_heal": false, "effect": "Kalkan" },
    "thunder_step":       { "cost": 40, "cd": 15.0, "base_dmg": 60,  "scale_stat": "INT", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Teleport + Hasar" },
    "meteor_fall":        { "cost": 60, "cd": 45.0, "base_dmg": 160, "scale_stat": "INT", "scale_ratio": 1.80, "is_damage": true, "is_heal": false, "effect": "Geniş AoE Burst" },
    "magma_burst":        { "cost": 45, "cd": 20.0, "base_dmg": 120, "scale_stat": "INT", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Noktasal Patlama" },
    "elemental_surge":    { "cost": 50, "cd": 60.0, "base_dmg": 0,  "scale_stat": "INT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Element Hasarını Artır" },

# --- MONK (3) - DEX/FOC/VIT ---
    "spirit_jab":         { "cost": 5,  "cd": 1.5, "base_dmg": 55,  "scale_stat": "DEX", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Hızlı Vuruş" },
    "palm_of_serenity":   { "cost": 10, "cd": 4.0, "base_dmg": 70,  "scale_stat": "DEX", "scale_ratio": 0.80, "is_damage": true, "is_heal": false, "effect": "Geri İtiş" },
    "chi_wave":           { "cost": 15, "cd": 5.0, "base_dmg": 60,  "scale_stat": "FOC", "scale_ratio": 0.90, "is_damage": true, "is_heal": true, "effect": "Hat Hasarı + Küçük Heal" }, 
    "fist_of_the_dawn":   { "cost": 20, "cd": 10.0, "base_dmg": 90,  "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Ağır Vuruş Bonusu" },
    "meditation":         { "cost": 0,  "cd": 30.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "HP/MP Kanal" },
    "iron_body":          { "cost": 25, "cd": 18.0, "base_dmg": 0,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Buff_PDef" },
    "cyclone_kick":       { "cost": 15, "cd": 6.0, "base_dmg": 65,  "scale_stat": "DEX", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "360 Derece AoE" },
    "spirit_step":        { "cost": 20, "cd": 12.0, "base_dmg": 40,  "scale_stat": "FOC", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "Gölge Adımı + Hasar" },
    "pressure_point":     { "cost": 10, "cd": 8.0, "base_dmg": 50,  "scale_stat": "DEX", "scale_ratio": 0.50, "is_damage": true, "is_heal": false, "effect": "Düşman Atk Düşürme" },
    "way_of_the_lotus":   { "cost": 30, "cd": 45.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Chi Tüketimi Bonusu" },

# --- CRUSADER (4) - VIT/STR/WIS ---
    "holy_strike":        { "cost": 10, "cd": 3.0, "base_dmg": 70,  "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Kutsal Hasar" },
    "shield_bash":        { "cost": 15, "cd": 6.0, "base_dmg": 55,  "scale_stat": "STR", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "Stun 0.8s" },
    "divine_guard":       { "cost": 25, "cd": 18.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "DMG Paylaşımı" },
    "purge_evil":         { "cost": 20, "cd": 10.0, "base_dmg": 40,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Negatif Etki Temizleme" }, 
    "radiant_slash":      { "cost": 15, "cd": 5.0, "base_dmg": 85,  "scale_stat": "STR", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "Yay Şeklinde AoE" },
    "sanctified_ground":  { "cost": 30, "cd": 15.0, "base_dmg": 20,  "scale_stat": "WIS", "scale_ratio": 0.40, "is_damage": false, "is_heal": true, "effect": "AoE Heal/Zayıflatma" },
    "vow_of_valor":       { "cost": 35, "cd": 25.0, "base_dmg": 0,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Buff_AtkDef" },
    "light_of_retribution":{ "cost": 0,  "cd": 60.0, "base_dmg": 120, "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": true, "is_heal": false, "effect": "Low HP Patlaması" },
    "hammer_of_conviction":{ "cost": 25, "cd": 18.0, "base_dmg": 140, "scale_stat": "STR", "scale_ratio": 1.50, "is_damage": true, "is_heal": false, "effect": "Zırh Kırma 25%" },
    "aegis_of_faith":     { "cost": 40, "cd": 45.0, "base_dmg": 0,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "DMG Reduce" },

# --- WARDEN (5) - DEX/STR/VIT ---
    "summon_companion":   { "cost": 40, "cd": 30.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Kurt/Ayı/Kartal Çağır" },
    "ferocity_strike":    { "cost": 10, "cd": 4.0, "base_dmg": 80,  "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Mini Stun" },
    "wild_pounce":        { "cost": 15, "cd": 8.0, "base_dmg": 75,  "scale_stat": "STR", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "Sıçrayış + Hasar" },
    "call_of_the_wild":   { "cost": 25, "cd": 20.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Pet Atk/Hız Buff" },
    "camouflage":         { "cost": 0,  "cd": 15.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Gizlilik + Crit Şansı" },
    "entangling_shot":    { "cost": 20, "cd": 10.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Alan Slow" },
    "beast_roar":         { "cost": 25, "cd": 15.0, "base_dmg": 0,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Düşman Def Düşürme + Pet Atk" },
    "twin_fang":          { "cost": 15, "cd": 6.0, "base_dmg": 60,  "scale_stat": "STR", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Warden + Pet Ortak Vuruş" },
    "guardian_of_the_forest":{ "cost": 50, "cd": 40.0, "base_dmg": 0,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Toprak Golemi Çağır" },
    "primal_focus":       { "cost": 30, "cd": 35.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Warden Atk + Pet Hasar Buff" },

# --- DRAGON KNIGHT (6) - VIT/STR/FOC ---
    "flame_strike":       { "cost": 15, "cd": 4.0, "base_dmg": 90,  "scale_stat": "STR", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Burn DoT" },
    "winged_leap":        { "cost": 25, "cd": 8.0, "base_dmg": 100, "scale_stat": "STR", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "AoE Zıplama" },
    "draconic_roar":      { "cost": 20, "cd": 12.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Stun 0.8s + Atk Düşürme" },
    "molten_guard":       { "cost": 30, "cd": 20.0, "base_dmg": 20,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": true, "is_heal": false, "effect": "DMG Reduce + Thorns" },
    "dragon_breath":      { "cost": 40, "cd": 15.0, "base_dmg": 135, "scale_stat": "STR", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Koni Şeklinde Hasar" },
    "flame_ward":         { "cost": 35, "cd": 18.0, "base_dmg": 0,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Ateş Duvarı" },
    "scale_slam":         { "cost": 10, "cd": 5.0, "base_dmg": 80,  "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Geri İtiş" },
    "infernal_charge":    { "cost": 25, "cd": 10.0, "base_dmg": 95,  "scale_stat": "STR", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Çizgisel Atak" },
    "ember_rebirth":      { "cost": 0,  "cd": 90.0, "base_dmg": 0,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Ölümü Atlama" },
    "heart_of_the_dragon":{ "cost": 50, "cd": 60.0, "base_dmg": 0,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Atk/Direnç Buff" },

# --- WARLOCK (7) - INT/FOC/WIS ---
    "dark_bolt":          { "cost": 15, "cd": 3.0, "base_dmg": 80,  "scale_stat": "INT", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "Temel Büyü Hasarı" },
    "curse_of_agony":     { "cost": 25, "cd": 8.0, "base_dmg": 140, "scale_stat": "INT", "scale_ratio": 1.50, "is_damage": true, "is_heal": false, "effect": "Artan DoT" },
    "soul_drain":         { "cost": 30, "cd": 10.0, "base_dmg": 45,  "scale_stat": "INT", "scale_ratio": 0.70, "is_damage": true, "is_heal": true, "effect": "Kanal + Can Emme" },
    "abyssal_grasp":      { "cost": 20, "cd": 6.0, "base_dmg": 50,  "scale_stat": "INT", "scale_ratio": 0.0,  "is_damage": true, "is_heal": false, "effect": "Root 1.2s" },
    "infernal_summon":    { "cost": 40, "cd": 25.0, "base_dmg": 25,  "scale_stat": "INT", "scale_ratio": 0.30, "is_damage": true, "is_heal": false, "effect": "İblis Çağır" },
    "shadow_veil":        { "cost": 0,  "cd": 18.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "DMG Reduce + Görünmezlik" },
    "hex_of_weakness":    { "cost": 20, "cd": 12.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Atk/Def Düşürme" },
    "hellfire_orb":       { "cost": 35, "cd": 15.0, "base_dmg": 120, "scale_stat": "INT", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Alan Patlaması" },
    "soul_rift":          { "cost": 45, "cd": 20.0, "base_dmg": 100, "scale_stat": "INT", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "Çekim Alanı + Patlama" },
    "demonic_ascension":  { "cost": 60, "cd": 70.0, "base_dmg": 0,  "scale_stat": "INT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Büyü Hasarı/Leech Buff" },

# --- CLERIC (8) - WIS/FOC/VIT ---
    "holy_light":         { "cost": 25, "cd": 4.0, "base_dmg": 100, "scale_stat": "WIS", "scale_ratio": 1.30, "is_damage": false, "is_heal": true, "effect": "Anlık Tek Hedef Heal" },
    "purify":             { "cost": 15, "cd": 6.0, "base_dmg": 40,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Negatif Etki Temizle + Kalkan" }, 
    "radiant_wave":       { "cost": 30, "cd": 8.0, "base_dmg": 70,  "scale_stat": "WIS", "scale_ratio": 0.90, "is_damage": false, "is_heal": true, "effect": "Yakın AoE Heal" },
    "sacred_bond":        { "cost": 35, "cd": 20.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.50, "is_damage": false, "is_heal": true, "effect": "DMG Paylaşımı + Self Heal" },
    "blessing_of_valor":  { "cost": 40, "cd": 30.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Buff_AtkDef" },
    "angelic_barrier":    { "cost": 45, "cd": 25.0, "base_dmg": 180, "scale_stat": "WIS", "scale_ratio": 1.40, "is_damage": false, "is_heal": false, "effect": "Kalkan" },
    "revive":             { "cost": 100, "cd": 120.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Ölü Diriltme" },
    "beacon_of_hope":     { "cost": 30, "cd": 18.0, "base_dmg": 30,  "scale_stat": "WIS", "scale_ratio": 0.50, "is_damage": false, "is_heal": true, "effect": "AoE HoT" },
    "hymn_of_serenity":   { "cost": 20, "cd": 15.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Takım MP Regen Buff" },
    "judgment_of_light":  { "cost": 25, "cd": 7.0, "base_dmg": 80,  "scale_stat": "INT", "scale_ratio": 0.0,  "is_damage": true, "is_heal": true, "effect": "Hasar + Yakın Heal" },

# --- BARD (9) - FOC/WIS/DEX ---
    "song_of_courage":    { "cost": 10, "cd": 5.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Buff_Atk" },
    "requiem_of_weakness":{ "cost": 15, "cd": 8.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Debuff_Atk" },
    "melody_of_healing":  { "cost": 20, "cd": 6.0, "base_dmg": 35,  "scale_stat": "WIS", "scale_ratio": 0.60, "is_damage": false, "is_heal": true, "effect": "AoE HoT" },
    "rhythm_of_agility":  { "cost": 15, "cd": 10.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Buff_AtkSpeed" },
    "dissonant_chord":    { "cost": 20, "cd": 8.0, "base_dmg": 60,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": true, "is_heal": false, "effect": "Cast Kesme + Hasar" },
    "resonant_shield":    { "cost": 30, "cd": 18.0, "base_dmg": 120, "scale_stat": "FOC", "scale_ratio": 1.20, "is_damage": false, "is_heal": false, "effect": "Takım Kalkanı" }, 
    "ballad_of_bravery":  { "cost": 0,  "cd": 25.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Buff_AtkDef" },
    "dirge_of_shadows":   { "cost": 25, "cd": 15.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Debuff_Crit" },
    "aria_of_restoration":{ "cost": 10, "cd": 5.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Takım MP Regen Buff" },
    "crescendo_finale":   { "cost": 50, "cd": 60.0, "base_dmg": 120, "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": true, "is_heal": false, "effect": "Final Vuruşu + Kalkan" },

# --- NECROMANCER (10) - INT/FOC/WIS ---
    "bone_spear":         { "cost": 20, "cd": 4.0, "base_dmg": 95,  "scale_stat": "INT", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Delici Hasar" },
    "soul_rot":           { "cost": 30, "cd": 8.0, "base_dmg": 160, "scale_stat": "INT", "scale_ratio": 1.70, "is_damage": true, "is_heal": false, "effect": "Yüksek DoT" },
    "raise_skeletons":    { "cost": 40, "cd": 25.0, "base_dmg": 0,  "scale_stat": "INT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Minion Çağır" },
    "death_coil":         { "cost": 25, "cd": 6.0, "base_dmg": 80,  "scale_stat": "INT", "scale_ratio": 1.00, "is_damage": true, "is_heal": true, "effect": "Kanal + Can Emme" }, 
    "bone_prison":        { "cost": 30, "cd": 15.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "2s Kafes" },
    "corpse_explosion":   { "cost": 35, "cd": 10.0, "base_dmg": 120, "scale_stat": "INT", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "AoE Ceset Patlaması" },
    "wraith_form":        { "cost": 0,  "cd": 18.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Temas Hasar Bağışıklığı" },
    "plague_field":       { "cost": 45, "cd": 15.0, "base_dmg": 140, "scale_stat": "INT", "scale_ratio": 1.50, "is_damage": true, "is_heal": false, "effect": "AoE DoT + Heal Reduce" },
    "summon_abomination": { "cost": 50, "cd": 40.0, "base_dmg": 100, "scale_stat": "INT", "scale_ratio": 1.20, "is_damage": false, "is_heal": false, "effect": "Tank Minion Çağır" }, 
    "ritual_of_sacrifice":{ "cost": 0,  "cd": 60.0, "base_dmg": 70,  "scale_stat": "INT", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Minionları Patlat + Self Buff" },

# --- RANGER (11) - DEX/FOC/VIT ---
    "power_shot":         { "cost": 15, "cd": 4.0, "base_dmg": 105, "scale_stat": "DEX", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "Zırh Delme 20%" },
    "multi_arrow":        { "cost": 10, "cd": 3.0, "base_dmg": 45,  "scale_stat": "DEX", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "3 Ok" },
    "explosive_trap":     { "cost": 25, "cd": 10.0, "base_dmg": 120, "scale_stat": "DEX", "scale_ratio": 1.30, "is_damage": true, "is_heal": false, "effect": "Trap AoE + Burn" },
    "poison_arrow":       { "cost": 15, "cd": 5.0, "base_dmg": 90,  "scale_stat": "DEX", "scale_ratio": 0.80, "is_damage": true, "is_heal": false, "effect": "DoT" },
    "evasive_roll":       { "cost": 0,  "cd": 6.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Kaçınma + DMG Bağışıklığı" },
    "falcon_mark":        { "cost": 30, "cd": 15.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Hedef İşaretle + DMG Artışı" },
    "windstep":           { "cost": 20, "cd": 10.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Hareket/Atk Speed Buff" },
    "piercing_volley":    { "cost": 25, "cd": 8.0, "base_dmg": 70,  "scale_stat": "DEX", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "3 Ardışık Delici Ok" },
    "camuflage":         { "cost": 0,  "cd": 20.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Gizlilik + Crit Şansı" },
    "arrow_storm":        { "cost": 40, "cd": 30.0, "base_dmg": 40,  "scale_stat": "DEX", "scale_ratio": 0.50, "is_damage": true, "is_heal": false, "effect": "Geniş AoE Ok Yağmuru" },
}

# --- YETENEK COOLDOWN YÖNETİMİ ---
var active_cooldowns: Dictionary = {}

# --- SİNYALLER ---
signal health_updated(current_hp, max_hp)
signal experience_updated(current_xp, max_xp)
signal level_updated(new_level)
signal mana_updated(current_mp, max_mp)
signal stats_updated(stats_payload) 
# KRİTİK DÜZELTME: Sinyal tanımı 5 argüman alacak şekilde güncellendi
signal skill_executed(skill_id, value, is_heal, effect, target_or_position) 

# --- STATLAR (Aynı) ---
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

var class_id: int = 0 

# --- YENİ DOT/HOT/BUFF SİSTEMİ ---
var active_statuses: Dictionary = {} # DoT, HoT ve Buff/Debuff'ları tutar

func _process(delta):
    # Cooldown'ları yönet
    var keys_to_remove = []
    for skill_id in active_cooldowns.keys():
        active_cooldowns[skill_id] -= delta
        if active_cooldowns[skill_id] <= 0:
            keys_to_remove.append(skill_id)

    for skill_id in keys_to_remove:
        active_cooldowns.erase(skill_id)
        
    _tick_statuses(delta) # Player'ın HoT/DoT ve Buff/Debuff'larını işle

# YENİ FONKSİYON: Player'ın HoT/DoT ve Buff/Debuff'larını Uygular
func _tick_statuses(delta):
    var keys_to_remove = []
    var needs_recalc = false
    
    for skill_id in active_statuses.keys():
        var status = active_statuses[skill_id]
        status.time_left -= delta
        
        # DoT/HoT ise tick'leri uygula
        if status.has("is_dot_hot"):
            status.next_tick -= delta
            if status.next_tick <= 0.0:
                var value = int(round(status.value_per_tick))
                
                # KRİTİK DÜZELTME: Player.gd'deki fonksiyonları çağır
                if status.is_heal:
                    call("heal", value, Color.GREEN) # player.gd'ye
                else:
                    # KRİTİK DÜZELTME: Color.from_html hatası giderildi (GDScript uyumlu renk kodu)
                    call("take_damage", value, Color("#9900CC"), null) # player.gd'ye (attacker = null)
                
                status.next_tick = status.tick_rate
        
        # Süresi biteni kaldır
        if status.time_left <= 0.0:
            keys_to_remove.append(skill_id)
            if status.has("is_buff"): # Eğer bir buff/debuff ise statları yeniden hesapla
                needs_recalc = true

    for skill_id in keys_to_remove:
        active_statuses.erase(skill_id)
        
    if needs_recalc:
        recalculate_derived_stats()
        print("Buff sona erdi, statlar yeniden hesaplandı.")
        
# YENİ FONKSİYON: HoT/DoT etkisini Player'a uygulamak için
func apply_status_effect(skill_id: String, total_value: float, duration: float, tick_rate: float, is_heal: bool):
    if not is_instance_valid(self): return # Obje silinmişse devam etme
    
    var num_ticks = ceil(duration / tick_rate)
    if num_ticks == 0: num_ticks = 1
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
func apply_buff_debuff(skill_id: String, duration: float, effect_type: String):
    if not is_instance_valid(self): return

    var buff_value = 0
    if SKILL_DATABASE.has(skill_id):
        buff_value = SKILL_DATABASE[skill_id].base_dmg

    active_statuses[skill_id] = {
        "is_buff": true,
        "time_left": duration,
        "effect_type": effect_type, # Örn: "Buff_Atk", "Thorns"
        "value": buff_value # Thorns hasarı gibi değerleri sakla
    }
    recalculate_derived_stats() # Statları hemen uygula
    print("PLAYER BUFF BAŞLATILDI: ", skill_id)
    

func _ready():
    # Godot'ta PlayerData singleton'unun var olduğunu varsayıyorum
    if has_node("/root/PlayerData"):
        class_id = get_node("/root/PlayerData").character_class_id
    recalculate_derived_stats()
    set_health(computed_max_health)
    set_mana(computed_max_mana)
    add_to_group("player_character") 
    emit_full_stat_update()

# --- GÜVENLİ GÜNCELLEME FONKSİYONLARI (SETTERS) ---

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
    
# --- STAT SİSTEMİ ÇEKİRDEĞİ ---

func add_experience(amount: int):
    set_experience(experience + amount)
    print("Tecrübe Kazanıldı: ", amount, ". Toplam XP: ", experience, " / ", experience_to_next_level)
    
    while experience >= experience_to_next_level:
        var remaining_xp = experience - experience_to_next_level
        set_experience(remaining_xp)
        level_up() 

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
    emit_full_stat_update() 

func recalculate_derived_stats():
    var old_max_hp = computed_max_health
    var old_max_mp = computed_max_mana
    
    # --- Google Doc Formüllerini Uygula (BÖLÜM 2) ---
    computed_max_health = int( (base_health + (hp_per_level * (level - 1))) + (vit * 18) + (str * 4) )
    computed_max_mana = int( (base_mana + (mp_per_level * (level - 1))) + (foc * 15) + (intel * 5) )
    
    # Physical Attack Power (PAP)
    match class_id: 
        1, 4, 6, 5: computed_physical_attack_power = str
        11, 3: computed_physical_attack_power = dex
        _: computed_physical_attack_power = str 
    
    # Magical Attack Power (MAP)
    computed_magical_attack_power = intel
    
    # Healing Power (HealP)
    computed_healing_power = wis
    
    # --- Diğer formüller (float kullanarak) ---
    var pdef_rating = (vit * 1.0) + (str * 0.2)
    var mdef_rating = (wis * 1.0) + (intel * 0.2)
    
    computed_pdef_percent = clampi(pdef_rating * 0.03, 0.0, 75.0)
    computed_mdef_percent = clampi(mdef_rating * 0.03, 0.0, 75.0)
    
    computed_evasion = dex * 0.08
    computed_aspd_bonus = dex * 0.2
    computed_cspd_bonus = foc * 0.2
    computed_pcrit_chance = 5.0 + (dex * 0.1)
    computed_mcrit_chance = 5.0 + (foc * 0.1)
    computed_hp_regen = 5.0 + (vit * 0.5)
    computed_mp_regen = 5.0 + (wis * 0.7)
    computed_debuff_resist = wis * 0.1
    computed_debuff_success = foc * 0.1

    # --- YENİ BUFF/DEBUFF UYGULAMA MANTIĞI ---
    # Statlar hesaplandıktan sonra, aktif buff'ları uygula
    for skill_id in active_statuses:
        var status = active_statuses[skill_id]
        if status.has("is_buff"):
            match status.effect_type:
                "Buff_Atk":
                    # (Örnek: %20 saldırı gücü artışı)
                    computed_physical_attack_power *= 1.2 
                    print("Buff_Atk Aktif!")
                "Buff_PDef":
                    computed_pdef_percent += 15.0 # (Örnek: +%15 PDef)
                    print("IronBody Aktif!")
                "Buff_AtkSpeed":
                    computed_aspd_bonus += 20.0 # (Örnek: +%20 Atk Hızı)
                    print("AdrenalSurge Aktif!")
                # ... Diğer buff'lar buraya eklenebilir ...

    # -----------------------------------

    if computed_max_health > old_max_hp:
        set_health(current_health + (computed_max_health - old_max_hp))
    else:
        set_health(current_health) 
        
    if computed_max_mana > old_max_mp:
        set_mana(current_mana + (computed_max_mana - old_max_mp))
    else:
        set_mana(current_mana)

func level_up():
    set_level(level + 1)
    
    manual_points_available += 5
    print("SEVİYE ATLADIN! Harcanabilir 5 puan kazandın!")
    
    # --- Sınıf Bazlı Otomatik Stat Dağıtımı ---
    match class_id:
        0: # Druid (Hibrit)
            intel += 1; wis += 1; foc += 1; vit += 1
        
        1: # Berserker (Uzman)
            str += 2; vit += 1
            if level % 2 == 1: 
                wis += 1 
            else: 
                dex += 1
        
        2: # Elementalist (Uzman)
            intel += 2; foc += 1
            if level % 2 == 1: 
                wis += 1 
            else: 
                vit += 1
        
        3: # Monk (Hibrit)
            dex += 1; vit += 1; foc += 1; wis += 1
        
        4: # Crusader (Uzman)
            vit += 2; wis += 1
            if level % 2 == 1: 
                foc += 1 
            else: 
                str += 1
        
        5: # Warden (Hibrit)
            str += 1; dex += 1; vit += 1; foc += 1
        
        6: # Dragon Knight (Uzman)
            vit += 2; str += 1
            if level % 2 == 1: 
                wis += 1 
            else: 
                foc += 1
        
        7: # Warlock (Uzman)
            intel += 2; foc += 1
            if level % 2 == 1: 
                wis += 1 
            else: 
                vit += 1
        
        8: # Cleric (Uzman)
            wis += 2; vit += 1
            if level % 2 == 1: 
                intel += 1 
            else: 
                foc += 1
        
        9: # Bard (Uzman)
            foc += 2; wis += 1
            if level % 2 == 1: 
                dex += 1 
            else: 
                vit += 1
        
        10: # Necromancer (Uzman)
            intel += 2; foc += 1
            if level % 2 == 1: 
                wis += 1 
            else: 
                vit += 1
        
        11: # Ranger (Uzman)
            dex += 2; vit += 1
            if level % 2 == 1: 
                str += 1 
            else: 
                foc += 1
        
        _: 
            print("HATA: Seviye atlama için class_id tanınmıyor!")

    set_experience_to_next_level(int(experience_to_next_level * 1.5))
    recalculate_derived_stats()
    set_health(computed_max_health)
    set_mana(computed_max_mana)
    emit_full_stat_update()

func emit_full_stat_update():
    var stats_payload = {
        "level": level,
        "hp": current_health, "max_hp": computed_max_health,
        "mp": current_mana, "max_mp": computed_max_mana,
        "xp": experience, "max_xp": experience_to_next_level,
        "points_available": manual_points_available,
        "str": str, "dex": dex, "vit": vit, "int": intel, "wis": wis, "foc": foc,
        
        # --- YAN STATLAR ---
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
        "debuff_success": computed_debuff_success
    }
    stats_updated.emit(stats_payload)
    
# --- YETENEK KONTROL VE KULLANIM FONKSİYONLARI ---

# Yetenek kullanılabilir mi kontrolü
func can_cast_skill(skill_id: String) -> bool:
    var skill_data = SKILL_DATABASE.get(skill_id)
    
    if skill_data == null:
        print("HATA: Bilinmeyen Yetenek ID'si: ", skill_id)
        return false

    # Cooldown kontrolü
    if active_cooldowns.has(skill_id):
        return false
        
    # Mana kontrolü (DÜZELTME: Sizin kodunuzdaki mp_cost hatası düzeltildi)
    if current_mana < skill_data.cost:
        return false
        
    return true

# Yeteneği kullan ve cooldown'u başlat
func start_skill_cooldown(skill_id: String):
    var skill_data = SKILL_DATABASE.get(skill_id)
    if skill_data != null:
        # 1. Manayı düş (mp_cost -> cost)
        set_mana(current_mana - skill_data.cost)
        
        # 2. Cooldown'ı başlat
        active_cooldowns[skill_id] = skill_data.cd
        
# --- YENİ EKLENEN YETENEK ETKİSİ MANTIĞI ---

# İstenen temel stat değerini döndürür
func _get_stat_value(stat_name: String) -> float:
    match stat_name:
        "STR": return float(str)
        "DEX": return float(dex)
        "VIT": return float(vit)
        "INT": return float(intel)
        "WIS": return float(wis)
        "FOC": return float(foc)
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

    # Nihai Formül: base_dmg + (Stat * Scale_Ratio)
    var final_value = base_value + (scaling_value * scale_ratio)
         
    return final_value

# Yeteneğin oyun içi etkisini tetikler ve hasar/iyileştirme sinyalini gönderir
func execute_skill(skill_id: String, target_or_position = null):
    var skill_data = SKILL_DATABASE.get(skill_id)
    
    if skill_data == null:
        print("HATA: Yetenek ID'si SKILL_DATABASE'de bulunamadı: ", skill_id)
        return
        
    if not can_cast_skill(skill_id):
        # YETENEK KULLANILAMAMA SEBEBİ LOGU (MANA/CD KONTROLÜ)
        if active_cooldowns.has(skill_id):
            print("YETENEK KULLANILAMADI: %s - Cooldown'da (Kalan: %.1fs)" % [skill_id, active_cooldowns[skill_id]])
        elif current_mana < skill_data.cost:
            print("YETENEK KULLANILAMADI: %s - Yetersiz Mana (%d / %d Gerekli)" % [skill_id, current_mana, skill_data.cost])
        return

    start_skill_cooldown(skill_id)
    
    var computed_value: float = _calculate_skill_value(skill_id)
    var is_heal: bool = skill_data.is_heal if "is_heal" in skill_data else false
    var effect_desc: String = skill_data.effect
    
    # Self-targeted (Kendine uygulanan) HoT/Buff skilleri
    var SELF_TARGET_EFFECTS = [
        "rejuvenate", "spirit_link", "sacred_bond", "death_coil", # Self HoT
        "bloodletting", "adrenal_surge", "iron_body", # Self Buff
        "thorn_armor", "aegis_of_faith" 
    ]

    # --- SİNYAL GÖNDERİMİ (5 ARGÜMANLI) ---
    if SELF_TARGET_EFFECTS.has(skill_id):
        # Eğer bu bir HoT veya Self-Buff ise, hedef olarak 'self'i (yani PlayerBase'in kendisini) gönder.
        skill_executed.emit(skill_id, computed_value, is_heal, effect_desc, self)
    else:
        # Diğer tüm skiller (Düşman hedefli Hasar, DoT, Debuff, AoE)
        skill_executed.emit(skill_id, computed_value, is_heal, effect_desc, target_or_position)

    print("YETENEK ÇAĞRISI GÖNDERİLDİ: ", skill_id, " (Değer: ", computed_value, ", Etki: ", effect_desc, ")")
