import 'dart:io';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late File userPhoto;
  Map<String, dynamic> userDataWhileSignUp = {
    'name' : '',
    'email' : '',
    'password' : '',
    'firstName' : '',
    'lastName' : '',
    'mobile' : '',
    'paymentMethod' : '',
    'profilePhoto' : '',
    'location' : ''
  };

  bool showPassword = false;
  void toggleShowPass () {
    showPassword = !showPassword;
    update();
  }

  bool signUpRequestInProgress = false;

  Future<bool> signUp (String name, String email, String password) async {
    signUpRequestInProgress = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    userDataWhileSignUp['name'] = name;
    userDataWhileSignUp['email'] = email;
    userDataWhileSignUp['password'] = password;

    signUpRequestInProgress = false;
    update();

    return true;
  }

  void updateBio ({required String firstName, required String lastName, required String mobile}) {
    userDataWhileSignUp['fistName'] = firstName;
    userDataWhileSignUp['lastName'] = lastName;
    userDataWhileSignUp['mobile'] = mobile;

    print(userDataWhileSignUp.toString());
  }

  int selectedPaymentMethod = -1;

  void setPaymentMethod (int idx) {
    selectedPaymentMethod = idx;
    if(idx == 0) {
      userDataWhileSignUp['paymentMethod'] = 'PayPal';
    } else if (idx == 1) {
      userDataWhileSignUp['paymentMethod'] = 'Visa';
    } else {
      userDataWhileSignUp['paymentMethod'] = 'MasterCard';
    }
    update();
  }

  void setUserProfilePhoto (File img) {
    userPhoto = img;
    update();
  }
}