import '../../domain/entities/auth_session.dart';

class LoginResponseModel extends AuthSession {
  LoginResponseModel({
    required super.accessToken,
    required super.refreshToken,
    required super.expiresAtUtc,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresAtUtc: DateTime.parse(json['expiresAtUtc'] as String),
    );
  }
}
