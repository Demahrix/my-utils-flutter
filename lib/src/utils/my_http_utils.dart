
class MyHttpUtils {

  static String toQuery(Map<String, Object?> queries, [ bool includeQuestionMark = true ]) {
    StringBuffer? sb;

    for (final entry in queries.entries) {
      if (entry.value == null) continue;

      String query = entry.key + "=" + entry.value.toString();
      if (sb == null) {
        sb = StringBuffer(query);
      } else {
        sb.write("&");
        sb.write(query);
      }
    }

    if (sb == null)
      return "";

    final result = Uri.decodeQueryComponent(sb.toString());
    return includeQuestionMark ? '?' + result : result;
  }


}
