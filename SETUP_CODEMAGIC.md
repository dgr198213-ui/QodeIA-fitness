# Configuración de Codemagic para Compilación Automática

Esta guía te ayudará a configurar **Codemagic** para compilar automáticamente tu APK en la nube cada vez que hagas push a GitHub.

## 🎯 ¿Qué es Codemagic?

**Codemagic** es un servicio de CI/CD en la nube que:
- ✅ Compila automáticamente tu app cuando haces push
- ✅ Genera APK y AAB listos para descargar
- ✅ Publica automáticamente en GitHub Releases
- ✅ Tiene plan gratuito con 500 minutos/mes
- ✅ Soporta Flutter, React Native, Xcode, etc.

## 📋 Requisitos

- Cuenta de GitHub (ya tienes)
- Cuenta de Codemagic (gratuita)
- El archivo `codemagic.yaml` en el repositorio (ya está)

## 🚀 Pasos de Configuración

### Paso 1: Crear Cuenta en Codemagic

1. Ve a: https://codemagic.io
2. Haz clic en **"Sign Up"**
3. Selecciona **"Sign up with GitHub"**
4. Autoriza Codemagic para acceder a tu GitHub
5. Completa tu perfil

### Paso 2: Conectar Repositorio

1. En el dashboard de Codemagic, haz clic en **"+ Add application"**
2. Selecciona **"GitHub"**
3. Busca **"QodeIA-fitness"**
4. Haz clic en **"Connect"**
5. Autoriza el acceso

### Paso 3: Configurar Workflow

1. Codemagic detectará automáticamente `codemagic.yaml`
2. Verifica que esté correctamente configurado
3. Haz clic en **"Start new build"**
4. Selecciona el workflow **"Android Release Build"**
5. Haz clic en **"Start build"**

### Paso 4: Esperar Compilación

- La compilación toma ~10-15 minutos
- Puedes ver el progreso en tiempo real
- Recibirás notificaciones por email

### Paso 5: Descargar APK

Una vez completada la compilación:

1. Ve a la sección **"Artifacts"**
2. Descarga:
   - `app-release.apk` (para instalar en dispositivos)
   - `app-release.aab` (para Google Play Store)

## 🔄 Compilación Automática

Después de configurar Codemagic:

### Cada vez que hagas push:

```bash
git add .
git commit -m "feat: nueva funcionalidad"
git push origin master
```

**Codemagic automáticamente:**
1. Detecta el push
2. Clona el repositorio
3. Compila el APK
4. Publica en GitHub Releases
5. Te envía email con el resultado

### Para compilaciones manuales:

1. Ve a tu proyecto en Codemagic
2. Haz clic en **"Start new build"**
3. Selecciona el workflow
4. Haz clic en **"Start build"**

## 📊 Monitoreo

### Ver compilaciones anteriores:

1. Ve a tu proyecto en Codemagic
2. Haz clic en **"Build history"**
3. Verás todas las compilaciones pasadas

### Descargar APK anterior:

1. Haz clic en la compilación
2. Ve a **"Artifacts"**
3. Descarga el APK que necesites

## 🔐 Variables de Entorno (Opcional)

Si necesitas variables secretas (claves de firma, etc.):

1. Ve a **Project Settings**
2. Haz clic en **"Environment variables"**
3. Agrega tus variables
4. Úsalas en `codemagic.yaml` con `$VARIABLE_NAME`

Ejemplo:
```yaml
- name: Build APK
  script: |
    flutter build apk --release \
      --dart-define=API_KEY=$API_KEY
```

## 📧 Notificaciones

Codemagic te notificará por email:
- ✅ Cuando la compilación es exitosa
- ❌ Cuando falla
- 📊 Con enlace directo al APK

## 💰 Plan Gratuito vs Pago

| Característica | Gratuito | Pro |
|---|---|---|
| Minutos/mes | 500 | 3000+ |
| Compilaciones paralelas | 1 | 3+ |
| Almacenamiento de artifacts | 1 GB | 10 GB |
| Soporte | Community | Premium |

Para la mayoría de proyectos, **el plan gratuito es suficiente**.

## 🐛 Solución de Problemas

### "Build failed: Flutter not found"
- Verifica que `flutter: stable` esté en `codemagic.yaml`
- Codemagic instalará automáticamente Flutter

### "Build failed: Dependencies not found"
- Ejecuta `flutter pub get` manualmente
- Verifica que `pubspec.yaml` esté correcto

### "Build failed: Android SDK not found"
- Codemagic proporciona Android SDK automáticamente
- Verifica que `instance_type: mac_mini_m1` sea correcto

### "APK no se descarga"
- Verifica que el workflow terminó exitosamente
- Revisa la sección "Artifacts"
- Si no aparece, revisa los logs de compilación

## 📚 Recursos

- [Documentación de Codemagic](https://docs.codemagic.io/)
- [Ejemplos de codemagic.yaml](https://docs.codemagic.io/yaml/yaml-getting-started/)
- [Flutter en Codemagic](https://docs.codemagic.io/flutter-builds/building-a-flutter-app/)

## ✅ Checklist Final

- [ ] Cuenta de Codemagic creada
- [ ] Repositorio conectado
- [ ] `codemagic.yaml` detectado
- [ ] Primera compilación exitosa
- [ ] APK descargado correctamente
- [ ] Notificaciones por email funcionando
- [ ] Compilación automática en cada push

---

**¡Listo para compilar en la nube!** ☁️🚀
