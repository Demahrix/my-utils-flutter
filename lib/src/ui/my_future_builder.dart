import 'package:flutter/material.dart';

class MyFutureBuilder<T> extends FutureBuilder<T> {

  MyFutureBuilder({
    super.key,
    super.initialData,
    super.future,
    required Widget Function(BuildContext) pendingBuilder,
    required Widget Function(BuildContext, T) dataBuilder,
    required Widget Function(BuildContext, Object?) errorBuilder
  }) : super(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return errorBuilder(context, snapshot.error);
            return dataBuilder(context, snapshot.data!);
          }
          return pendingBuilder(context);
        }
      );
}
