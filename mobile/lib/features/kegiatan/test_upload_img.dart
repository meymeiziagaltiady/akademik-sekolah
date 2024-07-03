import 'package:akademik_1/core/helpers/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestUploadImg extends StatelessWidget {
  final ImagePickerController controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            return controller.image.value != null
                ? Image.file(controller.image.value!)
                : Text('No image selected');
          }),
          TextButton(
            onPressed: () async {
              await controller.getImageFromCamera();
            },
            child: Text('Upload'),
          ),
        ],
      ),
    );
  }
}