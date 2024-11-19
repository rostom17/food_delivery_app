import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/theme/utilities/app_colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 30,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 28,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      titleSmall: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      bodySmall: TextStyle(color: Colors.black, fontSize: 20),
      bodyMedium: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(
          color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.grey[100],
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.grey[300],
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size( 175, 70),
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
      //backgroundColor: Colors.grey.withOpacity(.2),
      backgroundColor: AppColors.offWhileColor,
      elevation: 3,
      indicatorColor: Colors.greenAccent.withOpacity(.3),
      iconTheme: WidgetStatePropertyAll(IconThemeData(
          color: Colors.green.withOpacity(.8)
      )),
      labelTextStyle: const WidgetStatePropertyAll(
          TextStyle(color: Colors.black, fontWeight: FontWeight.w800)),
    ),
    iconTheme: const IconThemeData(
      color: Colors.greenAccent
    )
  );
}
