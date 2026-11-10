# Stranded: Alien Dawn Türkçe Yerelleştirme Pipeline'ı (sndTR)
## Teknik Borç Analizi ve Mimari İyileştirme Raporu (Technical Debt)

**Tarih:** 9 Kasım 2026  
**Proje:** Stranded: Alien Dawn Türkçe Yerelleştirme ve Mod Pipeline Yönetimi  
**Durum:** Kapsamlı Denetim ve Yeniden Yapılandırma Sonrası Analiz  

---

## 1. GİDERİLEN TEKNİK BORÇLAR (RESOLVED TECHNICAL DEBT)

Bu denetim ve geliştirme döngüsü kapsamında projenin uzun vadeli bakımını, taşınabilirliğini ve veri güvenliğini tehdit eden kritik teknik borçlar kalıcı olarak giderilmiştir:

### 1.1. Dağınık ve Sabit Kodlanmış Yol Bağımlılığı (Hardcoded Path Debt)
- **Önceki Durum:** Projede 11 farklı Python dosyasında ve `config.json` içerisinde geliştiricinin eski kişisel bilgisayarına ait `c:\Users\ugurtrsahin\Desktop\sndTR` ve `C:\Users\ugurtrsahin\AppData\...` yolları bulunuyordu. Proje başka bir dizine taşındığında veya başka bir geliştirici tarafından klonlandığında çalışmıyordu.
- **Giderilme Yöntemi:** `tools/paths.py` geliştirilerek `PROJECT_ROOT` nesnesi dinamikleştirildi, tüm göreli ve mutlak yollar platformdan bağımsız çözülebilir hale getirildi.

### 1.2. Atomik Olmayan Dosya Yazma ve Veri Kaybı Riski (Non-Atomic I/O Debt)
- **Önceki Durum:** `Game.csv` ve `memory.json` gibi kritik 15.000+ satırlık veri tabanları doğrudan `open(path, 'w')` ile açılıyordu. İşlem esnasında donma, elektrik kesintisi veya işletim sistemi kilitlemesi durumunda dosya 0 bayta düşerek siliniyordu.
- **Giderilme Yöntemi:** `atomic_write_csv` ve `atomic_write_json` fonksiyonları geliştirildi. Veri önce `.tmp` dosyasına yazılır, diske `fsync()` edilir ve Windows kilitlemelerine karşı 5 denemeli retry mekanizmasıyla atomik olarak hedef dosyanın üzerine taşınır.

### 1.3. Yetersiz Tag/Placeholder Maskeleme (Tag Masking Debt)
- **Önceki Durum:** `tools/fuzzy_tm.py` ve `main.py` etiket korumasında zayıf tekil regex (`<[^>]+>`) kullanıyor, oyun motorunun değişkenlerini (`{Bob}`, `{amount}`) koruyamıyordu. Bu durum çeviri motorlarının XML tag veya değişkenleri çevirmesine ve oyun motorunun çökmesine yol açıyordu.
- **Giderilme Yöntemi:** `tools/tag_masker.py` yazılarak `<<<...>>>`, `<...>` ve `{...}` yapıları sıra duyarlı sentinellerle (`___TAG_0___`) çift aşamalı maskeleme korumasına alındı.

### 1.4. Sessiz Hata Yutan ve Başarı İddia Eden Kalite Kapısı (Silent QA Failure Debt)
- **Önceki Durum:** `tools/run_qa_suite.py` hataları tespit etse bile daima `sys.exit(0)` dönüyordu. Bu durum otomasyon zincirlerinde bozuk çevirilerin fark edilmeden yayınlanmasına olanak tanıyordu.
- **Giderilme Yöntemi:** `run_qa()` fonksiyonu kritik hatalarda `sys.exit(1)`, temiz durumlarda `sys.exit(0)` dönecek şekilde kurumsal CI/CD Kalite Kapısı (Quality Gate) standartlarına uyarlandı.

### 1.5. Windows Batch Kopyalama Mantık Hatası (Batch ERRORLEVEL Debt)
- **Önceki Durum:** `Kurulum.bat` betiğinde ardışık `copy` komutlarının yalnızca en sonuncusunun `ERRORLEVEL` değeri okunuyordu. `Game.csv` veya fontlar kopyalanamasa dahi son komut başarılıysa kullanıcıya "Yama başarıyla yüklendi" deniyordu.
- **Giderilme Yöntemi:** `setlocal enabledelayedexpansion` ve `set "COPY_FAILED=0"` ile her bir `copy` komutuna hata bayrağı eklendi.

### 1.6. Çok Satırlı (Multiline) CSV Ayrıştırma Zafiyeti
- **Önceki Durum:** `tools/test_validation.py` satır sonu denetiminde yalnızca `\\n` arıyordu, CSV hücre içi gerçek multiline satır sonlarını kaçırıyordu. Bu nedenle `Game.csv` içindeki 8 kayıtta eksik kalan soru cümleleri eski QA tarafından fark edilmemişti.
- **Giderilme Yöntemi:** Hem `\\n` hem gerçek `\n` sayımı yapan algoritma yazıldı ve 8 eksik kayıt düzeltildi.

---

## 2. KALAN TEKNİK BORÇLAR VE GELECEK DÖNEM MİMARİ ÖNERİLERİ

Mevcut pipeline yerel geliştirme ve mod dağıtımı için tam kararlı duruma getirilmiştir. Gelecek geliştirme dönemlerinde projeyi daha da ileri taşımak için aşağıdaki mimari geliştirmeler önerilmektedir:

### 2.1. GitHub Actions CI/CD Pipeline Entegrasyonu
- **Mevcut Durum:** Testler ve QA komutları yerel terminalde manuel olarak veya CLI release sırasında çalıştırılmaktadır.
- **Öneri:** Depoya `.github/workflows/ci.yml` eklenerek her commit ve PR üzerinde otomatik olarak:
  - `python -m unittest discover tests`
  - `python main.py qa`
  komutlarının çalıştırılması ve kalite kapısı geçilmeden merge yapılmaması sağlanmalıdır.

### 2.2. Translation Memory (TM) Vektör / SQLite FTS5 Veritabanı
- **Mevcut Durum:** `memory.json` (1.4 MB) JSON dosyası olarak belleğe yüklenmekte ve bellek içi trigram vektörleri ile taranmaktadır. 15.000 satır için bu işlem oldukça hızlıdır (~0.08s).
- **Öneri:** Çeviri hafızası 50.000+ satıra ulaştığında JSON dosyasını belleğe almak yerine yerel bir SQLite veritabanına (`memory.db`) ve FTS5 (Full-Text Search) altyapısına geçilmesi arama süresini ve bellek ayak izini minimize edecektir.

### 2.3. Lua Mod Yapılandırması Sözdizimi Doğrulaması (Lua Syntax Check)
- **Mevcut Durum:** `items.lua` ve `metadata.lua` dosyaları Python testleri tarafından varlık ve paketleme açısından kontrol edilmektedir, ancak Lua syntax (sözdizimi) doğrulaması yapılmamaktadır.
- **Öneri:** `luacheck` veya hafif bir Lua parser ile bu dosyaların sözdizimsel doğruluğunu test eden bir test kurgulanabilir.

### 2.4. Modern Terminal Arayüzü (TUI)
- **Mevcut Durum:** `tools/localization_explorer.py` basit bir konsol `input()` döngüsü kullanmaktadır.
- **Öneri:** `rich` veya `textual` kütüphaneleri kullanılarak renkli, tablolu, sayfalama ve arama destekli modern bir yerelleştirme araştırma konsolu sunulabilir.

---

## 3. SONUÇ VE BAKIM DEĞERLENDİRMESİ

Yapılan refactor çalışmaları sonucunda projenin teknik borç endeksi **Kritik/Yüksek seviyeden Düşük (Kabul Edilebilir) seviyeye indirilmiştir.** Kod tabanı temiz, modüler, test güvencesi altına alınmış ve sürdürülebilir bir yapıya kavuşturulmuştur.
