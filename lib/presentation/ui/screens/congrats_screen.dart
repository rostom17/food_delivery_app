import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';
import 'package:food_delivery_app/presentation/ui/widgets/background_pattern.dart';

class CongratsScreen extends StatefulWidget {
  CongratsScreen({super.key});

  final List<dynamic> myArguments = Get.arguments;

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  bool showFirstAnimation = true;
  bool showSecondAnimation = true;
  bool showText = true;

  bool showButton = true;

  void _loadButton() {
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        showText = false;
      });
    });
  }

  void _loadSecondAnimation() {
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        showSecondAnimation = false;
        _loadButton();
      });
    });
  }

  @override
  void initState() {
    Timer(const Duration(milliseconds: 1200), () {
      setState(() {
        showFirstAnimation = false;
        _loadSecondAnimation();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundPattern(
        patternNumber: 0,
        backgroundPatternWidget: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    showFirstAnimation
                        ? Lottie.asset(
                            ImagePaths.celebrationAnimation,
                            height: Get.height * .7,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                            repeat: false,
                          )
                        : Lottie.asset(
                            ImagePaths.complete,
                            height: Get.height * .7,
                            width: double.maxFinite,
                            repeat: false,
                          ),
                    showSecondAnimation == false
                        ? Column(
                            children: [
                              const Text(
                                "Congrats!",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent),
                              ),
                              Text(
                                widget.myArguments[0],
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          )
                        : const Text(''),
                  ],
                ),
                showText == false
                    ? SizedBox(
                        height: Get.height * .07,
                        width: Get.width * .45,
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          onPressed: _onPressedIconButton,
                          icon: widget.myArguments[1],
                        ),
                      )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressedIconButton () {
    if(widget.myArguments[2] == 'reset') {
      if(mounted) {
        Get.offNamedUntil('/login', (Route<dynamic> route) => false);
      }
    } else {
      if(mounted) {
        Get.offNamedUntil('/bottomNav', (Route<dynamic> route) => false);
      }
    }
  }
}
