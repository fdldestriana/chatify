import 'package:chatify/shared/widget/re_button_widget.dart';
import 'package:chatify/shared/widget/re_logo_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import 'package:google_fonts/google_fonts.dart';

class WellcomeView extends StatefulWidget {
  const WellcomeView({Key? key}) : super(key: key);

  Widget build(context, WellcomeController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.38),
              const ReLogoWidget(),
              SizedBox(height: Get.height * 0.09),
              SizedBox(
                width: Get.width * 0.74,
                height: Get.height * 0.06,
                child: Text(
                  "Wellcome to Chatify",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              SizedBox(
                width: Get.width * 0.86,
                height: Get.height * 0.06,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Read our ",
                    style: GoogleFonts.poppins(color: const Color(0xFF000000)),
                    children: [
                      TextSpan(
                          text: "Privacy Policy ",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF31C48D)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async => await Get.launchUrls(
                                Uri.parse('https://flutter.dev'))),
                      const TextSpan(
                          text: "Tap \"Agree and\nContinue\" to accept"),
                      TextSpan(
                          text: " Terms of Services.",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF31C48D)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async => await Get.launchUrls(
                                Uri.parse('https://flutter.dev'))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              ReButtonWidget(
                title: "Agee and Continue",
                onPressed: () => Get.to(const SigninView()),
                width: Get.width * 0.77,
                height: Get.height * 0.06,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<WellcomeView> createState() => WellcomeController();
}
