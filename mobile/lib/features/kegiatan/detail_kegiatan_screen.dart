import 'dart:io';

import 'package:akademik_1/core/helpers/file_picker_controller.dart';
import 'package:akademik_1/core/widgets/components/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';

class DetailKegiatanScreen extends StatelessWidget {
  final FilePickerController filePickerController = Get.put(FilePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Jadwal Kegiatan'),
          leading: BackButton(color: Colors.white),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Nama Event',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Ini deskripsi Excepteur adipisicing ipsum et sint sit adipisicing ex dolore. Deserunt ex aliquip minim nulla sunt. Id ex elit minim qui irure proident amet irure consectetur eiusmod ipsum est. Incididunt proident irure elit nostrud qui aute deserunt eiusmod enim id incididunt cillum.',
                  style: TextStyle(fontSize: 14)),
              SizedBox(height: 40),
              _uploadFile()
            ])));
  }

  Widget _uploadFile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Foto, Video, atau dokumen PDF',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15,),
        SizedBox(
          width: double.infinity,
          child: DottedBorder(
            color: Color(0xff3B82F6),
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            dashPattern: [6, 3],
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: TextButton(
                onPressed: () async {
                  await filePickerController.getFile();
                },
                child: Text(
                  '+ Tambah File',
                  style: TextStyle(
                    color: Color(0xff3B82F6),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        _buildUploadedFilesList(),
        SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () async {
              DialogController().succesDialog('Berhasil', Text('File berhasil diupload'));
            },
            child: Text(
              'Upload',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xff3B82F6),
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadedFilesList() {
    return Obx(() {
      List<Widget> fileCards = [];
      fileCards.addAll(filePickerController.images.map((file) => _buildUploadedFileCard(file)));
      fileCards.addAll(filePickerController.videos.map((file) => _buildUploadedFileCard(file)));
      fileCards.addAll(filePickerController.pdfs.map((file) => _buildUploadedFileCard(file)));

      return Column(
        children: fileCards,
      );
    });
  }

  Widget _buildUploadedFileCard(File file) {
    String fileType = '';
    if (file.path.endsWith('.jpg') || file.path.endsWith('.jpeg') || file.path.endsWith('.png')) {
      fileType = 'Image';
    } else if (file.path.endsWith('.mp4')) {
      fileType = 'Video';
    } else if (file.path.endsWith('.pdf')) {
      fileType = 'PDF';
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Color(0xffE4E9F0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: fileType == 'Image'
                      ? Image.file(
                          file,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        )
                      : fileType == 'Video'
                          ? Icon(Icons.videocam, size: 60)
                          : Icon(Icons.picture_as_pdf, size: 60),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          file.path.split('/').last,
                          style: TextStyle(fontSize: 12, color: Color(0xff132A60)),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${(file.lengthSync() / 1024).toStringAsFixed(2)} KB',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 6,
              right: 6,
              child: GestureDetector(
                onTap: () {
                  if (fileType == 'Image') {
                    filePickerController.images.remove(file);
                  } else if (fileType == 'Video') {
                    filePickerController.videos.remove(file);
                  } else if (fileType == 'PDF') {
                    filePickerController.pdfs.remove(file);
                  }
                },
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
