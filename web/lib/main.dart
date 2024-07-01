import 'package:aplikasi_sekolah/views/pages/siswa_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi_sekolah/views/pages/login_page.dart';
import 'package:aplikasi_sekolah/views/pages/otp_page.dart';
import 'package:aplikasi_sekolah/controllers/siswa_controller.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      initialRoute: '/siswa',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/otp', page: () => OTPPage()),
        GetPage(name: '/siswa', page: () => StudentPage()),
      ],
    );
  }
}