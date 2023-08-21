import 'package:chatify/module/chat/view/chat_view.dart';
import 'package:chatify/state_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReUserWidget extends StatelessWidget {
  const ReUserWidget({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ChatView(data: data)),
      child: SizedBox(
        width: double.infinity,
        height: Get.height * 0.09,
        child: Row(
          children: [
            data["profilePic"] ??
                Image.asset(
                  "assets/profile_pictures/profile_picture.png",
                  width: Get.height * 0.09,
                  height: Get.height * 0.09,
                ),
            Text(
              "${data["username"]}",
              style: GoogleFonts.roboto(
                  color: const Color(0xFF000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
