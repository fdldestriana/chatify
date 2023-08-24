import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key, required this.data}) : super(key: key);
  final Map<String, dynamic> data;

  Widget build(context, ChatController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icon_buttons/phone_call.png")),
          IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icon_buttons/video_call.png")),
          IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icon_buttons/more_vert.png")),
        ],
        titleSpacing: 0.5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
      body: Column(
        children: [Expanded(child: _buildMessageList()), _buildMessageInput()],
      ),
    );
  }

  @override
  State<ChatView> createState() => ChatController();
}
