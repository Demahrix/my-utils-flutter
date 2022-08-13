
/// Permet obtenir seulement les resultats du future le plus récents 
class ExpirableFuture<T> {

  // final List<Future<T>> futures = [];
  Future<T>? _mostRecentFuture;
  final void Function(T) onData;
  final void Function(T) onError;

  ExpirableFuture({
    required this.onData,
    required this.onError
  });

  /// ajoute un future dans la liste d'attente
  /// et annule le precedent future
  void add(Future<T> f) {
    _mostRecentFuture = f;

    f.then((data) {
      if (_mostRecentFuture == f)
        onData(data);
    }, onError: (err) {
      if (_mostRecentFuture == f)
        onError(err);
    });

  }

  /// annule le future le plus recent
  void cancel() {
    _mostRecentFuture = null;
  }

}
