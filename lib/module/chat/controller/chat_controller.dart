import 'package:flutter/material.dart';
import '../view/chat_view.dart';

class ChatController extends State<ChatView> with TickerProviderStateMixin {
  static late ChatController instance;
  late ChatView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  late final TabController tabController;
}
