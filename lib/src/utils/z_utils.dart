
class ZUtils {

  static String toQuery(Map<String, String?> queries) {
    StringBuffer? sb;

    for (final entry in queries.entries) {
      if (entry.value == null) continue;

      String query = entry.key + "=" + entry.value!;
      if (sb == null) {
        sb = StringBuffer(query);
      } else {
        sb.write("&");
        sb.write(query);
      }
    }

    if (sb == null)
      return "";

    return Uri.decodeQueryComponent(sb.toString());
  }


}
