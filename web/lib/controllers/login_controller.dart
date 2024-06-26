import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void login() {
    // Implement login logic here
    print('Email: ${email.value}');
  }
}
