import 'package:flutter/material.dart';

import 'package:food_delivery_app/presentation/ui/app_constants/dummy_data.dart';
import 'package:food_delivery_app/presentation/ui/widgets/widgets.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BackgroundPattern(
          backgroundPatternWidget: Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) =>
                  RestaurantCard(imageLink: DummyData.restaurantImages[index]),
              itemCount: DummyData.restaurantImages.length,
            ),
          ),
          patternNumber: 2),
    );
  }

  AppBar _buildAppBar() => AppBar(title: Text("Popular Restaurants"),);
}
