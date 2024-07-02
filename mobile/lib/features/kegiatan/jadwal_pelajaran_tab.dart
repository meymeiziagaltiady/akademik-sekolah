import 'package:flutter/material.dart';

class JadwalPelajaranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [JadwalSection(), JadwalSection(), JadwalSection()],
      ),
    ));
  }

  Widget JadwalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Senin',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff3D5CFF))),
        SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33),
            side: BorderSide(
              color: Color.fromARGB(51, 0, 0, 0),
              width: 1.0,
            ),
          ),
          elevation: 0,
          margin: EdgeInsets.only(bottom: 20),
          child: SizedBox(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      PelajaranSection(),
                      Divider(
                        color: Color.fromARGB(51, 0, 0, 0),
                      ),
                      PelajaranSection(),
                    ],
                  ))),
        )
      ],
    );
  }

  Widget PelajaranSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'NAMA PELAJARAN',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: Text(
              'Jam 10:20 - 12:00',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.end,
            ))
          ],
        ),
        Text(
          'Nama Guru',
          style: TextStyle(
            fontSize: 11,
            color: Color(0xff393939),
          ),
          maxLines: 2,
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }
}
