class KConstants {
  // Durations
  static const kPictureClickTimerDuration = Duration(seconds: 5);
  static const apiTimeOut = Duration(seconds: 20);

  // Others
  static const empty = "";
  static const zero = 0;

  /// API CONFIG
  static const baseUrl = "https://api.example.com";
  static const apiKey = String.fromEnvironment('GPT_API_KEY');
  static const applicationJson = "application/json";
  static const contentType = "content-type";
  static const accept = "accept";
  static const authorization = "authorization";
  static const defaultLanguage = "en";
  static const token = "token";
}
