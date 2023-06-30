import 'package:chatify/shared/widget/re_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class EnterOtpView extends StatefulWidget {
  EnterOtpView({Key? key, required this.phoneNumber}) : super(key: key);
  final String phoneNumber;

  Widget build(context, EnterOtpController controller) {
    controller.view = this;

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
      body: SingleChildScrollView(
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
                defaultPinTheme: defaultPinTheme,
                length: 6,
                onCompleted: (value) => debugPrint(value),
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
                onPressed: () {},
              )
            ],
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

  @override
  State<EnterOtpView> createState() => EnterOtpController();
}
