
class ListUtils {

  // for classic > list.generate > for in
  static List<V>? zMap<U, V>(List<U>? l, V Function(U) f) {
    if (l == null)
      return null;

    final List<V> newList = [];
    for (int i=0, len=l.length; i<len; ++i)
      newList.add(f(l[i]));
    return newList;
  }

  static V? zReduce<U, V>(List<U> l, V Function(V? acc, U element) f, [V? initialValue]) {
    V? value = initialValue;
    for (int i=0, len=l.length; i<len; ++i)
      value = f(value, l[i]);
    return value;
  }

  static List<E> zFilter<E>(List<E> l, bool Function(E) f) {
    List<E> newList = [];
    for (int i=0, len=l.length; i<len; ++i) {
      var e = l[i];
      if (f(e))
        newList.add(e);
    }
    return newList;
  }

}
