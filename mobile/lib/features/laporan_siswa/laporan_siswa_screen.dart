import 'package:akademik_1/features/kegiatan/controller/kegiatan_controller.dart';
import 'package:akademik_1/features/laporan_siswa/kegiatan_siswa_tab.dart';
import 'package:akademik_1/features/laporan_siswa/mata_pelajaran_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanSiswaScreen extends StatelessWidget {
  final KegiatanController kegiatanController = Get.put(KegiatanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Belajar Siswa'),
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
                Tab(text: 'Mata Pelajaran'),
                Tab(text: 'Kegiatan Siswa'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: kegiatanController.tabController,
        children: [
          Center(child: MataPelajaranTab()),
          Center(child:KegiatanSiswaTab()),
        ],
      ),
    );
  }
}
