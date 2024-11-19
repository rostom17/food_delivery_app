import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/ui/screens/featured_screen/resturants_screen.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/ui/screens/user_screens/bottom_nav_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/auth_screens/forgot_password_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/auth_screens/reset_password_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/auth_screens/verification_code_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/congrats_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/auth_screens/payment_method_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/auth_screens/set_loaction_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/auth_screens/upload_photo_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/auth_screens/upload_photo_screen_2.dart';
import 'package:food_delivery_app/presentation/theme/dark_theme.dart';
import 'package:food_delivery_app/presentation/theme/light_theme.dart';
import 'package:food_delivery_app/presentation/ui/screens/auth_screens/bio_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/auth_screens/login_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/on_board_screen1.dart';
import 'package:food_delivery_app/presentation/ui/screens/on_board_screen2.dart';
import 'package:food_delivery_app/presentation/ui/screens/auth_screens/sign_up_screen.dart';
import 'package:food_delivery_app/presentation/ui/screens/splash_screen.dart';

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
