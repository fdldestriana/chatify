import 'package:flutter/material.dart';
import '../view/enter_otp_view.dart';

class EnterOtpController extends State<EnterOtpView> {
  static late EnterOtpController instance;
  late EnterOtpView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
}
