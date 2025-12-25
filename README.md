# QodeIA fitness - Entrenador Inteligente

Una aplicación Flutter híbrida compilable a APK con:
- 🎯 **Bluetooth HR** (pulsera de fitness) + acelerómetro
- 🧠 **Motor Python** vía Chaquopy + Kotlin MethodChannel
- 🎨 **UI Aura neon** con animaciones rotación/traslación
- 🎤 **Coach por voz** (TTS/STT) en español
- ⏱️ **Workout Timer** con voice triggers
- 📊 **Análisis AGTR15** en tiempo real

## 📋 Requisitos Previos

### Sistema
- **Flutter SDK** >= 3.0.0
- **Android Studio** con NDK
- **Kotlin** >= 1.9.0
- **Python** 3.11 (para Chaquopy)
- **Java** 11+

### Verificación
```bash
flutter doctor
# Debe mostrar: ✓ Flutter (Channel stable)
# ✓ Android toolchain
# ✓ Android Studio
```

## 🚀 Instalación Rápida

### 1. Clonar el repositorio
```bash
git clone https://github.com/qodeia/QodeIA-fitness.git
cd QodeIA-fitness
```

### 2. Obtener dependencias
```bash
flutter clean
flutter pub get
```

### 3. Compilar APK
```bash
flutter build apk --release
```

**Ruta del APK generado:**
```
build/app/outputs/flutter-apk/app-release.apk
```

### 4. Instalar en dispositivo
```bash
flutter install
# O manualmente:
adb install build/app/outputs/flutter-apk/app-release.apk
```

## 📱 Uso de la App

### Inicio Rápido
1. **Activa Bluetooth** en tu dispositivo
2. **Permite permisos** de micrófono y ubicación
3. **Abre QodeIA fitness**
4. **Presiona "Iniciar"** para comenzar el entrenamiento

### Funcionalidades
- **Entrenador por Voz**: Escucha instrucciones en español
- **Timer Inteligente**: Avisos en momentos clave (mitad, 10s, 5s, 3s)
- **Análisis en Tiempo Real**: AGTR15 calcula intensidad
- **Pulsera Bluetooth**: Lee BPM de dispositivos HR (0x180D)
- **Acelerómetro**: Fallback si no hay HR disponible

## 🔧 Configuración Avanzada

### Agregar Pulsera Bluetooth
1. Empareja tu pulsera en Bluetooth del sistema
2. Abre QodeIA fitness
3. La app detectará automáticamente el dispositivo HR
4. Verifica que aparezca "PULSO REAL" en la UI

### Crear Entrenamientos Personalizados
Edita `lib/models/workout_step.dart`:
```dart
static Workout defaultWorkout() {
  return Workout(
    id: 'custom_1',
    name: 'Mi Rutina',
    steps: [
      WorkoutStep(name: 'Calentamiento', durationSeconds: 30),
      WorkoutStep(name: 'Burpees', durationSeconds: 45),
      WorkoutStep(name: 'Descanso', durationSeconds: 15, isRest: true),
      // Agrega más pasos...
    ],
  );
}
```

## 🐛 Solución de Problemas

### MissingPluginException
**Causa**: Canal Kotlin mal escrito
**Solución**: Verifica que `CHANNEL = "qodeia/engine"` sea idéntico en:
- `MainActivity.kt`
- `main.dart`

### ClassNotFoundException
**Causa**: Package name inconsistente
**Solución**: Confirma que todos estos sean `com.example.qodeia_fitness`:
- `AndroidManifest.xml` → `package`
- `build.gradle` → `applicationId`
- `MainActivity.kt` → `package`
- `build.gradle` → `namespace`

### ModuleNotFoundError (Python)
**Causa**: Ruta de Python incorrecta
**Solución**: Verifica que exista:
```
android/app/src/main/python/
├── agtr15_engine.py
└── coach_logic.py
```

### No detecta pulsera Bluetooth
**Checklist**:
1. ✓ Bluetooth activado en el dispositivo
2. ✓ Permisos de ubicación concedidos
3. ✓ Pulsera no conectada a otra app
4. ✓ Pulsera en rango (< 10 metros)
5. ✓ Pulsera soporta 0x180D (Heart Rate Service)

### Audio no funciona
**Solución**: Verifica permisos en:
- `AndroidManifest.xml` → `RECORD_AUDIO`
- `Info.plist` → `NSMicrophoneUsageDescription`

## 📊 Estructura del Proyecto

```
QodeIA-fitness/
├── android/
│   ├── app/
│   │   ├── src/main/
│   │   │   ├── kotlin/com/example/qodeia_fitness/
│   │   │   │   └── MainActivity.kt (MethodChannel)
│   │   │   ├── python/
│   │   │   │   ├── agtr15_engine.py (Motor AGTR15)
│   │   │   │   └── coach_logic.py (Lógica del coach)
│   │   │   └── AndroidManifest.xml (Permisos)
│   │   └── build.gradle (Chaquopy config)
│   └── build.gradle
├── ios/
│   └── Runner/
│       └── Info.plist (Permisos iOS)
├── lib/
│   ├── main.dart (Punto de entrada)
│   ├── controllers/
│   │   └── workout_controller.dart (Lógica del timer)
│   ├── models/
│   │   └── workout_step.dart (Datos del entrenamiento)
│   ├── services/
│   │   └── voice_service.dart (TTS/STT)
│   ├── screens/
│   │   └── home_screen.dart (Pantalla principal)
│   └── widgets/
│       ├── aura_container.dart (UI neon)
│       └── workout_timer.dart (Timer visual)
├── pubspec.yaml (Dependencias)
└── README.md (Este archivo)
```

## 🎤 Triggers de Voz

La app anuncia automáticamente:

| Evento | Frase |
|--------|-------|
| Inicio ejercicio | "Prepárate para [Nombre]. ¡Comenzamos!" |
| Mitad del tiempo | "Vas por la mitad, ¡mantén el ritmo!" |
| 10 segundos | "Quedan 10 segundos" |
| 5 segundos | "Quedan 5 segundos" |
| 3 segundos | "3... 2... 1..." |
| Inicio descanso | "Comienza el descanso." |
| Fin rutina | "Entrenamiento completado. ¡Has hecho un gran trabajo con QodeIA!" |

## 🔐 Permisos Requeridos

### Android
```xml
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACTIVITY_RECOGNITION" />
<uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
```

### iOS
- Micrófono
- Bluetooth
- Ubicación
- Audio en background

## 📦 Compilación

### APK Release
```bash
flutter build apk --release
```

### APK Debug
```bash
flutter build apk
```

### AAB (Google Play)
```bash
flutter build appbundle --release
```

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama (`git checkout -b feature/AmazingFeature`)
3. Commit cambios (`git commit -m 'Add AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📝 Licencia

MIT License - ver `LICENSE` para detalles

## 👨‍💻 Autor

**QodeIA Team**
- GitHub: [@qodeia](https://github.com/qodeia)
- Email: info@qodeia.fitness

## 🙏 Agradecimientos

- Flutter Team
- Chaquopy (Python en Android)
- flutter_blue_plus
- flutter_tts
- speech_to_text

---

**¡Hecho con ❤️ para la comunidad de fitness!**
