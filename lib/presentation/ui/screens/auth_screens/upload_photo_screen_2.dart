import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/state_holders/auth_controller/sign_up_controller.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:food_delivery_app/presentation/ui/widgets/widgets.dart';

class UploadPhotoScreen2 extends StatefulWidget {
  const UploadPhotoScreen2({super.key});

  @override
  State<UploadPhotoScreen2> createState() => _UploadPhotoScreen2State();
}

class _UploadPhotoScreen2State extends State<UploadPhotoScreen2> {
  final _controller = Get.find<SignUpController>();
  @override
  Widget build(BuildContext context) {
    final myTheme = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      body: BackgroundPattern(
        patternNumber: 1,
        backgroundPatternWidget: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopCornerGoBackButtonWidget(myTheme: myTheme),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Upload Your Profile\nPhoto",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'This data will be displayed in your account\nprofile for security ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: Get.height * .07,
                  ),

                  Center(
                    child: Container(
                      height: 245,
                      width: 238,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: FileImage(_controller.userPhoto),),
                      ),
                    ),
                  ),

                  SizedBox(height: Get.height * .25),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed('/setLocation');
                      },
                      icon: Image.asset(ImagePaths.nextButton),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

