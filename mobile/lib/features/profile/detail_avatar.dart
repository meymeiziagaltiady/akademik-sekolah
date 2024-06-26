import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailAvatarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String picture = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: NetworkImage(picture)),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text(
                  "Edit",
                  style: TextStyle(color: Color(0xff3D5CFF), fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                onPressed: () => Get.snackbar('Hi', 'i am a modern snackbar')),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
