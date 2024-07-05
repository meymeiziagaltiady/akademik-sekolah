import 'package:flutter/material.dart';

class LaporanGuruScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Kinerja Guru'),
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAttendanceReportCard('Pendidikan Jasmani, Olahraga, dan Kesehatan', 'XI RPL B', 9),
            _buildAttendanceReportCard('Pendidikan Jasmani, Olahraga, dan Kesehatan', 'XI RPL B', 9),
            _buildAttendanceReportCard('Pendidikan Jasmani, Olahraga, dan Kesehatan', 'XI RPL B', 9),
            _buildAttendanceReportCard('Pendidikan Jasmani, Olahraga, dan Kesehatan', 'XI RPL B', 9),
            _buildAttendanceReportCard('Pendidikan Jasmani, Olahraga, dan Kesehatan', 'XI RPL B', 9),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceReportCard(
      String subject, String className, int lessonHours) {
    return Card(
      elevation: 6,
      shadowColor: Color.fromARGB(100, 0, 0, 0),
      margin: EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Color.fromARGB(25, 133, 133, 151),
        ),
      ),
      child: SizedBox(
          height: 125,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          subject,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1F1F39),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          className,
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff858597)), textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0xff3D5CFF),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        children: [
                          Text('Lesson Hours:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text(
                            '$lessonHours jam',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
