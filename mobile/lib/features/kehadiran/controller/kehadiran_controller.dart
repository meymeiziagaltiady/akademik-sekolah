import 'package:akademik_1/core/helpers/image_picker_controller.dart';
import 'package:akademik_1/core/widgets/components/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class KehadiranController extends GetxController {
  var selectedReason = 'Pilih Status Kehadiran'.obs;
  var currentLocation = 'Memuat lokasi...'.obs;
  bool isLocationObtained = false;

  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  @override
  void onInit() {
    super.onInit();
    determinePosition();
  }

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      currentLocation.value = 'Layanan lokasi tidak aktif';
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        currentLocation.value = 'Izin lokasi ditolak';
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      currentLocation.value = 'Izin lokasi ditolak secara permanen';
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _getAddressFromLatLng(position);
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];
      currentLocation.value =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      isLocationObtained = true;
    } catch (e) {
      currentLocation.value = 'Gagal mendapatkan lokasi';
    }
  }

  void onPresentClicked() {
    if (isLocationObtained) {
      outsideSchool();
    } else {
      Get.snackbar('TUNGGU', 'Lokasi anda saat ini belum didapatkan');
    }
  }

  void outsideSchool() {
    DialogController().FailDialog(
      'Oops',
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
              items: <String>['Pilih Status Kehadiran', 'Sakit', 'Izin']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: TextStyle(color: Color(0xff666666), fontSize: 12)),
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
    );
  }

  void insideSchool() async {
    final imagePicked = await imagePickerController.getImageFromCamera();
    if (imagePicked != null) {
      DialogController().succesDialog(
        'Berhasil',
        Text(
          "Terima kasih kehadiran kamu sudah disimpan!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Color(0xff858597)),
        ),
      );
    }
  }
}
