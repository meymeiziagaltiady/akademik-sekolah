import 'package:flutter/material.dart';

class DetailReportScoreScreen extends StatelessWidget {
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
              Text('Nama Mata Pelajaran',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Ini deskripsi Excepteur adipisicing ipsum et sint sit adipisicing ex dolore. Deserunt ex aliquip minim nulla sunt. Id ex elit minim qui irure proident amet irure consectetur eiusmod ipsum est. Incididunt proident irure elit nostrud qui aute deserunt eiusmod enim id incididunt cillum.',
                  style: TextStyle(fontSize: 14)),
              SizedBox(height: 40),
              Text(
                'Laporan Hasil Ujian',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildScoreList()
            ])));
  }

  Widget _buildScoreList() {
    return Column(
      children: [
        _buildScoreListItem('01', 'Nama Mapel', '100'),
        SizedBox(
          height: 10,
        ),
        _buildScoreListItem('02', 'Qui sit laborum minim excepteur do.', '90'),
        SizedBox(height: 10),
        _buildScoreListItem('03', 'Nama Mapel', '100'),
        SizedBox(
          height: 10,
        ),
        _buildScoreListItem('04', 'Nama Mapel', '100'),
        SizedBox(
          height: 20,
        ),
        _buildFinalScoreCard('AB')
      ],
    );
  }

  Widget _buildScoreListItem(String id, String title, String score) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              id,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB8B8D2)),
            )),
        Expanded(
            flex: 4,
            child: Text(
              title,
              overflow: TextOverflow.clip,
            )),
        SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xff3D5CFF)),
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                score,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildFinalScoreCard(String final_score) {
    return Card(
      elevation: 0,
      color: Color(0xff3D5CFF),
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 4,
                  child: Text(
                    'Nilai Akhir',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  )),
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xffFEF496),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Center(
                        child: Stack(
                      children: [
                        Text(
                          final_score,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Color(0xff3B82F6),
                          ),
                        ),
                        Text(
                          final_score,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff85B6FF)),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
