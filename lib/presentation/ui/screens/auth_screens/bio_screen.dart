import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/presentation/ui/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/state_holders/auth_controller/sign_up_controller.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';

class BioScreen extends StatefulWidget {
  const BioScreen({super.key});

  @override
  State<BioScreen> createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  final SignUpController _signUpController = Get.find<SignUpController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  void onTapNextButton() {
    if (_formKey.currentState!.validate()) {
      _signUpController.updateBio(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          mobile: _mobileNumberController.text.trim());
      Get.toNamed('/paymentScreen');
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopCornerGoBackButtonWidget(myTheme: myTheme),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Fill in your bio to get\nstarted",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'This data will be displayed in your account\nprofile for security',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textFormField("First Name", _firstNameController),
                    const SizedBox(
                      height: 15,
                    ),
                    textFormField("Last Name", _lastNameController),
                    const SizedBox(
                      height: 15,
                    ),
                    textFormField("Mobile Number", _mobileNumberController),
                    SizedBox(height: Get.height * .3),
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
      ),
    );
  }


  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }
}
