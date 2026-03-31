import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/auth_user.dart';

class AuthException implements Exception {
  const AuthException(this.message);

  final String message;
}

class AuthResponse {
  const AuthResponse({
    required this.token,
    required this.user,
  });

  final String token;
  final AuthUser user;
}

class AuthService {
  AuthService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static const String _defaultBaseUrlWeb = 'http://localhost:5001/api';
  static const String _defaultBaseUrlMobile = 'http://10.0.2.2:5001/api';

  String get _baseUrl {
    const configured = String.fromEnvironment('API_BASE_URL');
    if (configured.isNotEmpty) {
      return configured;
    }
    return kIsWeb ? _defaultBaseUrlWeb : _defaultBaseUrlMobile;
  }

  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name.trim(),
        'email': email.trim(),
        'password': password,
      }),
    );

    return _parseAuthResponse(response);
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email.trim(),
        'password': password,
      }),
    );

    return _parseAuthResponse(response);
  }

  Future<AuthUser> me(String token) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/auth/me'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final decoded = _decodeResponse(response);
    if (response.statusCode != 200 || decoded['user'] == null) {
      throw AuthException((decoded['message'] ?? 'Failed to fetch user').toString());
    }
    return AuthUser.fromJson(decoded['user'] as Map<String, dynamic>);
  }

  AuthResponse _parseAuthResponse(http.Response response) {
    final decoded = _decodeResponse(response);
    final token = decoded['token'];
    final user = decoded['user'];

    if ((response.statusCode != 200 && response.statusCode != 201) ||
        token == null ||
        user == null) {
      throw AuthException((decoded['message'] ?? 'Authentication failed').toString());
    }

    return AuthResponse(
      token: token.toString(),
      user: AuthUser.fromJson(user as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> _decodeResponse(http.Response response) {
    try {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (_) {
      throw const AuthException('Invalid server response');
    }
  }
}
