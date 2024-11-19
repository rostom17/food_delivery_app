import 'package:flutter/material.dart';

Widget textFormField (String text, TextEditingController x) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: TextFormField(
        controller: x,
        decoration: InputDecoration(
          hintText: text
        ),
        validator: (String? value) {
          if(value?.trim().isEmpty == true) {
            return "Enter your $text";
          }
          return null;
        },
      ),
    ),
  );
}

Widget textFormField_2 (Icon icon, TextEditingController tec, String name) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 5),
      child: TextFormField(
        controller: tec,
        decoration: InputDecoration(
          icon: icon,
            hintText: name,
          suffixIcon: name == 'Password' ? const Icon(Icons.visibility, color: Colors.grey,) : null,
        ),
        validator: (String? value) {
          if(value?.trim().isEmpty == true) {
            return "Enter your $name";
          }
          return null;
        },
      ),
    ),
  );
}