import 'package:flutter/material.dart';

class NeoColors {
  const NeoColors._();

  static const Color background = Color(0xFFDCEBFE);
  static const Color secondaryBackground = Color(0xFFFFFFFF);
  static const Color foreground = Color(0xFF000000);
  static const Color mainForeground = Color(0xFF000000);
  static const Color border = Color(0xFF000000);
  static const Color ring = Color(0xFF000000);
  static const Color main = Color(0xFF5294FF);
  static const Color overlay = Color(0xCC000000);

  static const Color chart1 = Color(0xFF5294FF);
  static const Color chart2 = Color(0xFFFF4D50);
  static const Color chart3 = Color(0xFFFACC00);
  static const Color chart4 = Color(0xFF05E17A);
  static const Color chart5 = Color(0xFF7A83FF);
}

class NeoMetrics {
  const NeoMetrics._();

  static const double boxShadowX = 4;
  static const double boxShadowY = 4;
  static const double radius = 5;
  static const double borderWidth = 3;
}

List<BoxShadow> neoShadow({
  Color color = NeoColors.border,
  double dx = NeoMetrics.boxShadowX,
  double dy = NeoMetrics.boxShadowY,
}) {
  return <BoxShadow>[
    BoxShadow(
      color: color,
      offset: Offset(dx, dy),
      blurRadius: 0,
      spreadRadius: 0,
    ),
  ];
}

BoxBorder neoBorder({double width = NeoMetrics.borderWidth}) {
  return Border.all(color: NeoColors.border, width: width);
}

class NeoText {
  const NeoText._();

  static const TextStyle heading = TextStyle(
    color: NeoColors.foreground,
    fontSize: 32,
    fontWeight: FontWeight.w800,
    height: 1.1,
    letterSpacing: -0.5,
  );

  static const TextStyle body = TextStyle(
    color: NeoColors.foreground,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const TextStyle label = TextStyle(
    color: NeoColors.foreground,
    fontSize: 12,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.4,
  );

  static const TextStyle link = TextStyle(
    color: NeoColors.foreground,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}

ThemeData buildNeoTheme() {
  const ColorScheme scheme = ColorScheme.light(
    primary: NeoColors.main,
    onPrimary: NeoColors.mainForeground,
    secondary: NeoColors.main,
    onSecondary: NeoColors.mainForeground,
    surface: NeoColors.secondaryBackground,
    onSurface: NeoColors.foreground,
    error: NeoColors.chart2,
    onError: NeoColors.foreground,
  );

  final ThemeData base = ThemeData(colorScheme: scheme);

  return base.copyWith(
    scaffoldBackgroundColor: NeoColors.background,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: NeoColors.foreground,
      selectionColor: NeoColors.main,
      selectionHandleColor: NeoColors.foreground,
    ),
    textTheme: base.textTheme.apply(
      bodyColor: NeoColors.foreground,
      displayColor: NeoColors.foreground,
    ),
  );
}
