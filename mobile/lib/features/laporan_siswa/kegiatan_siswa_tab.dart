import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KegiatanSiswaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildEventCard(
              'Pendidikan Jasmani, Olahraga, dan Kesehatan',
              'Laboris sit amet deserunt non labore id occaecat id. Cillum ad aute sit dolore quis elit ut cupidatat occaecat aliqua fugiat officia proident consectetur. Ullamco officia laboris laborum cillum sint laboris quis dolore aliqua fugiat quis. In excepteur ipsum tempor labore ipsum. Consequat irure ipsum anim qui adipisicing proident ad sunt duis ullamco ex mollit laboris. Occaecat ut Lorem reprehenderit anim. Aliquip in quis velit amet cillum consequat id sint proident.',
              ['image1.png', 'image2.jpg', 'video1.mp4', 'video2.mp4', 'image3.jpg', 'video3.mp4', 'video4.mp4'],
            ),
            _buildEventCard('nama mata pelajaran', 'ini deskripsi', ['image.jpg', 'video.mp4']),
            _buildEventCard('nama mata pelajaran', 'ini deskripsi', ['image.jpg']),
            _buildEventCard('nama mata pelajaran', 'ini deskripsi', ['video.mp4']),
            _buildEventCard('nama mata pelajaran', 'ini deskripsi', ['image1.jpg', 'image2.jpg']),
            _buildEventCard('nama mata pelajaran', 'ini deskripsi', ['video1.mp4', 'video2.mp4']),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(String subject, String description, List<String> attachments) {
    return GestureDetector(
      onTap: () => Get.toNamed('/detail_report_event'),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Color.fromARGB(25, 133, 133, 151),
          ),
        ),
        elevation: 6,
        shadowColor: Color.fromARGB(100, 0, 0, 0),
        margin: EdgeInsets.only(bottom: 20),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
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
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff858597),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                _buildAttachmentList(attachments)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAttachmentList(List<String> attachments) {
    List<Widget> attachmentWidgets = [];
    for (int i = 0; i < attachments.length && i < 2; i++) {
      attachmentWidgets.add(_buildAttachmentListItem(attachments[i]));
    }

    if (attachments.length > 2) {
      attachmentWidgets.add(_buildExtraAttachmentItem(attachments.length - 2));
    }

    return Row(
      children: attachmentWidgets,
    );
  }

  String _getFileType(String filename) {
    String extension = filename.split('.').last.toLowerCase();
    if (['jpg', 'jpeg', 'png'].contains(extension)) {
      return 'image';
    } else if (['mp4'].contains(extension)) {
      return 'video';
    } else {
      return 'file';
    }
  }

  Widget _buildAttachmentListItem(String filename) {
    String type = _getFileType(filename);
    IconData icon;
    Color iconColor;

    if (type == 'image') {
      icon = Icons.image;
      iconColor = Colors.green;
    } else if (type == 'video') {
      icon = Icons.videocam;
      iconColor = Colors.blue;
    } else {
      icon = Icons.attach_file;
      iconColor = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.all(7),
      constraints: BoxConstraints(maxWidth: 130),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xff858597), width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: iconColor),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              filename,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Color(0xff858597)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExtraAttachmentItem(int extraCount) {
    return Container(
      padding: EdgeInsets.all(7),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xff858597), width: 1),
      ),
      child: Text(
        '+$extraCount',
        style: TextStyle(fontSize: 12, color: Color(0xff858597)),
      ),
    );
  }
}
