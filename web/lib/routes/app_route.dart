import 'package:aplikasi_sekolah/views/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/login', page: () => LoginPage()),
    // Add other routes here
  ];
}
