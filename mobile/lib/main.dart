import 'package:akademik_1/features/home/home_screen.dart';
import 'package:akademik_1/features/auth/login_screen.dart';
import 'package:akademik_1/features/auth/otp_screen.dart';
import 'package:akademik_1/features/profile/detail_avatar.dart';
import 'package:akademik_1/features/profile/profile_screen.dart';
import 'package:akademik_1/features/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      initialRoute: '/splash',
      theme: ThemeData(
        primaryColor: Color(0xff02367B),
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue, backgroundColor: Colors.white),
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/otp', page: () => OTPScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/detail_avatar', page: () => DetailAvatarScreen()),
      ],
    );
  }
}
