
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

  static String formatName(String name, { bool firstInUpper = true }) {
    StringBuffer sb = StringBuffer();
    List<String> parts = name.split(' ');
    for (int i=0, len=parts.length; i<len; ++i) {
      String p = parts[i];

      if (p.isEmpty)
        continue;

      if (i == 0 && firstInUpper)
        sb.write(p.toUpperCase());
      else
        sb.write(p[0].toUpperCase() + p.substring(1));

      if (i != len - 1)
        sb.write(' ');
    }
    return sb.toString();
  }

  static String getShorterName(String name) {
    StringBuffer sb = StringBuffer();
    List<String> parts = name.split(' ');
    int count = parts.length;
    for (int i=0; i<count-1; ++i)
      sb.write('${parts[i][0].toUpperCase()}. ');

    if (count != 0) {
      String last = parts[count - 1];
      sb.write(last[0].toUpperCase() + last.substring(1));
    }

    return sb.toString();
  } 

  static int levenshteinDistance(String a, String b) => levenshteinDistance(a, b);

}
