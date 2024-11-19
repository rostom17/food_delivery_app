import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/theme/utilities/app_colors.dart';
import 'package:get/get.dart';

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 30,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 28, color: Colors.white),
        titleMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        titleSmall: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        bodyLarge: TextStyle(
          color: Colors.white60,
        ),
        bodyMedium: TextStyle(color: Colors.white54),
        bodySmall: TextStyle(color: Colors.white60, fontSize: 20)),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.green,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.grey.shade800,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      backgroundColor: Colors.white,
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(175, 70),
        elevation: 2,
        foregroundColor: Colors.white,
        backgroundColor: Colors.greenAccent.shade400,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    

    navigationBarTheme:  NavigationBarThemeData(
      backgroundColor: AppColors.darkBottomNavigationBarColor,
      elevation: 3,
      indicatorColor: Colors.green.withOpacity(.2),
      iconTheme: WidgetStatePropertyAll(IconThemeData(
        color: Colors.green.withOpacity(.8)
      )),
      labelTextStyle: const WidgetStatePropertyAll(
          TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
    ),
    iconTheme: const IconThemeData(
      color: Colors.greenAccent
    )
  );
}
