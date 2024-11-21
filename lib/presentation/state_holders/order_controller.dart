import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  List<Map<String, dynamic>> myOrderList = [];
  List<Map<int,int>> quantityCheck = [];

  void addToOrderList (Map<String,dynamic> order) {
    myOrderList.add(order);
    quantityCheck.add({order['id']: 1});
    update();
  }

  void removeFromOrderList (int id) {
    if(myOrderList.isNotEmpty) {
      myOrderList.removeWhere((item)=> item['id'] == id);
      quantityCheck.removeWhere((element)=> element.containsKey(id));
      update();
    }
    
  }

  int itemQuantity (int id) {
    int idx = quantityCheck.indexWhere((e)=> e.containsKey(id));
    if(idx != -1) {
      int value = quantityCheck[idx][id]!;
      return value;
    } else {
      return 1;
    }
  }

  void incrementItemNumber (int id) {
    int idx = quantityCheck.indexWhere((element)=> element.containsKey(id));
    if(idx != -1) {
      quantityCheck[idx][id] = quantityCheck[idx][id]! + 1;
      //print(quantityCheck[idx][id].toString());
    }
    update();
  }
  
  void decrementItemNumber (int id) {
    int idx = quantityCheck.indexWhere((element)=> element.containsKey(id));
    if(idx != -1 && quantityCheck[idx][id]! > 0) {
      quantityCheck[idx][id] = quantityCheck[idx][id]! - 1;
    }
    update();
  }
}