import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PengumumanScreen extends StatelessWidget {
  final String thumbnail = 'images/lepi.jpg';
  final String title = 'Ad voluptate velit laborum do officia nostrud.';
  final String content =
      'Minim aliqua consectetur aliqua adipisicing aliqua adipisicing cillum. Labore aute nostrud elit sunt aute minim. Esse mollit ipsum nulla nulla deserunt velit ipsum esse elit est tempor id aliqua eu.\nSit commodo culpa deserunt duis. Pariatur mollit quis tempor et dolor veniam elit cillum. Quis ex sint ut pariatur sint officia aliquip laboris.\nId reprehenderit magna nulla officia dolore anim dolor ex aliqua esse. Irure nulla qui culpa sunt non irure deserunt anim cillum amet aliqua. Sint commodo exercitation excepteur ex enim laboris esse tempor sint excepteur. Magna incididunt dolor duis minim ullamco.';
  final DateTime reminderDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengumuman'),
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPengumumanCard(title, content, thumbnail, reminderDate),
            _buildPengumumanCard(title, content, thumbnail, reminderDate),
            _buildPengumumanCard(title, content, thumbnail, reminderDate),
            _buildPengumumanCard(title, content, thumbnail, reminderDate),
            _buildPengumumanCard(title, content, thumbnail, reminderDate),
            _buildPengumumanCard(title, content, thumbnail, reminderDate),
            _buildPengumumanCard(title, content, thumbnail, reminderDate),
            _buildPengumumanCard(title, content, thumbnail, reminderDate),
            _buildPengumumanCard(title, content, thumbnail, reminderDate),
          ],
        ),
      ),
    );
  }

  Widget _buildPengumumanCard(
      String title, String content, String thumbnail, DateTime reminderDate) {
    String formattedReminderDate =
        DateFormat('HH:mm, dd MMM yyyy').format(reminderDate);

    return Card(
        elevation: 6,
        shadowColor: Color.fromARGB(100, 0, 0, 0),
        margin: EdgeInsets.only(bottom: 20),
        child: GestureDetector(
          onTap: () => Get.toNamed('/detail_pengumuman', arguments: {
            'thumbnail': thumbnail,
            'title': title,
            'content': content,
            'reminderDate': reminderDate
          }),
          child: SizedBox(
              height: 135,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formattedReminderDate,
                            style: TextStyle(
                                color: Color(0xff858597), fontSize: 10),
                          ),
                          Spacer(),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1F1F39),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                          ),
                          SizedBox(height: 10),
                          Text(
                            content,
                            style: TextStyle(
                                fontSize: 10, color: Color(0xff858597)),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        flex: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image(
                              image: AssetImage(thumbnail),
                              fit: BoxFit.cover,
                            )))
                  ],
                ),
              )),
        ));
  }
}
