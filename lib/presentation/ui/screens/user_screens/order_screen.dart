import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/state_holders/order_controller.dart';
import 'package:food_delivery_app/presentation/ui/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _orderController = Get.find<OrderController>();

  void quantityIncrement(int id) {
    _orderController.incrementItemNumber(id);
  }

  void quantityDecrement(int id) {
    _orderController.decrementItemNumber(id);
  }

  int qty(int id) {
    int index =
        _orderController.quantityCheck.indexWhere((e) => e.containsKey(id));
    int x = _orderController.quantityCheck[index][id]!;
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundPattern(
          backgroundPatternWidget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 20, right: 20, bottom: 0),
              child: GetBuilder<OrderController>(builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Details",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (controller.myOrderList.isNotEmpty)
                      ...orderCard(controller),
                    if (controller.myOrderList.isEmpty)
                      Center(
                        child: Lottie.asset('assets/lotties/empty.json'),
                      ),
                  ],
                );
              }),
            ),
          ),
          patternNumber: 1),
      bottomNavigationBar: _priceCalculation(),
    );
  }

  List<Widget> orderCard(controller) {
    return controller.myOrderList
        .map<Widget>(
          (item) => Dismissible(
            key: Key(item['id'].toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              controller.removeFromOrderList(item['id']);
            },
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Card(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                item['imageLink'],
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item['name']}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Text('Description'),
                          Text(
                            '${item['price']}',
                            style: const TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton.outlined(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              quantityIncrement(item['id']);
                            },
                            icon: const Icon(Icons.add),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            qty(item['id']).toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton.outlined(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              quantityDecrement(item['id']);
                            },
                            icon: const Icon(Icons.remove),
                          ),
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

  BottomAppBar _priceCalculation() {
    return BottomAppBar(
      color: Colors.transparent,
      height: 280,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green, Colors.greenAccent],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                _categiricalPrice("Sub-total", 15.9),
                _categiricalPrice("Discount", 1.0),
                _categiricalPrice("Delivery Charge", 4.99),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "150 \$",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Place Order",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.greenAccent,
                    fixedSize: const Size.fromWidth(double.maxFinite),
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _categiricalPrice(String category, double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category,
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
        ),
        Text(
          "$price \$",
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
