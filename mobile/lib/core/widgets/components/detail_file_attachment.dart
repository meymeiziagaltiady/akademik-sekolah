import 'package:akademik_1/core/widgets/components/pdf_viewer.dart';
import 'package:akademik_1/core/widgets/components/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailFileAttachment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, String>;
    String fileUrl = arguments['fileUrl']!;
    String fileType = arguments['fileType']!;
    String fileName = arguments['fileName']!;

    Widget getFileWidget() {
      if (fileType == 'image') {
        return Image.network(fileUrl);
      } else if (fileType == 'video') {
        return VideoApp(fileUrl);
      } else if (fileType == 'pdf') {
        return PDFViewer(fileUrl);
      } else {
        return Center(child: Text('Unsupported file type'));
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text(fileName, style: TextStyle(fontSize: 14)),
        centerTitle: false,
      ),
      body: Center(child: getFileWidget()),
      backgroundColor: Colors.transparent,
    );
  }
}