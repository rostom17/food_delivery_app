import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/ui/app_constants/dummy_data.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myThemeMode = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _sliverAppBar(myThemeMode),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Mr Panda",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit_square,
                            size: 30,
                          ))
                    ],
                  ),
                  Text(
                    "dummyemail@gmail.com",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _voucherCard(context),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Favourite",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          ..._favouriteSection(context),
        ],
      ),
    );
  }

  Card _voucherCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            const Icon(
              Icons.card_giftcard_rounded,
              size: 50,
              color: Colors.orange,
            ),
            const SizedBox(
              width: 20,
            ),
            Text("Your have 3 voucher",
                style: Theme.of(context).textTheme.titleSmall)
          ],
        ),
      ),
    );
  }

  SliverAppBar _sliverAppBar(Brightness myThemeMode) {
    return SliverAppBar(
      expandedHeight: 350,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://static.wikia.nocookie.net/kungfupanda/images/7/73/KFP3-promo-po4.jpg/revision/latest?cb=20150726165358',
          fit: BoxFit.fill,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
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
    );
  }

  List<Widget> _favouriteSection(BuildContext context) {
    return DummyData.favouriteItems
        .map(
          (item) => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: NetworkImage(item['imageLink']),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'].toString(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text("Description ${item['name']}"),
                            Text(
                              "\$ ${item['price']}",
                              style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart_checkout)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
