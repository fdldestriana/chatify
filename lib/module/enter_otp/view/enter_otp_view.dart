import 'package:flutter/material.dart';
import 'package:chatify/core.dart';

class EnterOtpView extends StatefulWidget {
  const EnterOtpView({Key? key}) : super(key: key);

  Widget build(context, EnterOtpController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF31C48D),
          ),
        ),
        title: const Text("Enter OTP Code"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }

  @override
  State<EnterOtpView> createState() => EnterOtpController();
}
