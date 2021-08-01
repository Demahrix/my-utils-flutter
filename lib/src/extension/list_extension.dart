
extension MyListExtension<E> on List<E> {

  
  @Deprecated("utiliser la class ListUtils")
  List<T> zMap<T>(T Function(E) f) {
    final List<T> newList = [];
    for (int i=0, len=this.length; i<len; ++i)
      newList.add(f(this[i]));
    return newList;
  }

  @Deprecated("utiliser la class ListUtils")
  T? zReduce<T>(T Function(T? acc, E element) f, [T? initialValue]) {
    T? value = initialValue;
    for (int i=0, len=this.length; i<len; ++i)
      value = f(value, this[i]);
    return value;
  }

  @Deprecated("utiliser la class ListUtils")
  List<E> zFilter(bool Function(E) f) {
    List<E> newList = [];
    for (int i=0, len=this.length; i<len; ++i) {
      var e = this[i];
      if (f(e))
        newList.add(e);
    }
    return newList;
  }

  /// Evite d'ecrire ce gens de code
  /// ```
  /// final List<dynamic> contacts = data["contacts"];
  /// data["contact"] = contacts == null ? List.generate(contacts.length, (index) => ClientContactModel.fromJson(contacts[index]))
  /// ```
  // static List<V>? zGenerate<T, V>(List<T>? list, V Function(T) f) {
  //   if (list == null)
  //     return null;
  //   List<V> newList = [];
  //   for (int i=0; i<list.length; ++i)
  //     newList[i] = f(list[i]);
  //   return newList;
  // }

}
