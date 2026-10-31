@echo off
setlocal
title Stranded: Alien Dawn - Turkce Yama Kurulumu
color 0B

echo ====================================================================
echo        STRANDED: ALIEN DAWN - TURKCE YERELLESTIRME YAMASI
echo ====================================================================
echo.
echo  Mod dosyalari oyunun mod dizinine yukleniyor...
echo.

set "TARGET_DIR=%APPDATA%\Stranded - Alien Dawn\Mods\StrandedAlienDawn_Turkish"

echo [*] Hedef Dizin: "%TARGET_DIR%"
echo [*] Klasor yapisi olusturuluyor...

if not exist "%TARGET_DIR%\Fonts" mkdir "%TARGET_DIR%\Fonts"
if not exist "%TARGET_DIR%\Localization" mkdir "%TARGET_DIR%\Localization"

echo [*] Dosyalar kopyalaniyor...

copy /Y "%~dp0Fonts\NotoSans-Regular.ttf" "%TARGET_DIR%\Fonts\" >nul
copy /Y "%~dp0Fonts\NotoSans-Bold.ttf" "%TARGET_DIR%\Fonts\" >nul
copy /Y "%~dp0Localization\Game.csv" "%TARGET_DIR%\Localization\" >nul
copy /Y "%~dp0items.lua" "%TARGET_DIR%\" >nul
copy /Y "%~dp0metadata.lua" "%TARGET_DIR%\" >nul
if exist "%~dp0preview.png" copy /Y "%~dp0preview.png" "%TARGET_DIR%\" >nul

if %ERRORLEVEL% EQU 0 (
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
    echo [!] HATA: Dosyalar kopyalanirken bir sorun olustu!
    echo     Lutfen oyunun kapali oldugundan emin olun ve tekrar deneyin.
)

echo.
pause
