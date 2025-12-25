# Proceso de Release - QodeIA fitness

Guía para crear y publicar nuevas versiones de QodeIA fitness.

## 📋 Checklist Pre-Release

- [ ] Todos los tests pasan: `flutter test`
- [ ] Código formateado: `dart format .`
- [ ] Sin warnings: `flutter analyze`
- [ ] README actualizado
- [ ] Changelog actualizado
- [ ] Versión actualizada en `pubspec.yaml`

## 🔄 Versioning

Usamos [Semantic Versioning](https://semver.org/):
- **MAJOR**: Cambios incompatibles
- **MINOR**: Nuevas funcionalidades compatibles
- **PATCH**: Correcciones de bugs

Ejemplo: `1.2.3` = Mayor.Menor.Patch

## 🚀 Pasos para Release

### 1. Actualizar Versión

Edita `pubspec.yaml`:
```yaml
version: 1.0.0+1  # Formato: version+buildNumber
```

### 2. Actualizar Changelog

Crea `CHANGELOG.md`:
```markdown
## [1.0.0] - 2024-01-15

### Added
- Feature X
- Feature Y

### Fixed
- Bug Z

### Changed
- Improvement A
```

### 3. Compilar APK Release

```bash
flutter clean
flutter pub get
flutter build apk --release
```

### 4. Crear Tag en Git

```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

### 5. Crear Release en GitHub

```bash
# Opción A: Desde línea de comandos
gh release create v1.0.0 \
  --title "QodeIA fitness v1.0.0" \
  --notes "Release notes aquí" \
  build/app/outputs/flutter-apk/app-release.apk

# Opción B: Desde GitHub Web
# 1. Ve a https://github.com/dgr198213-ui/QodeIA-fitness/releases
# 2. Haz clic en "Create a new release"
# 3. Selecciona el tag v1.0.0
# 4. Agrega título y descripción
# 5. Sube el APK
# 6. Publica
```

## 📦 Archivos a Incluir en Release

- `app-release.apk` - APK para instalar en dispositivos
- `app-release.aab` - Bundle para Google Play
- `CHANGELOG.md` - Cambios en esta versión
- `INSTALACION.md` - Guía de instalación

## 🎯 Distribución

### Google Play Store

1. Crea cuenta de desarrollador: https://play.google.com/console
2. Sube el AAB: `build/app/outputs/bundle/release/app-release.aab`
3. Completa información de la app
4. Envía para revisión

### GitHub Releases

1. Ve a Releases
2. Crea nuevo release
3. Sube APK
4. Publica

### Distribución Manual

1. Sube APK a tu servidor
2. Comparte el enlace
3. Los usuarios descargan e instalan

## 🔐 Firma de APK

Para producción, firma el APK:

```bash
# Crear keystore (solo una vez)
keytool -genkey -v -keystore ~/qodeia-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias qodeia-key

# Compilar con firma
flutter build apk --release
```

## 📊 Monitoreo Post-Release

- [ ] Usuarios pueden descargar
- [ ] Instalación sin errores
- [ ] App funciona correctamente
- [ ] Permisos funcionan
- [ ] Audio/Voz funcionan
- [ ] Bluetooth funciona

## 🐛 Rollback

Si hay un problema crítico:

```bash
# Crear hotfix
git checkout -b hotfix/v1.0.1

# Hacer cambios
# ...

# Compilar y probar
flutter build apk --release

# Mergear a master
git checkout master
git merge hotfix/v1.0.1

# Crear nuevo tag
git tag -a v1.0.1 -m "Hotfix: critical bug"
git push origin v1.0.1
```

## 📈 Análisis de Releases

Después de cada release:

1. Monitorea descargas en GitHub
2. Revisa issues reportados
3. Recopila feedback de usuarios
4. Planifica siguiente versión

---

**¡Listo para publicar!** 🎉
