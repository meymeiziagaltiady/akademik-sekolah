import 'package:aplikasi_sekolah/controllers/login_controller.dart';
import 'package:aplikasi_sekolah/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9F9FC),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          width: 700,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: 60),
              Text(
                'Email',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Obx(()=>TextField(
                controller:controller.emailController,
                onChanged: (value) {
                    // Reset email validation on input change
                    if (!controller.isEmailValid.value) {
                      controller.isEmailValid.value = true;
                    }
                  },
                decoration: InputDecoration(
                  hintText: 'Masukkan email',
                  hintStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16, 
                    fontWeight: FontWeight.w100, 
                  ),
                  errorText: controller.isEmailValid.value
                        ? null
                        : 'Enter a valid email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blue, // Warna border
                      width: 2.0, // Ketebalan border
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blue, // Warna border saat fokus
                      width: 2.0, // Ketebalan border saat fokus
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color(0xffE2E8F0),// Warna border saat tidak fokus
                      width: 1.0, // Ketebalan border saat tidak fokus
                    ),
                  ),
                ),
              )),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: controller.login,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Masuk'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff02367B), // Warna background tombol
                    foregroundColor: Colors.white, // Warna teks dan ikon tombol
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30), // Ukuran padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: TextStyle(
                      fontSize: 14, // Ukuran teks
                      fontWeight: FontWeight.w200, // Ketebalan teks
                    ),
                    iconColor: Colors.white, // Warna ikon
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}