import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class PDFViewer extends StatelessWidget {
  final String fileUrl;

  PDFViewer(this.fileUrl);

  Future<String> downloadAndSaveFile(String url, String fileName) async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      String savePath = '${dir.path}/$fileName';
      await Dio().download(url, savePath);
      return savePath;
    } catch (e) {
      throw Exception("Error downloading file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: downloadAndSaveFile(fileUrl, 'temp.pdf'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return PDFView(
            filePath: snapshot.data!,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: false,
            onRender: (_pages) {
              print('PDF rendered with $_pages pages');
            },
            onError: (error) {
              print('Error while rendering PDF: $error');
            },
            onPageError: (page, error) {
              print('Error on page $page: $error');
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}