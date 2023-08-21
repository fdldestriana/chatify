import 'package:chatify/shared/widget/re_button_widget.dart';
import 'package:chatify/shared/widget/re_logo_widget.dart';
import 'package:chatify/state_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReTabBarBodyWidget extends StatelessWidget {
  const ReTabBarBodyWidget(
      {super.key, required this.title, this.reButtonWidget});
  final String title;
  final ReButtonWidget? reButtonWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ReLogoWidget(
              width: Get.width * 0.24,
              height: Get.height * 0.11,
            ),
          ),
          SizedBox(height: Get.height * 0.03),
          Text(
            title,
            style: GoogleFonts.poppins(
                color: const Color(0xFF07DC8A),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: Get.height * 0.03),
          reButtonWidget ?? Container()
        ],
      ),
    );
  }
}
