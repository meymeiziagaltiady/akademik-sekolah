import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailPengumumanScreen extends StatelessWidget {
  final String thumbnail = Get.arguments['thumbnail'];
  final String title = Get.arguments['title'];
  final String content = Get.arguments['content'];
  final String reminderDate =
      DateFormat('HH:mm, dd MMM yyyy').format(Get.arguments['reminderDate']);

  @override
  Widget build(BuildContext context) {
    List<String> contentParagraphs = content.split('\n');

    return Scaffold(
      appBar: AppBar(
        title: Text('Pengumuman'),
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
                image: AssetImage(thumbnail),
                width: double.infinity,
                fit: BoxFit.contain),
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      reminderDate,
                      style: TextStyle(color: Color(0xff858597), fontSize: 10),
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(title,
                        style: TextStyle(
                            color: Color(0xff1F1F39),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    SizedBox(height: 35),
                    ...contentParagraphs.map((paragraph) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          paragraph,
                          style: TextStyle(
                            color: Color(0xff858597),
                            fontSize: 12,
                            height: 1.5, // Jarak antar baris
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      );
                    }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
