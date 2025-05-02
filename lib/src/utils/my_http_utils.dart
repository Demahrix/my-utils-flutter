
class MyHttpUtils {

  MyHttpUtils._();

  /// `buildUrl('http://127.0.0.1:5000', '/hello', { 'sort': 'asc', 'sortBy': 'name,size' })`
  static Uri buildUrl(String url, String path, Map<String, dynamic>? query) {
    String q = query == null || query.isEmpty
      ? ''
      : '?${getQueryParams(query)}';
    return Uri.parse('$url$path$q');
  }

  static String getQueryParams(Map<String, dynamic> params) {
    List<String> parts = [];

    final values = params.entries.toList();
    final len = values.length;

    for (int i=0; i<len; ++i) {
      final e = values[i];
      if (e.value == null)
        continue;

      final v = e.value;
      parts.add('${e.key}=${Uri.encodeComponent(v is List ? v.join(',') : v.toString())}');
    }

    return parts.join('&');
  }

}
