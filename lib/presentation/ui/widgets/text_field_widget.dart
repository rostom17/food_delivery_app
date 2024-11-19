import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/state_holders/auth_controller/sign_up_controller.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:get/get.dart';

Widget textFormField(String text, TextEditingController x) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        controller: x,
        decoration: InputDecoration(hintText: text),
        validator: (String? value) {
          if (value?.trim().isEmpty == true) {
            return "Enter your $text";
          }
          return null;
        },
      ),
    ),
  );
}

Widget textFormField_2(Icon icon, TextEditingController tec, String name) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: GetBuilder<SignUpController>(
        builder: (controller) {
          return TextFormField(
            controller: tec,
            obscureText: name == 'Password' && controller.showPassword ? true : false,
            decoration: InputDecoration(
              icon: icon,
              hintText: name,
              suffixIcon: name == 'Password' ? IconButton(
                onPressed: () {
                  controller.toggleShowPass();
                },
                icon: Icon(
                  controller.showPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ) : null,
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty == true) {
                return "Enter your $name";
              }
              else if(name == 'Email' && ImagePaths.emailChecker.hasMatch(value!)==false) {
                return "Enter Valid Email";
              }
              return null;
            },
          );
        }
      ),
    ),
  );
}
