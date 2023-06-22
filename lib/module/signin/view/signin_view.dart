import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import '../controller/signin_controller.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  Widget build(context, SigninController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Signin"),
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
  State<SigninView> createState() => SigninController();
}
