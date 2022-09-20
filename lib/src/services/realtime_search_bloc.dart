import 'dart:async';
import 'dart:developer';
import 'package:my_utils/src/enum/my_future_state.dart';

class RealtimeSearchBlocData<T> {

  final MyFutureState state;
  final List<T>? data;
  final Object? error;

  RealtimeSearchBlocData({
    required this.state,
    this.data,
    this.error
  });

  // add method has data ???
  // has error

}

/// `T` is item type
/// `U` is search params model
/// Lorsque `onSearch` renvoie `null` aucun recherche n'est lancé
class RealtimeSearchBloc<T, U> {

  U? _params;
  final Future<List<T>>? Function(U?) onSearch;
  final _controller = StreamController<RealtimeSearchBlocData<T>>();

  Future<List<T>>? _mostRecentFuture;

  RealtimeSearchBloc({
    U? initialParams,
    required this.onSearch
  }): _params = initialParams;

  U? get params => _params;
  Stream<RealtimeSearchBlocData<T>> get listen => _controller.stream;

  void search(U params) {
    _params = params;
    _mostRecentFuture = onSearch(_params);

    if (_mostRecentFuture == null)
      return;

    _controller.add(RealtimeSearchBlocData(state: MyFutureState.waiting));

    _mostRecentFuture!.then((value) {
      log(value.toString(), name: 'result');
      _controller.add(RealtimeSearchBlocData(
        state: MyFutureState.success,
        data: value
      ));
    }, onError: (err) {
      log(err.toString(), name: 'Error');
      _controller.add(RealtimeSearchBlocData(
        state: MyFutureState.error,
        error: err
      ));
    });
  }

  void retry() {
    if (_params != null)
      search(_params as U);
  }

  void cancel() {
    _mostRecentFuture = null;
  }

  void dispose() {
    _controller.close();
  }

}
