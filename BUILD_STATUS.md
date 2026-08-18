# Faraz Siddiqui AI Agent — Build Status

## Active source
This repository is the single active working repository for the Android APK build.

## Build pipeline
1. Flutter stable
2. Java 17
3. Flutter dependency resolution
4. Dart analysis
5. Android release APK build
6. APK integrity verification
7. Release artifact upload

## Current checkpoint
The release workflow is configured. A successful GitHub Actions run and verified APK artifact are required before this project is considered complete.

## Important
Do not treat the project as APK-complete until `app-release.apk` has been successfully built and verified.
