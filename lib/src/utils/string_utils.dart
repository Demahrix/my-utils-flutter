
class StringUtils {

  static bool isFalsy(String? s) {
    return s == null || s == "" || s.trim() == "";
  }

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

  static String capitalizeAll(String s) {
    return s.split(' ').map((e) => capitalize(e)).join(' ');
  }

  static bool isEmail(String s) {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(s);
  }

}