import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  String avatarPicture =
      "https://i.pinimg.com/736x/51/07/f3/5107f3192938d53dfa63d744c0249548.jpg";
  String username = "Jay Park";
  String sekolah = "SMA Hybe";
  String userRole = "Siswa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        child: SafeArea(
          child: Column(
            children: [
              header(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height / 4,
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
}
