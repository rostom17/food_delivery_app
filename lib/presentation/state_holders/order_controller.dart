import 'package:get/get.dart';

class OrderController extends GetxController {
  List<Map<String, dynamic>> myOrderList = [];

  void addToOrderList (Map<String,dynamic> order) {
    myOrderList.add(order);
    update();
  }

  void removeFromOrderList (int idx) {
    if(myOrderList.isNotEmpty) {
      myOrderList.removeAt(idx);
    }
    update();
  }

  void incrementItemNumber () {

  }
  
  void decrementItemNumber () {

  }
}