import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:food_delivery_app/presentation/ui/widgets/background_pattern.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.toNamed('/onBoardScreen_1');
    //Get.offAndToNamed('/onBoardScreen_1');
  }

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myThemeMode = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      body: BackgroundPattern(
        patternNumber: 0,
        backgroundPatternWidget: Center(
          child: Image.asset(myThemeMode == Brightness.light ? ImagePaths.foodNinjaLogo : ImagePaths.foodNinjaLogoDark),
        ),
      ),
    );
  }
}
