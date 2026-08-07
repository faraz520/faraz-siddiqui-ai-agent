# Faraz Siddiqui AI Agent (Flutter Android/iOS)

Permanent Personal Digital Assistant customized for **Faraz Siddiqui** — HSE Specialist, Safety Engineer, Content Creator & Writer.

## Features
- **ChatGPT-like Clean Interface**: Simple, ultra-responsive main chat screen with voice input, text input, attachment upload, and settings drawer.
- **Privacy First**: All messages, API keys, and personal documents are stored using `flutter_secure_storage` (Android KeyStore / iOS Keychain encrypted local storage).
- **HSE Safety Suite**: Automatic generation of Toolbox Talks (TBT), Job Safety Analysis (JSA), Safety Audit Checklists, and Incident Reports.
- **CV & Career Assistant**: Professional CV bullet point optimizer, Cover Letter generator, and HSE Engineering Interview Simulator.
- **Content Studio**: YouTube video scriptwriter, Blogger post planner, Facebook/Instagram/TikTok caption builder.
- **Bilingual (English & Urdu اردو)**: Seamless English & Urdu text and speech processing.
- **Modular Integration Ready**: Prepared for Google, YouTube Studio, Blogger, and Social Media APIs with explicit user permissions.

## Build Instructions

### Prerequisites
- Flutter SDK 3.2.0 or higher
- Android Studio / Xcode
- Java Development Kit (JDK) 17

### Local Execution
```bash
# 1. Fetch dependencies
flutter pub get

# 2. Run on Android Device / Emulator
flutter run -d android
```

### Building Release APK for Android
```bash
flutter build apk --release
```
The generated APK will be available at `build/app/outputs/flutter-apk/app-release.apk`.

### CI/CD Setup
This project includes preconfigured CI/CD workflows:
- **Codemagic**: See `codemagic.yaml` for automated APK builds.
- **GitHub Actions**: See `.github/workflows/build_apk.yml` for automated building on every push.
