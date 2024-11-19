import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:get/get.dart';

class OnBoardScreen1 extends StatelessWidget {
  const OnBoardScreen1({super.key});

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
                    ImagePaths.illustration1,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: screenHeight*.06,),
                Text(
                  'Find your Comfort',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Food here',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: screenHeight * .025,
                ),
                Text(
                  'Here You can find a chef or dish for every',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'taste and color.Enjoy!',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: screenHeight*.05,),
                IconButton(
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Get.toNamed('/onBoardScreen_2');
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
