import 'package:chatify/shared/widget/re_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  Widget build(context, SigninController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.key,
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.24),
              const ReLogoWidget(),
              SizedBox(height: Get.height * 0.09),
              SizedBox(
                width: Get.width * 0.74,
                height: Get.height * 0.03,
                child: Text(
                  "Wellcome to Chatify",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              Text(
                "Phone Number",
                style: GoogleFonts.poppins(
                  color: const Color(0xFF000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFormField()
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<SigninView> createState() => SigninController();
}
