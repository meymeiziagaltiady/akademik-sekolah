import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  String avatarPicture =
      "https://i.pinimg.com/736x/51/07/f3/5107f3192938d53dfa63d744c0249548.jpg";
  String username = "Jay Park";
  String sekolah = "SMA Hybe";
  String userRole = "Siswa";

  final List<String> content = const [
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf jlfkadjflkadjflkadjfldajflkadjflkajflkadjflkadjfladkjfalkjfklajfkladjlkfajdlkfajdlkfjlkdjflkajflkdajflkajflkajsflkajdflkj END',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf ',
    'dfakfjaldfjd alfjalkdfjaldkfjadf lkajdf kladfj adlkfdj alkfja lfkjadfadjf '
  ];
  final int maxLength = 650;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).primaryColor,
              statusBarIconBrightness: Brightness.light,
            ),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    header(context),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                btnFeature('icons/Clock.svg', 'Kehadiran',
                                    'kehadiran'),
                                btnFeature('icons/toa.svg', 'Pengumuman',
                                    'pengumuman'),
                                btnFeature(
                                    'icons/Matemathic.svg', 'Ujian', 'ujian'),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                btnFeature('icons/Schedule.svg', 'Kegiatan',
                                    'kegiatan'),
                                btnFeature(
                                    'icons/Webinar.svg',
                                    'Laporan Belajar Siswa',
                                    'laporan_belajar_siswa'),
                                btnFeature(
                                    'icons/E-Learning.svg',
                                    'Laporan Kinerja Guru',
                                    'laporan_kinerja_guru'),
                              ],
                            ),
                          ],
                        )),
                    pengumumanSection(context)
                  ],
                ),
              ),
            )));
  }

  Widget header(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, $username',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userRole,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                Text(
                  sekolah,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Get.toNamed('profile', arguments: {
                  'avatarPicture': avatarPicture,
                  'username': username,
                  'sekolah': sekolah
                }),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(avatarPicture),
                  radius: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget btnFeature(String icon, String nameFeature, String route) {
    return Expanded(
        child: Column(
      children: [
        SizedBox(
          child: ElevatedButton(
            onPressed: () => Get.toNamed('/$route'),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SvgPicture.asset(
                icon,
                width: 30,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff3B82F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          nameFeature,
          style: TextStyle(color: Color(0xff858597)),
          textAlign: TextAlign.center,
        ),
      ],
    ));
  }

  Widget pengumumanSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'PENGUMUMAN TERKINI',
              style: TextStyle(
                color: Color(0xff1F1F39),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
