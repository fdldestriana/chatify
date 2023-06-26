import 'package:chatify/module/signin/widget/component/re_remember_widget.dart';
import 'package:chatify/module/signin/widget/component/re_textformfield_widget.dart';
import 'package:chatify/shared/widget/re_button_widget.dart';
import 'package:chatify/shared/widget/re_logo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  Widget build(context, SigninController controller) {
    controller.view = this;
    String input = controller.textController.text;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.key,
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.24),
              const ReLogoWidget(),
              SizedBox(height: Get.height * 0.09),
              SizedBox(
                width: Get.width * 0.74,
                height: Get.height * 0.03,
                child: Text(
                  "Wellcome to Chatify",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    ReTextFormFieldWidget(
                      controller: controller.textController,
                      onFieldSubmitted: (input) {
                        if (input.isEmpty) {
                          controller.key.currentState!.reset();
                          controller.textController.clear();
                        }
                        controller.update();
                      },
                    ),
                    SizedBox(height: Get.height * 0.02),
                    const ReRememberWidget(),
                    SizedBox(height: Get.height * 0.03),
                    ReButtonWidget(
                        title: "Sign up",
                        width: Get.width * 0.77,
                        height: Get.height * 0.06,
                        onPressed: (input.isEmpty)
                            ? null
                            : () async {
                                if (controller.key.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance
                                        .verifyPhoneNumber(
                                            phoneNumber: input.replaceFirst(
                                                RegExp(r'0'), '+62'),
                                            verificationCompleted:
                                                (PhoneAuthCredential cred) {
                                              FirebaseAuth.instance
                                                  .signInWithCredential(cred);
                                            },
                                            verificationFailed: (e) {
                                              throw Exception(e.message);
                                            },
                                            codeSent: (verificationId,
                                                forceResendingToken) {},
                                            codeAutoRetrievalTimeout:
                                                (verificationId) {});
                                  } on FirebaseAuthException catch (e) {
                                    throw Exception(e.message);
                                  }
                                }
                              })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<SigninView> createState() => SigninController();
}
