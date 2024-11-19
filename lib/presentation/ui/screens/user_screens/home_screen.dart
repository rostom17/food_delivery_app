import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/presentation/ui/app_constants/dummy_data.dart';
import 'package:food_delivery_app/presentation/ui/utilities/searchBarDecoration.dart';
import 'package:food_delivery_app/presentation/ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundPattern(
        patternNumber: 1,
        backgroundPatternWidget: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                _titleSection(),
                const SizedBox(height: 20),
                _searchBarSection(),
                const SizedBox(height: 20),
                const FeaturedProductWidget(),
                const SizedBox(height: 20),
                _buildRow(context, "Nearest Restaurant", 1),
                const SizedBox(
                  height: 10,
                ),
                _restaurantSection(),
                const SizedBox(
                  height: 10,
                ),
                _buildRow(context, "Popular Menu", 2),
                const SizedBox(
                  height: 10,
                ),
                _itemSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _itemSection() {
    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            MenuCard(item: DummyData.menuItems[index]),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: DummyData.menuItems.length,
      ),
    );
  }

  SizedBox _restaurantSection() {
    return SizedBox(
      height: 210,
      width: double.maxFinite,
      //child: ItemBuilderWidget(itemImages: Others.restaurantImages),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => RestaurantCard(
                imageLink: DummyData.restaurantImages[index],
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: DummyData.restaurantImages.length),
    );
  }

  Row _buildRow(BuildContext context, String name, int key) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextButton(
          onPressed: () {
            if(key == 1) {
              Get.toNamed('/restaurantScreen');
            }
          },
          child: const Text(
            "View More",
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  Row _searchBarSection() {
    return Row(
      children: [
        SizedBox(
          width: Get.width * .70,
          child: TextFormField(
            decoration: searchBarDecoration(),
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.orange.withOpacity(.1),
              borderRadius: BorderRadius.circular(15)),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.deepOrange,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }

  Row _titleSection() {
    return Row(
      children: [
        Text(
          "Find Your\nFavorite Food",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Badge(
            backgroundColor: Colors.red,
            label: Text("2"),
            child: Icon(
              CupertinoIcons.bell,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
