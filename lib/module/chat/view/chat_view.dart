import 'package:flutter/material.dart';
import 'package:chatify/core.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  Widget build(context, ChatController controller) {
    controller.view = this;

    return const Scaffold();
  }

  @override
  State<ChatView> createState() => ChatController();
}
