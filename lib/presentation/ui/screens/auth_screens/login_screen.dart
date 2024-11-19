import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/ui/widgets/text_field_widget.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:food_delivery_app/presentation/ui/widgets/background_pattern.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onPressedLoginButton() {
    if (_formKey.currentState!.validate()) {
      Get.offAllNamed('/bottomNavScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = Get.height;
    final myThemeMode = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      backgroundColor: myThemeMode == Brightness.light ? const Color(0xFFf2f8fb) : const Color(0xFF0D0D0D),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * .04,
                ),
                Center(
                  child: Image.asset(myThemeMode == Brightness.light
                      ? ImagePaths.foodNinjaLogoDelivery
                      : ImagePaths.foodNinjaLogoDeliveryDark),
                ),
                SizedBox(
                  height: screenHeight * .07,
                ),
                Text(
                  "Login To Your Account",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: screenHeight * .07,
                ),
                textFormField('Email', _emailController),
                const SizedBox(
                  height: 16,
                ),
                textFormField('Password', _passwordController),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Or Continue With',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: myThemeMode == Brightness.light
                              ? Colors.grey[300]
                              : Colors.grey[800]),
                      height: screenHeight * .07,
                      width: Get.width * .4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.facebook,
                            size: 40,
                            color: Colors.indigo,
                          ),
                          Text(
                            'Facebook',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: myThemeMode == Brightness.light
                            ? Colors.grey[300]
                            : Colors.grey[800],
                      ),
                      height: screenHeight * .07,
                      width: Get.width * .4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              ImagePaths.googleLogo,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            'Google',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 15,
                ),
                IconButton(
                  onPressed: _onPressedLoginButton,
                  icon: SizedBox(
                      height: screenHeight * .072,
                      width: Get.width * .38,
                      child: Image.asset(
                        ImagePaths.loginButton,
                        fit: BoxFit.fill,
                      )),
                  highlightColor: Colors.transparent,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/signUp');
                      },
                      child: const Text(
                        'Sign Up..!',
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    //Text('Or', style: Theme.of(context).textTheme.titleSmall,),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/forgotPass');
                      },
                      child: Text(
                        'Forgot Your Password?',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            decoration: TextDecoration.combine([
                              TextDecoration.underline,
                            ])),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
