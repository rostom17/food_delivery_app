import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/ui/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';

class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({super.key});

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  Future<void> showSnackBar() async {
    await Future.delayed(const Duration(microseconds: 200));
    Get.snackbar('Feature Not Implemented Yet', "Please Move To Next Page ",
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.white,
        colorText: Colors.black);
  }

  @override
  void initState() {
    showSnackBar();
    super.initState();
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
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopCornerGoBackButtonWidget(myTheme: myTheme),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Set Your Location",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'This data will be displayed in your account\nprofile for security ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: Get.height * .07,
                    ),
                    _yourLoaction(context),
                    SizedBox(height: Get.height * .40),
                    _nextButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align _nextButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: IconButton(
        onPressed: () {
          Get.toNamed('/congrats', arguments: [
            'Your Profile is Ready to Use',
            Image.asset(
              ImagePaths.tryOrderButton,
              fit: BoxFit.fill,
            ),
            'create',
          ]);
        },
        icon: Image.asset(ImagePaths.nextButton),
      ),
    );
  }

  SizedBox _yourLoaction(BuildContext context) {
    return SizedBox(
      height: 147,
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  CupertinoIcons.location_solid,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                "Your Location",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          _setLocationSection(context)
        ],
      ),
    );
  }

  InkWell _setLocationSection(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text(
              "Set Your Location",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }
}
