@echo off
setlocal enabledelayedexpansion
title Stranded: Alien Dawn - Turkce Yama Kurulumu
color 0B

echo ====================================================================
echo        STRANDED: ALIEN DAWN - TURKCE YERELLESTIRME YAMASI
echo ====================================================================
echo.
echo  Mod dosyalari oyunun mod dizinine yukleniyor...
echo.

set "TARGET_DIR=%APPDATA%\Stranded - Alien Dawn\Mods\StrandedAlienDawn_Turkish"
set "COPY_FAILED=0"

echo [*] Hedef Dizin: "%TARGET_DIR%"
echo [*] Klasor yapisi olusturuluyor...

if not exist "%TARGET_DIR%\Fonts" mkdir "%TARGET_DIR%\Fonts"
if not exist "%TARGET_DIR%\Localization" mkdir "%TARGET_DIR%\Localization"

echo [*] Dosyalar kopyalaniyor...

if exist "%~dp0Fonts\NotoSans-Regular.ttf" (
    copy /Y "%~dp0Fonts\NotoSans-Regular.ttf" "%TARGET_DIR%\Fonts\" >nul
    if errorlevel 1 set "COPY_FAILED=1"
) else (
    echo [!] UYARI: Fonts\NotoSans-Regular.ttf bulunamadi.
    set "COPY_FAILED=1"
)

if exist "%~dp0Fonts\NotoSans-Bold.ttf" (
    copy /Y "%~dp0Fonts\NotoSans-Bold.ttf" "%TARGET_DIR%\Fonts\" >nul
    if errorlevel 1 set "COPY_FAILED=1"
) else (
    echo [!] UYARI: Fonts\NotoSans-Bold.ttf bulunamadi.
    set "COPY_FAILED=1"
)

if exist "%~dp0Localization\Game.csv" (
    copy /Y "%~dp0Localization\Game.csv" "%TARGET_DIR%\Localization\" >nul
    if errorlevel 1 set "COPY_FAILED=1"
) else if exist "%~dp0Game.csv" (
    copy /Y "%~dp0Game.csv" "%TARGET_DIR%\Localization\" >nul
    if errorlevel 1 set "COPY_FAILED=1"
) else (
    echo [!] HATA: Game.csv yerellestirme dosyasi bulunamadi!
    set "COPY_FAILED=1"
)

if exist "%~dp0items.lua" (
    copy /Y "%~dp0items.lua" "%TARGET_DIR%\" >nul
    if errorlevel 1 set "COPY_FAILED=1"
) else (
    echo [!] UYARI: items.lua bulunamadi.
    set "COPY_FAILED=1"
)

if exist "%~dp0metadata.lua" (
    copy /Y "%~dp0metadata.lua" "%TARGET_DIR%\" >nul
    if errorlevel 1 set "COPY_FAILED=1"
) else (
    echo [!] UYARI: metadata.lua bulunamadi.
    set "COPY_FAILED=1"
)

if exist "%~dp0preview.png" (
    copy /Y "%~dp0preview.png" "%TARGET_DIR%\" >nul
)

if "!COPY_FAILED!"=="0" (
    echo.
    echo ====================================================================
    echo  [+] TEBRIKLER! TURKCE YAMA BASARIYLA YUKLENDI!
    echo ====================================================================
    echo.
    echo  OYUNDA AKTIFLESTIRME ADIMLARI:
    echo  1. Stranded: Alien Dawn oyununu baslatin.
    echo  2. Ana menuden "Mod Manager" [Mod Yoneticisi] ekranina girin.
    echo  3. "Stranded: Alien Dawn - Turkce Yama" modunu bulun ve "Enable" yapin.
    echo  4. Oyun ayarlarindan dili "English" [Ingilizce] olarak secin.
    echo.
    echo  Iyi oyunlar dileriz!
    echo ====================================================================
) else (
    echo.
    echo ====================================================================
    echo  [!] HATA: Dosyalar kopyalanirken bir veya daha fazla sorun olustu!
    echo      Lutfen oyunun kapali oldugundan emin olun ve tekrar deneyin.
    echo ====================================================================
)

echo.
pause
