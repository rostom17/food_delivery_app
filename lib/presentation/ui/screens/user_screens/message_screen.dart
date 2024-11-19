import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/dummy_data.dart';
import 'package:food_delivery_app/presentation/ui/widgets/widgets.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundPattern(
          backgroundPatternWidget: Padding(
            padding:
                const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chat",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => MessageCardWidget(msg: DummyData.messages[index],),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: DummyData.messages.length),
                ),
              ],
            ),
          ),
          patternNumber: 1),
    );
  }
}
