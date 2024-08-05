import 'package:flutter/material.dart';

class ResponsiveUtils {

  ResponsiveUtils._();

  static double withByOrientation(BuildContext context) {
    var orientation = MediaQuery.orientationOf(context);
    var size = MediaQuery.sizeOf(context);
    if (orientation == Orientation.portrait)
      return size.width;
    return size.height;
  }

  /// https://pmatatias.medium.com/responsive-layout-with-buildcontext-dart-extension-3-145e438fb652.
  /// 
  /// Exemple:
  /// 
  /// ```dart
  /// GridView.count(
  ///  crossAxisCount: context.responsive<int>(
  ///    2, // default
  ///    sm: 2, // small 
  ///    md: 3, // medium
  ///    lg: 4, // large 
  //   xl: 5, // extra large screen
  ///  )
  /// ```
  /// 
  /// 
  /// ```dart
  /// Container(
  ///   child: context.responsive<Widget>(
  ///     mobileWidget, // default 
  ///     md: tabletWidget, // medium
  ///     lg: desktopWidget, // large
  ///   ),
  /// );
  /// ```
  /// 
  /// 
  static T of<T>(
    double value,
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    // final wd = MediaQuery.sizeOf(context).width;
    return value >= 1280
      ? (xl ?? lg ?? md ?? sm ?? defaultVal)
      : value >= 1024
          ? (lg ?? md ?? sm ?? defaultVal)
          : value >= 768
              ? (md ?? sm ?? defaultVal)
              : value >= 640
                  ? (sm ?? defaultVal)
                  : defaultVal;
  }

  /// https://stackoverflow.com/a/43445722
  static T ofAlt<T>(
    double value,
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    return value >= 1200
      ? (xl ?? lg ?? md ?? sm ?? defaultVal)
      : value >= 992
          ? (lg ?? md ?? sm ?? defaultVal)
          : value >= 768
              ? (md ?? sm ?? defaultVal)
              : value >= 576
                  ? (sm ?? defaultVal)
                  : defaultVal;
  }

}
