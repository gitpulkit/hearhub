import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// App-wide accessibility / appearance preferences.
class AppSettings extends ChangeNotifier {
  AppSettings({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  static const _textSizeKey = 'settings_text_size';
  static const _themeKey = 'settings_theme';
  static const _localeKey = 'settings_locale';

  /// Slider range used on the Personalize screen.
  static const double minTextSize = 12;
  static const double maxTextSize = 28;
  static const double defaultTextSize = 16;

  final FlutterSecureStorage _storage;

  double _textSize = defaultTextSize;
  ThemeMode _themeMode = ThemeMode.light;
  Locale _locale = const Locale('en');
  bool _isInitialized = false;

  double get textSize => _textSize;
  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.dark;
  Locale get locale => _locale;
  String get languageCode => _locale.languageCode;
  bool get isInitialized => _isInitialized;

  /// Maps the 12–28 slider to a [TextScaler] factor (16 → 1.0).
  double get textScaleFactor => _textSize / defaultTextSize;

  Future<void> initialize() async {
    if (_isInitialized) return;

    final savedText = await _storage.read(key: _textSizeKey);
    final savedTheme = await _storage.read(key: _themeKey);
    final savedLocale = await _storage.read(key: _localeKey);

    if (savedText != null) {
      final parsed = double.tryParse(savedText);
      if (parsed != null) {
        _textSize = parsed.clamp(minTextSize, maxTextSize);
      }
    }
    if (savedTheme == 'dark') {
      _themeMode = ThemeMode.dark;
    } else if (savedTheme == 'light') {
      _themeMode = ThemeMode.light;
    }
    if (savedLocale == 'es' || savedLocale == 'en') {
      _locale = Locale(savedLocale!);
    }

    _isInitialized = true;
    notifyListeners();
  }

  Future<void> setTextSize(double value) async {
    final next = value.clamp(minTextSize, maxTextSize);
    if (next == _textSize) return;
    _textSize = next;
    notifyListeners();
    try {
      await _storage.write(key: _textSizeKey, value: next.toStringAsFixed(1));
    } catch (_) {}
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (mode != ThemeMode.light && mode != ThemeMode.dark) return;
    if (mode == _themeMode) return;
    _themeMode = mode;
    notifyListeners();
    try {
      await _storage.write(
        key: _themeKey,
        value: mode == ThemeMode.dark ? 'dark' : 'light',
      );
    } catch (_) {}
  }

  Future<void> setLocale(Locale locale) async {
    final code = locale.languageCode;
    if (code != 'en' && code != 'es') return;
    if (code == _locale.languageCode) return;
    _locale = Locale(code);
    notifyListeners();
    try {
      await _storage.write(key: _localeKey, value: code);
    } catch (_) {}
  }
}
