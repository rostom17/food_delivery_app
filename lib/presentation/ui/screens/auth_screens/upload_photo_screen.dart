import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:food_delivery_app/presentation/ui/widgets/background_pattern.dart';
import 'package:get/get.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
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
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 8, left: 18),
                      decoration: BoxDecoration(
                        color: myTheme == Brightness.light
                            ? Colors.orange.shade50
                            : Colors.brown.shade900,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.orange,
                        size: 26,
                      ),
                    ),
                  ),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Container(
                      height: Get.height * .15,
                      width: double.maxFinite,
                      child: Center(
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ImagePaths.gallery2),
                            const SizedBox(height: 8,),
                            Text("From Gallery", style: Theme.of(context).textTheme.titleSmall,),
                          ],
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Card(
                    child: Container(
                      height: Get.height * .15,
                      width: double.maxFinite,
                      child: Center(
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImagePaths.camera),
                              const SizedBox(height: 8,),
                              Text("Take Photo", style: Theme.of(context).textTheme.titleSmall,),
                            ],
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * .25),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed('/uploadPhoto2');
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
