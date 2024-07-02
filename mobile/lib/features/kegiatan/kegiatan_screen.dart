import 'package:akademik_1/features/kegiatan/controller/kegiatan_controller.dart';
import 'package:akademik_1/features/kegiatan/jadwal_pelajaran_tab.dart';
import 'package:akademik_1/features/kegiatan/kegiatan_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KegiatanScreen extends StatelessWidget {
  final KegiatanController kegiatanController = Get.put(KegiatanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Kegiatan'),
        leading: BackButton(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: kegiatanController.tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xff3D5CFF),
              tabs: [
                Tab(text: 'Kegiatan'),
                Tab(text: 'Jadwal Pelajaran'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: kegiatanController.tabController,
        children: [
          Center(child: KegiatanTab()),
          Center(child: JadwalPelajaranTab()),
        ],
      ),
    );
  }
}
