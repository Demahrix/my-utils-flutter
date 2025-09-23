import 'dart:async' show Completer, Future, FutureOr, Timer;


class Debouncer<T> {

  final Duration delay;
  Timer? _timer;
  Completer<T>? _completer;

  Debouncer({required this.delay});

  Future<T> run(FutureOr<T> Function() action) {
    // Annule l'exécution précédente
    _timer?.cancel();
    _completer?.completeError(StateError("Action annulée par un nouvel appel debounce"));

    _completer = Completer<T>();

    // Redémarre le timer
    _timer = Timer(delay, () async {
      try {
        final result = await action();
        if (!_completer!.isCompleted)
          _completer!.complete(result);
      } catch (e, st) {
        if (!_completer!.isCompleted) {
          _completer!.completeError(e, st);
        }
      }
    });

    return _completer!.future;
  }

  void dispose() {
    _timer?.cancel();
    if (_completer != null && !_completer!.isCompleted) {
      _completer!.completeError(StateError("Debouncer disposé"));
    }
  }

}
