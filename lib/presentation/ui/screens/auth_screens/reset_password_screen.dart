import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:food_delivery_app/presentation/ui/widgets/background_pattern.dart';
import 'package:food_delivery_app/presentation/ui/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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
              child: Form(
                key: _formKey,
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
                      "Reset Your Password here",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: Get.height * .02,
                    ),
                    Text(
                      'Select which contact details should we\nuse to reset your password ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    textFormField('New Password', _newPasswordController),
                    const SizedBox(
                      height: 10,
                    ),
                    textFormField('Confirm Password', _confirmPasswordController),
                    SizedBox(height: Get.height * .42),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed('/congrats', arguments: [
                            'Password Reset Successful',
                            Image.asset(
                              ImagePaths.backButton,
                              fit: BoxFit.fill,
                            ),
                            'reset',
                          ]);
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
      ),
    );
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
