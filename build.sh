#!/bin/bash

# Script de compilación para QodeIA fitness
# Uso: ./build.sh [debug|release]

set -e

BUILD_TYPE=${1:-release}

echo "🚀 QodeIA fitness - Build Script"
echo "=================================="
echo "Build Type: $BUILD_TYPE"
echo ""

# Verificar que Flutter está instalado
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter no está instalado"
    echo "Descarga Flutter desde: https://flutter.dev/docs/get-started/install"
    exit 1
fi

# Mostrar versión de Flutter
echo "✓ Flutter version:"
flutter --version
echo ""

# Limpiar builds anteriores
echo "🧹 Limpiando builds anteriores..."
flutter clean

# Obtener dependencias
echo "📦 Obteniendo dependencias..."
flutter pub get

# Compilar APK
echo "🔨 Compilando APK ($BUILD_TYPE)..."
if [ "$BUILD_TYPE" = "debug" ]; then
    flutter build apk
else
    flutter build apk --release
fi

# Mostrar ruta del APK
APK_PATH="build/app/outputs/flutter-apk/app-$BUILD_TYPE.apk"
if [ -f "$APK_PATH" ]; then
    echo ""
    echo "✅ APK compilado exitosamente!"
    echo "📍 Ruta: $APK_PATH"
    echo "📊 Tamaño: $(du -h "$APK_PATH" | cut -f1)"
    echo ""
    echo "📱 Para instalar en dispositivo:"
    echo "   adb install -r $APK_PATH"
    echo ""
    echo "🚀 O usa Flutter directamente:"
    echo "   flutter install"
else
    echo "❌ Error: APK no se generó correctamente"
    exit 1
fi
