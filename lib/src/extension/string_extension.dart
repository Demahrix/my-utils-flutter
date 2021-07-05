
extension MyStringExtension on String {

  String thousandFormatter([String separator = " "]) {
    StringBuffer sb = StringBuffer();
    int start = length % 3;

    if (start != 0)
      sb.write(substring(0, start));

    for (; start < length; start += 3) {
      if (start != 0)
        sb.write(separator);
      sb.write(substring(start, start + 3));
    }

    return sb.toString();
  }

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
