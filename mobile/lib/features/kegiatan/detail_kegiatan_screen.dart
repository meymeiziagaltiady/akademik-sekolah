import 'package:akademik_1/core/helpers/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailKegiatanScreen extends StatelessWidget {
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Jadwal Kegiatan'),
          leading: BackButton(color: Colors.white),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Nama Event',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Ini deskripsi Excepteur adipisicing ipsum et sint sit adipisicing ex dolore. Deserunt ex aliquip minim nulla sunt. Id ex elit minim qui irure proident amet irure consectetur eiusmod ipsum est. Incididunt proident irure elit nostrud qui aute deserunt eiusmod enim id incididunt cillum.',
                  style: TextStyle(fontSize: 14)),
              SizedBox(height: 40),
              Obx(() {
                if (imagePickerController.image.value != null) {
                  return _uploadImage();
                } else {
                  return _importImage(context);
                }
              })
            ])));
  }

  Widget _importImage(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
        child: ElevatedButton(
          onPressed: () async {
            await imagePickerController.getImageFromGallery();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.photo_rounded,
                color: Color(0xff9E9E9E),
                size: 28,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Pilih File',
                style: TextStyle(color: Color(0xff9E9E9E), fontSize: 16),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffFAFAFA),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              side: BorderSide(
                color: Color(0xff3B82F6),
                width: 2,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'atau',
              style: TextStyle(color: Color(0xff616161), fontSize: 18),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            await imagePickerController.getImageFromCamera();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Ambil Foto',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff3B82F6),
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _uploadImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Foto atau Video',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Color(0xffE4E9F0)),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        imagePickerController.image.value!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FractionallySizedBox(
                          widthFactor: 0.9,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                imagePickerController.imageName.value,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff132A60),
                                ),
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${(imagePickerController.imageSize.value / 1024).toStringAsFixed(2)} KB',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: GestureDetector(
                    onTap: () {
                      imagePickerController.image.value = null;
                      imagePickerController.imageName.value = '';
                      imagePickerController.imageSize.value = 0;
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              Get.snackbar('UPLOAD FILE BERHASIL', 'yeyyy');
            },
            child: Text(
              'Upload',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff3B82F6),
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
