import 'package:akademik_1/features/kegiatan/controller/kegiatan_controller.dart';
import 'package:akademik_1/features/kegiatan/jadwal_pelajaran_tab.dart';
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
        bottom: TabBar(
          controller: kegiatanController.tabController,
          tabs: [
            Tab(text: 'Kegiatan'),
            Tab(text: 'Jadwal Pelajaran'),
          ],
        ),
      ),
      body: TabBarView(
        controller: kegiatanController.tabController,
        children: [
          Center(child: Text('Kegiatan')),
          Center(child: JadwalPelajaranTab()),
        ],
      ),
    );
  }
}
