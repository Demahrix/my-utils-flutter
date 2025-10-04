import 'dart:async';

class TrailingThrottler<T> {

  final Duration interval;
  bool _isThrottled = false;
  void Function()? _pendingAction;
  Completer<T>? _pendingCompleter;

  TrailingThrottler({required this.interval});

  /// Exécution d'une fonction synchrones
  void run(void Function() action) {
    if (!_isThrottled) {
      _isThrottled = true;
      action();
      _startTimer();
    } else {
      // Stocke la dernière action pour l’exécuter à la fin de l’intervalle
      _pendingAction = action;
    }
  }

  /// Exécution d'une fonction asynchrone avec Future<T>
  Future<T> runAsync(FutureOr<T> Function() action) {
    if (!_isThrottled) {
      _isThrottled = true;
      _pendingCompleter = Completer<T>();
      _startTimer();

      Future(() async {
        try {
          final result = await action();
          if (!_pendingCompleter!.isCompleted) _pendingCompleter!.complete(result);
        } catch (e, st) {
          if (!_pendingCompleter!.isCompleted) _pendingCompleter!.completeError(e, st);
        }
      });

      return _pendingCompleter!.future;
    } else {
      _pendingAction = () {
        Future(() async {
          try {
            final result = await action();
            if (_pendingCompleter != null && !_pendingCompleter!.isCompleted) {
              _pendingCompleter!.complete(result);
            }
          } catch (e, st) {
            if (_pendingCompleter != null && !_pendingCompleter!.isCompleted) {
              _pendingCompleter!.completeError(e, st);
            }
          }
        });
      };
      _pendingCompleter ??= Completer<T>();
      return _pendingCompleter!.future;
    }
  }

  void _startTimer() {
    Timer(interval, () {
      _isThrottled = false;
      if (_pendingAction != null) {
        final action = _pendingAction!;
        _pendingAction = null;
        run(action); // Exécute la dernière action stockée
      }
    });
  }

  void dispose() {
    _pendingAction = null;
    if (_pendingCompleter != null && !_pendingCompleter!.isCompleted) {
      _pendingCompleter!.completeError(StateError("Throttler disposé"));
    }
  }

}
