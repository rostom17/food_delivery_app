import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/ui/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/state_holders/auth_controller/sign_up_controller.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final SignUpController _signUpController = Get.find<SignUpController>();

  void onTapNextButton() {
    if(_signUpController.selectedPaymentMethod != -1) {
      Get.toNamed('/uploadPhoto');
    }
    else {
      Get.snackbar('Please Choose a Payment Method','');
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
                  _buildCard(Image.asset(ImagePaths.paypalLogo), 0),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildCard(Image.asset(ImagePaths.visaLogo), 1),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildCard(Image.asset(ImagePaths.masterCardLogo), 2),

                  SizedBox(height: Get.height * .33),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      onPressed: onTapNextButton,
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

  Widget _buildCard(Image img, int index) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return InkWell(
          onTap: ()=> controller.setPaymentMethod(index),
          child: Card(
            elevation: 0,
            color: index == controller.selectedPaymentMethod ? Colors.green : null,
            child: SizedBox(
              width: double.maxFinite,
              height: 85,
              child: Center(
                child: SizedBox(
                  height: 70,
                  width: 100,
                  child: img,
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
