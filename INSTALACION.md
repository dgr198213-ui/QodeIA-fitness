# Instalación de QodeIA fitness

Guía paso a paso para instalar QodeIA fitness en tu dispositivo Android.

## 🎯 Opción 1: Instalar APK Compilado (Más Fácil)

### Paso 1: Descargar el APK

1. Ve a: https://github.com/dgr198213-ui/QodeIA-fitness/releases
2. Descarga el archivo `app-release.apk` más reciente
3. Guarda el archivo en tu dispositivo Android

### Paso 2: Habilitar Instalación desde Fuentes Desconocidas

1. Abre **Configuración** en tu dispositivo
2. Ve a **Seguridad** o **Privacidad**
3. Busca **"Fuentes desconocidas"** o **"Instalar apps de fuentes desconocidas"**
4. Habilita la opción
5. Selecciona tu navegador o gestor de archivos

### Paso 3: Instalar la App

1. Abre el archivo `app-release.apk`
2. Toca el botón **"Instalar"**
3. Espera a que termine la instalación
4. Toca **"Abrir"** para ejecutar la app

### Paso 4: Conceder Permisos

Cuando abras QodeIA fitness por primera vez, te pedirá permisos:
- ✅ **Micrófono** - Para el coach por voz
- ✅ **Bluetooth** - Para conectar pulsera de fitness
- ✅ **Ubicación** - Para escanear dispositivos Bluetooth
- ✅ **Actividad Física** - Para leer acelerómetro

Toca **"Permitir"** en cada solicitud.

## 🔧 Opción 2: Compilar Localmente (Para Desarrolladores)

### Requisitos

```bash
# Verificar que tienes instalado:
flutter --version    # Flutter 3.0+
java -version        # Java 11+
python3 --version    # Python 3.11+
```

### Pasos

1. **Clonar repositorio**
```bash
git clone https://github.com/dgr198213-ui/QodeIA-fitness.git
cd QodeIA-fitness
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Compilar APK**
```bash
# Opción A: Comando directo
flutter build apk --release

# Opción B: Usando script (Linux/Mac)
./build.sh release

# Opción C: Usando Makefile
make build-release

# Opción D: Windows
build.bat release
```

4. **Instalar en dispositivo**
```bash
# Conecta tu dispositivo por USB
# Habilita "Depuración USB"

flutter install
```

## 📱 Configuración Inicial

### Primera Ejecución

1. **Abre QodeIA fitness**
2. **Concede todos los permisos** solicitados
3. **Conecta tu pulsera Bluetooth** (opcional):
   - Ve a Configuración > Bluetooth
   - Busca tu pulsera de fitness
   - Empareja el dispositivo
4. **Presiona "Iniciar"** para comenzar tu primer entrenamiento

### Solución de Problemas Iniciales

**La app no abre:**
- Asegúrate de haber concedido todos los permisos
- Reinicia el dispositivo
- Desinstala y reinstala la app

**No detecta la pulsera:**
- Verifica que Bluetooth esté activado
- Asegúrate de que la pulsera no está conectada a otra app
- Reinicia tanto el dispositivo como la pulsera
- Verifica que la pulsera sea compatible (debe tener Heart Rate Service 0x180D)

**El audio no funciona:**
- Verifica que el volumen no esté silenciado
- Concede permiso de micrófono
- Reinicia la app

## 🔄 Actualizar la App

### Desde APK

1. Descarga el nuevo `app-release.apk`
2. Abre el archivo
3. Toca **"Actualizar"**
4. Espera a que termine

### Desde Código Fuente

```bash
cd QodeIA-fitness
git pull origin master
flutter pub get
flutter build apk --release
flutter install
```

## 🗑️ Desinstalar

### Método 1: Desde Configuración

1. Abre **Configuración**
2. Ve a **Aplicaciones** o **Gestor de aplicaciones**
3. Busca **QodeIA fitness**
4. Toca **"Desinstalar"**

### Método 2: Desde Terminal

```bash
adb uninstall com.example.qodeia_fitness
```

## 📊 Información de la App

| Propiedad | Valor |
|-----------|-------|
| Nombre | QodeIA fitness |
| Paquete | com.example.qodeia_fitness |
| Versión | 1.0.0 |
| Tamaño | ~50-100 MB (depende de arquitectura) |
| Requisitos | Android 7.0+ (API 24+) |
| Arquitecturas | ARM64, ARM32, x86_64 |

## 🆘 Soporte

Si tienes problemas:

1. **Revisa la [Guía de Compilación](COMPILACION.md)**
2. **Consulta el [README](README.md)**
3. **Abre un issue en GitHub**: https://github.com/dgr198213-ui/QodeIA-fitness/issues
4. **Contacta al equipo**: info@qodeia.fitness

## ✅ Checklist de Instalación

- [ ] Descargué el APK o compilé la app
- [ ] Habilité "Fuentes desconocidas"
- [ ] Instalé la app correctamente
- [ ] Concedí todos los permisos
- [ ] La app abre sin errores
- [ ] Pude iniciar un entrenamiento
- [ ] El audio funciona correctamente

---

**¡Listo para entrenar!** 💪
