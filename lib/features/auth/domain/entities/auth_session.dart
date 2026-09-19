class AuthSession {
  const AuthSession({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAtUtc,
  });

  final String accessToken;
  final String refreshToken;
  final DateTime expiresAtUtc;
}
