# Guía de Compilación - QodeIA fitness

Esta guía te ayudará a compilar la aplicación QodeIA fitness a APK desde tu máquina local.

## 📋 Requisitos Previos

### Software Necesario
- **Flutter SDK** >= 3.0.0
- **Android Studio** o Android SDK
- **Java Development Kit (JDK)** 11 o superior
- **Git** (para clonar el repositorio)
- **Python** 3.11 (para Chaquopy)

### Verificación del Entorno

```bash
# Verificar Flutter
flutter --version

# Verificar Java
java -version

# Verificar Android SDK
flutter doctor -v
```

**Resultado esperado:**
```
✓ Flutter (Channel stable, 3.16.0)
✓ Android toolchain - develop for Android devices
✓ Android Studio (version 2023.1)
✓ Connected device (1 available)
```

## 🚀 Instalación Rápida

### 1. Clonar el Repositorio

```bash
git clone https://github.com/dgr198213-ui/QodeIA-fitness.git
cd QodeIA-fitness
```

### 2. Instalar Dependencias

```bash
# Opción A: Usando make (Linux/Mac)
make get

# Opción B: Comando directo
flutter clean
flutter pub get
```

### 3. Compilar APK

```bash
# Opción A: Usando make (Linux/Mac)
make build-release

# Opción B: Comando directo
flutter build apk --release

# Opción C: Usando script
chmod +x build.sh
./build.sh release

# Opción D: Windows
build.bat release
```

### 4. Ubicación del APK

```
build/app/outputs/flutter-apk/app-release.apk
```

## 📱 Instalación en Dispositivo

### Método 1: Flutter (Recomendado)

```bash
# Conecta tu dispositivo Android via USB
# Habilita "Depuración USB" en Configuración > Opciones de Desarrollador

flutter install
```

### Método 2: ADB Manual

```bash
# Instalar APK
adb install -r build/app/outputs/flutter-apk/app-release.apk

# Desinstalar
adb uninstall com.example.qodeia_fitness

# Reinstalar
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

### Método 3: Transferencia Directa

1. Conecta tu dispositivo por USB
2. Copia el APK a la carpeta de descargas
3. Abre el archivo en tu dispositivo
4. Toca "Instalar"

## 🔧 Compilación Avanzada

### APK Debug (para desarrollo)

```bash
flutter build apk
# Ubicación: build/app/outputs/flutter-apk/app-debug.apk
```

### AAB para Google Play

```bash
flutter build appbundle --release
# Ubicación: build/app/outputs/bundle/release/app-release.aab
```

### Compilación con Información Personalizada

```bash
# Cambiar versión
flutter build apk --release \
  --build-number=2 \
  --build-name=1.0.1

# Especificar arquitectura
flutter build apk --release --target-platform android-arm64
```

## 🛠️ Solución de Problemas

### Error: "Flutter SDK not found"

```bash
# Verificar instalación de Flutter
which flutter

# Si no está en PATH, agregar manualmente
export PATH="$PATH:/path/to/flutter/bin"
```

### Error: "Android SDK not found"

```bash
# Aceptar licencias de Android
flutter doctor --android-licenses

# Instalar SDK manualmente
flutter config --android-sdk-path /path/to/android-sdk
```

### Error: "No connected devices"

```bash
# Verificar dispositivos conectados
adb devices

# Si no aparece, habilitar depuración USB:
# 1. Ir a Configuración > Acerca del teléfono
# 2. Tocar "Número de compilación" 7 veces
# 3. Ir a Configuración > Opciones de Desarrollador
# 4. Habilitar "Depuración USB"
```

### Error: "Gradle build failed"

```bash
# Limpiar y reintentar
flutter clean
flutter pub get
flutter build apk --release

# Si persiste, actualizar Gradle
cd android
./gradlew wrapper --gradle-version 8.1.0
cd ..
```

### Error: "Python module not found"

```bash
# Verificar que Python 3.11 esté instalado
python3 --version

# Chaquopy requiere Python 3.11+
# Si tienes otra versión, instala 3.11 específicamente
```

## 📊 Monitoreo de Compilación

### Ver logs detallados

```bash
flutter build apk --release -v
```

### Analizar tamaño del APK

```bash
flutter build apk --release --analyze-size
```

### Profiling de compilación

```bash
flutter build apk --release --profile
```

## 🔐 Firma de APK (Producción)

### Crear keystore

```bash
keytool -genkey -v -keystore ~/qodeia-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias qodeia-key
```

### Configurar firma en Flutter

Crea `android/key.properties`:
```properties
storePassword=<password>
keyPassword=<password>
keyAlias=qodeia-key
storeFile=/path/to/qodeia-key.jks
```

Luego compila:
```bash
flutter build apk --release
```

## 📈 Optimización

### Reducir tamaño del APK

```bash
# Habilitar ProGuard
flutter build apk --release --obfuscate

# Usar split APK por arquitectura
flutter build apk --release --split-per-abi
```

### Mejorar velocidad de compilación

```bash
# Compilación incremental
flutter build apk --incremental

# Compilar solo para arquitectura específica
flutter build apk --release --target-platform android-arm64
```

## 📚 Recursos Adicionales

- [Flutter Build Documentation](https://flutter.dev/docs/deployment/android)
- [Android Studio Setup](https://developer.android.com/studio/install)
- [Gradle Documentation](https://gradle.org/docs/)
- [Chaquopy Documentation](https://chaquo.com/chaquopy/)

## ✅ Checklist Final

Antes de compilar:
- [ ] Flutter instalado y en PATH
- [ ] Android SDK actualizado
- [ ] Java 11+ instalado
- [ ] Python 3.11+ instalado
- [ ] Repositorio clonado
- [ ] Dependencias instaladas (`flutter pub get`)
- [ ] Dispositivo conectado (si vas a instalar)
- [ ] Depuración USB habilitada (si vas a instalar)

## 🆘 Soporte

Si encuentras problemas:

1. Ejecuta `flutter doctor -v` para diagnosticar
2. Revisa los logs: `flutter build apk --release -v`
3. Abre un issue en GitHub: https://github.com/dgr198213-ui/QodeIA-fitness/issues
4. Consulta la documentación oficial de Flutter

---

**¡Listo para compilar!** 🚀
