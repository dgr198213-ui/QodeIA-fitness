@echo off
REM Script de compilación para QodeIA fitness (Windows)
REM Uso: build.bat [debug|release]

setlocal enabledelayedexpansion

set BUILD_TYPE=%1
if "%BUILD_TYPE%"=="" set BUILD_TYPE=release

echo 🚀 QodeIA fitness - Build Script
echo ==================================
echo Build Type: %BUILD_TYPE%
echo.

REM Verificar que Flutter está instalado
where flutter >nul 2>nul
if errorlevel 1 (
    echo ❌ Flutter no está instalado
    echo Descarga Flutter desde: https://flutter.dev/docs/get-started/install
    exit /b 1
)

REM Mostrar versión de Flutter
echo ✓ Flutter version:
flutter --version
echo.

REM Limpiar builds anteriores
echo 🧹 Limpiando builds anteriores...
flutter clean

REM Obtener dependencias
echo 📦 Obteniendo dependencias...
flutter pub get

REM Compilar APK
echo 🔨 Compilando APK (%BUILD_TYPE%)...
if "%BUILD_TYPE%"=="debug" (
    flutter build apk
) else (
    flutter build apk --release
)

REM Mostrar ruta del APK
set APK_PATH=build\app\outputs\flutter-apk\app-%BUILD_TYPE%.apk
if exist "%APK_PATH%" (
    echo.
    echo ✅ APK compilado exitosamente!
    echo 📍 Ruta: %APK_PATH%
    echo.
    echo 📱 Para instalar en dispositivo:
    echo    adb install -r %APK_PATH%
    echo.
    echo 🚀 O usa Flutter directamente:
    echo    flutter install
) else (
    echo ❌ Error: APK no se generó correctamente
    exit /b 1
)
