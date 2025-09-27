import 'dart:async' show Completer, Future, FutureOr, Timer;


class Debouncer<T> {

  final Duration delay;
  Timer? _timer;
  Completer<T>? _completer;

  Debouncer({required this.delay});

  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  Future<T> runAsync(FutureOr<T> Function() action) {
      cancel();

    _completer = Completer<T>();

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

  void cancel() {
    _timer?.cancel();

    if (_completer != null && !_completer!.isCompleted)
      _completer?.completeError(StateError("Action annulée par un nouvel appel debounce"));
  }

  void dispose() {
    _timer?.cancel();
    if (_completer != null && !_completer!.isCompleted) {
      _completer!.completeError(StateError("Debouncer disposé"));
    }
  }

}
