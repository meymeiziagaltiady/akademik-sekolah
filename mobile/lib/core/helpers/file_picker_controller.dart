import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class FilePickerController extends GetxController {
  var images = <File>[].obs;
  var videos = <File>[].obs;
  var pdfs = <File>[].obs;

  Future<void> getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4', 'pdf'],
      allowMultiple: true,
    );

    if (result != null) {
      List<File> selectedFiles =
          result.paths.map((path) => File(path!)).toList();
      for (var file in selectedFiles) {
        if (file.path.endsWith('.jpg') ||
            file.path.endsWith('.jpeg') ||
            file.path.endsWith('.png')) {
          if (images.length < 5) {
            images.add(file);
          } else {
            Get.snackbar('Peringatan', 'Maksimal 5 gambar telah terunggah.',
                snackPosition: SnackPosition.BOTTOM);
          }
        } else if (file.path.endsWith('.mp4')) {
          if (videos.length < 3) {
            videos.add(file);
          } else {
            Get.snackbar('Peringatan', 'Maksimal 3 video telah terunggah.',
                snackPosition: SnackPosition.BOTTOM);
          }
        } else if (file.path.endsWith('.pdf')) {
          if (pdfs.length < 1) {
            pdfs.add(file);
          } else {
            Get.snackbar(
                'Peringatan', 'Hanya satu dokumen PDF yang dapat diunggah.',
                snackPosition: SnackPosition.BOTTOM);
          }
        }
      }
    }
  }
}
