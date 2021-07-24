
class StringUtils {

  static String thousandFormatter(String s, [String separator = " "]) {
    final StringBuffer sb = StringBuffer();
    final int length = s.length;
    int start = length % 3;

    if (start != 0)
      sb.write(s.substring(0, start));

    for (; start < length; start += 3) {
      if (start != 0)
        sb.write(separator);
      sb.write(s.substring(start, start + 3));
    }

    return sb.toString();
  }

  static String orDefault(String? s, [String defaultValue = "N/A"]) {
    if (s == null || s == "" || s.trim() == "")
      return defaultValue;
    return s;
  }

  /// Met la premiere lettre en majuscule
  static String capitalize(String s) {
    return s[0].toUpperCase() + s.substring(1);
  }

  static String capitaizeAll(String s) {
    return "0";
  }

  static bool isEmail(String s) {
    throw UnimplementedError();
  }

}