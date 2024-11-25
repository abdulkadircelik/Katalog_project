class AppConstants {
  static const String appName = 'Product Catalog';

  // API URLs
  static const String baseUrl = 'API_BASE_URL';

  // Storage Keys
  static const String tokenKey = 'TOKEN_KEY';
  static const String userKey = 'USER_KEY';
  static const String languageKey = 'LANGUAGE_KEY';

  // Cache Duration
  static const Duration cacheDuration = Duration(hours: 24);

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Validation Rules
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 20;
}
