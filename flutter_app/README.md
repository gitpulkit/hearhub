# HearHub - Flutter

A Flutter port of the HearHub React app. Discover and use hearing support tools — simply.

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.0.0 or higher)

## Setup

If you get errors about missing platform files, generate them first:

```bash
cd flutter_app
flutter create . --platforms=web,ios,android
```

## Run the app

```bash
cd flutter_app
flutter pub get
flutter run -d chrome
```

For iOS Simulator:
```bash
flutter run -d ios
```

For Android Emulator:
```bash
flutter run -d android
```

## Screens

- **/** - Landing (Welcome to HearHub)
- **/onboarding** - Role selection (Student, Professional, Parent, Senior)
- **/guide/:category** - Category-specific guide with recommended tools
- **/dashboard** - Main hub with Top Picks and Daily Situations
- **/assessment/:scenario** - Hearing assessment questions (Restaurant, Meeting, Classroom, Home)
