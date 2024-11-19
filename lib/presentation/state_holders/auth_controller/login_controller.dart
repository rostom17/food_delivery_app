import 'package:get/get.dart';

class LoginController extends GetxController {
  bool loginRequestInProgress = false;

  Future<bool> loginRequest(String email, String pass) async {
    loginRequestInProgress = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    loginRequestInProgress = false;
    update();

    if (email == "abcd@gmail.com" && pass == "1234") {
      return true;
    } else {
      return false;
    }
  }
}
