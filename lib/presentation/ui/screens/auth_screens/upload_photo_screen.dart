import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:food_delivery_app/presentation/ui/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/state_holders/auth_controller/sign_up_controller.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  XFile? pickedImage;
  final SignUpController _signUpController = Get.find<SignUpController>();

  void ontTapNextButton () {
    if(pickedImage != null) {
      File imageFile = File(pickedImage!.path);
      _signUpController.setUserProfilePhoto(imageFile);
      Get.toNamed('/uploadPhoto2');
    } else {
      Get.snackbar("Please choose a photo", '');
    }
  }

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
                  const SizedBox(
                    height: 20,
                  ),
                  _pickImage(context, ImagePaths.gallery2, false),
                  const SizedBox(
                    height: 15,
                  ),
                  _pickImage(context, ImagePaths.camera, true),
                  SizedBox(height: Get.height * .25),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      onPressed: ontTapNextButton,
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

  Widget _pickImage(BuildContext context, String imagePath, bool isCamera) {
    return InkWell(
      onTap: isCamera ? _pickImageFromCamera : _pickImageFromGallery,
      child: Card(
        child: Container(
          height: Get.height * .15,
          width: double.maxFinite,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  isCamera ? "Open Camera" : "From Gallery",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery () async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future _pickImageFromCamera () async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
  }
}
