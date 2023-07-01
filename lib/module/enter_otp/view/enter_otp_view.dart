import 'package:chatify/shared/utils/validator.dart';
import 'package:chatify/shared/widget/re_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class EnterOtpView extends StatefulWidget {
  EnterOtpView(
      {Key? key, required this.phoneNumber, required this.verificationId})
      : super(key: key);
  final String phoneNumber;
  final String verificationId;

  Widget build(context, EnterOtpController controller) {
    controller.view = this;
    String smsCode = controller.otpController.text;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF31C48D),
          ),
        ),
        title: Text(
          "Enter OTP Code",
          style: GoogleFonts.poppins(
              color: const Color(0xFF000000),
              fontWeight: FontWeight.w600,
              fontSize: 22),
        ),
      ),
      body: Form(
        key: controller.key,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.16),
                SizedBox(
                  width: Get.width * 0.93,
                  height: Get.height * 0.03,
                  child: Center(
                    child: Text(
                      "Code has been sent to $phoneNumber",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.15),
                Pinput(
                  controller: controller.otpController,
                  defaultPinTheme: defaultPinTheme,
                  length: 6,
                  onSubmitted: (input) {
                    if (input.isEmpty) {
                      controller.key.currentState!.reset();
                      controller.otpController.clear();
                    }
                    controller.update();
                  },
                  onCompleted: (input) {
                    controller.update();
                    debugPrint(input);
                  },
                  validator: (inputValidator),
                ),
                SizedBox(height: Get.height * 0.04),
                SizedBox(
                  width: Get.width * 0.46,
                  height: Get.height * 0.04,
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: "Resend code in ",
                          style: GoogleFonts.openSans(
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          children: [
                            TextSpan(
                              text: "56 s",
                              style: GoogleFonts.openSans(
                                  color: const Color(0xFF31C48D),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.12),
                ReButtonWidget(
                  title: "Verify",
                  width: Get.width * 0.77,
                  height: Get.height * 0.06,
                  onPressed: (buttonValidator(smsCode) == null)
                      ? () async {
                          PhoneAuthCredential cred =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode: smsCode);
                          await FirebaseAuth.instance
                              .signInWithCredential(cred);
                          Get.to(const ChatView());
                        }
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: Get.width * 0.11,
    height: Get.height * 0.06,
    textStyle: GoogleFonts.openSans(
        fontSize: 20,
        color: const Color(0xFF000000),
        fontWeight: FontWeight.w700),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFF31C48D)),
      borderRadius: BorderRadius.circular(13),
    ),
  );

  String? inputValidator(input) {
    if (Validator.isNumber(input) || input.isEmpty) {
      return null;
    }
    return "Input is not a number";
  }

  String? buttonValidator(input) {
    if (input.isNotEmpty && Validator.isLengthInRange(input, 6, 6)) {
      return null;
    }
    return "Input doesn't have sufficient length";
  }

  @override
  State<EnterOtpView> createState() => EnterOtpController();
}
