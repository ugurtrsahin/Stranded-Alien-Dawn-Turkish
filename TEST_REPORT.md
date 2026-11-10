# Stranded: Alien Dawn Türkçe Yerelleştirme Pipeline'ı (sndTR)
## Test ve Kalite Güvence Doğrulama Raporu (Test Report)

**Tarih:** 10 Kasım 2026  
**Güncel Sürüm:** v1.0.10 (İkinci Dalga Tam-CSV LQA Denetimi: Menü/Buton Eşsesli Kelimeler, Büyük Harf Karakterler, Kritik Öğreticiler & Terim Tutarlılığı)  
**Test Ortamı:** Windows 10/11, PowerShell, Python 3  
**Çalışma Alanı:** `C:\Users\ugurtrsahin\PROJELER\sndTR`  
**Git Branch:** `audit-fix-refactor`  
**Genel Sonuç:** **BAŞARILI (ALL TESTS PASSED - 23/23 PASS, 0 HATA)**  

---

## 0. v1.0.10 ÇEVİRİ VE MOD PENCERESİ DOĞRULAMA SONUÇLARI

- **438 İkinci Dalga Tam-CSV LQA Kaydı Doğrulaması (`tools/apply_v110_fixes.py`):** 15.495 satırlık `Game.csv` veri tabanında `438` hedefli iyileştirme uygulandı (`0` etiket/satır sonu atlaması, `0` eksik ID). Menü ve buton halüsinasyonları (`APPLY -> UYGULA`, `RATE -> DEĞERLENDİR`, `IMPORT -> İÇE AKTAR`, `CREDITS -> EMEĞİ GEÇENLER`, `Master Volume -> Ana Ses Düzeyi`, `Author (desc) -> Yazar (azalan)`, `Pet -> Sev`, `Slaughter -> Kesim`, `Butcher -> Doğra`, `Charge -> Şarj`, `mine -> mayın`), büyük harf küçük `ğ`/`ş` karakter hataları (`0` kalıntı), `Nothing To Lose` (`Kaybedecek Bir Şey Yok`), kritik öğretici terslikleri (`Unpause the game`, depolama rafları taşıma yönü), terim tutarlılığı (`Fullness -> Tokluk`, `Relaxation -> Rahatlama`, `Crash Landing -> Zorunlu İniş`, `Overlays -> Katmanlar`, `Cook stove -> Yemek ocağı`) ve kalan 11 `exploding skarabei` / teknoloji / keşif metni düzeltildi.
- **Canlı Mod Senkronizasyonu ve Bütünlük Testleri:** Yeni `test_v110_localization_lqa_integrity` dahil 23/23 birim test `OK` döndü, `main.py qa` `0` hata verdi, `main.py sync` ile canlı oyun mod klasörü (`v1.0.10` / `110`) güncellendi.
- **v1.0.10 Yayın Paketi:** `dist/StrandedAlienDawn_Turkish_v1.0.10.zip` (1.40 MB, SHA-256: `dc3f0c70aefb01669254ab33521c3f093750e9d7824aec50a874a3d049f945f0`) üretildi.

### v1.0.9 Önceki Doğrulama Kaydı

- **648 Tam-CSV LQA Kaydı Doğrulaması (`tools/apply_v109_fixes.py`):** 483 nokta atışı ID düzeltmesi ve 165 programatik `<tag>'ek` / `</em>'ek` temizliği ile tüm `Game.csv` (15.495 satır) içinde kalan dinamik etiket kesme çakışmaları `0`'a indirildi (`Remaining tag-apostrophe clashes: 0`). Eşsesli kelime halüsinasyonları (`Fan -> Vantilatör`, `Handpan -> Handpan`, `Distillery -> Damıtımevi`, `Bedroll -> Uyku tulumu`, `Rate Mod -> Modu Değerlendir`, `Will berries -> Yabani meyveler`, `Buzzshroom -> Vızıltı mantarı`, `Skarabei -> Bokböceği`, `Hydroponic -> Hidroponik`), `HappinessFactor` / `TalkTopicDef` / `JournalEntry` şahıs ve çatı hataları, `Umayr`/`Zander` biyografileri ve öğretici bozulmaları (`Natural curiosity`, `bisiklete bindirebilirsiniz`) düzeltildi.
- **Canlı Mod Senkronizasyonu ve Bütünlük Testleri:** Yeni `test_v109_localization_lqa_integrity` dahil 22/22 birim test `OK` döndü, `main.py qa` `0` hata verdi, `main.py sync` ile canlı oyun mod klasörü (`v1.0.9` / `109`) güncellendi.
- **v1.0.9 Yayın Paketi:** `dist/StrandedAlienDawn_Turkish_v1.0.9.zip` (1.40 MB, SHA-256: `7ac06833e67c27b6b0c370d5db3ab9b7dfac7ec8bc19f389ac6164105602f8ec`) üretildi.

### v1.0.8 Önceki Doğrulama Kaydı

- **389 Üretim, Tarif, Kaynak, Kamp Arayüzü ve Teknoloji Ağacı Kaydı Doğrulaması:** Çalışma tezgahı arayüzündeki `'Until'` -> `'Şu sayıya kadar'`, `'<positive>Awaiting materials</positive>'` -> `'<positive>Malzeme bekleniyor</positive>'`, `'Stokta var'` -> `'Stok:'`, `'Yapma zamanı'` -> `'Üretim süresi'`, `'Sıfır başarısızlık:'` -> `'Hatasız üretim:'`, `'Sentetik tekstiller'` -> `'Sentetik kumaş'`, `'Akaryakıt'` -> `'Sıvı yakıt'`, `'Kökleri çiğneyin'` -> `'Çiğneme kökü'`, `'Eğim'` -> `'Bulamaç'`, kazazede baş üstü `'<status>: <target>'` formatı ve 164 Teknoloji Ağacı `'Açılanlar'` / `'* Çalışma tezgahlarında üretilir'` satırı düzeltildi. QA suite'i ve yeni `test_v108_crafting_and_production_terminology_integrity` birim testi 0 hata ile onayladı.
- **Canlı Mod Senkronizasyonu Doğrulaması:** `main.py sync` ile `metadata.lua` (v1.0.8), `items.lua`, `preview.png`, fontlar ve `Game.csv` dosyalarının `%APPDATA%\...\Mods\StrandedAlienDawn_Turkish\` dizinine tam eşitlendiği doğrulandı.
- **v1.0.8 Yayın Paketi:** `dist/StrandedAlienDawn_Turkish_v1.0.8.zip` başarıyla üretildi (SHA-256: `57fd75292bdef0907933c00e2eef777dca96445189dc968479fedfbc5dc829a2`).

---

## 1. TEST ÖZETİ TABLOSU

| Test Grubu | Test Dosyası | Test Sayısı | Başarılı | Başarısız | Süre |
| :--- | :--- | :---: | :---: | :---: | :---: |
| **Yol & Atomik I/O** | `tests/test_paths_and_atomic.py` | 4 | 4 | 0 | 0.05s |
| **Tag & FuzzyTM** | `tests/test_tag_masker_and_fuzzy_tm.py` | 4 | 4 | 0 | 0.08s |
| **Sözlük Ayrıştırıcı** | `tests/test_import_glossary.py` | 2 | 2 | 0 | 0.06s |
| **QA & Doğrulama** | `tests/test_qa_and_validation.py` | 6 | 6 | 0 | 0.25s |
| **Pipeline & Sync** | `tests/test_pipeline_and_sync.py` | 3 | 3 | 0 | 0.22s |
| **Toggle & Packager** | `tests/test_toggle_and_packaging.py` | 4 | 4 | 0 | 0.09s |
| **TOPLAM BİRİM TEST** | `python -m unittest discover tests` | **23** | **23** | **0** | **< 1.0s** |

---

## 2. BİRİM TEST DETAYLARI

### 2.1. `tests/test_paths_and_atomic.py`
1. `test_project_root_detection`: `PROJECT_ROOT` nesnesinin geçerli bir dizin olduğunu ve kök göstergelerini (`Game.csv`, `main.py`) içerdiğini doğrular. (**PASS**)
2. `test_resolve_project_path`: Göreli ve mutlak yolların platform bağımsız doğru çözüldüğünü doğrular. (**PASS**)
3. `test_load_project_config`: `config.json` dosyasının ortam değişkenleri (`%APPDATA%`) ile birlikte güvenle okunduğunu doğrular. (**PASS**)
4. `test_atomic_write_csv_and_json`: Geçici dosya (`.tmp`), UTF-8-SIG BOM yazımı, veri bütünlüğü ve atomik yer değiştirme mantığını doğrular. (**PASS**)

### 2.2. `tests/test_tag_masker_and_fuzzy_tm.py`
1. `test_mask_and_unmask_tags`: Hem XML etiketlerinin (`<color #ff0000>...</color>`) hem de dinamik değişkenlerin (`{Bob}`, `{1}`) sıralı ve kayıpsız maskelenip açıldığını doğrular. (**PASS**)
2. `test_fuzzy_tm_similarity`: Önceden hesaplanmış Trigram vektör benzerliğinin doğruluğunu ve eşik değerini test eder. (**PASS**)
3. `test_fuzzy_tm_template_adaptation`: Sayısal ve metinsel değişkenlerin şablon cümlelere tam uyarlandığını test eder. (**PASS**)
4. `test_fuzzy_tm_empty_and_edge_cases`: Boş veri tabanı, geçersiz girdi ve sınır durumlarında güvenli davranışı doğrular. (**PASS**)

### 2.3. `tests/test_import_glossary.py`
1. `test_glossary_parsing_mode_safety`: Markdown ayrıştırıcısının "Ken Laux", "Animal Taming", "Skarabei", "Wet Season" gibi tuzak kayıtları açıklamalardan çekmediğini ve yalnızca onaylı sütunları aldığını doğrular. (**PASS**)
2. `test_actual_glossary_output`: Derlenen `glossary.json` dosyasında tam 98 adet kanonik terim olduğunu ve bozuk eşleşme içermediğini doğrular. (**PASS**)

### 2.4. `tests/test_qa_and_validation.py`
1. `test_validation_detects_newline_mismatch`: Multiline ve kaçışlı satır sonu uyuşmazlıklarının başarıyla yakalandığını test eder. (**PASS**)
2. `test_run_qa_fails_on_broken_csv`: Bozuk etiket veya eksik placeholder içeren dosyalarda `run_qa()` fonksiyonunun `SystemExit(1)` verdiğini doğrular. (**PASS**)
3. `test_run_qa_passes_on_clean_csv`: Temiz ve kurallara uygun CSV dosyalarında `run_qa()` fonksiyonunun `SystemExit(0)` (başarılı) döndüğünü doğrular. (**PASS**)

### 2.5. `tests/test_pipeline_and_sync.py`
1. `test_glossary_word_boundary`: Sözlük uygulama adımının kelime içi parçaları bozmadığını ("Planet" kelimesinin "Gezegenet" olmadığını) doğrular. (**PASS**)
2. `test_sync_files_two_step`: `Game.csv` dosyasının önce repo içi `Localization/Game.csv`ye, ardından oyun mod klasörüne atomik olarak eşitlendiğini doğrular. (**PASS**)
3. `test_build_checkpoint_preservation`: Çeviri işlemi sırasında kesinti olduğunda checkpoint ile mevcut çevirilerin korunduğunu test eder. (**PASS**)

### 2.6. `tests/test_toggle_and_packaging.py`
1. `test_apply_normalization`: ğ, Ğ, ş, Ş harflerinin normalizasyonunu; ç, ö, ü vb. harflerin bozulmadan korunduğunu doğrular. (**PASS**)
2. `test_toggle_turkish_chars_file_execution`: Gerçek mod (Mode 1) ve Güvenli mod (Mode 2) dosya yazma işlemlerinin `utf-8-sig` ile çalıştığını doğrular. (**PASS**)
3. `test_packager_success_and_missing_files`: Dağıtım paketleyicisinin eksik dosyalarda işlemi durdurduğunu; tam ortamda geçerli zip arşivi ve SHA-256 ürettiğini doğrular. (**PASS**)
4. `test_localization_explorer_load_data`: Arama motorunun CSV dosyasını doğru kolon indeksleriyle yüklediğini doğrular. (**PASS**)

---

## 3. CANLI YERELLEŞTİRME VERİSİ (LQA) VE CSV BÜTÜNLÜK SONUÇLARI

### 3.1. `Game.csv` Bütünlük Taraması (15.495 Kayıt)
- **Toplam Kayıt:** 15.495 satır
- **CSV Format / Delimiter:** Virgül (`,`), tırnak kaçışlı (`"`), `utf-8-sig` (BOM)
- **Eski QA Tarafından Kaçırılan 8 Hatalı Satırın Düzeltilmesi:**
  - ID 296131215564: "Save and continue?" -> "Kaydedip devam edilsin mi?" (Düzeltildi)
  - ID 784330778697: "Change the map and continue?" -> "Harita değiştirilip devam edilsin mi?" (Düzeltildi)
  - ID 848544422104: "Change the scenario and continue?" -> "Senaryo değiştirilip devam edilsin mi?" (Düzeltildi)
  - ID 398966499049: "Change the rules and continue?" -> "Kurallar değiştirilip devam edilsin mi?" (Düzeltildi)
  - ID 354774024588: "Change the seed and continue?" -> "Tohum (seed) değiştirilip devam edilsin mi?" (Düzeltildi)
  - ID 565937963985: "Do you want to enable this mod anyway?" -> "Bu modu yine de etkinleştirmek istiyor musunuz?" (Düzeltildi)
  - ID 12407: "All unsaved progress will be lost. Continue?" -> "Kaydedilmemiş tüm ilerleme kaybolacak. Devam edilsin mi?" (Düzeltildi)
  - ID 529975158495: "All progress will be lost. Continue?" -> "Tüm ilerleme kaybolacak. Devam edilsin mi?" (Düzeltildi)

### 3.2. `tools/run_qa_suite.py` Canlı Doğrulama Çıktısı:
```text
[22:12:18] INFO    : QA ve Kalite Güvence testleri başlatılıyor...
[22:12:18] SUCCESS : Tüm kalite güvence ve bütünlük testleri BAŞARIYLA GEÇTİ.
Çıkış Kodu: 0
Kritik Hata: 0
Eksik Placeholder: 0
Tag Uyuşmazlığı: 0
```

---

## 4. CLI ENTEGRASYON VE ÇALIŞMA TESTLERİ

Aşağıdaki komutlar terminal üzerinden fiilen çalıştırılmış ve davranışları doğrulanmıştır:

| Komut | Beklenen Davranış | Gerçekleşen Sonuç | Durum |
| :--- | :--- | :--- | :---: |
| `python main.py --help` | Kullanılabilir komutları listeleme | Tüm komutlar Türkçe açıklamalarla listelendi | **PASS** |
| `python main.py import-glossary` | rehber.md'den glossary.json derleme | 98 terim temiz biçimde üretildi | **PASS** |
| `python main.py sync` | Git kopyası ve mod kopyasını eşitleme | İki hedef eşitlendi, QA otomatik çalıştı | **PASS** |
| `python main.py qa` | Kalite kontrollerini çalıştırma | 15.495 satır tarandı, 0 hata ile geçti | **PASS** |
| `python main.py rotate-backups` | Eski yedekleri temizleme | Güvenli çalıştı, hata vermedi | **PASS** |
| `python main.py release --version 1.0.6` | Sürüm paketi ve SHA-256 üretimi | `StrandedAlienDawn_Turkish_v1.0.6.zip` (1.40 MB, SHA-256: `b460fbec37d85ecd1a5d882a85a165fcba202ffbcd0452af802af754e268cba9`) üretildi | **PASS** |
| `python main.py release --version 1.0.7` | Sürüm paketi ve SHA-256 üretimi | `StrandedAlienDawn_Turkish_v1.0.7.zip` (1.40 MB, SHA-256: `35464fe934fe46a74910ef1eff2e3fa4c233c91a0dcda9116cbcf03c6eac31c1`) üretildi | **PASS** |

---

## 5. SONUÇ

sndTR yerelleştirme projesi, LQA v1.0.7 çeviri iyileştirmeleri (toplam 387+ kritik LQA satır düzeltmesi) ve pipeline altyapısı tüm test aşamalarını (20/20 birim testi, 0 QA hatası, 0 bütünlük hatası) sıfır hata ve tam uyumlulukla tamamlamıştır.
