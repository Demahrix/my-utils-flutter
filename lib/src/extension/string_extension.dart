
extension MyStringExtension on String {

  @Deprecated("utils la class StringUtils")
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

  @Deprecated("utils la class StringUtils")
  static String orDefault(String? s, [String defaultValue = "N/A"]) {
    if (s == null || s == "" || s.trim() == "")
      return defaultValue;
    return s;
  }

}
