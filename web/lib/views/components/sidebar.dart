import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:aplikasi_sekolah/controllers/siswa_controller.dart';

class Sidebar extends StatelessWidget {
  final StudentController controller = Get.find<StudentController>();

  final String toggleIcon = '''
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M17.9999 5.99997H19.9999V18H17.9999V5.99997ZM15.9999 11H7.41394L11.7069 6.70697L10.2929 5.29297L3.58594 12L10.2929 18.707L11.7069 17.293L7.41394 13H15.9999V11Z" fill="#F8FAFC"/>
    </svg>
  ''';

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: controller.isSidebarOpen.value ? 250 : 70,
        color: const Color(0xff02367b),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (controller.isSidebarOpen.value)
                    Text(
                      'Akademik',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  IconButton(
                    icon: SvgPicture.string(
                      toggleIcon,
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      controller.toggleSidebar();
                    },
                  ),
                ],
              ),
            ),
            buildMenuItem(Icons.person, 'Siswa', controller),
            buildMenuItem(Icons.person_outline, 'Guru', controller),
            buildMenuItem(Icons.admin_panel_settings, 'Admin Sekolah', controller),
            buildMenuItem(Icons.school, 'Sekolah', controller),
            buildMenuItem(Icons.access_time, 'Kehadiran', controller),
            buildMenuItem(Icons.announcement, 'Pengumuman', controller),
            buildMenuItem(Icons.book, 'Mata Pelajaran', controller),
            buildMenuItem(Icons.schedule, 'Jadwal Kegiatan', controller),
            buildMenuItem(Icons.edit, 'Ujian', controller),
            buildMenuItem(Icons.report, 'Laporan Belajar Siswa', controller),
            buildMenuItem(Icons.report, 'Laporan Belajar Guru', controller),
          ],
        ),
      );
    });
  }

  Widget buildMenuItem(IconData icon, String title, StudentController controller) {
    return Obx(() {
      bool isSelected = controller.selectedMenuItem.value == title;
      return Container(
        color: isSelected ? Color(0xff214e8b) : Colors.transparent,
        child: ListTile(
          leading: Icon(icon, color: isSelected ? Colors.lightBlueAccent : Colors.white),
          title: controller.isSidebarOpen.value
              ? Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Colors.lightBlueAccent : Color(0xffe2e8f0),
                    fontSize: 16,
                    fontWeight: FontWeight.normal, // Mengatur ketebalan teks
                  ),
                )
              : null,
          selected: isSelected,
          onTap: () {
            controller.selectMenuItem(title);
          },
        ),
      );
    });
  }
}
