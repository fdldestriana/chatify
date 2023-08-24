import 'package:chatify/module/chat/view/chat_view.dart';
import 'package:chatify/service/chat_service/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatController extends State<ChatView> {
  static late ChatController instance;
  late ChatView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final TextEditingController messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void sendMessage(String receiverId) async {
    if (messageController.text.isNotEmpty) {
      await chatService.sendMessage(receiverId, messageController.text);
    }
    messageController.clear();
  }
}
