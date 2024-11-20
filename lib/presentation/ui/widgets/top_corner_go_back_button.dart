
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopCornerGoBackButtonWidget extends StatelessWidget {
  const TopCornerGoBackButtonWidget({
    super.key,
    required this.myTheme,
  });

  final Brightness myTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}