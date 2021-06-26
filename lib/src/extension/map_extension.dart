
extension MyMapExtension<K, V> on Map<K, V> {

  List<V> get zValues {
    final List<V> list = [];
    for (final e in this.entries)
      list.add(e.value);
    return list;
  }


}
