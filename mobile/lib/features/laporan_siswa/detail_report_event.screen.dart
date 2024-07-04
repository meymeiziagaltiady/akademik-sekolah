import 'package:flutter/material.dart';

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
              _buildEventAttachmentList()
            ])));
  }

  Widget _buildEventAttachmentList() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return _buildEventAttachmentListItem(
            'Aute veniam aliquip voluptate commodo ad.jpg',
            'https://firehouseshelter.com/wp-content/themes/kronos/assets/images/news-placeholder.jpg');
      },
    );
  }

  Widget _buildEventAttachmentListItem(String filename, String file_url) {
    return Card(
      elevation: 6,
      shadowColor: Color.fromARGB(100, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                file_url,
                fit: BoxFit.cover,
              ),
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
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
