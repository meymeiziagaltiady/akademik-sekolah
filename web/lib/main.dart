import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi_sekolah/views/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}