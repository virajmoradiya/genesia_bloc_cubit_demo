import 'package:flutter/material.dart';
import 'package:genesia_demo/generated/fonts.gen.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  dialogTheme: const DialogTheme(elevation: 0, shadowColor: Colors.transparent),
  textTheme: _textTheme,
  appBarTheme: _appbarTheme,
  scaffoldBackgroundColor: _colorScheme.surface,
  dialogBackgroundColor: _colorScheme.surface,
  fontFamily: FontFamily.openSans,
  colorScheme: _colorScheme,
  filledButtonTheme: _filledButtonThemeData,
  textSelectionTheme: TextSelectionThemeData(cursorColor: _colorScheme.onSurface,selectionHandleColor: _colorScheme.onSurface,selectionColor: _colorScheme.onSurfaceVariant)
);

ColorScheme get _colorScheme => const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF030A21),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFFFFFFF),
    onSecondary: Color(0xff000000),
    error: Color(0xfffa132d),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xff030A21),
    onSurface: Color(0xFFFFFFFF),
    onSurfaceVariant: Color(0xff5D6271));

TextTheme get _textTheme => const TextTheme(
      headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    );

AppBarTheme get _appbarTheme => AppBarTheme(
    backgroundColor: _colorScheme.surface,
    centerTitle: true,
    iconTheme: IconThemeData(color: _colorScheme.surface),
    elevation: 0,
    scrolledUnderElevation: 0,
    titleTextStyle: _textTheme.titleLarge?.copyWith(color: _colorScheme.onSurfaceVariant));

FilledButtonThemeData get _filledButtonThemeData => FilledButtonThemeData(
    style: FilledButton.styleFrom(
        backgroundColor: _colorScheme.onSurface,
        textStyle: _textTheme.labelMedium?.copyWith(
          color: _colorScheme.onSurface,
        ),
        overlayColor: _colorScheme.surface));
