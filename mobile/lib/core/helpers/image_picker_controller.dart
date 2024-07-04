import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var image = Rx<File?>(null);
  var imageSize = RxInt(0);
  var imageName = RxString('');

  Future getImageFromGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);
      if (imagePicked != null) {
        image.value = File(imagePicked.path);
        updateImageInfo();
      }
    } catch (e) {
      Get.snackbar('Error', 'Error picking image from gallery: $e');
    }
  }

  Future getImageFromCamera() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imagePicked = await picker.pickImage(source: ImageSource.camera);
      if (imagePicked != null) {
        image.value = File(imagePicked.path);
        updateImageInfo();
      }
      return imagePicked;
    } catch (e) {
      Get.snackbar('Error', 'Error picking image from camera: $e');
      return null;
    }
  }

  void updateImageInfo() {
    if (image.value != null) {
      imageName.value = image.value!.path.split('/').last;
      var bytes = image.value!.readAsBytesSync();
      imageSize.value = bytes.lengthInBytes;
    } else {
      imageName.value = '';
      imageSize.value = 0;
    }
  }
}
