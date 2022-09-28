import 'package:my_utils/src/enum/my_future_state.dart';

class MyFutureData<T> {

  final T? _data;
  final Object? _error;

  const MyFutureData(): _data = null, _error = null;
  const MyFutureData.withData(T data): _data = data, _error = null;
  const MyFutureData.withError(Object error): _error = error, _data = null;

  T? get data => _data;
  Object? get error => _error;

  MyFutureState get state => _data != null
    ? MyFutureState.success
    : _error != null
      ? MyFutureState.error
      : MyFutureState.waiting;

}
