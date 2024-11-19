import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:food_delivery_app/presentation/ui/widgets/background_pattern.dart';
import 'package:get/get.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
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
                    "Payment Method",
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
                  _buildCard(Image.asset(ImagePaths.paypalLogo)),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildCard(Image.asset(ImagePaths.visaLogo)),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildCard(Image.asset(ImagePaths.masterCardLogo)),

                  SizedBox(height: Get.height * .33),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed('/uploadPhoto');
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

  Card _buildCard(Image img) {
    return Card(
      child: Container(
        width: double.maxFinite,
        height: 85,
        child: Center(
          child: Container(
            height: 70,
            width: 100,
            child: img,
          ),
        ),
      ),
    );
  }
}
