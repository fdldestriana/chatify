import 'package:flutter/material.dart';
import '../view/signin_view.dart';

class SigninController extends State<SigninView> {
  static late SigninController instance;
  late SigninView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey key = GlobalKey<FormState>();
}
