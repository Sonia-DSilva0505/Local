import 'package:flutter/material.dart';

import 'device_size.dart';

extension BuildContextExtension on BuildContext {
  /// Returns the [ThemeData] of the current [BuildContext].
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  // height of the screen
  double get height => MediaQuery.of(this).size.height;
  // width of the screen
  double get width => MediaQuery.of(this).size.width;
  // height of the status bar
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  // height of the bottom bar
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
  // is FormFactor mobile
  bool get isMobile => width < FormFactor.tablet;
  bool get isTablet => width < FormFactor.desktop;
  bool get isDesktop => width >= FormFactor.desktop;
  bool get isDesktopLg => width >= FormFactor.desktopLg;
}
