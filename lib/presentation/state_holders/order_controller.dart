import 'package:get/get.dart';

class OrderController extends GetxController {
  List<Map<String, dynamic>> myOrderList = [];
  List<Map<int, int>> quantityCheck = [];

  double subTotal = 0;
  double discount = .15;
  double deliveryCharge = 4.90;

  void addToOrderList(Map<String, dynamic> order) {
    int idx = myOrderList.indexWhere((element) => element['id'] == order['id']);
    if (idx == -1) {
      myOrderList.add(order);
      quantityCheck.add({order['id']: 1});
      subTotal = subTotal + order['price'];
    }
    update();
  }

  void removeFromOrderList(int id) {
    if (myOrderList.isNotEmpty) {
      int idx = myOrderList.indexWhere((element) => element['id'] == id);
      int idx2 = quantityCheck.indexWhere((e) => e.containsKey(id));
      subTotal = subTotal - myOrderList[idx]['price'] * quantityCheck[idx2][id];
      myOrderList.removeWhere((item) => item['id'] == id);
      quantityCheck.removeWhere((element) => element.containsKey(id));
      update();
    }
  }

  int itemQuantity(int id) {
    int idx = quantityCheck.indexWhere((e) => e.containsKey(id));
    if (idx != -1) {
      int value = quantityCheck[idx][id]!;
      return value;
    } else {
      return 1;
    }
  }

  void incrementItemNumber(int id) {
    int idx = quantityCheck.indexWhere((element) => element.containsKey(id));
    if (idx != -1) {
      quantityCheck[idx][id] = quantityCheck[idx][id]! + 1;
    }

    int idx2 = myOrderList.indexWhere((element)=> element['id'] == id);
    if(idx2 != -1) {
      subTotal = subTotal + myOrderList[idx2]['price'] ;
    }
    update();
  }

  void decrementItemNumber(int id) {
    int idx = quantityCheck.indexWhere((element) => element.containsKey(id));
    if (idx != -1 && quantityCheck[idx][id]! > 1) {
      quantityCheck[idx][id] = quantityCheck[idx][id]! - 1;
    }
    int idx2 = myOrderList.indexWhere((element)=> element['id'] == id);
    if(idx2 != -1) {
      subTotal = subTotal - myOrderList[idx2]['price'] ;
    }
    update();
  }

  double get getSubtotal => subTotal;
  double get getDiscount => subTotal * .1;
  double get getTotalPrice => subTotal != 0 ? subTotal - (subTotal * .1) + deliveryCharge : 0;
}
