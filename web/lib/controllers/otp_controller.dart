import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OTPController extends GetxController{
  final digit1Controller = TextEditingController();
  final digit2Controller = TextEditingController();
  final digit3Controller = TextEditingController();
  final digit4Controller = TextEditingController();

  var isValid = true.obs;

  void submitOTP(){
    final otp = digit1Controller.text + digit2Controller.text + digit3Controller.text + digit4Controller.text;

    if (otp.length != 4 || !GetUtils.isNumericOnly(otp)) {
      isValid(false);
      print('invalid OTP');
    } else {
      isValid(true);
      Get.offNamed('/home');
    }
  }

  @override
  void onClose() {
    digit1Controller.dispose();
    digit2Controller.dispose();
    digit3Controller.dispose();
    digit4Controller.dispose();
    super.onClose();
  }
}