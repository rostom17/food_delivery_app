import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'package:food_delivery_app/presentation/ui/widgets/background_pattern.dart';

class VerificationCodeScreen extends StatefulWidget {
  VerificationCodeScreen({super.key});

  final String selectedMethod = Get.arguments;

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
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
                    "Enter 6-digit\nVerification Code",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'code send to ${widget.selectedMethod}. This Code will\nexpire in next 1.30 minutes',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  Form(
                    key: _formKey,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Pinput(
                            length: 6,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * .33),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Didn't receive pin yet!",
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Resend Pin',
                          style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: Colors.green),
                        )),
                  ),
                  SizedBox(
                    height: Get.height * .01,
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/resetPassword');
                          },
                          child: const Text(
                            'Verify',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
