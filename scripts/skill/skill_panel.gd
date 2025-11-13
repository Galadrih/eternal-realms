extends Panel
class_name SkillPanel

# ---------------------------------------------------------
#  SKILL DESCRIPTION VERİTABANI
#  SKILL_DESCRIPTIONS["Druid"]["bloom_field"] -> tooltip metni
#  Anahtarlar:
#    - Birinci seviye: Class klasör ismi (skills klasöründeki isim)
#    - İkinci seviye:  Skill .tres / .png dosya ismi (uzantısız)
# ---------------------------------------------------------
const SKILL_DESCRIPTIONS := {
    "Druid": {
        "life_bloom": "Druid'in varlığı, çevresindeki yaşama bereket saçar. Belli aralıklarla yakındaki yaralıları iyileştirir ve iyileşen hedeflerin aldığı şifayı artırır.",
        "natures_fury": "Druid'in öfkesi ormanın derinliklerinden beslenir. Büyü kullandıkça biriken bu enerji, bir sonraki güçlü doğa saldırısını serbest bırakır.",
        "vine_whip": "Kadim ormanın kökleri, bir kırbaç gibi uzanarak hedefin etrafına sarılır. Hem büyü hasarı verir hem de düşmanı yavaşlatarak kaçışını engeller.",
        "rejuvenate": "Hedefe bereketli bir doğa ruhu bahşedilir. Zamanla yenileyici enerji akışı sağlayarak yavaşça canını tazeler.",
        "entangle_roots": "Toprak canlanır ve hedefin ayaklarını anında köklerle bağlayarak kısa süreliğine hareket edemez hale getirir. Kökler, kısa bir süre sonra yavaşça zehirli öz suyu emer.",
        "poison_spores": "Bir avuç dolusu ölümcül spor, belirlenen alana yayılarak zehirli bir bulut oluşturur. İçindeki düşmanlar zehir hasarı alır ve iyileşme güçleri azalır.",
        "spirit_link": "Druid, kendi hayat enerjisiyle müttefikine bir bağ kurar. Müttefikin acısını paylaşır ve bu fedakarlığın bir kısmını anında iyileştirir.",
        "thorn_armor": "Druid'in derisi kalınlaşmış dikenli kabukla kaplanır. Gelen hasarı azaltır ve yakın temas kurmaya çalışan düşmanları yaralar.",
        "seed_shot": "Hızla sertleşmiş bir tohum fırlatır. Hedefe çarptığında patlayarak hafif alana yayılan hasar verir.",
        "bloom_field": "Toprak, kısa süreliğine can veren bir bahar alanı oluşturur. Müttefikleri iyileştirirken, düşmanları yavaşlatarak onlara engel olur.",
        "rot_pulse": "Çevresine çürümekte olan enerjiden bir darbe yollar. Düşmanların saldırı gücünü azaltır ve onlara çürüme (DoT) hasarı verir.",
        "natures_grasp": "Ormanın öfkesi Druid'in adımlarına yansır. İleri doğru atılırken geçtiği düşmanlara hasar verir ve onları kısa süreliğine kökleriyle hapseder."
    },

    "Berserker": {
        "blood_rush": "Kan kokusu, Berserker'ı daha da çıldırtır. Ölümle burun buruna geldiğinde, kısa süreliğine saldırı ve hareket hızıyla şahlanır.",
        "iron_will": "Demir gibi bir irade, Berserker'ı savaş alanında sarsılmaz kılar. Kontrol etkilerine karşı gösterdiği direnç, süresini kısaltır.",
        "rage_slash": "Düşmanın savunmasını hiçe sayan, saf öfke ile dolu tek bir güçlü balta darbesi.",
        "frenzied_combo": "Durmaksızın ve kontrolsüzce savurulan üç hızlı darbe. Kombonun son vuruşu düşmanı kısa süreliğine sersemletebilir.",
        "war_cry": "Berserker'ın ilkel çığlığı, hem kendi savaş azmini artırır hem de yakındaki düşmanların direncini sarsarak zırhlarını kırar.",
        "bloodletting": "Savaşa olan bağlılığını kanıyla mühürler. Kısa süreliğine kendi canını feda ederek yıkıcı bir saldırı gücü kazanır.",
        "earth_splitter": "Balta, gücüyle yeri yararak geniş bir alana yayılan hasar verir. Düşmanlar bu şoktan kısa süreliğine etkilenir.",
        "unyielding_strike": "Tüm savunmaları aşmak için tasarlanmış hassas ve güçlü bir darbe. Hedefe hasar verirken, zırhını kısa süreliğine etkisiz hale getirir.",
        "berserk_charge": "Hedefe doğru gözü kara bir hızla koşar. Çarptığı ilk düşmanı hırpalar ve kısa süreliğine yere serer.",
        "bone_breaker": "Hedefin savunma düzenini bozmak için tasarlanmış, kemikleri ufalayan bir vuruş. Vurulan düşmanın zırhı kısa süreliğine etkisiz hale gelir.",
        "adrenal_surge": "Savaşın ortasında damarlarında saf adrenalin akar. Kısa süreliğine saldırı ve hareket hızını büyük ölçüde artırır.",
        "reckless_fury": "Berserker, baltasını çevresinde dönerek kontrolsüzce sallar. Yakındaki her şeye hasar verirken, bu pervasızlık onu gelen saldırılara karşı savunmasız bırakır."
    },

    "Elementalist": {
        "elemental_harmony": "Elementalist'in elementler arasında kurduğu uyum, büyülerinin gücünü artırır. Farklı elementler arka arkaya kullanıldığında ikinci büyü daha yıkıcı olur.",
        "arcane_flow": "Elementalist'in kanında akan büyülü akım, büyüler isabet ettikçe hızlanır. Atış hızı artarak daha seri büyü yapmasını sağlar.",
        "fire_bolt": "Yoğunlaştırılmış ateşten bir mermi hedefe fırlatılır. Çarptığı hedefin yanmasına neden olarak zamanla hasar verir.",
        "frost_shard": "Elementalist'in nefesinden çıkan keskin bir buz parçası. Hedefe hasar verir ve soğuk, hareketini yavaşlatarak kaçışını zorlaştırır.",
        "lightning_arc": "Elementalist'in elinden çıkan ani bir elektrik akımı, yakınlardaki en fazla 3 hedefe sıçrayarak şok hasarı verir.",
        "stone_spike": "Elementalist'in kontrolüyle yerden fırlayan keskin taş bir diken hattı. Dar bir alandaki tüm düşmanlara hasar verir.",
        "flame_vortex": "Belirlenen alanda hızla dönen bir ateş girdabı yaratır. İçinde kalan düşmanlara sürekli ateş hasarı verir.",
        "ice_barrier": "Elementalist'in çevresinde hızla yoğunlaşmış buz kristallerinden bir savunma bariyeri oluşturur ve aldığı hasarı kısa süreliğine emer.",
        "thunder_step": "Elementalist, bir şimşek hızında istenilen konuma ışınlanır. Varış noktasında bıraktığı enerji patlaması düşmanlara hasar verir.",
        "meteor_fall": "Gökyüzünden çağrılan devasa bir ateş ve kaya kütlesi, belirlenen geniş bir alana düşerek büyük bir yıkıma neden olur.",
        "magma_burst": "Elementalist'in hedeflediği noktada erimiş kaya patlaması. Anlık büyük hasar verir ve geride kalan magma, kısa bir süre daha düşmanları yakar.",
        "elemental_surge": "Elementalist, bir elementin gücünü bedeninde yoğunlaştırır. Kısa süreliğine o elementin büyülerinin gücü büyük ölçüde artar."
    },

    "Monk": {
        "inner_balance": "Monk'un iç dengesi, her başarılı vuruşta Chi enerjisi biriktirir. Bu enerji, hem saldırı hem de savunma gücünü artırır.",
        "tranquil_mind": "Dış dünyadan soyutlanmış, huzurlu bir zihin. Kısa süreliğine hasar almadığında, Monk hızla canını ve enerjisini yenilemeye başlar.",
        "spirit_jab": "Nefes ve Chi enerjisiyle güçlendirilmiş hızlı bir yumruk. Düşmana anlık hasar verir.",
        "palm_of_serenity": "Monk, avucunun ortasında bir enerji şoku yayar. Hedefi geri iterken ona hasar verir ve dengeyi bozar.",
        "chi_wave": "Monk'un enerjisinden oluşan dalga düşmanlara hasar verirken, dalganın yakınındaki müttefiklere şifa ulaştırır.",
        "fist_of_the_dawn": "Monk, tüm enerjisini bir sonraki ağır vuruşuna odaklar. Bu ilk vuruş, yıkıcı bir bonus hasar uygular.",
        "meditation": "Monk, tüm dış etkenlerden soyutlanarak iç huzura ulaşır. Kanal süresince can ve mana enerjisini hızla yeniler.",
        "iron_body": "Bedenini dövülmüş demir kadar sert hale getirir. Kısa süreliğine fiziksel saldırılara karşı büyük bir direnç kazanır.",
        "cyclone_kick": "Monk, hızla dönerek çevresindeki tüm düşmanlara tekmeler savurur. Geniş bir alana hasar verir.",
        "spirit_step": "Bedenini kısa süreliğine gölge enerjisiyle birleştirir. Hızla ileri atılırken geçtiği düşmanlara enerji hasarı verir.",
        "pressure_point": "Hızlı bir parmak darbesiyle hedefin vücudundaki baskı noktasına vurur. Fiziksel hasar verirken, düşmanın saldırı gücünü zayıflatır.",
        "way_of_the_lotus": "Monk'un hareketleri ve vuruşları, etrafına Chi enerjisi saçar. Bu süre zarfında Chi harcayarak yaptığı vuruş ve iyileştirmeler ek güç kazanır."
    },

    "Crusader": {
        "lights_resolve": "Crusader'ın inancı, aldığı darbelerle güçlenir. Blok yapma şansı artar ve biriken ışık, sonraki saldırısına ilahi hasar ekler.",
        "sacred_protection": "Kutsal bir ruh tarafından korunan kalkan. Fiziksel darbelerin yanı sıra, Crusader'ı büyü hasarına karşı da dirençli yapar.",
        "holy_strike": "Kılıç, ilahi ışıkla kutsanır. Hem güçlü bir fiziksel darbe vurur hem de üzerine kutsal enerji hasarı ekler.",
        "shield_bash": "Crusader, kalkanını tüm gücüyle hedefe çarpar. Hasar verirken, düşmanı kısa süreliğine sersemleterek etkisiz hale getirir.",
        "divine_guard": "Crusader'ın inancı, müttefiki ile arasında bir kalkan görevi görür. Müttefikin aldığı hasarın bir kısmını kendi üzerine çeker.",
        "purge_evil": "Kutsal bir ışıma yayarak yakındaki müttefikler üzerindeki tüm kötü etkileri temizler. Bu enerji düşmanlara kutsal hasar verir.",
        "radiant_slash": "Crusader, kılıcını hızla savururken geride parlak bir ışık yayı bırakır. Yay şeklindeki bu vuruş, önündeki tüm düşmanlara hasar verir.",
        "sanctified_ground": "Crusader, bulunduğu alanı geçici olarak kutsar. Müttefikler bu alanda iyileşme kazanırken, düşmanlar zayıflar.",
        "vow_of_valor": "İlahi bir yeminle gücünü ve direncini artırır. Takımın savunmasını güçlendirirken, kendi saldırı gücünü artırır.",
        "light_of_retribution": "Ölümcül bir darbe aldığında, inancından gelen son bir ışık patlamasıyla çevresindeki düşmanlara kutsal hasar verir.",
        "hammer_of_conviction": "Düşmanın inancını sarsan, ezici bir darbe. Yüksek hasar verir ve kısa süreliğine hedefin zırhını kırarak savunmasını zayıflatır.",
        "aegis_of_faith": "Crusader, kendisini inancın yıkılmaz bir kalkanıyla kuşatır. Kısa süreliğine tüm kaynaklardan gelen hasarı büyük ölçüde azaltır."
    },

    "Warden": {
        "natures_bond": "Warden ve yoldaşı arasındaki sarsılmaz bağ. Yoldaşı yanındayken Warden'a ekstra can yenilemesi ve fiziksel koruma sağlar.",
        "hunters_instinct": "Avcının içgüdüsü, güçlü hedeflere odaklanır. Canı yüksek olan düşmanlara yapılan saldırılarda kritik vuruş şansı artar.",
        "summon_companion": "Ormanın derinliklerinden gelen bir yoldaş, Warden’a savaşta eşlik etmek için çağrılır.",
        "ferocity_strike": "Yırtıcı bir hayvanın hızı ve gücüyle yapılan ani bir vuruş. Hedefe hasar verir ve onu kısa süreliğine sersemletir.",
        "wild_pounce": "Warden, bir avcı gibi hedefin üzerine sıçrar. İniş noktasında çevresindeki düşmanlara çarpma hasarı verir.",
        "call_of_the_wild": "Warden'ın uluması veya çağrısı yoldaşını çıldırtır. Pet'in saldırı ve hareket hızını büyük ölçüde artırır.",
        "camouflage": "Warden, çevresindeki ortama uyum sağlayarak kendini görünmez kılar. Gizlilikten yaptığı ilk saldırı neredeyse her zaman kritik hasar verir.",
        "entangling_shot": "Özel olarak hazırlanmış, yapışkan sıvıyla dolu bir ok fırlatılır. Düştüğü yerde patlayarak düşmanları yavaşlatan bir alan oluşturur.",
        "beast_roar": "Warden ve yoldaşı aynı anda kükrer. Düşmanların savunmasını kırarken, yoldaşın vuruşlarını güçlendirir.",
        "twin_fang": "Warden ve yoldaşı, avlarını aynı anda yakalayan iki diş gibi senkronize saldırır. Hedefe aynı anda iki ayrı vuruş yapılır.",
        "guardian_of_the_forest": "Topraktan bir parça canlanır ve kısa süreliğine Warden'ın yanında savaşan, yavaş ancak çok dayanıklı bir golem oluşturur.",
        "primal_focus": "Warden, ilkel içgüdülerini serbest bırakır. Kendisi ve yoldaşı hasar güçlerini artırır, ancak bu odaklanma onu gelen hasara karşı daha hassas yapar."
    },

    "Dragon_Knight": {
        "dragons_blood": "Dragon Knight'ın damarlarında akan ejderha kanı. Darbe aldığında anında aktifleşen bu kan, kısa süreliğine hızla canını yeniler.",
        "scaled_resilience": "Dragon Knight'ın vücudu ejderha pulları kadar dayanıklıdır. Fiziksel ve element saldırılarına karşı doğal bir direnç sağlar.",
        "flame_strike": "Silah, damarlardaki ejderha ateşiyle kaplanır. Hedefe yüksek fiziksel hasar verir ve kısa süreliğine yanmasına neden olur.",
        "winged_leap": "Ejderha kanatlarının gücüyle göğe sıçrar ve belirlenen alana düşerek çevresindeki tüm düşmanlara çarpma hasarı verir.",
        "draconic_roar": "Dragon Knight'ın kükremesi düşmanların kalbine korku salar. Kısa süreliğine onları sersemletir ve saldırı güçlerini azaltır.",
        "molten_guard": "Zırh, içindeki ejderha ateşiyle erimiş metale dönüşür. Gelen hasarı azaltır ve yakın temas kuran düşmanları yakar.",
        "dragons_breath": "Ağzından yayılan güçlü bir ateş konisi. Önündeki tüm düşmanlara büyük miktarda ateş hasarı verir.",
        "flame_ward": "Kısa süreliğine önünde, içinden geçen düşmanları yakan bir ateşten duvar oluşturur.",
        "scale_slam": "Kalkanını bir ejderha pulunun ağırlığıyla çarpar. Hasar verir ve düşmanı geri iterek konumunu bozar.",
        "infernal_charge": "Dragon Knight, bir lav nehri gibi ileri doğru hücum eder. Çizgisindeki düşmanlara hasar verir ve yolun sonunda küçük bir patlama yaratır.",
        "ember_rebirth": "Ejderha kanının mucizesi. Ölümcül bir darbe alsa bile, kor halindeki ateşle yeniden canlanarak ayakta kalır.",
        "heart_of_the_dragon": "Ejderha ruhunun gücünü çağırır. Saldırı gücünü, dirençlerini artırır ve hayati fonksiyonlarını hızlandırır."
    },

    "Warlock": {
        "pact_of_shadows": "Warlock'un yaptığı yasak anlaşmaların gücü. Büyüler isabet ettikçe biriken bu enerji, bir sonraki laneti çok daha güçlü hale getirir.",
        "soul_leech": "Warlock'un doğuştan gelen ruh emme yeteneği. Yaptığı her büyü hasarının küçük bir kısmını kendi canına dönüştürür.",
        "dark_bolt": "Saf karanlık enerjiden oluşan bir mermi hedefe fırlatılır.",
        "curse_of_agony": "Hedefin üzerine yavaş ve acı verici bir lanet yerleştirilir. Lanet, zamanla büyüyerek düşmanın enerjisini tüketir.",
        "soul_drain": "Düşmanın ruh enerjisini acımasızca çeker. Ona karanlık hasarı verirken, bu enerji Warlock'un kendi canını tazeler.",
        "abyssal_grasp": "Hedefin ayakları altından uçurumdan gelen gölgeler uzanır. Düşmanı kısa süreliğine sabitleyip ona gölge hasarı verir.",
        "infernal_summon": "Kısa süreliğine Warlock'a hizmet edecek, küçük bir cehennem iblisi çağrılır.",
        "shadow_veil": "Warlock, kendini bir gölge perdesiyle sarar. Gelen hasarı büyük ölçüde azaltır ve düşmanların hedef almasını zorlaştırır.",
        "hex_of_weakness": "Hedefe uygulanan karanlık bir büyü. Kısa süreliğine düşmanın hem saldırı gücünü hem de savunmasını zayıflatır.",
        "hellfire_orb": "Yoğunlaştırılmış cehennem ateşi küresi hedeflenen alanda patlar.",
        "soul_rift": "Belirlenen alanda ruhların uğultusundan oluşan bir yarık açılır. Yakındaki düşmanları kendine çeker ve süre sonunda patlayarak hasar verir.",
        "demonic_ascension": "Warlock, yasak güçle geçici olarak iblis formu kazanır. Büyü hasarı ve can emme yeteneği büyük ölçüde artar."
    },

    "Cleric": {
        "divine_grace": "Cleric'in kutsaması, şifadan daha fazlasını sunar. İyileşen hedefler, kısa süreliğine aldıkları hasarı azaltan bir zarafet kazanır.",
        "lights_benediction": "Işığın lütfu, sessiz kaldığında artar. Kısa bir süre büyü yapmadığında, sonraki iyileştirmesi büyük bir güç kazanır.",
        "holy_light": "Tanrısal bir enerji patlaması, hedefin yaralarını anında ve yüksek miktarda iyileştirerek onu kutsar.",
        "purify": "Hedef üzerindeki tüm zararlı büyüleri, zehirleri veya lanetleri temizler ve onu kutsal bir kalkanla korur.",
        "radiant_wave": "Cleric'in inancından yayılan şifa dalgasıdır. Yakındaki tüm müttefikleri anlık olarak iyileştirir.",
        "sacred_bond": "Cleric, kendi ilahi enerjisini bir müttefike bağlar. Müttefikin aldığı hasarın bir kısmını paylaşır ve bu yükün bir kısmını anında onarır.",
        "blessing_of_valor": "Kutsal bir kutsama, tüm takımın üzerine yayılır. Kısa süreliğine hem saldırı güçlerini hem de dirençlerini artırır.",
        "angelic_barrier": "Hedefin çevresinde, ilahi irade ile dokunulmuş, hasarı emen bir kalkan oluşturur.",
        "revive": "Cleric'in inancı, ölüme meydan okur. Düşmüş bir müttefiki canının bir kısmıyla savaş alanına geri getirir.",
        "beacon_of_hope": "Belirlenen alana ilahi bir ışık feneri indirilir. Alan içindeki müttefiklere sürekli ve yavaş bir iyileşme akışı sağlar.",
        "hymn_of_serenity": "Cleric'in söylediği huzur dolu bir ilahi. Takımın mana ve enerji akışını hızlandırarak daha sık yetenek kullanmalarını sağlar.",
        "judgment_of_light": "Kutsal bir öfke ile düşmana hasar verirken, yayılan kutsal enerji yakındaki müttefikleri iyileştirir."
    },

    "Bard": {
        "harmony_of_battle": "Bard'ın ritmi, savaşın temposunu belirler. Aktif şarkı sayısı arttıkça, takımın saldırı hızı da artar.",
        "inspiring_presence": "Bard'ın ilham verici varlığı. Yakınında duran müttefikler, yavaş ve sürekli bir can/mana yenilenmesi kazanır.",
        "song_of_courage": "Bard'ın coşkulu ezgisi tüm takıma cesaret aşılar. Bu, kısa süreliğine saldırı güçlerini artırır.",
        "requiem_of_weakness": "Düşmanın moralini bozan ve gücünü tüketen melankolik bir ağıt. Yakındaki düşmanların verdiği hasarı azaltır.",
        "melody_of_healing": "Yumuşak, yatıştırıcı bir melodi, çevredeki müttefikleri yavaş ve sürekli olarak iyileştirir.",
        "rhythm_of_agility": "Hızlı ve canlı bir ritim, takımın ayaklarına hafiflik verir. Hareket ve kaçınma şanslarını artırır.",
        "dissonant_chord": "Ani ve kulak tırmalayıcı bir ses patlaması. Düşmanların yetenek kullanmasını kısa süreliğine engeller ve hasar verir.",
        "resonant_shield": "Bard'ın enstrümanından yayılan rezonans, takımın çevresinde hasarı emen geçici bir enerji kalkanı oluşturur.",
        "ballad_of_bravery": "Savaşın ortasında yavaşça yükselen bir destan. Zamanla takımın saldırı ve savunma gücünü artıran kalıcı bir destek sağlar.",
        "dirge_of_shadows": "Kara ve kasvetli bir marş, düşmanların odaklanmasını bozar. Kritik vuruş yapma yeteneklerini azaltır.",
        "aria_of_restoration": "Ruhları dinlendiren güçlü bir arya. Takımın mana ve enerji yenilenmesini hızlandırır.",
        "crescendo_finale": "Bard, tüm aktif ezgilerini tek bir güçlü nota ile sonlandırır. Müttefiklere anlık kalkan verirken, düşmanlara hasar verip onları sersemletir."
    },

    "Necromancer": {
        "grave_pact": "Mezarlarla yapılan lanetli bir anlaşma. Çevrede bir canlının ölümü, Necromancer'ın minyon çağırma büyüsünü güçlendirir ve bedelsiz yapar.",
        "unholy_vitality": "Necromancer'ın vücudu sağlıksız bir enerjiyle dolar. Yaptığı karanlık büyü hasarının küçük bir kısmını kendi canını yenilemek için kullanır.",
        "bone_spear": "Kara büyüyle güçlendirilmiş, keskin bir kemik mızrağı fırlatılır. Hedefleri delerek arkasındaki düşmanlara da hasar verir.",
        "soul_rot": "Hedefin ruhuna yavaşça yayılan karanlık bir hastalık. Zamanla büyük miktarda hasar verir.",
        "raise_skeletons": "Yıkılmış mezarlıklardan iskelet savaşçıları çağrılır. Bu geçici hizmetkarlar Necromancer adına savaşır.",
        "death_coil": "Karanlık bir enerji sarmalı fırlatılır. Düşmana hasar verirken, enerjiyi emerek Necromancer'ı iyileştirir.",
        "bone_prison": "Yerin altından aniden yükselen kemikler, hedefi geçici bir kafese hapsederek hareket etmesini engeller.",
        "corpse_explosion": "Yakındaki cesetlere ruh enerjisi pompalanır ve onların patlamasına neden olur. Çevredeki düşmanlara büyük hasar verir.",
        "wraith_form": "Necromancer'ın bedeni, geçici olarak madde ötesi bir hayalet forma bürünür. Tüm fiziksel teması ve zemin etkilerini görmezden gelir.",
        "plague_field": "Belirlenen alana veba ve çürüme yayan bir enerji sis yayılır. İçindeki düşmanlar sürekli hasar alır ve iyileşme güçleri azalır.",
        "summon_abomination": "Parçalanmış bedenlerden oluşan, yavaş ama yıkılmaz bir iğrenç yaratık çağrılır. Ağır darbeleriyle düşmanlara hasar verir.",
        "ritual_of_sacrifice": "Necromancer, çağrılmış tüm hizmetkarlarını yok ederek onların enerjisini patlatır. Düşmanlara hasar verir, ancak bu ritüel onu kısa süreliğine savunmasız bırakır."
    },

    "Ranger": {
        "hunters_focus": "Avcının mutlak odaklanması. Ranger hareket etmeden durduğunda, her geçen saniye verdiği hasar artar.",
        "natures_reflex": "Doğanın verdiği refleks. Kritik bir darbe aldığında, Ranger içgüdüsel olarak hızla geri çekilir ve hasardan kurtulur.",
        "power_shot": "Tamamen gerilmiş bir yaydan çıkan güçlü bir ok. Hedefe yüksek hasar verir ve zırhının bir kısmını deler.",
        "multi_arrow": "Hızla birden fazla ok çekilir ve konik bir alana yayılır. Yakın mesafedeki düşmanlara üç ayrı vuruş yapabilir.",
        "explosive_trap": "Ranger'ın hassaslıkla kurduğu gizli bir tuzak. Tetiklendiğinde patlayarak çevresindeki düşmanlara hasar verir ve kısa süreliğine bir ateş alanı oluşturur.",
        "poison_arrow": "Ucu güçlü bir zehirle kaplanmış bir ok. Hedefe hasar verir ve zehrin yavaşça etkisini göstermesine neden olur.",
        "evasive_roll": "Çevik bir yuvarlanmayla düşman saldırılarından kaçar. Yuvarlanma sırasında kısa süreliğine hasar almaz.",
        "falcon_mark": "Hedef, Ranger'ın şahininin gözüyle işaretlenir. Bu işaret sayesinde, tüm takımın o hedefe verdiği hasar artar.",
        "windstep": "Ranger'ın adımları rüzgar kadar hafifler. Kısa süreliğine hareket ve saldırı hızı artar.",
        "piercing_volley": "Ranger'ın ustalıkla attığı üç ardışık ok. Hedefe arka arkaya yüksek hasar verir.",
        "camouflage": "Ranger, çevresindeki ortama uyum sağlayarak kendini görünmez kılar. Gizlilikten yaptığı ilk saldırı kesinlikle kritik hasar verir.",
        "arrow_storm": "Gökyüzüne doğru yayılan oklar, belirlenen geniş bir alana yağmur gibi iner ve düşmanlara sürekli hasar verir."
    }
}

# ---------------------------------------------------------
#  PANEL AYARLARI
# ---------------------------------------------------------
@export_dir var skills_root := "res://skills"
@export var grid_columns := 1              # FFXIV tarzı liste için 1 sütun
@export var item_min_size := Vector2(220, 52)

# Sahnede şu hiyerarşiyi varsayıyorum:
# SkillPanel
#   MarginContainer
#     VBoxContainer
#       TitleBar (HBoxContainer)
#         Title (Label)
#         CloseButton (Button)
#       Search (LineEdit)
#       ScrollContainer
#         Grid (GridContainer)
@onready var _grid       = $"MarginContainer/VBoxContainer/ScrollContainer/Grid"
@onready var _close_btn  = $"MarginContainer/VBoxContainer/TitleBar/CloseButton"
@onready var _search     = $"MarginContainer/VBoxContainer/Search"

var _all_skills: Array = []

func _ready() -> void:
    add_to_group("skill_panel")
    hide()

    if _grid:
        _grid.columns = grid_columns

    if _close_btn:
        _close_btn.pressed.connect(_on_close)
    if _search:
        _search.text_changed.connect(_on_search)

    _load_all_skills()
    _populate("")

# ---------------------------------------------------------
#  PUBLIC API (HUD buradan çağırıyor)
# ---------------------------------------------------------

func refresh_for_class(cname) -> void:
    if cname == null or cname == "":
        return

    var safe_name := str(cname)
    if " " in safe_name:
        safe_name = safe_name.replace(" ", "_")

    skills_root = "res://skills/%s" % safe_name
    _load_all_skills()

    var current_filter := ""
    if _search:
        current_filter = _search.text

    _populate(current_filter)

func set_skills_root(path: String) -> void:
    if path == null or path == "":
        return

    skills_root = path
    _load_all_skills()

    var current_filter := ""
    if _search:
        current_filter = _search.text

    _populate(current_filter)

func set_filter(text: String) -> void:
    if _search:
        _search.text = text
    _populate(text)

func open_panel() -> void:
    show()

func close_panel() -> void:
    hide()

# ---------------------------------------------------------
#  İÇ MANTIK
# ---------------------------------------------------------

func _on_close() -> void:
    close_panel()

func _on_search(new_text: String) -> void:
    _populate(new_text)

func _load_all_skills() -> void:
    _all_skills.clear()
    var exts := [".tres", ".res"]
    _recurse_load(skills_root, exts)

func _recurse_load(path: String, exts: Array) -> void:
    if path == "" or not DirAccess.dir_exists_absolute(path):
        return

    var da := DirAccess.open(path)
    if da == null:
        return

    da.list_dir_begin()
    while true:
        var name := da.get_next()
        if name == "":
            break
        if name.begins_with("."):
            continue

        var full := path.path_join(name)
        if da.current_is_dir():
            _recurse_load(full, exts)
        else:
            for e in exts:
                if name.ends_with(e):
                    var res := load(full)
                    if res is SkillData:
                        _ensure_skill_extras(res)
                        _all_skills.append(res)
                    break
    da.list_dir_end()

# SkillData içini ikon + description ile tamamla
func _ensure_skill_extras(sd: SkillData) -> void:
    var res_path := sd.resource_path
    if res_path == "":
        return

    # Örnek: res://skills/Druid/bloom_field.tres
    var base_dir := res_path.get_base_dir()      # res://skills/Druid
    var file_name := res_path.get_file()        # bloom_field.tres
    var skill_name := file_name.get_basename()  # bloom_field

    var parts := base_dir.split("/")
    if parts.size() == 0:
        return
    var class_dir := parts[parts.size() - 1]    # Druid, Berserker, Dragon_Knight...

    # 1) İKON OTO YÜKLE
    if not sd.icon:
        var icon_path := "res://assets/skill_icons/%s/%s.png" % [class_dir, skill_name]
        if ResourceLoader.exists(icon_path):
            var tex := load(icon_path)
            if tex is Texture2D:
                sd.icon = tex

    # 2) DESCRIPTION OTO DOLDUR
    if (sd.description == "" or sd.description == null) and SKILL_DESCRIPTIONS.has(class_dir):
        var class_dict = SKILL_DESCRIPTIONS[class_dir]
        if class_dict.has(skill_name):
            sd.description = class_dict[skill_name]

func _clear_grid() -> void:
    if not _grid:
        return
    for c in _grid.get_children():
        c.queue_free()

func _populate(filter_text: String = "") -> void:
    if not _grid:
        return

    _clear_grid()
    var f := filter_text.strip_edges().to_lower()

    for sd in _all_skills:
        var name_str := str(sd.display_name)
        var id_str := ""
        if "id" in sd:
            id_str = String(sd.id)

        if f != "" and not name_str.to_lower().contains(f) and not id_str.to_lower().contains(f):
            continue

        var item: SkillItem = SkillItem.new()

        # Satır genişliğini panelin item_min_size.x'ine göre ayarla
        if "row_width" in item:
            item.row_width = int(item_min_size.x)

        item.set_skill(sd)
        _grid.add_child(item)
