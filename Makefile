.PHONY: help clean get build-debug build-release build-aab install analyze format test

help:
	@echo "QodeIA fitness - Build Commands"
	@echo "================================"
	@echo "make clean          - Limpiar builds anteriores"
	@echo "make get            - Obtener dependencias"
	@echo "make analyze        - Analizar código"
	@echo "make format         - Formatear código"
	@echo "make test           - Ejecutar pruebas"
	@echo "make build-debug    - Compilar APK debug"
	@echo "make build-release  - Compilar APK release"
	@echo "make build-aab      - Compilar AAB (Google Play)"
	@echo "make install        - Instalar APK en dispositivo"
	@echo "make run            - Ejecutar app en modo desarrollo"

clean:
	@echo "🧹 Limpiando..."
	flutter clean

get:
	@echo "📦 Obteniendo dependencias..."
	flutter pub get

analyze:
	@echo "🔍 Analizando código..."
	flutter analyze

format:
	@echo "✨ Formateando código..."
	dart format .

test:
	@echo "🧪 Ejecutando pruebas..."
	flutter test

build-debug: clean get
	@echo "🔨 Compilando APK debug..."
	flutter build apk
	@echo "✅ APK debug: build/app/outputs/flutter-apk/app-debug.apk"

build-release: clean get
	@echo "🔨 Compilando APK release..."
	flutter build apk --release
	@echo "✅ APK release: build/app/outputs/flutter-apk/app-release.apk"

build-aab: clean get
	@echo "🔨 Compilando AAB (Google Play)..."
	flutter build appbundle --release
	@echo "✅ AAB: build/app/outputs/bundle/release/app-release.aab"

install: build-debug
	@echo "📱 Instalando en dispositivo..."
	flutter install

run:
	@echo "🚀 Ejecutando app..."
	flutter run

doctor:
	@echo "🏥 Verificando entorno..."
	flutter doctor -v
