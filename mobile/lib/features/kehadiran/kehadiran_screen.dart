import 'package:akademik_1/core/widgets/components/marquee.dart';
import 'package:akademik_1/features/kehadiran/controller/kehadiran_controller.dart';
import 'package:akademik_1/features/kehadiran/controller/date_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KehadiranScreen extends StatelessWidget {
  final KehadiranController kehadiranController =
      Get.put(KehadiranController());
  final DateController dateController = Get.put(DateController());
  String avatarPicture =
      "https://i.pinimg.com/736x/51/07/f3/5107f3192938d53dfa63d744c0249548.jpg";

  @override
  Widget build(BuildContext context) {
    dateController.updateCurrentDate();

    return Scaffold(
      appBar: AppBar(
        title: Text('Kehadiran'),
        leading: BackButton(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(context),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Riwayat Kehadiran',
                    style: TextStyle(
                        color: Color(0xff1F1F39), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  _buildKehadiranCard('hadir'),
                  _buildKehadiranCard('sakit'),
                  _buildKehadiranCard('izin'),
                  _buildKehadiranCard('dinas luar'),
                  _buildKehadiranCard('hadir'),
                  _buildKehadiranCard('sakit'),
                  _buildKehadiranCard('izin'),
                  _buildKehadiranCard('dinas luar'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        height: MediaQuery.of(context).size.height / 4,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: [
            // SHOW CURRENT LOCATION
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.place, color: Colors.red),
                Text("Lokasi Saat Ini:",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                SizedBox(width: 5),
                Container(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: MarqueeWidget(
                      child: Text(
                          'Jl. Cipamokolan No.143, Cipamokolan, Rancasari',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      direction: Axis.horizontal),
                )
              ],
            ),

            Spacer(),
            Card(
              elevation: 6,
              shadowColor: Color.fromARGB(100, 0, 0, 0),
              margin: EdgeInsets.only(bottom: 20),
              child: SizedBox(
                  child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Text(
                                dateController.getFormattedDate('id'),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1F1F39),
                                ),
                              )),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.access_time,
                                  color: Color(0xff858597), size: 10),
                              SizedBox(width: 2),
                              Text(
                                'Jam Masuk 08.00 WIB',
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff858597)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: kehadiranController.insideSchool,
                        child: Text(
                          "Absen Masuk",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(1),
                          backgroundColor: Color(0xff3B82F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            )
          ],
        ));
  }

  Widget _buildKehadiranCard(String status) {
    String formattedPresentDate = dateController.getFormattedDate('id');
    String formattedPresentTime = dateController.getFormattedTime();

    return Card(
      margin: EdgeInsets.only(bottom: 20),
      elevation: 7,
      shadowColor: Color(0xffDFDFEB),
      child: ExpansionTile(
        title: Text(
          formattedPresentDate,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xff1F1F39),
          ),
        ),
        expandedAlignment: Alignment.topLeft,
        childrenPadding: EdgeInsets.all(15),
        trailing: kehadiranBadge(status),
        children: [
          Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatarPicture),
                    radius: 25,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ABSEN MASUK',
                          style: TextStyle(
                              color: Color(0xff1F1F39),
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      Text(formattedPresentTime,
                          style:
                              TextStyle(color: Color(0xff858597), fontSize: 12))
                    ],
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatarPicture),
                    radius: 25,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ABSEN KELUAR',
                          style: TextStyle(
                              color: Color(0xff1F1F39),
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      Text(formattedPresentTime,
                          style:
                              TextStyle(color: Color(0xff858597), fontSize: 12))
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget kehadiranBadge(String status) {
    switch (status) {
      case "hadir":
        return hadirBadge();
      case "sakit":
        return sakitBadge();
      case "izin":
        return izinBadge();
      case "dinas luar":
        return dinasLuarBadge();
      default:
        return Placeholder();
    }
  }

  Widget hadirBadge() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Color.fromARGB(38, 33, 133, 208),
            borderRadius: BorderRadius.circular(3)),
        child: Text(
          'Hadir',
          style: TextStyle(
            color: Color(0xff2185D0),
            fontSize: 12,
          ),
        ));
  }

  Widget sakitBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(38, 219, 40, 40),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        'Sakit',
        style: TextStyle(
          color: Color(0xffDB2828),
          fontSize: 12,
        ),
      ),
    );
  }

  Widget izinBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(8, 251, 169, 8),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        'Izin',
        style: TextStyle(
          color: Color(0xffFBBD08),
          fontSize: 12,
        ),
      ),
    );
  }

  Widget dinasLuarBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(38, 33, 186, 69),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        'Dinas Luar',
        style: TextStyle(
          color: Color(0xff21BA45),
          fontSize: 12,
        ),
      ),
    );
  }
}
