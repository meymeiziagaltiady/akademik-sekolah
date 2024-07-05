import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailReportEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Laporan Belajar Siswa'),
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
              SizedBox(height: 20),
              _buildEventAttachmentList(context)
            ])));
  }

  Widget _buildEventAttachmentList(BuildContext context) {
    List<Map<String, String>> attachments = [
      {
        'filename': 'Aute veniam aliquip voluptate commodo ad.jpg',
        'file_url':
            'https://firehouseshelter.com/wp-content/themes/kronos/assets/images/news-placeholder.jpg',
        'type': 'image'
      },
      {
        'filename': 'Sample Video.mp4',
        'file_url':
            'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4',
        'type': 'video'
      },
      {
        'filename': 'Sample PDF.pdf',
        'file_url':
            'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
        'type': 'pdf'
      }
      // Add more attachments here
    ];

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: attachments.length,
      itemBuilder: (context, index) {
        var attachment = attachments[index];
        return _buildEventAttachmentListItem(context, attachment['filename']!,
            attachment['file_url']!, attachment['type']!);
      },
    );
  }

  Widget _buildEventAttachmentListItem(
      BuildContext context, String filename, String fileUrl, String type) {
    return InkWell(
      onTap: () {
        Get.toNamed('/detail_file_attachment',
            arguments: {'fileUrl': fileUrl, 'fileType': type, 'fileName':filename});
      },
      child: Card(
        elevation: 6,
        shadowColor: Color.fromARGB(100, 0, 0, 0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
            side: BorderSide(color: Color.fromARGB(25, 133, 133, 151))),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: type == 'image'
                    ? Image.network(
                        fileUrl,
                        fit: BoxFit.cover,
                      )
                    : type == 'video'
                        ? Icon(Icons.videocam, size: 50)
                        : Icon(Icons.picture_as_pdf, size: 50),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        filename,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
