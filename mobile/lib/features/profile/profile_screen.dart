import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
    final String avatarPicture = Get.arguments['avatarPicture'];
    final String username = Get.arguments['username'];
    final String sekolah = Get.arguments['sekolah'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profil'),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          leading: BackButton(color: Colors.white),
        ),
        body: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
                child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarPicture),
                  radius: 40,
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: 'Ubah Avatar',
                    style: TextStyle(color: Color(0xff006CA5),fontSize: 14),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed('/detail_avatar',arguments: avatarPicture);
                      },
                  ),
                ),
                SizedBox(height: 20),
                // FIELD username
                _buildProfileField("Nama", username),
                SizedBox(height: 20),
                // FIELD SEKOLAH
                _buildProfileField("Sekolah", sekolah)
              ],
            ))));
  }

  Widget _buildProfileField(String label, String value) {
    return TextFormField(
      initialValue: value,
      readOnly: true,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        enabled: false,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffB8B8D2),
          ),
        ),
      ),
    );
  }
}
