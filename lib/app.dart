import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/app_routes.dart';

class FoodNinja extends StatelessWidget {
  const FoodNinja({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodNinja',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=> const SplashScreen()),
        GetPage(name: '/onBoardScreen_1', page: ()=> const OnBoardScreen1()),
        GetPage(name: '/onBoardScreen_2', page: ()=> const OnBoardScreen2()),
        GetPage(name: '/login', page: ()=> const LoginScreen()),
        GetPage(name: '/signUp', page: ()=> const SignUpScreen()),
        GetPage(name: '/bio', page: ()=> const BioScreen()),
        GetPage(name: '/paymentScreen', page: ()=> const PaymentMethodScreen()),
        GetPage(name: '/uploadPhoto', page: ()=> const UploadPhotoScreen()),
        GetPage(name: '/uploadPhoto2', page: ()=> const UploadPhotoScreen2()),
        GetPage(name: '/setLocation', page: ()=> const SetLocationScreen()),
        GetPage(name: '/congrats', page: ()=> CongratsScreen()),
        GetPage(name: '/forgotPass', page: ()=> const ForgotPasswordScreen()),
        GetPage(name: '/verificationCode', page: ()=> VerificationCodeScreen()),
        GetPage(name: '/resetPassword', page: ()=> const ResetPasswordScreen()),
        GetPage(name: '/bottomNavScreen', page: ()=> const BottomNavScreen()),
        GetPage(name: '/restaurantScreen', page: ()=> const RestaurantsScreen()),
      ],

      home: const SplashScreen(),

      theme: lightTheme(),
      darkTheme: darkTheme(),


    );
  }
}
