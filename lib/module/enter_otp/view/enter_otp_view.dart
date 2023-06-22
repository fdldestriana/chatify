import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import '../controller/enter_otp_controller.dart';

class EnterOtpView extends StatefulWidget {
  const EnterOtpView({Key? key}) : super(key: key);

  Widget build(context, EnterOtpController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("EnterOtp"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<EnterOtpView> createState() => EnterOtpController();
}
