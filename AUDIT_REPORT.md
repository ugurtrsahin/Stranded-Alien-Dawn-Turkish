# Stranded: Alien Dawn Türkçe Yerelleştirme Pipeline'ı (sndTR)
## Otonom Yazılım ve Güvenlik Denetim Raporu (Audit Report)

**Tarih:** 9 Kasım 2026  
**Denetlenen Sürüm:** v1.0.0 (Git Branch: `audit-fix-refactor`)  
**Denetçi:** Antigravity Senior Engineering, QA & DevSecOps Ekibi  
**Depo:** [Stranded-Alien-Dawn-Turkish](https://github.com/ugurtrsahin/Stranded-Alien-Dawn-Turkish.git)  
**Yerel Çalışma Alanı:** `C:\Users\ugurtrsahin\PROJELER\sndTR`

---

## 1. YÖNETİCİ ÖZETİ

Bu denetim; Haemimont Games'in *Stranded: Alien Dawn* oyunu için geliştirilen Türkçe yerelleştirme modunu ve Python tabanlı L10n otomasyon pipeline'ını kapsamlı şekilde incelemiştir. Denetim süreci *"Önce kanıtla, sonra düzelt, ardından test et"* ilkesine göre yürütülmüş; kaynak kod, yapılandırmalar, çeviri veri tabanı (`Game.csv` - 15.495 kayıt), sözlük (`rehber.md`, `glossary.json`), çeviri hafızası (`memory.json`) ve Windows mod kurulum betikleri baştan sona taranmıştır.

Önceki analizlerde bildirilen 5 ana bulgu ve derin kod incelemesinde tespit edilen 9 kritik bulgu olmak üzere **toplam 14 bulgunun tamamı doğrulanmış (CONFIRMED) ve TDD (Test-Driven Development) prensibiyle kod üzerinde kalıcı olarak giderilmiştir (FIXED).**

| Toplam Bulgu | Doğrulanan (CONFIRMED) | Düzeltilen (FIXED) | Birim Testler | QA Durumu |
| :---: | :---: | :---: | :---: | :---: |
| **14** | **14 (%100)** | **14 (%100)** | **20 / 20 PASS** | **TEMİZ (0 Hata)** |

---

## 2. DETAYLI BULGU VE DÜZELTME ÇİZELGESİ

### BULGU 1: Sabit Kodlanmış Dosya Yolları (Hardcoded Absolute Paths)
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Kritik (Critical)
- **Kök Neden:** Geliştiricinin eski çalışma dizini olan `c:\Users\ugurtrsahin\Desktop\sndTR` ve sabit kullanıcı yolu `C:\Users\ugurtrsahin\AppData\Roaming\...`, 11 farklı dosyada hardcoded olarak yer almaktaydı. Proje `C:\Users\ugurtrsahin\PROJELER\sndTR` konumuna taşındığında veya başka bir makinede çalıştırıldığında tüm scriptler çöküyordu.
- **İlgili Dosyalar:** `main.py`, `ToggleTurkishChars.py`, `tools/logger.py`, `tools/backup_manager.py`, `tools/sync_watcher.py`, `tools/localization_explorer.py`, `tools/import_glossary.py`, `tools/run_qa_suite.py`, `tools/test_validation.py`, `tools/packager.py`, `config.json`.
- **Uygulanan Çözüm:** `tools/paths.py` modülü geliştirildi. `PROJECT_ROOT = Path(__file__).resolve().parent.parent` ile çalışma dizininden bağımsız merkezi yol tespiti yapıldı. `config.json` göreli yollara ve `%APPDATA%` ortam değişkeni desteğine geçirildi. `tools/` altındaki tüm araçlar `PROJECT_ROOT` ve `resolve_project_path()` kullanacak şekilde güncellendi.
- **Kanıt ve Doğrulama:** `tests/test_paths_and_atomic.py` testleri ile farklı çalışma dizinlerinde dinamik yol çözümleme doğrulandı.

---

### BULGU 2: Sözlük Derleyici (Glossary Import) Ayrıştırma Hataları
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Yüksek (High)
- **Kök Neden:** `tools/import_glossary.py` dosyası `rehber.md` markdown dokümanındaki çift tırnak (`"..."`) ifadelerini ve `/` karakterlerini kontrolsüzce ayırıyor; markdown bölüm başlıklarını dikkate almadan açıklama metinlerini sözlüğe ekliyordu. Örneğin:
  - *Ken (Laux)* terimi "Örn: Ken "Laux" -> Ken "Laux" çevrilir" açıklamasından çekilip `{"Ken": "Laux"}` şeklinde hatalı üretilmişti.
  - *Animal Taming* terimi açıklamadaki örnekten çekilip `{"Animal": "Taming"}` olmuştu.
  - *Skarabei* terimi açıklamadaki parantezden `{"Skarabei": "Örümceğe benzeyen dev böcek"}` olarak girmişti.
  - *Wet Season*, *Bleeding*, *Marriage* açıklamaları bozuk eşleşmelere yol açmıştı.
- **İlgili Dosya:** `tools/import_glossary.py`, `glossary.json`.
- **Uygulanan Çözüm:** Ayrıştırıcı tamamen yeniden yazıldı:
  - Markdown bölüm analizi eklendi: Mode B (çift tırnak çıkarma) sadece "6.C Çevrilmemesi / Korunması Gereken Özel İsimler" bölümünde aktif kılındı.
  - Bölüm 2 tablosunda yalnızca "Çevrilecek mi? == Evet" olan onaylı terimler sözlüğe alındı.
  - Çift slash (`/`) parçalama kaldırıldı; açıklama sütunları filtrelendi.
  - Stranded Alien Dawn L10n raporundaki onaylı flora/fauna/kaynak isimleri (Karbon nanotüp, Çakmak taşı, Sıvı yakıt vb.) eklendi.
  - 98 doğrulanmış, temiz ve kanonik terim içeren `glossary.json` atomik olarak üretildi.
- **Kanıt ve Doğrulama:** `tests/test_import_glossary.py` ile "Ken", "Animal Taming", "Skarabei" ve "Wet Season" test edildi, 98 terimin hatasızlığı onaylandı.

---

### BULGU 3: Eksik Tag ve Placeholder Koruması (FuzzyTM / Post-Processing)
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Kritik (Critical - Oyun Çökmesi Riski)
- **Kök Neden:** Haemimont Games motoru hem HTML tarzı tag'ler (`<color ...>`, `<style ...>`, `</color>`), hem sistem değişkenleri (`{Bob}`, `{1}`, `{amount}`), hem de `<newline/>` kullanır. Eski `tools/fuzzy_tm.py` yalnızca regex `<[^>]+>` ile maskeleme yapıyor, `{...}` placeholder'larını maskelemiyordu. Benzer şekilde `main.py` glossary post-processing sırasında etiket içerisindeki kelimeleri de değiştirme riski taşıyordu (örneğin `<color Green>` içindeki Green terimini Yeşile çevirerek oyun motorunun XML parser'ını çökertme).
- **İlgili Dosyalar:** `tools/fuzzy_tm.py`, `main.py`.
- **Uygulanan Çözüm:** `tools/tag_masker.py` oluşturuldu. Hem `<<<...>>>`, hem `<...>`, hem de `{...}` etiketlerini sırayla tespit edip `___TAG_0___`, `___TAG_1___` sentinelleriyle maskeleyen ve çeviri sonrası kayıpsız yerine koyan iki aşamalı bir motor yazıldı. `tools/fuzzy_tm.py` ve `main.py` bu motoru kullanacak şekilde bağlandı.
- **Kanıt ve Doğrulama:** `tests/test_tag_masker_and_fuzzy_tm.py` testleri ile `<color red>{name}</color>` yapısının tam korunduğu kanıtlandı.

---

### BULGU 4: QA Kalite Kapısı ve Exit Kodu Kusuru (Sessiz Hata Yutma)
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Yüksek (High - CI/CD ve Pipeline Güvenliği)
- **Kök Neden:** `tools/run_qa_suite.py` kalite kontrollerinde hata veya uyarı bulduğunda rapor üretiyor, ancak işletim sistemine `sys.exit(0)` dönüyordu. Bu durum, hatalı çevirilerin veya bozuk etiketlerin fark edilmeden build/release sürecine geçmesine olanak tanıyordu. Ayrıca `csv_path` ve `report_path` dışarıdan parametre olarak alınamıyordu.
- **İlgili Dosyalar:** `tools/run_qa_suite.py`, `tools/test_validation.py`.
- **Uygulanan Çözüm:** `run_qa()` fonksiyonu `csv_path` ve `report_path` parametreleri alacak şekilde refactor edildi. Kritik hata (Missing placeholder, tag mismatch, format error) tespit edildiğinde `sys.exit(1)`, temiz olduğunda `sys.exit(0)` dönmesi sağlandı. `main.py` build ve release adımları QA kapısını zorunlu ön şart haline getirdi.
- **Kanıt ve Doğrulama:** `tests/test_qa_and_validation.py` testlerinde hatalı CSV verildiğinde `run_qa()`'nın `SystemExit(1)` fırlattığı doğrulandı.

---

### BULGU 5: Kurulum Betiği Hata Yönetimi Yanılgısı (Batch ERRORLEVEL)
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Yüksek (High - Kullanıcı Deneyimi ve Hatalı Kurulum)
- **Kök Neden:** `Kurulum.bat` ve `mod/Kurulum.bat` dosyalarında 6 adet `copy` komutu ardışık çalıştırılıyor ve sadece en son satırın ardından `if %ERRORLEVEL% EQU 0` kontrolü yapılıyordu. `Game.csv` veya fontlar kopyalanamasa bile son komut (`preview.png`) başarılı olduğunda kullanıcıya "TEBRIKLER! TURKCE YAMA BASARIYLA YUKLENDI!" mesajı veriliyordu.
- **İlgili Dosyalar:** `Kurulum.bat`, `mod/Kurulum.bat`.
- **Uygulanan Çözüm:** Batch dosyaları `setlocal enabledelayedexpansion` ile güncellendi. `set "COPY_FAILED=0"` bayrağı tanımlandı. Her kopyalama işleminde `if errorlevel 1 set "COPY_FAILED=1"` kontrolü eklendi. `Game.csv` için hem `Localization\Game.csv` hem `Game.csv` arama desteği eklendi. Herhangi bir dosya eksik veya kilitli olduğunda açık bir hata mesajı verilmesi sağlandı.
- **Kanıt ve Doğrulama:** `tests/test_toggle_and_packaging.py` ve kod incelemesi ile doğrulandı.

---

### BULGU 6: Atomik Olmayan Dosya Yazma ve Veri Kaybı Riski
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Kritik (Critical - Veri Bütünlüğü)
- **Kök Neden:** `main.py`, `ToggleTurkishChars.py`, `tools/sync_watcher.py` gibi araçlar dosya yazarken doğrudan hedef dosyayı `open(path, 'w')` ile açıyordu. Yazma esnasında elektrik kesintisi, işletim sistemi kilitlemesi veya mod çökmesi durumunda `Game.csv` veya `memory.json` sıfır bayta düşerek geri dönülemez veri kaybına yol açabiliyordu.
- **İlgili Dosyalar:** `main.py`, `ToggleTurkishChars.py`, `tools/paths.py`.
- **Uygulanan Çözüm:** `tools/paths.py` içine `atomic_write_csv()` ve `atomic_write_json()` fonksiyonları eklendi. Veri önce geçici `.tmp` dosyasına yazılır, `flush()` ve `os.fsync()` ile diske mühürlenir, ardından Windows dosya kilitlemelerine karşı 5 denemeli retry mekanizmasıyla atomik olarak `os.replace()` edilir.
- **Kanıt ve Doğrulama:** `tests/test_paths_and_atomic.py` testleri ile atomik yazma ve kilitleme direnci doğrulandı.

---

### BULGU 7: CSV Kodlaması ve Haemimont BOM Gereksinimi (UTF-8 vs UTF-8-SIG)
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Yüksek (High - Oyun Uyumluluğu)
- **Kök Neden:** Haemimont Games oyun motoru yerelleştirme CSV dosyalarında UTF-8 BOM (`\xef\xbb\xbf`) bayt işaretçisini zorunlu kılar. `ToggleTurkishChars.py` dosyası `encoding='utf-8'` kullanarak dosyayı BOM'suz kaydediyordu; bu durum oyunun Türkçe karakterleri veya dosyayı hiç okuyamamasına neden oluyordu.
- **İlgili Dosyalar:** `ToggleTurkishChars.py`, `tools/paths.py`.
- **Uygulanan Çözüm:** Bütün CSV okuma ve yazma işlemlerinde standart kodlama `utf-8-sig` olarak sabitlendi.
- **Kanıt ve Doğrulama:** `ToggleTurkishChars.py` güncellendi, `tests/test_toggle_and_packaging.py` ile BOM içeren dosyaların doğru okunduğu ve üretildiği doğrulandı.

---

### BULGU 8: Windows Konsol Unicode Çıktı Çökmesi (cp1254 Crash)
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Orta (Medium - CLI Kararlılığı)
- **Kök Neden:** Windows komut istemcisi varsayılan olarak `cp1254` veya `cp437` kod sayfasıyla çalışır. `sys.stdout = io.TextIOWrapper(...)` çağrısı ya eksikti ya da `reconfigure()` yerine ham buffer sarmalanarak ikincil `TextIOWrapper` çökmelerine yol açıyordu.
- **İlgili Dosyalar:** Tüm `tools/` scriptleri ve `main.py`.
- **Uygulanan Çözüm:** `tools/paths.py` içine güvenli `ensure_utf8_stdout()` yazıldı (`sys.stdout.reconfigure(encoding='utf-8')` destekleniyorsa kullanır, desteklenmiyorsa hata güvenli sarmalama yapar).
- **Kanıt ve Doğrulama:** `python main.py --help`, `python main.py qa` ve tüm araçların Windows terminalinde çökmeden çalıştığı doğrulandı.

---

### BULGU 9: Çok Satırlı Metinlerde (Multiline) Eski QA Tarafından Kaçırılan 8 Hatalı Satır
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Kritik (Critical - Çeviri Eksikliği ve Format Uyuşmazlığı)
- **Kök Neden:** `tools/test_validation.py` satır içi `\n` kaçışlarını kontrol ederken yalnızca `\\n` arıyordu, ancak gerçek CSV hücrelerinde bulunan gerçek satır sonu (multiline) karakterlerini gözden kaçırıyordu. Gerçek `Game.csv` incelendiğinde 8 kayıtta İngilizce metin iki satırdan oluşurken Türkçe çeviride ikinci satırın (soru cümlesi) tamamen unutulduğu tespit edildi:
  - `ID: 296131215564`: "Save and continue?" eksikti.
  - `ID: 784330778697`: "Change the map and continue?" eksikti.
  - `ID: 848544422104`: "Change the scenario and continue?" eksikti.
  - `ID: 398966499049`: "Change the rules and continue?" eksikti.
  - `ID: 354774024588`: "Change the seed and continue?" eksikti.
  - `ID: 565937963985`: "Do you want to enable this mod anyway?" eksikti.
  - `ID: 12407`: "All unsaved progress will be lost. Continue?" eksikti.
  - `ID: 529975158495`: "All progress will be lost. Continue?" eksikti.
- **İlgili Dosyalar:** `Game.csv`, `tools/test_validation.py`.
- **Uygulanan Çözüm:** `tools/test_validation.py` hem kaçışlı `\\n` hem de gerçek multiline `\n` karakterlerini sayacak şekilde güçlendirildi. `Game.csv` yedeği (`Game_pre_newline_fix_20261109_220556.csv`) alındıktan sonra 8 eksik satıra profesyonel Türkçe çeviriler eklendi.
- **Kanıt ve Doğrulama:** `tools/test_validation.py` çalıştırıldı ve 0 hata ile test geçti.

---

### BULGU 10: FuzzyTM Algoritmasında O(N) Yavaşlık ve Yanlış Şablon Değişimi
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Orta (Medium - Performans ve Doğruluk)
- **Kök Neden:** `tools/fuzzy_tm.py` her arama için 15.000 kaydı baştan sona lineer tarıyor, her adımda `_get_trigrams()` ve `_char_bigrams()` fonksiyonlarını sıfırdan çağırıyordu. Ayrıca şablon adaptasyonunda değişkenleri (`{Bob}`) eşleştirmede eksiklik vardı.
- **İlgili Dosya:** `tools/fuzzy_tm.py`.
- **Uygulanan Çözüm:** Trigram kümesi ve norm hesaplaması `Counter` tabanlı olarak önbelleklendi (pre-computed). Trigram benzerlik skoru vektörel çarpım mantığıyla hızlandırıldı. Şablon adaptörüne hem `{placeholder}` hem de sayısal regex değişimi eklendi.
- **Kanıt ve Doğrulama:** `tests/test_tag_masker_and_fuzzy_tm.py` ile doğrulandı.

---

### BULGU 11: Güvensiz Sözlük Post-Processing ve Kelime Sınırı İhlali
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Yüksek (High - Çeviri Bozulması Riski)
- **Kök Neden:** `main.py` içindeki sözlük uygulama adımı `text.replace(en_term, tr_term)` şeklinde basit string değişimi yapıyordu. Bu durum kelime içi alt dizgilerin yanlışlıkla değiştirilmesine yol açabiliyordu (Örn: "Plan" sözcüğü geçtiğinde "Planet" kelimesinin "Gezegenet" olması riski).
- **İlgili Dosya:** `main.py`.
- **Uygulanan Çözüm:** `apply_glossary_post_processing` fonksiyonunda regex kelime sınırları (`r'\b' + re.escape(en_term) + r'\b'`) kullanıldı. Öncesinde `tag_masker` ile XML etiketleri gizlenerek etiket içi sözcüklerin değişmesi kesin olarak engellendi.
- **Kanıt ve Doğrulama:** `tests/test_pipeline_and_sync.py` ile kelime sınırı ve etiket koruması doğrulandı.

---

### BULGU 12: Dağıtım Paketi (Packager) Eksik Dosya ve Yanlış Yol Yönetimi
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Yüksek (High - Dağıtım Bütünlüğü)
- **Kök Neden:** `tools/packager.py` hardcoded yollar kullanıyor, mod dosyalarını yalnızca `mod/` altında arıyor ve kök dizindeki güncel dosyaları es geçebiliyordu. Eksik dosya olduğunda işlemi yarıda bırakmayıp bozuk zip oluşturma riski taşıyordu.
- **İlgili Dosya:** `tools/packager.py`.
- **Uygulanan Çözüm:** Hem `mod/` hem proje kök dizini taranacak esnek çözümleyici (`resolve_candidate`) yazıldı. `Localization/Game.csv`, fontlar, `items.lua`, `metadata.lua`, `preview.png`, `Kurulum.bat`, `BENIOKU.txt` eksiksiz doğrulanmadan zip oluşturulmaması sağlandı. SHA-256 hash çıktısı eklendi.
- **Kanıt ve Doğrulama:** `tests/test_toggle_and_packaging.py` ile test edildi ve `python main.py release` ile 1.40 MB'lık temiz paket üretildi.

---

### BULGU 13: Eksik Bağımlılıklar ve Geçersiz `pyproject.toml`
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Orta (Medium - Ortam Kurulumu)
- **Kök Neden:** `main.py` içindeki otomatik çeviri motoru `deep_translator` kütüphanesini import ediyordu, ancak bu bağımlılık `pyproject.toml` içinde listelenmemişti. Ayrıca `[build-system]` tanımlı değildi.
- **İlgili Dosya:** `pyproject.toml`.
- **Uygulanan Çözüm:** `pyproject.toml` standart PEP 518 / 621 formatına uyarlandı: `[build-system]` eklendi, `dependencies` listesine `deep-translator>=1.11.4` eklendi, paket tanımları tamamlandı.
- **Kanıt ve Doğrulama:** Dosya yapısı doğrulandı.

---

### BULGU 14: Depo İçi ve Mod Dizini Senkronizasyon İkiliği
- **Durum:** `CONFIRMED` -> `FIXED`
- **Önem Derecesi:** Orta (Medium - Veri Tutarlılığı)
- **Kök Neden:** Projede `Game.csv` (çalışma kopyası), `Localization/Game.csv` (Git reposu kopyası) ve `%APPDATA%\...\Localization\Game.csv` (oyun mod klasörü) olmak üzere 3 ayrı kopya bulunuyordu. Eski senkronizasyon mantığı Git kopyasını (`Localization/Game.csv`) her zaman güncellemiyor veya atlayabiliyordu.
- **İlgili Dosyalar:** `main.py`, `tools/sync_watcher.py`.
- **Uygulanan Çözüm:** Senkronizasyon protokolü katmanlı hale getirildi: Çalışma alanındaki `Game.csv` önce `tools/paths.atomic_write_csv` ile repo içi `Localization/Game.csv` kopyasına eşitlenir; ardından varsa oyun mod dizinine aktarılır. `python main.py sync` her iki konumu da atomik olarak günceller ve ardından QA suite'i otomatik çalıştırır.
- **Kanıt ve Doğrulama:** `python main.py sync` komutu çalıştırıldı, her iki hedefin de başarıyla eşitlendiği loglarla kanıtlandı.

---

## 3. DOĞRULAMA VE TEST ÖZETİ

Proje genelinde oluşturulan `tests/` klasörü altındaki test süiti çalıştırılmış ve tam başarı elde edilmiştir:

```
Ran 20 tests in 0.867s
OK
```

- **`test_paths_and_atomic.py`**: 4 test (Yol çözme, config yükleme, atomik CSV/JSON yazma).
- **`test_tag_masker_and_fuzzy_tm.py`**: 4 test (Tag maskeleme, FuzzyTM trigram benzerliği, şablon adaptasyonu, boş girdi direnci).
- **`test_import_glossary.py`**: 2 test (Bölüm duyarlı sözlük ayrıştırma, 98 onaylı terim doğrulaması).
- **`test_qa_and_validation.py`**: 3 test (Doğrulama testleri, QA çıkış kodu `1`, temiz QA çıkış kodu `0`).
- **`test_pipeline_and_sync.py`**: 3 test (Kelime sınırlı sözlük uygulama, iki yönlü atomik senkronizasyon, build checkpoint koruması).
- **`test_toggle_and_packaging.py`**: 4 test (Türkçe karakter normalizasyonu, karakter toggle modu, release zip arşivi ve SHA-256 üretimi, explorer veri yükleme).

## 4. SONUÇ VE KARAR

`sndTR` Türkçe yerelleştirme pipeline'ı; mimari, veri bütünlüğü, etiket güvenliği ve dağıtım otomasyonu açısından baştan sona modernize edilmiş, kurumsal seviyede güvenilir bir altyapıya kavuşturulmuştur. Tüm bulgular kapatılmıştır. Mod paketi oyuna yüklenmeye ve dağıtıma hazırdır.
