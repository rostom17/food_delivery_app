import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';

class OnBoardScreen2 extends StatelessWidget {
  const OnBoardScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Get.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * .05,),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * .5,
                  width: double.maxFinite,
                  child: Image.asset(
                    ImagePaths.illustration2,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: screenHeight*.06,),
                Text(
                  'Food Ninja is Where Your',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Comfort Food Lives',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: screenHeight * .025,
                ),
                Text(
                  'Enjoy the fast and smooth delivery at',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'your doorstep',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: screenHeight*.05,),
                IconButton(
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  icon: Image.asset(ImagePaths.nextButton),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}