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
          centerTitle: true,
          leading: BackButton(color: Colors.white),
        ),
        body: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () =>
                      {Get.toNamed('/detail_avatar', arguments: avatarPicture)},
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(avatarPicture),
                    radius: 40,
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  splashColor: Colors.grey[200],
                  onTap: () =>
                      {Get.toNamed('/detail_avatar', arguments: avatarPicture)},
                  child: Text(
                    'Ubah Avatar',
                    style: TextStyle(color: Color(0xff006CA5)),
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
