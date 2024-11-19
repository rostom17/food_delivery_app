import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/ui/widgets/background_pattern.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final String phoneNumber = '+8801 xxxxxx 890';
  final String email = 'r .... 81 @gmail.com';

  String? selectedValue = '';

  void _selectedMethod(String value) {
    selectedValue = value;
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
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Select which contact details should we\nuse to reset your password ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        _selectedMethod(phoneNumber);
                      },
                      child: _buildCard('sms', phoneNumber, context)),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        _selectedMethod(email);
                      },
                      child: _buildCard('email', email, context)),
                  SizedBox(height: Get.height * .36),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed('/verificationCode',
                            arguments: selectedValue);
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

  Card _buildCard(String method, String name, BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.maxFinite,
        height: 105,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              method == 'sms'
                  ? const Icon(
                      CupertinoIcons.text_bubble,
                      color: Colors.greenAccent,
                      size: 40,
                    )
                  : const Icon(
                      CupertinoIcons.mail,
                      color: Colors.greenAccent,
                      size: 40,
                    ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Via $method',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(name, style: Theme.of(context).textTheme.titleMedium),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
