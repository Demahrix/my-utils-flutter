
extension MyStringExtension on String {

  static String orDefault(String? s, [String defaultValue = "N/A"]) {
    if (s == null || s == "" || s.trim() == "")
      return defaultValue;
    return s;
  }

  /// Met la premiere lettre en majuscule
  String capitalize() {
    return this[0].toUpperCase() + this.substring(1);
  }

  String capitaizeAll() {
    return "0";
  }

  bool isEmail() {
    throw UnimplementedError();
  }

}
