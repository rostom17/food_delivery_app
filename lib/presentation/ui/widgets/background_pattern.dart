import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:food_delivery_app/presentation/ui/app_constants/image_paths.dart';

class BackgroundPattern extends StatelessWidget {
  const BackgroundPattern(
      {required this.backgroundPatternWidget,
      required this.patternNumber,
      super.key});

  final Widget backgroundPatternWidget;
  final int patternNumber;

  @override
  Widget build(BuildContext context) {
    final myThemeMode = MediaQuery.of(context).platformBrightness;
    return Stack(
      children: [
        SvgPicture.asset(
          patternNumber == 0
              ? myThemeMode == Brightness.light
                  ? ImagePaths.backgroundPatternLight
                  : ImagePaths.backgroundPatternDark
              : ImagePaths.backgroundPattern2,
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
        backgroundPatternWidget,
      ],
    );
  }
}
