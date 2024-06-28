import 'package:get/get.dart';

class StudentController extends GetxController {
  var students = <Map<String, String>>[].obs;
  var isSidebarOpen = true.obs;
  var selectedMenuItem = 'Siswa'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  void fetchStudents() {
    var dummyData = List.generate(100, (index) {
      return {
        "NISN": "00400356${index.toString().padLeft(2, '0')}",
        "Nama": "Siswa ${index + 1}",
        "Sekolah": "SMK Negeri 1 ${['Cimahi', 'Tasik', 'Bandung'][index % 3]}",
        "Kelas": "Kelas ${10 + (index % 3)}",
      };
    });
    students.assignAll(dummyData);
  }

  void toggleSidebar() {
    isSidebarOpen.value = !isSidebarOpen.value;
  }

  void selectMenuItem(String item) {
    selectedMenuItem.value = item;
  }
}
