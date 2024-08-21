
extension MyListExtension<E> on List<E> {

  E? zFind(bool Function(E, int) fn) {
    for (int i=0, len=this.length; i<len; ++i) {
      var e = this[i];
      if (fn(e, i))
        return e;
    }
    return null;
  }

  List<V> zMap<V>(V Function(E, int) fn) {
    final List<V> newList = [];
    for (int i=0, len=this.length; i<len; ++i)
      newList.add(fn(this[i], i));
    return newList;
  }

  List<E> zFilter(bool Function(E, int) fn) {
    List<E> newList = [];
    for (int i=0, len=this.length; i<len; ++i) {
      var e = this[i];
      if (fn(e, i))
        newList.add(e);
    }
    return newList;
  }

  bool equals(List<E> l) {
    if (identical(this, l))
      return true;
    if (this.length != l.length)
      return false;

    for (var i=0,len=this.length; i<len; ++i)
      if (this[i] != l[i])
        return false;
    return true;
  }

}


// FIXME remove
class ListUtils {

  static V? zReduce<U, V>(List<U> l, V Function(V? acc, U element) f, [V? initialValue]) {
    V? value = initialValue;
    for (int i=0, len=l.length; i<len; ++i)
      value = f(value, l[i]);
    return value;
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

}
