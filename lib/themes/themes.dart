import 'package:flutter/material.dart';

ThemeData buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);
  var colorTheme =const ColorScheme(brightness: Brightness.light,
        primary: Color(0xFF0E0E0E),
        onPrimary: Color(0XFF0000CD),
        secondary: Color(0XFFE9EDF3),
        onSecondary: Color(0XFF747474),
        onSurface: Color(0xffffffff),
        error: Color(0xFFF32424),
        onError: Color(0xFFF32424),
         background: Color(0xFFF1F2F3),
        onBackground: Color(0xFFFFFFFF),
        surface: Color(0xFFFFFFFF),
  );

  return baseTheme.copyWith(
      colorScheme: colorTheme,
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(Colors.grey[200]),
      )
  );
}