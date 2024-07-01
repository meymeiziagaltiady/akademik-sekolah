import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class LoginController extends GetxController {
 // Text editing controller for email
  final emailController = TextEditingController();

  // Observable to track if email is valid
  var isEmailValid = true.obs;

  get validateEmail => null;

  // Function to handle login action
  void login() {
    final email = emailController.text;

    // email validation
    if (email.isEmpty || !GetUtils.isEmail(email)) {
      isEmailValid.value = false;
    } else {
      isEmailValid.value = true;
      Get.offNamed('/otp');
    }
  }
  
  // Dispose controller when not needed
  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
