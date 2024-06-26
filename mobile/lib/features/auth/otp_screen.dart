import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akademik_1/features/auth/controller/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final OTPController controller = Get.put(OTPController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verifikasi Email',
              style: TextStyle(
                color: Color(0xff1F1F39),
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Kode OTP sudah dikirim ke email anda',
              style: TextStyle(
                color: Color(0xff858597),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOTPField(controller.digit1Controller, controller.isValid),
                _buildOTPField(controller.digit2Controller, controller.isValid),
                _buildOTPField(controller.digit3Controller, controller.isValid),
                _buildOTPField(controller.digit4Controller, controller.isValid),
              ],
            ),
            Obx(() => SizedBox(
                  child: controller.isValid.value
                      ? null
                      : Text("kode OTP tidak valid", style: TextStyle(color: Colors.red),),
                )),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Tidak mendapat email? ',
                      style: TextStyle(color: Color(0xffD9D9D9))),
                  TextSpan(
                    text: 'kirim ulang',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('KIRIM ULANG OTP');
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                onPressed: controller.submitOTP,
                child: Text(
                  'Verifikasi',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPField(TextEditingController controller, RxBool isValid) {
    return SizedBox(
      width: 50,
      child: Obx(() => TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffB8B8D2),
                ),
                borderRadius: BorderRadius.circular(13),
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
            ),
          )),
    );
  }
}
