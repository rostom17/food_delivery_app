import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/state_holders/check_box_controller.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:food_delivery_app/presentation/ui/widgets/background_pattern.dart';
import 'package:food_delivery_app/presentation/ui/widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final CheckBoxController _checkBoxController = CheckBoxController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = Get.height;
    final myThemeMode = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      body: BackgroundPattern(
        patternNumber: 0,
        backgroundPatternWidget: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * .05,
                  ),
                  Center(
                    child: Image.asset(myThemeMode == Brightness.light
                        ? ImagePaths.foodNinjaLogoDelivery
                        : ImagePaths.foodNinjaLogoDeliveryDark),
                  ),
                  SizedBox(
                    height: screenHeight * .06,
                  ),
                  Text(
                    "Sign Up For Free",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: screenHeight * .035,
                  ),
                  textFormField_2(
                      const Icon(
                        CupertinoIcons.person,
                        color: Colors.greenAccent,
                      ),
                      _userNameController,
                      "user-name"),
                  const SizedBox(
                    height: 12,
                  ),
                  textFormField_2(
                      const Icon(
                        CupertinoIcons.mail,
                        color: Colors.greenAccent,
                      ),
                      _emailController,
                      "Email"),
                  const SizedBox(
                    height: 12,
                  ),
                  textFormField_2(
                      const Icon(
                        CupertinoIcons.lock_shield,
                        color: Colors.greenAccent,
                      ),
                      _userNameController,
                      "Password"),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    return CheckboxListTile(
                      value: _checkBoxController.isSignInChecked,
                      onChanged: (newValue) {
                        _checkBoxController.toggleSignInChecked();
                      },
                      title: Text(
                        "Keep Me Sign In",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      activeColor: Colors.greenAccent,
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }),
                  Obx(() {
                    return CheckboxListTile(
                      value: _checkBoxController.isGetEmailChecked,
                      onChanged: (newValue) {
                        _checkBoxController.toggleGetEmailChecked();
                      },
                      title: Text(
                        "Email Me About Special Pricing",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      activeColor: Colors.greenAccent,

                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/bio');
                    },
                    icon: SizedBox(
                      height: screenHeight * .072,
                      width: Get.width * .45,
                      child: Image.asset(
                        ImagePaths.createAccountButton,
                        fit: BoxFit.fill,
                      ),
                    ),
                    highlightColor: Colors.transparent,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: () {
                      if(mounted) {
                        Get.back();
                      }
                    },
                    child: const Text(
                      'already have an account?',
                      style: TextStyle(
                          //fontStyle: FontStyle.italic,
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
