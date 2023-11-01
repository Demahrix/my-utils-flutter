
// FIXME remove
class ListUtils {

  static E? findFirst<E>(List<E> l, bool Function(E) f) {
    for (int i=0, len=l.length; i<len; ++i) {
      final e = l[i];
      if (f(e))
        return e;
    }
    return null;
  }

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

  /// La liste ne doit pas etre vide
  static E max<E extends num>(List<E> l) {
    E value = l[0];
    for (int i=1, len=l.length; i<len; ++i) {
      if (l[i] > value)
        value = l[i];
    }
    return value;
  }

  /// La liste ne doit pas etre vide
  static E min<E extends num>(List<E> l) {
    E value = l[0];
    for (int i=1, len=l.length; i<len; ++i) {
      if (l[i] < value)
        value = l[i];
    }
    return value;
  }

  static bool equals<E>(List<E> l1, List<E> l2) {
    if (identical(l1, l2))
      return true;
    if (l1.length != l2.length)
      return false;

    for (var i=0,l=l1.length; i<l; ++i)
      if (l1[i] != l2[i])
        return false;
    return true;
  }

}
