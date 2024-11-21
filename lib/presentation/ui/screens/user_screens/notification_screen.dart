import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/dummy_data.dart';
import 'package:food_delivery_app/presentation/ui/widgets/widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myTheme = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      body: BackgroundPattern(
        backgroundPatternWidget: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopCornerGoBackButtonWidget(myTheme: myTheme),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Notification",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20,),
                ...notificationBuilder(context),
              ],
            ),
          ),
        ),
        patternNumber: 1,
      ),
    );
  }

  List<Widget> notificationBuilder(BuildContext context) {
    return DummyData.notifications
        .map((elemnt) => Card(
          margin: const EdgeInsets.symmetric(vertical: 12),
              child: SizedBox(
                height: 100,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 18, top: 10, bottom: 10, right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        elemnt['icon'],
                        size: 50,
                        color: elemnt['iconColor']
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              elemnt['title'],
                              style: Theme.of(context).textTheme.titleSmall,
                              
                            ),
                            Text(elemnt['time'])
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
        .toList();
  }
}
