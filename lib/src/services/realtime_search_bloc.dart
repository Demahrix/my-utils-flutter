import 'dart:async';
import 'package:my_utils/src/models/my_future_data.dart';

typedef RealtimeSearchBlocData<T> = MyFutureData<List<T>>;

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
  Stream<MyFutureData<List<T>>> get listen => _controller.stream;

  void search(U params) {
    _params = params;
    _mostRecentFuture = onSearch(_params);

    if (_mostRecentFuture == null)
      return;

    // Notify loading
    _controller.add(const MyFutureData());

    _mostRecentFuture!.then((value) {
      // Notify success
      _controller.add(MyFutureData.withData(value));
    }, onError: (err) {
      // Notify error
      _controller.add(MyFutureData.withError(err));
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
