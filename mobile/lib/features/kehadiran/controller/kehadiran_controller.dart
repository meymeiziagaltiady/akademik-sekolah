import 'package:akademik_1/core/helpers/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KehadiranController extends GetxController {
  var selectedReason = 'Pilih Status Kehadiran'.obs;
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  void outsideSchool() {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Material(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'icons/Fail.svg',
                        width: 70,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Oops",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Kamu tidak berada pada radius alamat sekolah",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff858597)),
                      ),
                      SizedBox(height: 20),

                      // DROPDOWN
                      Obx(
                        () => Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedReason.value,
                              items: <String>[
                                'Pilih Status Kehadiran',
                                'Sakit',
                                'Izin'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 12)),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                selectedReason.value = newValue!;
                              },
                              isExpanded: true,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // BACK BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[600],
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                          onPressed: () => Get.back(),
                          child: Text(
                            'Kembali',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void insideSchool() async {
    final imagePicked = await imagePickerController.getImageFromCamera();
    if (imagePicked != null) {
      succesDialog();
    }
  }

  void succesDialog() {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Material(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'icons/Success.svg',
                        width: 70,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Berhasil!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Terima kasih kehadiran kamu sudah disimpan!",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff858597)),
                      ),
                      SizedBox(height: 20),

                      // BACK BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff3D5CFF),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                          onPressed: () => Get.back(),
                          child: Text(
                            'Ok',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
