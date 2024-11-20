import 'package:food_delivery_app/presentation/state_holders/auth_controller/login_controller.dart';
import 'package:food_delivery_app/presentation/state_holders/auth_controller/sign_up_controller.dart';
import 'package:food_delivery_app/presentation/state_holders/order_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies () {
    Get.put(LoginController());
    Get.put(SignUpController());
    Get.put(OrderController());
  }
}