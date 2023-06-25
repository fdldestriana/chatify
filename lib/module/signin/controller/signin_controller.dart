import 'package:chatify/module/signin/view/signin_view.dart';
import 'package:flutter/material.dart';

class SigninController extends State<SigninView> {
  static late SigninController instance;
  late SigninView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController textController = TextEditingController();
}
