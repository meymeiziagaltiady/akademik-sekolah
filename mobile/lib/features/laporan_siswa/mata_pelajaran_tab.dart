import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MataPelajaranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _buildSubjectCard(
              'Pendidikan Jasmani, Olahraga, dan Kesehatan',
              'Laboris sit amet deserunt non labore id occaecat id. Cillum ad aute sit dolore quis elit ut cupidatat occaecat aliqua fugiat officia proident consectetur. Ullamco officia laboris laborum cillum sint laboris quis dolore aliqua fugiat quis. In excepteur ipsum tempor labore ipsum. Consequat irure ipsum anim qui adipisicing proident ad sunt duis ullamco ex mollit laboris. Occaecat ut Lorem reprehenderit anim. Aliquip in quis velit amet cillum consequat id sint proident.',
              'A'),
          _buildSubjectCard('nama mata pelajaran', 'ini deskripsi', 'AB')
        ],
      ),
    ));
  }

  Widget _buildSubjectCard(
      String subject, String description, String final_score) {
    return GestureDetector(
        onTap: () => Get.toNamed('/detail_report_score'),
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
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Color(0xffFEF496)),
                      padding: EdgeInsets.all(8),
                      child: Center(
                          child: Stack(
                        children: [
                          Text(
                            final_score,
                            style: TextStyle(
                              fontSize: 30,
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
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff85B6FF)),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
