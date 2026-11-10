# Stranded: Alien Dawn Türkçe Yerelleştirme Pipeline'ı (sndTR)
## Geliştirme ve Mimari Değişiklik Günlüğü (Development Changelog)

**Tarih:** 10 Kasım 2026  
**Güncel Sürüm:** v1.0.10 (İkinci Dalga Tam-CSV LQA Denetimi: Menü/Buton Eşsesli Kelimeler, Büyük Harf Karakterler, Kritik Öğreticiler & Terim Tutarlılığı)  
**Önceki Sürüm:** v1.0.9  
**Aktif Dal:** `audit-fix-refactor`

---

## 0.00001. SÜRÜM v1.0.10 GÜNCELLEMESİ (10 Kasım 2026)

### A. Mod Penceresi & Canlı Sürüm Takibi (`metadata.lua` & `BENIOKU.txt`)
- **Mod Başlığı:** `"Stranded: Alien Dawn - Türkçe Yama v1.0.10 (Turkish Localization)"`
- **Sürüm:** `version = 110` (v1.0.10 / V. 0.00-110)
- **Canlı Mod Senkronizasyonu:** `main.py sync` ile `C:\Users\ugurtrsahin\AppData\Roaming\Stranded - Alien Dawn\Mods\StrandedAlienDawn_Turkish\` dizini güncellendi.

### B. İkinci Dalga Tam-CSV LQA Denetimi ve İyileştirmeleri (`tools/apply_v110_fixes.py` — 438 Satır)
1. **Menü, Arayüz, Buton & Eşsesli Kelime Halüsinasyonları (`Kategori 1 & 2`):**
   - `APPLY` -> **`UYGULA`** (`ID 713012890294`, `148605689666`, `12307`; eski: `BAŞVUR`), `RATE / RATE UP / RATE DOWN` -> **`DEĞERLENDİR / OLUMLU OYLA / OLUMSUZ OYLA`** (`ID 449539499567`, `239889641249`, `773069911096`), `Rate <ModName>` -> **`<ModName> Modunu Değerlendir`** (`ID 10385`), `IMPORT / EXPORT` -> **`İÇE AKTAR / DIŞA AKTAR`** (`ID 850265353960`, `152640595873`), `CREDITS` -> **`EMEĞİ GEÇENLER`** (`ID 779417116874`), `Master Volume` -> **`Ana Ses Düzeyi`** (`ID 723387039210`), `Author (desc)` -> **`Yazar (azalan)`** (`ID 525396275058`).
   - `HARD / Insane` -> **`ZOR / Çılgın`** (`ID 215718392194`, `471164441125`), `Pet` -> **`Sev / SEV`** (`ID 596626324288`, `604295751627`, `547705853932`), `Slaughter` -> **`Kesim / KESİM`**, `Butcher` -> **`Doğra`** (`ID 354509014696`, `693722979034`), `Charge` -> **`Şarj`** (`ID 622428636978`; eski: `Ücret`), `mine` (`LandMine`) -> **`mayın`** (`ID 282562395250`; eski: `kaz`), `Hearing Range` -> **`İşitme Mesafesi`** (`ID 118739120081`), `Beholder` -> **`elinde bulunduran`** (`ID 650245866297`), `Print money` -> **`para basın`** (`ID 775443390659`), `EMUmbrella` (`Light force field emitter`) -> **`hafif güç alanı yayıcısı`** (`ID 234746711129`).
2. **Büyük Harf Türkçe Karakter Bozulmaları & Çevrilmemiş Kalıntılar (`Kategori 4 & 6`):**
   - Tamamındaki ALL-CAPS küçük `ğ`/`ş` hataları sıfırlandı: `ZORUNLU İNİŞ` (`KAZA İNİş`, `ID 448987015155`), `SEÇİLİ NESNE HİLELERİ` (`SEÇİLMİş`, `ID 752975052221`), `DEĞİŞİM GÜNLÜĞÜ` (`DEĞİŞİM GÜNLÜğÜ`, `ID 737233662230`, `508028372782`), `HERHANGİ BİR DÜĞMEYE BASIN` (`DÜğMEYE`, `ID 109686442217`) ve tüm `CreditsData` `ÖZEL TEŞEKKÜRLER / MÜŞAVİR / MÜŞTERİ / GÜVENLİĞİ` satırları (`10+` satır).
   - `Nothing To Lose` (`TradingShipDef Smuggler`): `Kaybedecek Bir şey Noth` -> **`Kaybedecek Bir Şey Yok`** (`ID 596923225700`), `L./R. back paw / leg` -> **`Sol/Sağ arka pençe / bacak`**, açıkta kalan `<em>Windows / Rooms / Orders / Craft, Mix, Smelt, Sew / rotate / Camp / Expeditions</em>` ve `infopanel` kalıntıları temizlendi.
3. **Terim Tutarlılığı, Kritik Öğreticiler, Teknolojiler & Keşif Akıcılığı (`Kategori 3, 5 & 7`):**
   - Terim bütünlüğü sağlandı: `Fullness` -> **`Tokluk`**, `Relaxation` -> **`Rahatlama`** (eski: `Gevşeme`), `Crash Landing` -> **`Zorunlu İniş`** (eski: `Çarpışma İnişi / KAZA İNİş`), `Overlays` -> **`Katmanlar`** (eski: `Kaplamalar / Yer Paylaşımları`), `Cook stove` -> **`Yemek ocağı`** (eski: `Aşçı ocağı`), kalan 11 `exploding skarabei` hatası, `Buttermelons -> Tereyağkavunları` (`ID 711364249925`), tekil taretler (`Uçaksavar top/Makineli tüfek/Füze fırlatıcı tareti`) ve `FarmField_*` tarla adları düzeltildi.
   - `Tutorial EquipSpear` (`ID 545924752797`) içindeki `"Unpause the game"` zıt anlam hatası (`"Oyunu duraklatın"`) -> **`"Oyunu devam ettirin (duraklatmayı kaldırın)..."`**, `Tutorial Restrictions_2` (`ID 984480232283`) ters taşıma yönü -> **`"Stok Yığınlarından odalara daha yakın bir konuma taşınsınlar"`** olarak düzeltildi.
   - `Tech FieldTreePalm` (`ID 453310109879`: `"Avuç içinde"` -> **`"Palmiyenin üzerinde"`**), `Tech FieldTreeTeaball` (`ID 551496158439`: `"param yetiyorsa"` -> **`"Mecbur kalmadıkça"`**), `Tech Beer` (`ID 901707492071`: `"hurda metal fermantasyon varili"`), 9 `TachyonSource` keşif metni klonu, 1. tekil şahıs/edilgen kalıntılar (`soludu`, `kıskandı`, `yakındı`, `toplanıyor`, `ayırt etmek neredeyse imkânsızdır`) ve Ken'in biyografisi (`ID 631134086061`) doğal Türkçeye kavuşturuldu.

### C. Dağıtım Paketi (v1.0.10)
- **Paket:** `dist/StrandedAlienDawn_Turkish_v1.0.10.zip`
- **Boyut:** 1.40 MB
- **SHA-256:** `dc3f0c70aefb01669254ab33521c3f093750e9d7824aec50a874a3d049f945f0`

---

## 0.00000. SÜRÜM v1.0.9 GÜNCELLEMESİ (10 Kasım 2026)

### A. Mod Penceresi & Canlı Sürüm Takibi (`metadata.lua` & `BENIOKU.txt`)
- **Mod Başlığı:** `"Stranded: Alien Dawn - Türkçe Yama v1.0.9 (Turkish Localization)"`
- **Sürüm:** `version = 109` (v1.0.9 / V. 0.00-109)
- **Canlı Mod Senkronizasyonu:** `main.py sync` ile `%APPDATA%\Stranded - Alien Dawn\Mods\StrandedAlienDawn_Turkish\` dizini güncellendi.

### B. Tam-CSV LQA Denetimi ve İyileştirmeleri (`tools/apply_v109_fixes.py` — 648 Satır)
1. **Dinamik Etiket Söz Dizimi, Kesme İşareti Uyumu ve Etiket Eşitliği (`Kategori 4`):**
   - Bütün `Game.csv` boyunca `<tag>'ek`, `</em>'ek`, `:00'da` (`celebration_starthour`) ve `</negative>'nin` / `</positive>'nin` gibi etiket-ek çakışmaları tamamen ortadan kaldırıldı (`Remaining tag-apostrophe clashes: 0`):
     - Kaynak/olay şablonları: `<res_name('RawMeat')>'yi <res_name('DryMeat')>'ye` -> **`<res_name('RawMeat')> kaynağını <res_name('DryMeat')> kaynağına`**, `<res_name('FoodRaw')> ve <res_name('FoodProcessed')>'yi` -> **`<res_name('FoodRaw')> ve <res_name('FoodProcessed')> kaynaklarını`**, `<res_name('ScrapMetal')> ve <res_name('Ore')>'yi <res_name('Metal')>'ye` -> **`<res_name('ScrapMetal')> ve <res_name('Ore')> kaynaklarını <res_name('Metal')> kaynağına`**.
     - Kişi/sohbet etiketleri: `<other_social.FirstName>'ın/'a/'ı` ve `<other.FirstName>` ekleri `adlı kişinin / adlı kişiye / adlı kişiyi / adlı kişiden` biçiminde doğallaştırıldı; `<DisplayName>'a` -> `<DisplayName> hedefine`, `<AnimalName>'yi` -> `<AnimalName> hayvanını`, `<right_click>'ı` / `<ButtonY>'ı` -> `tuşunu`, `</em>'de` ekleri ise etiket içine (`<em>Bilim menüsünde</em>`, `<em>Savunma menüsünde</em>`, `<em>sol üstte</em>`) taşındı.
     - Kapanış etiketleri: `<negative>Ortalama şebeke şarjı %<BatteryLevel> seviyesinin altında</negative>`, `<positive>Sıcaklık <temp(SensorTemperature)> değerinin altında</positive>`, `saat <celebration_starthour(...)>:00 olduğunda` ve `<em><res('Synthetics')></em>` / `<color  255 128 0>` etiket eşitliği düzeltildi.
2. **Eşsesli Kelime & Bağlam Halüsinasyonları (`Kategori 1`):**
   - `ElectricFan` (`Fan`): `Hayran / Hayranlar` -> **`Vantilatör / Vantilatörler`** (`ID 549443141673`, `ID 896946270314`).
   - `HandpanStand`: `El Tavası / El Tavaları` -> **`Handpan / Handpanler`** (`ID 133723220978`, `ID 324208331366`).
   - `Distillery`: `İçki Fabrikası` -> **`Damıtımevi / Damıtımevleri`** (`ID 336419106247`, `ID 169910944858`).
   - `Bed_Bedroll` & `Bed_Purpleleaf`: `Yatak Örtüsü / Mor yapraklı yatak örtüsü` -> **`Uyku tulumu / Uyku tulumları / Moryaprak uyku tulumu`** (`ID 401477042762`, `ID 297650350769`, `ID 528287741832`, `ID 691608061545`).
   - `LandMine`: `Yangın söndürücü tuzak` -> **`Yangın çıkarıcı tuzak`** (`ID 236635479360`).
   - `PunchingPole` / `ShootingTarget` / `BenchPress`: `Delme direği` -> **`Yumruk direği`**, `Çekim hedefi` -> **`Atış hedefi`**, `Tezgah presleri` -> **`Bench pressler`**.
   - `HydroponicRack` & `SmallMech` / `CombatMech`: `Topraksız raf` / `hidrofonik` -> **`Hidroponik raf`**, `Hafif mekanikler / Savaş makinesi / Makine bakım bölmesi` -> **`Hafif mekanik zırh / Savaş mekanik zırhı / Mekanik zırh bakım bölmesi`**.
   - `Rate Mod` -> **`Modu Değerlendir`** (`ID 157897998461`), `Threshold charge` -> **`Eşik şarjı`** (`ID 482085523166`), `Oil extraction` -> **`Yağ çıkarma`** (`ID 622210890848`), `Will berries` -> **`Yabani meyveler`** (`ID 686897122375`), `Orange mushrooms` -> **`Turuncu mantarlar`**, `Strange succulent` -> **`Tuhaf sukulent`**, `Buzzshroom` -> **`Vızıltı mantarı`**, `Skarabei` -> **`Bokböceği`**, `Peak/Muzzle/Book lungs` -> **`Gaga / Burun kısmı / Kitapsı akciğerler`**, `Great danes` -> **`Danualar`**, `Floor/Table/Sign/Statue` kısa adları (**`Zemin / Masa / Tabela / Heykel`**), `SmallCargoShip` / `Automated Ansible Relay` hataları temizlendi.
3. **Çatı, Şahıs, Biyografiler, Öğreticiler ve Bozuk Kalıntılar (`Kategori 2, 3, 5, 6, 7`):**
   - `HappinessFactor`, `DirectOrder`, `StatusUI`, `RelaxationRoutine` ve `TalkTopicDef` kayıtlarındaki 1. tekil/çoğul şahıs (`-yorum`, `-dım`, `-tık`) ve yanlış edilgen yapılar (`alay edildi`, `iltifat edildi`, `birleştirildi`, `saldırıya uğradı`) 3. tekil şahıs etken Türkçeye geçirildi.
   - `Under deconstruction` -> `Yapım aşamasında` hatası **`Söküm aşamasında`** (`ID 587697757642`), `Cancel Deconstruct` -> **`Sökmeyi İptal Et`** (`ID 399099712677`), `Producers` -> **`Üreticiler`** (`ID 519458364576`) olarak düzeltildi.
   - `Tutorial` içindeki bozuk regex kalıntıları (`"Natural curiosity'yı İyileştir"` -> **`"Maki Onda İyileştir"`**, `"hayatta kalanları bisiklete bindirebilirsiniz"` -> **`"kazazedeler arasında geçiş yapabilirsiniz"`**, `"kiremit yığını"` -> **`"2 karelik bir Stok Yığını"`**, `"Bir tutamda!"` -> **`"Zor durumda!"`**), açıkta kalan İngilizce kelimeler (`<em>place / cancel / leap / fire / Forbid / Allow / Help / Actions / Rooms / Orders / Resources</em>`), `CharacterDef` içindeki **Umayr** ve **Zander** biyografileri (`ID 709814511172`, `ID 664163804187`), `JournalEntry` devrik yapıları ve `Robots & Guardians` DLC'sindeki `Hasat botu istasyonları` / `Saldırı botu istasyonları` / `Yıkılmış indirme gemisi` / `savaş dronu` kayıtları düzeltildi.

### C. Dağıtım Paketi (v1.0.9)
- **Paket:** `dist/StrandedAlienDawn_Turkish_v1.0.9.zip`
- **Boyut:** 1.40 MB
- **SHA-256:** `7ac06833e67c27b6b0c370d5db3ab9b7dfac7ec8bc19f389ac6164105602f8ec`

---

**Güncel Sürüm (Önceki Arşiv):** v1.0.8 (Üretim, Zanaat, Kaynaklar, Kamp Arayüzü, Kazazede Durumları & Teknoloji Ağacı LQA Düzeltmeleri)

---

## 0.0000. SÜRÜM v1.0.8 GÜNCELLEMESİ (10 Kasım 2026)

### A. Mod Penceresi & Canlı Sürüm Takibi (`metadata.lua` & `BENIOKU.txt`)
- **Mod Başlığı:** `"Stranded: Alien Dawn - Türkçe Yama v1.0.8 (Turkish Localization)"`
- **Sürüm:** `version = 108` (v1.0.8 / V. 0.00-108)
- **Canlı Mod Senkronizasyonu:** `main.py sync` ile `%APPDATA%\Stranded - Alien Dawn\Mods\StrandedAlienDawn_Turkish\` dizini güncellendi.

### B. Çeviri ve Yerelleştirme İyileştirmeleri (`tools/apply_v108_fixes.py` — 389 Kritik Kayıt)
1. **Üretim ve Çalışma Tezgahı Arayüzü (`ProductionDeviceComponent.lua`, `TutorialsMenu.lua`, `ClassDef-Camp.lua`):**
   - Üretim hedefi modundaki `"Until"` ifadesinin makine çevirisiyle `"Şu tarihe kadar"` (tarih/zaman) olarak çevrilmesi hatası -> **`"Şu sayıya kadar"`** (stok hedefi) olarak düzeltildi (`ID 720118304136`, `ID 675594817179`, `ID 123285954734`, `ID 229657315864`).
   - Malzeme beklendiğinde yazan `"<positive>Awaiting materials</positive>"` -> `"<positive>Beklenen materyaller</positive>"` hatası -> **`"<positive>Malzeme bekleniyor</positive>"`** (`"<positive>İşçi bekleniyor</positive>"` ile tam uyumlu) olarak düzeltildi (`ID 899919534458`).
   - `"In stock <em><res_short(res, amount)></em>"` -> `"Stokta var ..."` ifadesi -> **`"Stok: <em><res_short(res, amount)></em>"`** (`ID 448224157722`); `"Time to make"` -> `"Yapma zamanı"` hatası -> **`"Üretim süresi"`** (`ID 430717715608`); `"No failure at"` -> `"Sıfır başarısızlık:"` ifadesi -> **`"Hatasız üretim:"`** / **`"Sıfır hata:"`** (`ID 572289848437`, `ID 222210884126`, `ID 707478489425`, `ID 421818271019`, `ID 710604772140`, `ID 514313243174`); `"Crafted on"` -> `"Hazırlanma tarihi"` hatası -> **`"Üretildiği yer"`** (`ID 638087781238`); `"Fail (ingredients lost)"` -> **`"Başarısız (malzemeler ziyan oldu)"`** (`ID 898359945511`) olarak yenilendi.
2. **Kaynak, Tarif ve Zırh/Silah Terminolojisi Bütünlüğü (`Recipe.lua` & `Resource.lua`):**
   - `"Liquid fuel"` -> `"Akaryakıt"` hatası -> **`"Sıvı yakıt"`** (`ID 830108241303`, `ID 926475312055`, `ID 107621717226`, `ID 900834991531`, `ID 585761785652`, `ID 723592370188`).
   - `"Synthetic textiles"` -> `"Sentetik tekstiller"` hatası -> **`"Sentetik kumaş"`** (`ID 809502656522`, `ID 179557527872`, `ID 400097059996`, `ID 775443390659`, `ID 482421081540`, `ID 454547077328`).
   - `"Chew roots"` -> `"Kökleri çiğneyin"` (emir kipi!) hatası -> **`"Çiğneme kökü"`** / **`"Çiğneme kökleri"`** (`ID 593737195959`, `ID 719636136826`, `ID 400995552805`, `ID 970126045630`, `ID 295605161841`, `ID 372276260816`).
   - `"Slop"` -> `"Eğim"` (bayır/eğim!) hatası -> **`"Bulamaç"`** (`ID 406625005238`, `ID 992529839173`).
   - `"Glitter caps"` -> `"Simli kapaklar / Parıltılı kapaklar"` hatası -> **`"Işıltılı şapkalar"`** (`ID 602658341015`, `ID 264576721040`, `ID 850593290507`, `ID 340651740113`, `ID 352870328100`).
   - `"Synthetic helm"` / `"Carbon helm"` -> `"Sentetik dümen"` / `"Karbon dümen"` (gemi dümeni!) hatası -> **`"Sentetik miğfer"`** / **`"Karbon miğfer"`**; `"Veggie helmet / vest / leggings"` -> `"Vejetaryen kaskı / Sebze yeleği / Vejetaryen tayt"` hatası -> **`"Bitkisel deri kask / yelek / tayt"`**; `"Railgun sniper"` -> `"Demiryolu keskin nişancısı"` hatası -> **`"Railgun keskin nişancı tüfeği"`**; `"Punch"` -> `"Delgeç"` hatası -> **`"Yumruk"`**; `"Craft pipes..."` -> `"Boruları hazırlayın..."` hatası -> **`"Pipolar yapın..."`**; lehimleme ve 3D yazıcı tariflerindeki devrik emir kipleri (`"Lehim devre kartları."` -> **`"Devre kartları lehimleyin."`**) düzeltildi.
3. **Kazazede Etkinlik Durumları, Doğrudan Emirler, Kamp Arayüzü ve Teknoloji Ağacı (`ActivityType.lua`, `DirectOrder.lua`, `Camp/`, `Tech.lua`):**
   - Kazazede baş üstü etkinlik şablonları `"<status> <target>"` -> **`"<status>: <target>"`** (`"İnşa ediyor: Tavan"`, `"İlgileniyor: Elektrikli fırın"`) biçimine getirildi (`ID 298952287785` vb. 12 şablon); edilgen durum fiilleri (`"Besleniyor"`, `"Parçalanıyor"`, `"Doğranıyor"`) etken (**`"Besliyor"`**, **`"Parçalıyor"`**, **`"Doğruyor"`**) yapıldı.
   - Savaşta `"Miss"` -> `"Bayan"` hatası -> **`"Iska"`** (`ID 184860743988`, `ID 516016222566`); Giysi korumasında `"Arms"` -> `"Silahlar"` hatası -> **`"Kollar"`** (`ID 474183169256`); Tuzaklarda `"Arm"` -> `"Kol"` hatası -> **`"Kur"`** (`ID 287062017493`, `ID 547571855805`, `ID 629866296296`); Meşalelerde `"Light"` -> `"Işık"` hatası -> **`"Yak"`**; Kasada `"Safe"` -> `"Güvenli"` hatası -> **`"Çelik kasa"`** (`ID 202542464848`); Güç alanında `"Alan kapısını zorla"` hatası -> **`"Güç alanı kapısı"`** (`ID 843167584155`); `"Metal oil press"` -> `"Metal yağı tuşuna basın"` hatası -> **`"Metal yağ presi"`** olarak düzeltildi.
   - Teknoloji ağacındaki tüm `"Kilidi açar / Kilitlerin açılması"` başlıkları **`"Açılanlar"`** ve `"* Çalışma Tezgahlarında hazırlandı"` satırları **`"* Çalışma tezgahlarında üretilir"`** / **`"* Lehim tezgahlarında üretilir"`** / **`"* 3D Yazıcılarda üretilir"`** olarak standardize edildi.

### C. Dağıtım Paketi (v1.0.8)
- **Paket:** `dist/StrandedAlienDawn_Turkish_v1.0.8.zip`
- **Boyut:** 1.40 MB
- **SHA-256:** `57fd75292bdef0907933c00e2eef777dca96445189dc968479fedfbc5dc829a2`

---

## 0.000. SÜRÜM v1.0.7 GÜNCELLEMESİ (10 Kasım 2026)

### A. Mod Penceresi & Canlı Sürüm Takibi (`metadata.lua` & `BENIOKU.txt`)
- **Mod Başlığı:** `"Stranded: Alien Dawn - Türkçe Yama v1.0.7 (Turkish Localization)"`
- **Sürüm:** `version = 107` (v1.0.7 / V. 0.00-107)
- **Canlı Mod Senkronizasyonu:** `main.py sync` ile `%APPDATA%\Stranded - Alien Dawn\Mods\StrandedAlienDawn_Turkish\` dizini güncellendi.

### B. Çeviri ve Yerelleştirme İyileştirmeleri (`tools/apply_v107_fixes.py` — 85 Kritik Kayıt)
1. **Kazazede Biyografileri ve Eski Sözlük İsim Bozulmaları (`CharacterDef.lua` & Tutorial):**
   - Eski bozuk sözlük eşleştirmeleri yüzünden biyografilerinde karakter isimlerinin yerine İngilizce yetenek adları basılan **Emelin** (`Exquisite Cook`), **Katina** ve **Melody** (`Impeccable healer`), **Vivien** (`Avid Tailor`), **Henry Caldwell** (`Close combat specialist`) ile öğreticideki **Rakha** (`Master builder`) kayıtları tamamen temizlendi (`ID 142523748306`, `ID 251387495570`, `ID 955095552322`, `ID 535435368896`, `ID 541823031880`, `ID 223879301122`, `ID 874488875035`).
   - Emelin'in biyografisindeki *"rare game"* -> *"nadir bulunan bir oyunu"* (video oyunu!) hatası -> **"nadir av hayvanlarını"**; Simon'ın biyografisindeki *"robbed some suit"* -> *"bir takım elbiseyi soydu"* hatası -> **"takım elbiseli zengin bir adamı soydu"**; Umayr'ın biyografisindeki *"very poor company"* -> *"çok kötü bir şirket"* hatası -> **"çekilmez bir yol arkadaşı"**; Carter'ın *"in and out of prison"* -> *"hapishanede ve hapishanede büyüdü"* hatası -> **"hapishaneye gire çıka büyüdü"** olarak düzeltildi (`ID 615490480060`, `ID 782480760986`, `ID 709814511172`, `ID 171121547390`, `ID 109343205584`, `ID 208862042963`).
2. **Moral ve Mutluluk (HappinessFactor) Halüsinasyonları (`HappinessFactor.lua`):**
   - *"My <other.FirstName> is dead"* -> *"<other.FirstName> cihazım öldü"* hatası -> **"<other.FirstName> hayatını kaybetti"** (`ID 709444547565`).
   - *"Ate slop"* -> *"Yemek yedim"* hatası -> **"Bulamaç yedi"** (`ID 862558440600`).
   - *"Yuck!"* ve *"Bleh!"* tiksinti ünlemlerinin *"Evet!"* / *"Vay canına!"* / *"Vay be!"* olarak çevrilmesi düzeltildi -> **"Öğk!"** (`ID 615223794706`, `ID 335982668146`, `ID 235920966928`, `ID 463872862694`, `ID 555899949488`).
   - *"grounded silicon"* -> *"topraklanmış silikon"* (elektrik topraklaması!) hatası -> **"öğütülmüş silikon"** (`ID 763441694701`).
   - *"Creature comforts"* -> *"Yaratık konforu"* hatası -> **"Yaşam konforu"** (`ID 940139544871`).
3. **Sağlık Durumları (`HealthCondition.lua`), Bildirimler (`NotificationPreset.lua`) ve Özellikler (`Trait.lua`):**
   - *"Cut"* (yara) -> *"Kes"* (emir kipi!) hatası -> **"Kesik"** (`ID 614192623011`).
   - *"Gunshot"* -> *"Ateşli silah sesi"* hatası -> **"Kurşun yarası"** (`ID 398179001224`, `ID 203891592171`).
   - *"Overate"* -> *"Aşırı"* hatası -> **"Aşırı yeme"** (`ID 683759243869`).
   - *"treatment courses"* -> *"tedavi kursu"* hatası -> **"tedavi kürü"**; *"Malunion"* -> *"Kötü birleşme"* hatası -> **"Yanlış kaynama"**.
   - *"Animal feeders"* -> *"Hayvan besleyenlere"* hatası -> **"Hayvan yemliklerine"** (`ID 410902389173`).
   - Açıkta kalan İngilizce bildirim satırları (`restrictions`, `Genius`, `- At least <em>1 unoccupied Landing spot</em>.`) ve `"Bayıldı hayatta kalanların"` bozuk sıfatları (`Baygın kazazedelerin`) düzeltildi.
   - `Crafting database` -> *"Veritabanı oluşturma"* hatası -> **"Üretim veritabanı"** (`ID 359698660743`); `Gains Sentience while healing` -> *"İyileşirken Bilinç kazanır"* hatası -> **"Tedavi yaparken Bilinç kazanır"** (`ID 509739251878`).

### C. Dağıtım Paketi (v1.0.7)
- **Paket:** `dist/StrandedAlienDawn_Turkish_v1.0.7.zip`
- **Boyut:** 1.40 MB
- **SHA-256:** `35464fe934fe46a74910ef1eff2e3fa4c233c91a0dcda9116cbcf03c6eac31c1`

---

## 0.00. SÜRÜM v1.0.6 GÜNCELLEMESİ (9 Kasım 2026)

### A. Mod Penceresi & Canlı Sürüm Takibi (`metadata.lua` & `BENIOKU.txt`)
- **Mod Başlığı:** `"Stranded: Alien Dawn - Türkçe Yama v1.0.6 (Turkish Localization)"`
- **Sürüm:** `version = 106` (v1.0.6 / V. 0.00-106)
- **Canlı Mod Senkronizasyonu:** `main.py sync` ile `%APPDATA%\Stranded - Alien Dawn\Mods\StrandedAlienDawn_Turkish\` dizini güncellendi.

### B. Çeviri ve Yerelleştirme İyileştirmeleri (`tools/apply_v106_fixes.py` — 137 Kritik Kayıt)
1. **Eşsesli Kelime ve Bağlam Halüsinasyonları:**
   - `Opportunity_BrainNanites.lua`: *"Okay, use the shot."* -> *"Tamam, şutu kullan."* (futbol şutu!) ve *"Nano-bot booster shot"* -> *"Nano-bot güçlendirici atış"* hataları -> **"Tamam, iğneyi vur."** ve **"Nanorobot güçlendirici iğne"** olarak düzeltildi; metin içindeki çevrilmemiş `"any"` kelimesi temizlendi (`ID 868240060145`, `ID 316471688058`, `ID 302099104475`, `ID 466666988951`).
   - `Crash_Mixed.lua`, `Site_EndlessCPU.lua`, `Site_EndlessFuel.lua`, `CrashedPod_NewSite.lua`: *"unlock Crash site expedition"* -> *"Siteyi çökertme seferinin kilidini açın"* (web sitesi çökertme!) -> **"<em>Kaza alanı</em> keşif seferinin kilidini aç"** (`ID 446411753288`, `ID 124290984666`, `ID 220846937327`, `ID 661749038769`).
   - `Moonshine` Tarifleri ve Olayları: *"Moonshine"* -> *"Ay Işığı"* ve *"Distill moonshine from grain."* -> *"Ay ışığını tahıldan damıtın."* hataları -> **"Kaçak İçki"** ve **"Tahıldan kaçak içki damıtın."** olarak düzeltildi (`ID 494141630230`, `ID 835689112657`, `ID 869600925649`, `ID 471124791198`, `ID 137605478844`, `ID 687665380382`, `ID 173126995661`).
   - `Site_Crash_Armory*`, `Site_Crash_Armor*`, `Site_Crash_CruiseShip`, `Site_Crash_DeadBody*`: *"protective shell pods"* -> *"koruyucu mermi kabuğu"* ve *"no vitals"* -> *"hayati önem taşıyan hiçbir şey yoktu"* hataları -> **"koruyucu kaçış kapsülü"** ve **"hiçbir yaşam belirtisi yoktu"**; *"relieved some soldiers of their armor"* -> *"zırhlarından kurtardım"* hatası -> **"Ölü askerlerin üzerindeki zırhları aldım."**; *"do some scavenging"* -> *"biraz temizlik yapın"* hatası -> **"etraftan işe yarar hurda topla"** olarak düzeltildi.
   - Maden Yatağı (`Site_Hole_Ore`, `Site_Meteor_Ore`, `Site_PeculiarRocks_*`): *"observe the deposit"* -> *"depozitoyu gözlemleyin"* (banka depozitosu!) -> **"maden yatağını incele"** (`ID 845005652906`, `ID 159569293876`, `ID 525305197978`, `ID 184224937724`).
   - `TheCalling_NewSite.lua`: *"unlock Call source expedition"* -> *"kilidi aç Kaynağı ara seferi"* -> **"<em>Çağrının kaynağı</em> keşif seferinin kilidini aç"** (`ID 103550476342`).
2. **Robots & Guardians (Hope DLC) ve Keşif Diyalogları:**
   - `Hope_Milestone_*`: Hope'un uykuyu, sosyalleşmeyi, aşık olmayı ve beceri çeşitliliğini öğrendiği 4 olaydaki *"Good for you!"* -> *"Afiyet olsun!"* hatası -> **"Senin adına çok sevindim!"** olarak düzeltildi (`ID 902935404568`, `ID 541160775157`, `ID 658216367253`, `ID 167001890133`).
   - `SurvivorRescued.lua`: Kurtarma kapsülüyle gezegenden ayrılan kazazedeye söylenen *"Godspeed!"* -> *"Tanrı aşkına!"* hatası -> **"Yolun açık olsun!"** olarak düzeltildi (`ID 740500827431`).
   - `Site_HuntingGrounds_Predator_Defeat.lua`: *"long enough for me to leg it"* -> *"benim ona ayak basmama yetecek kadar"* hatası -> **"tabana kuvvet sıvışmama yetecek kadar"** olarak düzeltildi (`ID 442084916801`).
   - `Site_Injury_Moderate.lua`: *"lost my footing"* -> *"ayağımı kaybettim"* hatası -> **"ayağım kaydı"** ve *"<ExplorationSiteName> adresinde iş kazası"* -> **"<ExplorationSiteName> bölgesinde iş kazası"** olarak düzeltildi (`ID 947170105638`, `ID 332402997655`, `ID 930068629513`).
   - `Site_GenericRecruit.lua` & `Site_Dogfight_*`: *"Welcome them to our camp."* -> *"Onları kampımıza hoş geldiniz."* bozuk cümlesi -> **"Onu kampımıza kabul et ve hoş geldin de."** olarak düzeltildi (`ID 624468911428`, `ID 551700093175`, `ID 640435387802`).
3. **Açıkta Kalan İngilizce Terimler ve Özellikler:**
   - `<em>resources</em>` -> `<em>kaynak</em>`, `<em>Genius</em>` -> `<em>Dâhi</em>`, `Effigy'nin hikayesi` -> `Korkuluğun hikâyesi`.
   - 9 adet `<TraitName('Pacifist',actor)> - can't fight` -> *"savaşamıyorum"* hatası -> **"dövüşemez"** olarak düzeltildi.
   - 20 adet `A patch of plants` -> *"Bir bitki parçası"* hatası -> **"Bir bitki kümesi"** olarak düzeltildi.

### C. Dağıtım Paketi (v1.0.6)
- **Paket:** `dist/StrandedAlienDawn_Turkish_v1.0.6.zip`
- **Boyut:** 1.40 MB
- **SHA-256:** `b460fbec37d85ecd1a5d882a85a165fcba202ffbcd0452af802af754e268cba9`

---

## 0.0. SÜRÜM v1.0.5 GÜNCELLEMESİ (9 Kasım 2026)
- **Mod Başlığı:** `"Stranded: Alien Dawn - Türkçe Yama v1.0.5 (Turkish Localization)"` (`version = 105`)
- **Kapsam:** `tools/apply_v105_fixes.py` ile 89 satır düzeltildi (`case` -> `metal çanta`, `gave in` -> `kaya çıkıntısı koptu / enkaz yığını çöktü`, 24x `Nice find!` -> `Güzel buluntu!`, `ExpeditionPreset.lua` harita noktaları).
- **Paket:** `dist/StrandedAlienDawn_Turkish_v1.0.5.zip` (SHA-256: `c2772bcdfb320f8ea1bf7720efa1e901f7f47b72a1945b612e9af1cf693f0b3f`).

---

## 0. SÜRÜM v1.0.4 GÜNCELLEMESİ (9 Kasım 2026)

### A. Mod Penceresi & Canlı Sürüm Takibi (`metadata.lua` & `items.lua`)
- **Mod Başlığı:** `"Stranded: Alien Dawn - Türkçe Yama v1.0.4 (Turkish Localization)"`
- **Sürüm:** `version = 104` (v1.0.4 / V. 0.00-104)
- **Mod Açıklaması:** Mod Yöneticisi ekranında v1.0.4'te yapılan keşif olayları ve diyalog düzeltmelerini özetleyen sürüm notları yerleştirildi.
- **Canlı Mod Senkronizasyonu:** `main.py sync` ile `%APPDATA%\Stranded - Alien Dawn\Mods\StrandedAlienDawn_Turkish\` dizini tam güncellendi.

### B. Çeviri ve Yerelleştirme İyileştirmeleri (22 Kritik Kayıt)
Kullanıcının oyun içi ekran görüntüsüyle bildirdiği Enkaz Keşif Olayı (`Site_Scavenge_Noise`) ve dalları baştan sona doğallaştırıldı:
1. **Diyalog Seçenekleri:**
   - Seçenek 1: Hatalı mastar eki *"Geri gelmek!"* (`ID 978240499712`) düzeltildi -> **"Tehlikeli bir şey olabilir. Hemen geri dön!"**
   - Seçenek 2: *"Siperinizden dışarı atlayın ve yaratığı şaşırtın."* (`ID 693706420635`) düzeltildi -> **"Siperinden fırla ve yaratığı gafil avla!"**
   - Seçenek 3: *"Gürültüyü çıkaran şeye bir göz atmaya çalışın."* (`ID 848705169176`) düzeltildi -> **"Gürültüyü neyin çıkardığına gizlice bakmaya çalış."**
2. **Olay Giriş Metni (`ID 338672720026`):**
   - *"Bir karıştırma sesi duyduğumda"* ifadesi -> **"Tam enkazı incelemeye başlayacaktım ki bir kurcalama sesi duydum!"** olarak düzeltildi.
   - *"yaratığın oflayıp puflamasını dinledim"* ifadesi -> **"yaratığın hırıltılı solumalarını dinledim"** olarak doğallaştırıldı.
3. **Olay Sonuçları ve Kararları:**
   - *"Ayrılmak çok faydalı"* ("It's too useful to leave") saçmalığı düzeltildi -> **"Burada bırakılamayacak kadar işe yarar."** (`ID 281649938493`, `ID 169574876639`, `ID 138890126612`).
   - *"Yalnızca hurdaları alın. O kişinin keskin nişancıya bizden daha çok ihtiyacı var."* ifadesi -> **"Yalnızca hurdaları al. O insanın bu tüfeğe bizden daha çok ihtiyacı var."** (`ID 472432791038`, `ID 250210174404`, `ID 131040602295`).
   - *"Savaş onunla!"* devrik ifadesi -> **"Onunla dövüş!"** (`ID 706825696563`, `ID 246330742565`).
   - *"Güzel bul!"* anlamsız çevirisi -> **"Güzel buluntu!"** (`ID 873636981905`, `ID 103882021163`, `ID 955600635691`).
   - *"Hemen oradan uzaklaş!"* (`ID 606398261585`) ve *"Tüm gücünle kaç!"* (`ID 360312211036`, `ID 783063759167`).
   - Canavar kaçırma ve ceset gömme hikayeleri akıcı edebi Türkçeye uyarlandı (`ID 897912027870`, `ID 715797564437`, `ID 135898632021`, `ID 918243884494`).

### C. Dağıtım Paketi (v1.0.4)
- **Paket:** `dist/StrandedAlienDawn_Turkish_v1.0.4.zip`
- **Boyut:** 1.40 MB
- **SHA-256:** `f039cf59f2258735a4da1a997fd0d83f984909504fcf2d1b1cda573ff1837f39`

---

## 1. SÜRÜM v1.0.3 GÜNCELLEMESİ (9 Kasım 2026)

### A. Mod Penceresi & Canlı Sürüm Takibi (`metadata.lua` & `items.lua`)
- **Mod Başlığı:** `"Stranded: Alien Dawn - Türkçe Yama v1.0.3 (Turkish Localization)"`
- **Sürüm:** `version = 103` (v1.0.3 / V. 0.00-103)
- **Mod Açıklaması:** Mod Yöneticisi ekranında v1.0.3'te yapılan alet, ekipman ve deyim geliştirmelerini özetleyen sürüm notları yerleştirildi.
- **Canlı Mod Senkronizasyonu:** `main.py sync` ile `%APPDATA%\Stranded - Alien Dawn\Mods\StrandedAlienDawn_Turkish\` dizini tam güncellendi.

### B. Çeviri ve Yerelleştirme İyileştirmeleri (18 Kritik Kayıt)
1. **Alet ve Ekipman Çevirileri:**
   - Kulak tıkacı (`Earplugs`) açıklamalarındaki İngilizce "plugs" kelimesinin yanlışlıkla elektrik fişi zannedilerek *"birkaç küçük fiş"* şeklinde çevrilmesi düzeltildi; yerine **"Deliksiz bir uyku sağlamak için tasarlanmış bir çift küçük kulak tıkacı."** yazıldı (`ID 757784831977`).
   - Hayatta kalma kiti içeriğinde *"Acil durum kumaşı"* olarak yer alan vahim hata düzeltildi; yerine **"Acil durum erzakı"** (Emergency rations) yazıldı (`ID 637710026553`).
2. **Deyim ve Atasözü Doğallaştırmaları:**
   - *"Better safe than sorry"* deyimi için kullanılan literal *"Özür dilemektense güvende olmak daha iyidir"* çevirisi yerine akıcı Türkçe deyim **"Tedbiri elden bırakmamak gerek."** yerleştirildi (`ID 235362715830`).
   - Fırın teknolojisindeki *"beggars can't be choosers"* deyimi için kullanılan *"dilenciler seçici olamaz"* yerine **"yoklukta seçici olunamaz"** kalıbı yerleştirildi (`ID 575337273762`).
3. **Arayüz Eylemleri ve Terimleri:**
   - `Campfire sitting` eylemindeki *"Kamp ateşi oturuyor"* literal hatası düzeltildi; yerine **"Kamp ateşi başında oturma"** yazıldı (`ID 671750556274`).
   - İngilizce kalan `Campfire expedition` ifadesi **"Kamp Ateşi keşfi"** olarak çevrildi (`ID 170241436767`).
   - İngilizce kalan `Workbench` kelimeleri **"Çalışma Tezgahı"** olarak güncellendi (`ID 375552048141`, `ID 602696583937`, `ID 347914736549`).
   - `Metal/Ahşap duvar feneri` tutarsızlığı giderilerek meşale standardına uygun şekilde **"Metal/Ahşap duvar meşalesi"** yapıldı (`ID 970821153175`, `ID 814274167689`, `ID 587662598349`, `ID 499275674346`).
4. **Gramer ve Anlatım Bozuklukları:**
   - *"erzakları pişirmek yapmaktır"* ifadesi düzeltildi -> *"erzakları pişirmektir"* (`ID 722188608675`).
   - Yağmurda ıslanma debuff'larındaki *"azalmış olacakları Mutluluk"* / *"azalır olacaktır"* ifadeleri düzeltildi -> *"Mutluluğu azalacaktır"* (`ID 258513352148`, `ID 333147476239`).
   - *"Acil Durum tayınları"* ifadesi -> **"Acil durum erzakı"** olarak standartlaştırıldı (`ID 713948359095`, `ID 270832276425`).

### C. Dağıtım Paketi (v1.0.3)
- **Paket:** `dist/StrandedAlienDawn_Turkish_v1.0.3.zip`
- **Boyut:** 1.40 MB
- **SHA-256:** `e5007c4ef6173063f9c15983237bf85c7a1fe0a3bda91f77aa2eb63afe578f45`

---

## 1. SÜRÜM v1.0.2 GÜNCELLEMESİ (9 Kasım 2026)

### A. Mod Penceresi & Canlı Sürüm Takibi (`metadata.lua` & `items.lua`)
- **Mod Başlığı:** `"Stranded: Alien Dawn - Türkçe Yama v1.0.2 (Turkish Localization)"`
- **Sürüm:** `version = 102` (v1.0.2)
- **Mod Açıklaması:** Mod Yöneticisi penceresinde oyuncunun göreceği v1.0.2 detaylı sürüm notları eklendi.
- **Canlı Mod Senkronizasyonu:** `main.py sync` ile `%APPDATA%\Stranded - Alien Dawn\Mods\StrandedAlienDawn_Turkish\` dizini tam güncellendi.

### B. Çeviri ve Yerelleştirme İyileştirmeleri (22 Kritik Kayıt)
1. **Mekanik Zırh (Mech) ve Robotik Kontrol Öğreticileri:**
   - "Dismount" ve "Mount" komutlarındaki garip 'Attan inme' / 'Attan çıkar' çevirileri düzeltildi; bilimkurgu lore'una uygun olarak "Zırhtan İn", "İn" ve "Bin" olarak aktarıldı (`ID 485715074698`, `ID 723602449957`).
2. **Çevre Olayları ve Felaket İsimleri:**
   - "Cold snap" için kullanılan hatalı "Soğuk ani" literal çevirisi kaldırıldı; yerine **"Ani Soğuk Dalgası"**, "Aşırı Soğuk Dalgası" ve "Şiddetli Soğuk Dalgası" terimleri yerleştirildi (`ID 289156222683`, `ID 742836435741`, `ID 162396124055`, `ID 122970697925`, `ID 714275979565`, `ID 285241970130`, `ID 371404601394`, `ID 390812280105`, `ID 162594524038`, `ID 849835089215`, `ID 796359182184`).
3. **Kolonist Karakter Yetenekleri (Avid Traits) Tutarlılığı:**
   - "Avid Carpenter" -> **Tutkulu marangoz**
   - "Avid Farmer" -> **Tutkulu çiftçi**
   - "Avid Tailor" -> **Tutkulu terzi**
   (Önceki 'Hırslı' ve 'Hevesli' tutarsızlığı `rehber.md` standardıyla giderildi).
4. **İmla ve Yazım Hataları:**
   - `ID 860903463534`: "Aşırı Yeme Krizik" typo'su -> **Aşırı Yeme Krizi** olarak düzeltildi.
5. **Göreve Çağırma ve Hayatta Kalan Öğreticileri:**
   - Kule savunması ve dövüş kontrol öğreticilerindeki "askere alınmış" yerine "göreve çağrılmış" terimi standartlaştırıldı (`ID 543361605881`, `ID 690565480835`, `ID 929290112533`, `ID 738679686687`, `ID 886157183909`).

### C. Dağıtım Paketi (v1.0.2)
- **Paket:** `dist/StrandedAlienDawn_Turkish_v1.0.2.zip`
- **Boyut:** 1.40 MB
- **SHA-256:** `341fb2d72e3135bc4b58b632fb784e53b8efe657992b0daa5daa3a4d19053e1a`

---

## 1. SÜRÜM v1.0.1 GÜNCELLEMESİ (9 Kasım 2026)

### A. Oyuncu Mod Penceresi & Arayüz Sürüm Takibi (`metadata.lua` & `items.lua`)
- **Mod Başlığı:** Oyuncunun oyun içi Mod Yöneticisi (Mod Manager) ekranında güncellemeyi doğrudan görebilmesi için mod başlığı `"Stranded: Alien Dawn - Türkçe Yama v1.0.1 (Turkish Localization)"` olarak güncellendi.
- **Sürüm Numarası:** `version = 101` (v1.0.1) yapıldı.
- **Sürüm Notları ve Açıklama:** Mod detay penceresine sürüm yenilikleri, yapılan düzeltmeler ve geliştirici bilgisi eklendi.
- **Canlı Mod Senkronizasyonu (`main.py`):** `sync_files()` işlevi genişletilerek `Game.csv`nin yanı sıra `metadata.lua`, `items.lua`, `preview.png`, `BENIOKU.txt`, `Kurulum.bat` ve font dosyalarını da oyunun `%APPDATA%` mod klasörüne anında senkronize eder hale getirildi. Artık geliştirme sonrası oyuna girildiğinde mod güncellemeleri anında test edilebilir.

### B. Çeviri İyileştirmeleri (Askeri Kontrol ve Hayatta Kalma Komutları)
`Game.csv` ve `Localization/Game.csv` içindeki 14 kritik arayüz komutundaki makine çevirisi hataları profesyonelce düzeltildi:
- `Undraft` -> **Serbest Bırak** (Önceki hatalı 'Taslağı geri al' giderildi)
- `Undraft everyone` -> **Herkesi Serbest Bırak** (Önceki hatalı 'Herkesin taslağını kaldır' giderildi)
- `Shift + <left_click> Undraft everyone` -> **Shift + <left_click> Herkesi serbest bırak**
- `<ButtonY> Undraft everyone` -> **<ButtonY> Herkesi serbest bırak**
- `Undraft & Dismount` -> **Serbest Bırak ve İn** (Önceki hatalı 'Taslağı Geri Al ve Sök' giderildi)
- `Drafted units` -> **Göreve çağrılan birimler** (Önceki hatalı 'Taslağı hazırlanmış birimler' giderildi)
- `Cannot be drafted while vomiting.` -> **Kusarken göreve çağrılamaz.**
- `You can't lead drafted animals.` -> **Göreve çağrılmış hayvanlara liderlik edemezsiniz.**
- `Assigned <em><AssignedUnitName></em>` -> **Atanan: <em><AssignedUnitName></em>**
- `Drafted - in combat` -> **Göreve çağrıldı - savaşta**
- `draft and mount the mechs` -> **göreve geçip mekanik zırhlara (mech) binmeleri**
- `draft and mount the mech` -> **göreve geçip mekanik zırha (mech) binmesi**
- `Select drafted / armed survivors` -> **Göreve çağrılmış / silahlı hayatta kalanları seçin**

### C. Dağıtım Paketi (v1.0.1)
- **Paket:** `dist/StrandedAlienDawn_Turkish_v1.0.1.zip`
- **Boyut:** 1.40 MB
- **SHA-256:** `a69261e5cc4238308d3ed32c97b43165070d9033783d0ff4bb327b3aff2ac95b`

---

## 1. YENİ EKLENEN MODÜLLER VE BİLEŞENLER

### `tools/__init__.py`
- `tools` klasörünü standart Python paketi haline getirdi.

### `tools/paths.py`
- **Merkezi Dizin Yönetimi:** `PROJECT_ROOT` nesnesi ile projenin diskteki kök konumu dinamik olarak çözülür.
- **Yol Çözümleyici (`resolve_project_path`):** Göreli ve mutlak yolları çalışma dizininden bağımsız olarak çözer.
- **Güvenli Konfigürasyon Yükleyici (`load_project_config`):** `config.json` dosyasını `%APPDATA%` ortam değişkeni açılımıyla birlikte güvenle belleğe alır.
- **Atomik CSV Yazıcı (`atomic_write_csv`):** `utf-8-sig` kodlaması, Windows dosya kilitlemelerine karşı 5 denemeli retry mekanizması, `.tmp` dosyasına yazıp `os.replace` ile atomik değişim sağlar.
- **Atomik JSON Yazıcı (`atomic_write_json`):** `utf-8` ve `ensure_ascii=False` ile atomik ve biçimlendirilmiş JSON yazar.
- **Güvenli Konsol Çıktısı (`ensure_utf8_stdout`):** Windows komut satırında Unicode/Türkçe karakter çökmelerini önler.

### `tools/tag_masker.py`
- **Gelişmiş Tag/Placeholder Maskeleyici:** Oyun motoruna özgü etiketleri korur:
  - Üçlü açılı ayraçlar: `<<<...>>>`
  - Tekli XML/HTML etiketleri: `<color ...>`, `</color>`, `<style ...>`, `<newline/>`
  - Dinamik değişkenler: `{Bob}`, `{1}`, `{amount}`
- **İki Aşamalı Sentinelleme:** Etiketleri `___TAG_0___`, `___TAG_1___` sentinelleriyle gizler, çeviri sonrası kayıpsız ve orijinal sırasıyla geri yerleştirir.

### `tests/` Test Paketi (20 Birim Test)
- `tests/__init__.py`
- `tests/test_paths_and_atomic.py`: Merkezi yollar ve atomik I/O testleri (4 test).
- `tests/test_tag_masker_and_fuzzy_tm.py`: Maskeleme ve FuzzyTM testleri (4 test).
- `tests/test_import_glossary.py`: Sözlük ayrıştırma ve veri doğrulaması (2 test).
- `tests/test_qa_and_validation.py`: QA kalite kapısı ve multiline doğrulama (3 test).
- `tests/test_pipeline_and_sync.py`: CLI işlem hattı ve atomik senkronizasyon (3 test).
- `tests/test_toggle_and_packaging.py`: Karakter modları, packager ve explorer (4 test).

---

## 2. REFACTOR EDİLEN VE İYİLEŞTİRİLEN BİLEŞENLER

### `main.py`
- Hardcoded masaüstü yolları temizlendi; `tools.paths` merkezi yapısına bağlandı.
- `apply_glossary_post_processing()` fonksiyonu `tag_masker` ile XML etiket korumalı ve regex kelime sınırlı (`\b`) hale getirildi.
- `sync_files()` işlevi iki katmanlı yapıldı: Önce `Game.csv` -> `Localization/Game.csv` (Git kopyası), ardından oyun mod klasörüne atomik kopyalama.
- `run_build()` işlemine translation checkpoint desteği ve `atomic_write_csv()` entegre edildi.
- `release` komutuna otomatik QA kapısı ve senkronizasyon eklendi.

### `ToggleTurkishChars.py`
- Hardcoded masaüstü ve kullanıcı adı yolları kaldırıldı; `tools.paths` üzerinden dinamik yol çözümü eklendi.
- CSV okuma ve yazma kodlaması `utf-8-sig` (Haemimont BOM zorunluluğu) ile sabitlendi.
- Programatik API fonksiyonları (`toggle_turkish_chars()`, `apply_normalization()`) eklendi ve birim testlere açıldı.

### `Kurulum.bat` ve `mod/Kurulum.bat`
- `setlocal enabledelayedexpansion` ve `set "COPY_FAILED=0"` denetimi eklendi.
- Her bir `copy` komutunda `errorlevel` denetlenerek dosya eksikliği durumunda yanlış "Tebrikler" mesajı verilmesi engellendi.
- `Game.csv` için hem `Localization\Game.csv` hem `Game.csv` kaynak dosyası desteği sağlandı.

### `tools/fuzzy_tm.py`
- Hem `<...>` hem `{...}` maskelemesi `tools.tag_masker` ile birleştirildi.
- Trigram kümesi ve vektör normları `Counter` yapısıyla bellekte önbelleklendi (pre-computed), arama süresi optimize edildi.
- Şablon adaptasyonuna `{name}` ve sayısal değişkenlerin tam uyarlanması eklendi.

### `tools/import_glossary.py`
- Markdown ayrıştırıcısı bölüm duyarlı hale getirildi:
  - Çift tırnak çıkarma mantığı (Mode B) yalnızca Bölüm 6.C (Özel İsimler) için sınırlandırıldı.
  - Açıklama metinlerinin (Örn: Ken "Laux", Animal Taming, Skarabei) yanlışlıkla çeviri kabul edilmesi engellendi.
  - Bölüm 2 tablosunda sadece "Çevrilecek mi? == Evet" olan kayıtlar alındı.
  - L10n raporundaki onaylı flora/fauna/maden karşılıkları entegre edildi.
- 98 doğrulanmış ve kanonik terim içeren `glossary.json` atomik olarak üretildi.

### `tools/run_qa_suite.py`
- `csv_path` ve `report_path` dışarıdan parametre alabilir hale getirildi.
- Hata bulunduğunda işletim sistemine `sys.exit(1)`, temiz olduğunda `sys.exit(0)` dönen gerçek Kalite Kapısı (Quality Gate) uygulandı.

### `tools/test_validation.py`
- Yalnızca `\\n` arayan zayıf kontrol kaldırıldı; hem kaçışlı hem de gerçek CSV hücre içi multiline `\n` satır sonları analiz edilecek şekilde genişletildi.
- Parametrik dosya yolu desteği eklendi.

### `tools/packager.py`
- Hardcoded yollar temizlendi.
- Aday dosya çözümleyicisi (`resolve_candidate`) ile hem `mod/` klasörü hem de kök dizindeki mod dosyaları güvenle taranır hale getirildi.
- Tüm dosyalar (Game.csv, fontlar, Lua yapılandırmaları, Kurulum.bat, BENIOKU.txt) doğrulanmadan zip paketi üretilmemesi sağlandı.
- SHA-256 hash çıktısı eklendi.

### `tools/localization_explorer.py`
- Hardcoded masaüstü yolu temizlendi; `PROJECT_ROOT` ve `ensure_utf8_stdout()` entegre edildi.
- `load_data(csv_path)` parametrik hale getirildi.

### `tools/logger.py` ve `tools/backup_manager.py`
- Log ve yedekleme dizinleri `PROJECT_ROOT` altına dinamik olarak bağlandı.

### `config.json`
- Sabit `c:\Users\ugurtrsahin\Desktop\sndTR` yolları kaldırıldı; göreli yollar (`Game.csv`, `memory.json`, `glossary.json`) ve mod dizini için `%APPDATA%\...` tanımlandı.

### `pyproject.toml`
- `[build-system]` eklendi (`setuptools>=61.0`).
- Bağımlılıklara `deep-translator>=1.11.4` eklendi.
- `packages = ["tools"]` ve CLI betik eşleşmeleri tanımlandı.

---

## 3. VERİ DOSYALARI DÜZELTMELERİ

### `Game.csv` (15.495 Kayıt)
- Eski QA ve doğrulama araçlarının kaçırdığı 8 multiline kayıtta eksik kalan soru cümleleri ve satır sonu kaymaları giderildi:
  - `ID: 296131215564` -> "Kaydedip devam edilsin mi?"
  - `ID: 784330778697` -> "Harita değiştirilip devam edilsin mi?"
  - `ID: 848544422104` -> "Senaryo değiştirilip devam edilsin mi?"
  - `ID: 398966499049` -> "Kurallar değiştirilip devam edilsin mi?"
  - `ID: 354774024588` -> "Tohum (seed) değiştirilip devam edilsin mi?"
  - `ID: 565937963985` -> "Bu modu yine de etkinleştirmek istiyor musunuz?"
  - `ID: 12407` -> "Kaydedilmemiş tüm ilerleme kaybolacak. Devam edilsin mi?"
  - `ID: 529975158495` -> "Tüm ilerleme kaybolacak. Devam edilsin mi?"
- Öncesinde `backups/Game_pre_newline_fix_20261109_220556.csv` yedeği güvenle alındı.

### `glossary.json`
- 98 adet doğrulanmış kanonik terim ile baştan derlendi.

---

### LQA İterasyonları (v1.0.1 – v1.0.5)
- **v1.0.1 (14 Kayıt):** Askeri / Göreve Çağırma (`Draft` / `Undraft`) arayüz hataları ("Taslağı geri al" -> "Serbest Bırak", "Undraft & Dismount" -> "Serbest Bırak ve İn", "Assigned" -> "Atanan:") düzeltildi.
- **v1.0.2 (22 Kayıt):** Mekanik zırh (Mech) öğreticilerindeki "Attan inme / Attan çıkar" -> "Zırhtan İn / Bin", hava olayı `Cold snap` ("Soğuk ani" -> "Ani Soğuk Dalgası"), `Avid` yetenekleri ("Tutkulu marangoz/çiftçi/terzi") ve "Aşırı Yeme Krizik" yazım hatası giderildi.
- **v1.0.3 (18 Kayıt):** Kulak tıkacı (`Earplugs` -> "birkaç küçük fiş" yerine "bir çift küçük kulak tıkacı"), acil durum kiti (`Emergency rations` -> "Acil durum kumaşı" yerine "Acil durum erzakı"), deyim hatası (`Better safe than sorry` -> "Tedbiri elden bırakmamak gerek"), `Campfire sitting` ("Kamp ateşi başında oturma") ve `Workbench` ("Çalışma Tezgahı") düzeltildi.
- **v1.0.4 (22 Kayıt):** `Site_Scavenge_Noise` ("Bir gürültü!") keşif olayı baştan sona doğallaştırıldı ("Geri gelmek!" -> "Hemen geri dön!", "yaratığı şaşırtın" -> "Siperinden fırla ve yaratığı gafil avla!", "Ayrılmak çok faydalı" -> "Burada bırakılamayacak kadar işe yarar", "Savaş onunla!" -> "Onunla dövüş!", "Güzel bul!" -> "Güzel buluntu!").
- **v1.0.5 (89 Kayıt — `tools/apply_v105_fixes.py`):**
  - **Eşsesli (Homonym) Halüsinasyonları:** `case` (metal çanta/kutu) kelimesinin "olay / dava" ("Lanet davayı kapat!") olarak çevrilmesi (5 kayıt) ve `site` (keşif bölgesi/enkaz) kelimesinin "siteye / siteden / Çökme sitesi / İt dalaşı sitesi" olarak çevrilmesi (12 kayıt) giderildi.
  - **Deyim ve Phrasal Verb Hataları:** `gave in` ("kaya çıkıntısı koptu / enkaz yığını çöktü" yerine "pes etti / boyun eğmek zorunda kaldı"), `unload in canisters` ("bidonlara aktaracağım" yerine "kutuyu boşaltacağım"), `A finger-licking find!` ("Parmak ısırtan bir keşif!"), `That was a close one!` ("Ucuz atlattın!"), `Some genius you are!` ("Sözde dâhi olacaksın!") düzeltildi.
  - **Seçenek / Mastar / Emir Kipi Hataları:** 24 farklı keşif dosyasındaki `Nice find!` ("Güzel bul!" -> "Güzel buluntu!"), `Forget it; come back.` ("Unut gitsin; geri gelmek." -> "Boş ver, hemen kampa dön."), `Fight it!` ("Savaş onunla!" -> "Onunla dövüş!") düzeltildi.
  - **Keşif Haritası (`ExpeditionPreset.lua`):** `Crashed rescue pod` ("Kurtarma podu çöktü" -> "Düşmüş kurtarma kapsülü"), `Silicon deposit` ("Silikon deposu" -> "Silikon yatağı"), `must be abandoned` ("terk edilmesi gerekir" -> "terk edilmiş olmalı"), "hurda toplamaye" yazım hataları giderildi.

---

## 4. DAĞITIM ÇIKTISI

- **Paket:** `dist/StrandedAlienDawn_Turkish_v1.0.5.zip`
- **Boyut:** 1.40 MB
- **SHA-256:** `c2772bcdfb320f8ea1bf7720efa1e901f7f47b72a1945b612e9af1cf693f0b3f`
- **Paket İçeriği:**
  - `Localization/Game.csv`
  - `Fonts/NotoSans-Regular.ttf`
  - `Fonts/NotoSans-Bold.ttf`
  - `items.lua`
  - `metadata.lua` (`version = 105`)
  - `preview.png`
  - `Kurulum.bat`
  - `BENIOKU.txt`
