extends CharacterBody2D

# --- YETENEK VERİTABANI (TÜM 12 SINIFIN AKTİF YETENEKLERİ) ---
# ... (SKILL_DATABASE içeriği değişmedi) ...
const SKILL_DATABASE = {
# --- DRUID (0) - INT/WIS/FOC ---
    "VineWhip":          { "cost": 15, "cd": 4.0, "base_dmg": 65,  "scale_stat": "INT", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "Slow 40%" },
    "Rejuvenate":        { "cost": 20, "cd": 8.0, "base_dmg": 30,  "scale_stat": "WIS", "scale_ratio": 0.50, "is_damage": false, "is_heal": true, "effect": "HoT" },
    "EntangleRoots":     { "cost": 25, "cd": 12.0, "base_dmg": 20,  "scale_stat": "INT", "scale_ratio": 0.30, "is_damage": true, "is_heal": false, "effect": "Root 1.5s + DoT" },
    "PoisonSpores":      { "cost": 30, "cd": 15.0, "base_dmg": 22,  "scale_stat": "INT", "scale_ratio": 0.35, "is_damage": true, "is_heal": false, "effect": "AoE DoT + Heal Reduce" },
    "SpiritLink":        { "cost": 40, "cd": 30.0, "base_dmg": 0,   "scale_stat": "WIS", "scale_ratio": 0.30, "is_damage": false, "is_heal": true, "effect": "Damage Share + Self Heal" },
    "ThornArmor":        { "cost": 25, "cd": 20.0, "base_dmg": 18,  "scale_stat": "INT", "scale_ratio": 0.25, "is_damage": true, "is_heal": false, "effect": "Damage Reduce + Thorns" },
    "SeedShot":          { "cost": 10, "cd": 2.0, "base_dmg": 45,  "scale_stat": "INT", "scale_ratio": 0.50, "is_damage": true, "is_heal": false, "effect": "Mini Patlama" },
    "BloomField":        { "cost": 35, "cd": 18.0, "base_dmg": 28,  "scale_stat": "WIS", "scale_ratio": 0.45, "is_damage": false, "is_heal": true, "effect": "AoE HoT + Slow" },
    "RotPulse":          { "cost": 45, "cd": 25.0, "base_dmg": 90,  "scale_stat": "INT", "scale_ratio": 0.80, "is_damage": true, "is_heal": false, "effect": "AoE DoT + Atk Reduce" },
    "NaturesGrasp":      { "cost": 30, "cd": 15.0, "base_dmg": 40,  "scale_stat": "INT", "scale_ratio": 0.40, "is_damage": true, "is_heal": false, "effect": "Dash + Root 1s" },
    
# --- BERSERKER (1) - STR/VIT/DEX ---
    "RageSlash":         { "cost": 0,  "cd": 4.0, "base_dmg": 110, "scale_stat": "STR", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Yüksek Hasar" },
    "FrenziedCombo":     { "cost": 10, "cd": 6.0, "base_dmg": 55,  "scale_stat": "STR", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "3 Vuruş + Stun Şansı" },
    "WarCry":            { "cost": 0,  "cd": 15.0, "base_dmg": 0,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Takım Atk/Def Kırma" },
    "Bloodletting":      { "cost": 0,  "cd": 25.0, "base_dmg": 0,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "HP Feda + Atk Artışı" },
    "EarthSplitter":     { "cost": 15, "cd": 10.0, "base_dmg": 95,  "scale_stat": "STR", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "AoE + Zayıf Sersemletme" },
    "UnyieldingStrike":  { "cost": 20, "cd": 12.0, "base_dmg": 95,  "scale_stat": "STR", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "Zırh Delme 30%" },
    "BerserkCharge":     { "cost": 0,  "cd": 8.0, "base_dmg": 80,  "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Dash + Yere Serme" },
    "BoneBreaker":       { "cost": 25, "cd": 18.0, "base_dmg": 150, "scale_stat": "STR", "scale_ratio": 1.60, "is_damage": true, "is_heal": false, "effect": "Yüksek Burst + Zırh Kırma 25%" },
    "AdrenalSurge":      { "cost": 0,  "cd": 30.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Atk Speed/Hareket" },
    "RecklessFury":      { "cost": 15, "cd": 15.0, "base_dmg": 60,  "scale_stat": "STR", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Döner Alan Hasarı" },

# --- ELEMENTALIST (2) - INT/FOC/WIS ---
    "FireBolt":          { "cost": 12, "cd": 3.0, "base_dmg": 85,  "scale_stat": "INT", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "Burn DoT" },
    "FrostShard":        { "cost": 15, "cd": 4.0, "base_dmg": 70,  "scale_stat": "INT", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Slow 40%" },
    "LightningArc":      { "cost": 20, "cd": 5.0, "base_dmg": 65,  "scale_stat": "INT", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "3 Hedefe Sıçrar" },
    "StoneSpike":        { "cost": 25, "cd": 6.0, "base_dmg": 90,  "scale_stat": "INT", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Hat Üzeri AoE" },
    "FlameVortex":       { "cost": 30, "cd": 10.0, "base_dmg": 35,  "scale_stat": "INT", "scale_ratio": 0.40, "is_damage": true, "is_heal": false, "effect": "Yerde Ateş Alanı" },
    "IceBarrier":        { "cost": 35, "cd": 18.0, "base_dmg": 150, "scale_stat": "WIS", "scale_ratio": 1.20, "is_damage": false, "is_heal": false, "effect": "Kalkan" },
    "ThunderStep":       { "cost": 40, "cd": 15.0, "base_dmg": 60,  "scale_stat": "INT", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Teleport + Hasar" },
    "MeteorFall":        { "cost": 60, "cd": 45.0, "base_dmg": 160, "scale_stat": "INT", "scale_ratio": 1.80, "is_damage": true, "is_heal": false, "effect": "Geniş AoE Burst" },
    "MagmaBurst":        { "cost": 45, "cd": 20.0, "base_dmg": 120, "scale_stat": "INT", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Noktasal Patlama" },
    "ElementalSurge":    { "cost": 50, "cd": 60.0, "base_dmg": 0,  "scale_stat": "INT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Element Hasarını Artır" },

# --- MONK (3) - DEX/FOC/VIT ---
    "SpiritJab":         { "cost": 5,  "cd": 1.5, "base_dmg": 55,  "scale_stat": "DEX", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Hızlı Vuruş" },
    "PalmOfSerenity":    { "cost": 10, "cd": 4.0, "base_dmg": 70,  "scale_stat": "DEX", "scale_ratio": 0.80, "is_damage": true, "is_heal": false, "effect": "Geri İtiş" },
    "ChiWave":           { "cost": 15, "cd": 5.0, "base_dmg": 60,  "scale_stat": "FOC", "scale_ratio": 0.90, "is_damage": true, "is_heal": true, "effect": "Hat Hasarı + Küçük Heal" }, 
    "FistOfTheDawn":     { "cost": 20, "cd": 10.0, "base_dmg": 90,  "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Ağır Vuruş Bonusu" },
    "Meditation":        { "cost": 0,  "cd": 30.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "HP/MP Kanal" },
    "IronBody":          { "cost": 25, "cd": 18.0, "base_dmg": 0,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Fiziksel DMG Reduce" },
    "CycloneKick":       { "cost": 15, "cd": 6.0, "base_dmg": 65,  "scale_stat": "DEX", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "360 Derece AoE" },
    "SpiritStep":        { "cost": 20, "cd": 12.0, "base_dmg": 40,  "scale_stat": "FOC", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "Gölge Adımı + Hasar" },
    "PressurePoint":     { "cost": 10, "cd": 8.0, "base_dmg": 50,  "scale_stat": "DEX", "scale_ratio": 0.50, "is_damage": true, "is_heal": false, "effect": "Düşman Atk Düşürme" },
    "WayOfTheLotus":     { "cost": 30, "cd": 45.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Chi Tüketimi Bonusu" },

# --- CRUSADER (4) - VIT/STR/WIS ---
    "HolyStrike":        { "cost": 10, "cd": 3.0, "base_dmg": 70,  "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Kutsal Hasar" },
    "ShieldBash":        { "cost": 15, "cd": 6.0, "base_dmg": 55,  "scale_stat": "STR", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "Stun 0.8s" },
    "DivineGuard":       { "cost": 25, "cd": 18.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "DMG Paylaşımı" },
    "PurgeEvil":         { "cost": 20, "cd": 10.0, "base_dmg": 40,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Negatif Etki Temizleme" }, 
    "RadiantSlash":      { "cost": 15, "cd": 5.0, "base_dmg": 85,  "scale_stat": "STR", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "Yay Şeklinde AoE" },
    "SanctifiedGround":  { "cost": 30, "cd": 15.0, "base_dmg": 20,  "scale_stat": "WIS", "scale_ratio": 0.40, "is_damage": false, "is_heal": true, "effect": "AoE Heal/Zayıflatma" },
    "VowOfValor":        { "cost": 35, "cd": 25.0, "base_dmg": 0,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Takım Def/Atk Buff" },
    "LightOfRetribution":{ "cost": 0,  "cd": 60.0, "base_dmg": 120, "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": true, "is_heal": false, "effect": "Low HP Patlaması" },
    "HammerOfConviction":{ "cost": 25, "cd": 18.0, "base_dmg": 140, "scale_stat": "STR", "scale_ratio": 1.50, "is_damage": true, "is_heal": false, "effect": "Zırh Kırma 25%" },
    "AegisOfFaith":      { "cost": 40, "cd": 45.0, "base_dmg": 0,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Tüm Hasar Azaltımı" },

# --- WARDEN (5) - DEX/STR/VIT ---
    "SummonCompanion":   { "cost": 40, "cd": 30.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Kurt/Ayı/Kartal Çağır" },
    "FerocityStrike":    { "cost": 10, "cd": 4.0, "base_dmg": 80,  "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Mini Stun" },
    "WildPounce":        { "cost": 15, "cd": 8.0, "base_dmg": 75,  "scale_stat": "STR", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "Sıçrayış + Hasar" },
    "CallOfTheWild":     { "cost": 25, "cd": 20.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Pet Atk/Hız Buff" },
    "Camuflage":        { "cost": 0,  "cd": 15.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Gizlilik + Crit Şansı" },
    "EntanglingShot":    { "cost": 20, "cd": 10.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Alan Slow" },
    "BeastRoar":         { "cost": 25, "cd": 15.0, "base_dmg": 0,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Düşman Def Düşürme + Pet Atk" },
    "TwinFang":          { "cost": 15, "cd": 6.0, "base_dmg": 60,  "scale_stat": "STR", "scale_ratio": 0.70, "is_damage": true, "is_heal": false, "effect": "Warden + Pet Ortak Vuruş" },
    "GuardianOfTheForest":{ "cost": 50, "cd": 40.0, "base_dmg": 0,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Toprak Golemi Çağır" },
    "PrimalFocus":       { "cost": 30, "cd": 35.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Warden Atk + Pet Hasar Buff" },

# --- DRAGON KNIGHT (6) - VIT/STR/FOC ---
    "FlameStrike":       { "cost": 15, "cd": 4.0, "base_dmg": 90,  "scale_stat": "STR", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Burn DoT" },
    "WingedLeap":        { "cost": 25, "cd": 8.0, "base_dmg": 100, "scale_stat": "STR", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "AoE Zıplama" },
    "DraconicRoar":      { "cost": 20, "cd": 12.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Stun 0.8s + Atk Düşürme" },
    "MoltenGuard":       { "cost": 30, "cd": 20.0, "base_dmg": 20,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": true, "is_heal": false, "effect": "DMG Reduce + Thorns" },
    "DragonBreath":      { "cost": 40, "cd": 15.0, "base_dmg": 135, "scale_stat": "STR", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Koni Şeklinde Hasar" },
    "FlameWard":         { "cost": 35, "cd": 18.0, "base_dmg": 0,  "scale_stat": "STR", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Ateş Duvarı" },
    "ScaleSlam":         { "cost": 10, "cd": 5.0, "base_dmg": 80,  "scale_stat": "STR", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Geri İtiş" },
    "InfernalCharge":    { "cost": 25, "cd": 10.0, "base_dmg": 95,  "scale_stat": "STR", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Çizgisel Atak" },
    "EmberRebirth":      { "cost": 0,  "cd": 90.0, "base_dmg": 0,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Ölümü Atlama" },
    "HeartOfTheDragon":  { "cost": 50, "cd": 60.0, "base_dmg": 0,  "scale_stat": "VIT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Atk/Direnç Buff" },

# --- WARLOCK (7) - INT/FOC/WIS ---
    "DarkBolt":          { "cost": 15, "cd": 3.0, "base_dmg": 80,  "scale_stat": "INT", "scale_ratio": 1.00, "is_damage": true, "is_heal": false, "effect": "Temel Büyü Hasarı" },
    "CurseOfAgony":      { "cost": 25, "cd": 8.0, "base_dmg": 140, "scale_stat": "INT", "scale_ratio": 1.50, "is_damage": true, "is_heal": false, "effect": "Artan DoT" },
    "SoulDrain":         { "cost": 30, "cd": 10.0, "base_dmg": 45,  "scale_stat": "INT", "scale_ratio": 0.70, "is_damage": true, "is_heal": true, "effect": "Kanal + Can Emme" },
    "AbyssalGrasp":      { "cost": 20, "cd": 6.0, "base_dmg": 50,  "scale_stat": "INT", "scale_ratio": 0.0,  "is_damage": true, "is_heal": false, "effect": "Root 1.2s" },
    "InfernalSummon":    { "cost": 40, "cd": 25.0, "base_dmg": 25,  "scale_stat": "INT", "scale_ratio": 0.30, "is_damage": true, "is_heal": false, "effect": "İblis Çağır" },
    "ShadowVeil":        { "cost": 0,  "cd": 18.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "DMG Reduce + Görünmezlik" },
    "HexOfWeakness":     { "cost": 20, "cd": 12.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Atk/Def Düşürme" },
    "HellfireOrb":       { "cost": 35, "cd": 15.0, "base_dmg": 120, "scale_stat": "INT", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "Alan Patlaması" },
    "SoulRift":          { "cost": 45, "cd": 20.0, "base_dmg": 100, "scale_stat": "INT", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "Çekim Alanı + Patlama" },
    "DemonicAscension":  { "cost": 60, "cd": 70.0, "base_dmg": 0,  "scale_stat": "INT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Büyü Hasarı/Leech Buff" },

# --- CLERIC (8) - WIS/FOC/VIT ---
    "HolyLight":         { "cost": 25, "cd": 4.0, "base_dmg": 100, "scale_stat": "WIS", "scale_ratio": 1.30, "is_damage": false, "is_heal": true, "effect": "Anlık Tek Hedef Heal" },
    "Purify":            { "cost": 15, "cd": 6.0, "base_dmg": 40,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Negatif Etki Temizle + Kalkan" }, 
    "RadiantWave":       { "cost": 30, "cd": 8.0, "base_dmg": 70,  "scale_stat": "WIS", "scale_ratio": 0.90, "is_damage": false, "is_heal": true, "effect": "Yakın AoE Heal" },
    "SacredBond":        { "cost": 35, "cd": 20.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.50, "is_damage": false, "is_heal": true, "effect": "DMG Paylaşımı + Self Heal" },
    "BlessingOfValor":   { "cost": 40, "cd": 30.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Takım Atk/Direnç Buff" },
    "AngelicBarrier":    { "cost": 45, "cd": 25.0, "base_dmg": 180, "scale_stat": "WIS", "scale_ratio": 1.40, "is_damage": false, "is_heal": false, "effect": "Kalkan" },
    "Revive":            { "cost": 100, "cd": 120.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Ölü Diriltme" },
    "BeaconOfHope":      { "cost": 30, "cd": 18.0, "base_dmg": 30,  "scale_stat": "WIS", "scale_ratio": 0.50, "is_damage": false, "is_heal": true, "effect": "AoE HoT" },
    "HymnOfSerenity":    { "cost": 20, "cd": 15.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Takım MP Regen Buff" },
    "JudgmentOfLight":   { "cost": 25, "cd": 7.0, "base_dmg": 80,  "scale_stat": "INT", "scale_ratio": 0.0,  "is_damage": true, "is_heal": true, "effect": "Hasar + Yakın Heal" },

# --- BARD (9) - FOC/WIS/DEX ---
    "SongOfCourage":     { "cost": 10, "cd": 5.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Takım Atk Buff" },
    "RequiemOfWeakness": { "cost": 15, "cd": 8.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Düşman Hasar Düşürme" },
    "MelodyOfHealing":   { "cost": 20, "cd": 6.0, "base_dmg": 35,  "scale_stat": "WIS", "scale_ratio": 0.60, "is_damage": false, "is_heal": true, "effect": "AoE HoT" },
    "RhythmOfAgility":   { "cost": 15, "cd": 10.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Takım Hareket/Dodge Buff" },
    "DissonantChord":    { "cost": 20, "cd": 8.0, "base_dmg": 60,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": true, "is_heal": false, "effect": "Cast Kesme + Hasar" },
    "ResonantShield":    { "cost": 30, "cd": 18.0, "base_dmg": 120, "scale_stat": "FOC", "scale_ratio": 1.20, "is_damage": false, "is_heal": false, "effect": "Takım Kalkanı" }, 
    "BalladOfBravery":   { "cost": 0,  "cd": 25.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Atk/Def Stack Buff" },
    "DirgeOfShadows":    { "cost": 25, "cd": 15.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Düşman Crit Şansı Düşürme" },
    "AriaOfRestoration": { "cost": 10, "cd": 5.0, "base_dmg": 0,  "scale_stat": "WIS", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Takım MP Regen Buff" },
    "CrescendoFinale":   { "cost": 50, "cd": 60.0, "base_dmg": 120, "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": true, "is_heal": false, "effect": "Final Vuruşu + Kalkan" },

# --- NECROMANCER (10) - INT/FOC/WIS ---
    "BoneSpear":         { "cost": 20, "cd": 4.0, "base_dmg": 95,  "scale_stat": "INT", "scale_ratio": 1.10, "is_damage": true, "is_heal": false, "effect": "Delici Hasar" },
    "SoulRot":           { "cost": 30, "cd": 8.0, "base_dmg": 160, "scale_stat": "INT", "scale_ratio": 1.70, "is_damage": true, "is_heal": false, "effect": "Yüksek DoT" },
    "RaiseSkeletons":    { "cost": 40, "cd": 25.0, "base_dmg": 0,  "scale_stat": "INT", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Minion Çağır" },
    "DeathCoil":         { "cost": 25, "cd": 6.0, "base_dmg": 80,  "scale_stat": "INT", "scale_ratio": 1.00, "is_damage": true, "is_heal": true, "effect": "Kanal + Can Emme" }, 
    "BonePrison":        { "cost": 30, "cd": 15.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "2s Kafes" },
    "CorpseExplosion":   { "cost": 35, "cd": 10.0, "base_dmg": 120, "scale_stat": "INT", "scale_ratio": 1.40, "is_damage": true, "is_heal": false, "effect": "AoE Ceset Patlaması" },
    "WraithForm":        { "cost": 0,  "cd": 18.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Temas Hasar Bağışıklığı" },
    "PlagueField":       { "cost": 45, "cd": 15.0, "base_dmg": 140, "scale_stat": "INT", "scale_ratio": 1.50, "is_damage": true, "is_heal": false, "effect": "AoE DoT + Heal Reduce" },
    "SummonAbomination": { "cost": 50, "cd": 40.0, "base_dmg": 100, "scale_stat": "INT", "scale_ratio": 1.20, "is_damage": false, "is_heal": false, "effect": "Tank Minion Çağır" }, 
    "RitualOfSacrifice": { "cost": 0,  "cd": 60.0, "base_dmg": 70,  "scale_stat": "INT", "scale_ratio": 0.90, "is_damage": true, "is_heal": false, "effect": "Minionları Patlat + Self Buff" },

# --- RANGER (11) - DEX/FOC/VIT ---
    "PowerShot":         { "cost": 15, "cd": 4.0, "base_dmg": 105, "scale_stat": "DEX", "scale_ratio": 1.20, "is_damage": true, "is_heal": false, "effect": "Zırh Delme 20%" },
    "MultiArrow":        { "cost": 10, "cd": 3.0, "base_dmg": 45,  "scale_stat": "DEX", "scale_ratio": 0.60, "is_damage": true, "is_heal": false, "effect": "3 Ok" },
    "ExplosiveTrap":     { "cost": 25, "cd": 10.0, "base_dmg": 120, "scale_stat": "DEX", "scale_ratio": 1.30, "is_damage": true, "is_heal": false, "effect": "Trap AoE + Burn" },
    "PoisonArrow":       { "cost": 15, "cd": 5.0, "base_dmg": 90,  "scale_stat": "DEX", "scale_ratio": 0.80, "is_damage": true, "is_heal": false, "effect": "DoT" },
    "EvasiveRoll":       { "cost": 0,  "cd": 6.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Kaçınma + DMG Bağışıklığı" },
    "FalconMark":        { "cost": 30, "cd": 15.0, "base_dmg": 0,  "scale_stat": "FOC", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Hedef İşaretle + DMG Artışı" },
    "Windstep":          { "cost": 20, "cd": 10.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Hareket/Atk Speed Buff" },
    "PiercingVolley":    { "cost": 25, "cd": 8.0, "base_dmg": 70,  "scale_stat": "DEX", "scale_ratio": 0.85, "is_damage": true, "is_heal": false, "effect": "3 Ardışık Delici Ok" },
    "Camouflage":        { "cost": 0,  "cd": 20.0, "base_dmg": 0,  "scale_stat": "DEX", "scale_ratio": 0.0,  "is_damage": false, "is_heal": false, "effect": "Gizlilik + Crit Şansı" },
    "ArrowStorm":        { "cost": 40, "cd": 30.0, "base_dmg": 40,  "scale_stat": "DEX", "scale_ratio": 0.50, "is_damage": true, "is_heal": false, "effect": "Geniş AoE Ok Yağmuru" },
}
# ... (Diğer değişkenler ve sinyaller) ...
# --- YETENEK COOLDOWN YÖNETİMİ ---
var active_cooldowns: Dictionary = {}

# --- SİNYALLER (HUD ve Karakter Penceresi için) ---
signal health_updated(current_hp, max_hp)
signal experience_updated(current_xp, max_xp)
signal level_updated(new_level)
signal mana_updated(current_mp, max_mp)
signal stats_updated(stats_payload) 
signal skill_executed(skill_id, value, is_heal, target_or_position) 

# --- TEMEL DEĞERLER (Google Doc BÖLÜM 2) ---
var base_health: int = 80
var base_mana: int = 30
var hp_per_level: int = 10
var mp_per_level: int = 5
# ... (Statlar, computed statlar ve _process/_ready fonksiyonları) ...
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

func _process(delta):
    var keys_to_remove = []
    for skill_id in active_cooldowns.keys():
        active_cooldowns[skill_id] -= delta
        if active_cooldowns[skill_id] <= 0:
            keys_to_remove.append(skill_id)

    for skill_id in keys_to_remove:
        active_cooldowns.erase(skill_id)

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

# MANA GİTMEMESİ SORUNUNA YÖNELİK DEBUG İÇİN EK LİNE
func set_mana(new_mana):
    var old_mana = current_mana
    current_mana = clampi(new_mana, 0, computed_max_mana)
    if old_mana != current_mana:
        # Mana değiştiğinde konsola yazdır
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
    
# --- STAT SİSTEMİ ÇEKİRDEĞİ VE LEVEL UP FONKSİYONLARI BURADA KALIYOR ---

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
        
    # Mana kontrolü
    if current_mana < skill_data.cost:
        return false
        
    return true

# Yeteneği kullan ve cooldown'u başlat
func start_skill_cooldown(skill_id: String):
    var skill_data = SKILL_DATABASE.get(skill_id)
    if skill_data != null:
        # 1. Manayı düş (Artık set_mana debug çıktısı verecek)
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
        # YENİ DEBUG LOG: Neden kullanılamadığını söyle
        if active_cooldowns.has(skill_id):
            print("YETENEK KULLANILAMADI: %s - Cooldown'da (Kalan: %.1fs)" % [skill_id, active_cooldowns[skill_id]])
        elif current_mana < skill_data.cost:
            print("YETENEK KULLANILAMADI: %s - Yetersiz Mana (%d / %d Gerekli)" % [skill_id, current_mana, skill_data.cost])
        return

    start_skill_cooldown(skill_id)
    
    var computed_value: float = _calculate_skill_value(skill_id)
    
    var is_heal: bool = skill_data.is_heal if "is_heal" in skill_data else false
    var is_damage: bool = skill_data.is_damage if "is_damage" in skill_data else (computed_value > 0.0 and not is_heal) 
    var effect_desc: String = skill_data.effect

    print("YETENEK KULLANILDI: %s (Hesaplanan Değer: %.2f, İyileştirme: %s, Etki: %s)" % [
        skill_id, computed_value, str(is_heal), effect_desc
    ])

    # --- ÖZEL YETENEK ETKİSİ MANTIĞI: SINYAL GÖNDERİMİ ---
    
    if computed_value != 0.0:
        if is_heal:
            # Self Heal durumları
            if skill_id == "Rejuvenate" or skill_id == "SpiritLink" or skill_id == "SacredBond" or skill_id == "DeathCoil": 
                set_health(current_health + int(computed_value))
                print("Self Heal/HoT Tetiklendi: +%.0f HP" % computed_value)
                skill_executed.emit(skill_id, computed_value, true, self)
            else:
                # Normal iyileştirme sinyali
                skill_executed.emit(skill_id, computed_value, true, target_or_position)
        elif is_damage:
            # Hasar sinyali
            skill_executed.emit(skill_id, computed_value, false, target_or_position)
            
    elif computed_value == 0.0:
        match skill_id:
            "WarCry": 
                skill_executed.emit(skill_id, 0, false, "AreaDebuff")
            "Bloodletting":
                # %5 can feda
                set_health(current_health - int(computed_max_health * 0.05)) 
                print("Bloodletting: -%.0f HP, Self Buff: Atk Artışı" % (computed_max_health * 0.05))
                skill_executed.emit(skill_id, 0, false, "SelfBuff")
            "EvasiveRoll":
                skill_executed.emit(skill_id, 0, false, "Movement")
            _:
                skill_executed.emit(skill_id, 0, false, effect_desc)
