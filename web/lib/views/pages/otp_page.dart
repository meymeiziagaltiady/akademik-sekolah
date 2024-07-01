import 'package:aplikasi_sekolah/controllers/otp_controller.dart';
import 'package:aplikasi_sekolah/widgets/custom_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPPage extends StatelessWidget {
  final OTPController controller = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9F9FC),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          width: 700,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Verifikasi OTP',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'kami sudah mengirim kode OTP pada email anda',
                  style: TextStyle(
                    color: Color(0xff858597),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OTPField(controller.digit1Controller, controller.isValid),
                  SizedBox(width: 10),
                  OTPField(controller.digit2Controller, controller.isValid),
                  SizedBox(width: 10),
                  OTPField(controller.digit3Controller, controller.isValid),
                  SizedBox(width: 10),
                  OTPField(controller.digit4Controller, controller.isValid),
                ],
              ),
              Obx(() => SizedBox(
                    child: controller.isValid.value
                        ? null
                        : Center(
                            child: Text(
                              "kode OTP tidak valid",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                  )),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Tidak mendapat email? ',
                        style: TextStyle(color: Color(0xff000000))),
                  ]),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'kirim ulang OTP',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('KIRIM ULANG OTP');
                        },
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: ElevatedButton(
                  onPressed: controller.submitOTP,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Konfirmasi'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xff02367B), // Warna background tombol
                    foregroundColor: Colors.white, // Warna teks dan ikon tombol
                    padding: EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30), // Ukuran padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: TextStyle(
                      fontSize: 14, // Ukuran teks
                      fontWeight: FontWeight.w200, // Ketebalan teks
                    ),
                    iconColor: Colors.white, // Warna ikon
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget OTPField(TextEditingController controller, RxBool isValid) {
    return SizedBox(
        width: 80,
        child: Obx(() => TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffB8B8D2),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(13),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(13),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(13),
              ),
              errorText: isValid.value ? null : '',
              errorStyle: TextStyle(color: Colors.red),
              counterText: "",
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: TextStyle(
              fontSize: 24,
              height: 2,
            ))));
  }
}
