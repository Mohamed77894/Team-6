class AuthTokenStore {
  String? _accessToken;

  String? get accessToken => _accessToken;

  void save(String accessToken) {
    _accessToken = accessToken;
  }

  void clear() {
    _accessToken = null;
  }
}
