import 'package:akademik_1/core/widgets/components/detail_file_attachment.dart';
import 'package:akademik_1/features/home/home_screen.dart';
import 'package:akademik_1/features/auth/login_screen.dart';
import 'package:akademik_1/features/auth/otp_screen.dart';
import 'package:akademik_1/features/kegiatan/detail_kegiatan_screen.dart';
import 'package:akademik_1/features/kegiatan/kegiatan_screen.dart';
import 'package:akademik_1/features/kehadiran/kehadiran_screen.dart';
import 'package:akademik_1/features/laporan_guru/laporan_guru_screen.dart';
import 'package:akademik_1/features/laporan_siswa/detail_report_event.screen.dart';
import 'package:akademik_1/features/laporan_siswa/detail_report_score_screen.dart';
import 'package:akademik_1/features/laporan_siswa/laporan_siswa_screen.dart';
import 'package:akademik_1/features/pengumuman/detail_pengumuman.dart';
import 'package:akademik_1/features/pengumuman/pengumuman_screen.dart';
import 'package:akademik_1/features/profile/detail_avatar.dart';
import 'package:akademik_1/features/profile/profile_screen.dart';
import 'package:akademik_1/features/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) =>runApp(Main()));
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      initialRoute: '/home',
      theme: ThemeData(
          primaryColor: Color(0xff02367B),
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue, backgroundColor: Colors.white),
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff02367B),
            centerTitle: true,
            titleTextStyle: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.white, letterSpacing: .5, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )),
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/otp', page: () => OTPScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/detail_avatar', page: () => DetailAvatarScreen()),
        GetPage(name: '/pengumuman', page: () => PengumumanScreen()),
        GetPage(name: '/detail_pengumuman', page: () => DetailPengumumanScreen()),
        GetPage(name: '/kehadiran', page: () => KehadiranScreen()),
        GetPage(name: '/kegiatan', page: () => KegiatanScreen()),
        GetPage(name: '/detail_kegiatan', page: () => DetailKegiatanScreen()),
        GetPage(name: '/laporan_siswa', page: () => LaporanSiswaScreen()),
        GetPage(name: '/detail_report_score', page: () => DetailReportScoreScreen()),
        GetPage(name: '/detail_report_event', page: () => DetailReportEventScreen()),
        GetPage(name: '/detail_file_attachment', page: ()=> DetailFileAttachment()),
        GetPage(name: '/laporan_guru', page: ()=> LaporanGuruScreen()),
      ],
    );
  }
}
