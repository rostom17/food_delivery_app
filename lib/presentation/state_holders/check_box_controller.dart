import 'package:get/get.dart';

class CheckBoxController {
  RxBool _isSignInChecked = false.obs;
  RxBool _isGetEmailChecked = false.obs;

  bool get isSignInChecked => _isSignInChecked.value;

  bool get isGetEmailChecked => _isGetEmailChecked.value;

  void toggleSignInChecked () {
    _isSignInChecked.value = !_isSignInChecked.value ;
  }

  void toggleGetEmailChecked () {
    _isGetEmailChecked.value = !_isGetEmailChecked.value;
  }
}