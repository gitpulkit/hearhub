import 'package:flutter/material.dart';

import '../models/auth_user.dart';
import '../services/auth_service.dart';
import '../services/token_storage.dart';

class AuthState extends ChangeNotifier {
  AuthState({
    AuthService? authService,
    TokenStorage? tokenStorage,
  })  : _authService = authService ?? AuthService(),
        _tokenStorage = tokenStorage ?? const TokenStorage();

  final AuthService _authService;
  final TokenStorage _tokenStorage;

  AuthUser? _user;
  String? _token;
  bool _isInitialized = false;

  AuthUser? get user => _user;
  bool get isAuthenticated => _token != null && _user != null;
  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    if (_isInitialized) return;

    _token = await _tokenStorage.readToken();
    if (_token != null) {
      try {
        _user = await _authService.me(_token!);
      } catch (_) {
        await _tokenStorage.clearToken();
        _token = null;
        _user = null;
      }
    }
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final result = await _authService.login(email: email, password: password);
    _token = result.token;
    _user = result.user;
    await _tokenStorage.saveToken(result.token);
    notifyListeners();
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await _authService.register(
      name: name,
      email: email,
      password: password,
    );
    _token = result.token;
    _user = result.user;
    await _tokenStorage.saveToken(result.token);
    notifyListeners();
  }

  Future<void> logout() async {
    await _tokenStorage.clearToken();
    _token = null;
    _user = null;
    notifyListeners();
  }
}
