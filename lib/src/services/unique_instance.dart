import 'dart:collection' show HashMap;

class UniqueInstance {

  static UniqueInstance? _instance;

  final HashMap<Type, dynamic> _bucket = new HashMap();
  /// Contient les facotries des lazy singletons
  final HashMap<Type, dynamic Function()> _lazyBucket = new HashMap();

  UniqueInstance._();

  factory UniqueInstance.getInstance() {
    if (_instance == null)
      _instance = new UniqueInstance._();
    return _instance!;
  }

  /// Retourne l'objet de type `T` .
  /// **Eleve une exception** s'il n'a pas été enregistré.
  T get<T>() {
    if (_bucket.containsKey(T))
      return _bucket[T];

    if (_lazyBucket.containsKey(T)) {
      _bucket[T] = _lazyBucket[T]!();
      _lazyBucket.remove(T);
      return _bucket[T];
    }

    throw new Exception("Aucun element de type $T n'a été enregistré !");
  }

  /// Enregistre un objet de type `T`.
  /// **Eleve une exception** si un objet ou un factory retournant un objet du meme type exise déjà
  void register<T>(T object) {
    if (_bucket.containsKey(T) || _lazyBucket.containsKey(T))
      throw new Exception("Un element de type $T a déjà été enregistré !");
    _bucket[T] = object;
  }

  /// Enregistre une factory retournant un objet de type `T`
  /// **Eleve une exception** si un objet ou un factory retournant un objet du meme type exise déjà
  void registerLazy<T>(T Function() builder) {
    if (_bucket.containsKey(T) || _lazyBucket.containsKey(T))
      throw new Exception("Un element de type $T a déjà été enregistré !");
    _lazyBucket[T] = builder;
  }

  /// Supprime l'objet de type `T` ( ou le factory retournant un object de type `T`)
  /// **Eleve une exception** s'il n'a pas été enregistré
  void delete<T>() {
    if (_bucket.containsKey(T))
      _bucket.remove(T);
    else if (_lazyBucket.containsKey(T))
      _lazyBucket.remove(T);
    else
      throw new Exception("Aucun element de type $T n'a été enregistré !");
  }

  /// Met à jour un object s'il n'existe pas l'ajoute
  /// attentie avec les registerLzy et update
  void update<T>(T o) {
    _bucket[T] = o;
  }

  /// Returne `true` si un objet de type `T` ( ou un factory retournant un object de type `T`) a été enregistré.
  bool contains<T>() => _bucket.containsKey(T) || _lazyBucket.containsKey(T);

  /// Libère les ressources utilisé par l'objet
  void clear() {
    _bucket.clear();
    _lazyBucket.clear();
  }

}
