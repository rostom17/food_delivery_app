import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/state_holders/order_controller.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/dummy_data.dart';
import 'package:get/get.dart';

class FoodItemScreen extends StatelessWidget {
  FoodItemScreen({super.key});

  final _orderController = Get.find<OrderController>();
  final Map<String, dynamic> item = Get.arguments!;

  void _onTapItem() {
    Get.toNamed('/foodItemScreen', arguments: item);
  }

  void onTapAddtoCart() {
    _orderController.addToOrderList(item);
    Get.snackbar("Successful", "Item Added to your List");
  }

  @override
  Widget build(BuildContext context) {
    final myThemeMode = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _sliverAppBar(myThemeMode),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _foodNameSection(context),
                  _rating_FavouriteSection(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "Lasagna is a beloved Italian dish known for its rich layers of flavor. It features wide, flat pasta sheets layered with a hearty meat sauce, creamy ricotta cheese, and a rich béchamel sauce. The layers are often topped with grated Parmesan cheese and baked until golden brown. Lasagna is a comforting and satisfying meal, perfect for sharing with family and friends. The combination of textures and flavors, from the tender pasta to the savory sauce, makes it a timeless classic."),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Similar Category Food",
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildSimilarCategoryItem(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 3,
        child: ElevatedButton(
          onPressed: onTapAddtoCart,
          child: const Text("Add to cart"),
        ),
      ),
    );
  }

  SizedBox _buildSimilarCategoryItem() {
    return SizedBox(
      height: 620,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) => _itemBuilder(context, index),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return InkWell(
      onTap: _onTapItem,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 180,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage(
                        "${DummyData.menuItems[index]['imageLink']}",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Text(
                "${DummyData.menuItems[index]['name']}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${DummyData.menuItems[index]['ratings']}',
                  ),
                ],
              ),
              Text(
                '\$${DummyData.menuItems[index]['price']}',
                style: const TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _rating_FavouriteSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
          width: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.orange,
            ),
            itemCount: 4,
          ),
        ),
        SizedBox(
          width: 50,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.heart,
                color: Colors.red,
              )),
        )
      ],
    );
  }

  Row _foodNameSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${item['name']}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Text(
          '\$15.5',
          style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  SliverAppBar _sliverAppBar(Brightness myThemeMode) {
    return SliverAppBar(
      expandedHeight: 350,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          '${item['imageLink']}',
          fit: BoxFit.cover,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                myThemeMode == Brightness.light ? Colors.white : Colors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
        ),
      ),
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      leadingWidth: 80,
    );
  }
}
