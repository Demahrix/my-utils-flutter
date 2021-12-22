import 'package:flutter/material.dart';

class MyFutureBuilder<T> extends FutureBuilder<T> {

  MyFutureBuilder({
    Key? key,
    T? initialData,
    Future<T>? future,
    Widget Function(BuildContext)? pendingBuilder,
    required Widget Function(BuildContext, T?) dataBuilder,
    Widget Function(BuildContext, Object?)? errorBuilder
  }) : super(
        key: key,
        initialData: initialData,
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return errorBuilder!.call(context, snapshot.error);
            return dataBuilder(context, snapshot.data);
          }
          return pendingBuilder!.call(context);
        }
      );
}
