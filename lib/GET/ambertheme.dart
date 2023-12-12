import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color primaryColor = Colors.amber.shade200;
Color  secondary = Colors.amber;
final redMaterialColor = MaterialColor(primaryColor.value, const {
  50: Color(0xFFb71c1c),
  100: Color(0xFFa51919),
  200: Color(0xFF921616),
  300: Color(0xFF801414),
  400: Color(0xFF6e1111),
  500: Color(0xFF5c0e0e),
  600: Color(0xFF490b0b),
  700: Color(0xFF370808),
  800: Color(0xFF250606),
  900: Color(0xFF120303),
  1000: Color(0xFF000000)
});

ThemeData amberTheme = ThemeData(
  progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
  primarySwatch: redMaterialColor,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: secondary,
    brightness: Brightness.light,
    cardColor: Colors.white,
    errorColor: Colors.red.shade900,
    primarySwatch: redMaterialColor,
  ),
  appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.white, size: 24.0),
      iconTheme: IconThemeData(color: Colors.white, size: 24.0),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(color: primaryColor, size: 24.0),
    selectedLabelStyle: TextStyle(fontSize: 14.0, color: primaryColor),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    unselectedIconTheme: const IconThemeData(color: Colors.grey, size: 24.0),
    unselectedLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.grey),
  ),
  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: true,
    isDense: false,
    isCollapsed: false,
    hintStyle: TextStyle(
      color: Colors.grey.shade600,
      fontWeight: FontWeight.w500,
      fontSize: 12.0,
    ),
    errorStyle: const TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w500,
      fontSize: 12.0,
    ),
    contentPadding: const EdgeInsets.all(12.0),
    errorMaxLines: 1,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)), borderSide: BorderSide(color: primaryColor)),
    focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)), borderSide: BorderSide(color: Colors.red)),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x0DFFFFFF)),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFB3B3B3)),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  ),
);
