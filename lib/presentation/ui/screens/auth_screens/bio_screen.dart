import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:food_delivery_app/presentation/ui/widgets/background_pattern.dart';
import 'package:food_delivery_app/presentation/ui/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class BioScreen extends StatefulWidget {
  const BioScreen({super.key});

  @override
  State<BioScreen> createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

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
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 10,bottom: 10, right: 8, left: 18),
                        decoration: BoxDecoration(
                          color: myTheme == Brightness.light ? Colors.orange.shade50 : Colors.brown.shade900,
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
                        onPressed: () {
                          Get.toNamed('/paymentScreen');
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
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }
}
