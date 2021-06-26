
extension MyListExtension<E> on List<E> {

  // for classic > list.generate > for in
  List<T> zMap<T>(T Function(E) f) {
    final List<T> newList = [];
    for (int i=0, len=this.length; i<len; ++i)
      newList.add(f(this[i]));
    return newList;
  }

  T? zReduce<T>(T Function(T? acc, E element) f, [T? initialValue]) {
    T? value = initialValue;
    for (int i=0, len=this.length; i<len; ++i)
      value = f(value, this[i]);
    return value;
  }

  List<E> zFilter(bool Function(E) f) {
    List<E> newList = [];
    for (int i=0, len=this.length; i<len; ++i) {
      var e = this[i];
      if (f(e))
        newList.add(e);
    }
    return newList;
  }

}
