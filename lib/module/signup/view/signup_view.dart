import 'package:chatify/module/signin/widget/component/re_remember_widget.dart';
import 'package:chatify/module/signin/widget/component/re_textformfield_widget.dart';
import 'package:chatify/shared/widget/re_bottotextauthscreen_widget.dart';
import 'package:chatify/shared/widget/re_button_widget.dart';
import 'package:chatify/shared/widget/re_logo_widget.dart';
import 'package:chatify/shared/widget/re_notloggedin_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  Widget build(context, SignupController controller) {
    controller.view = this;
    String phoneNumb = controller.textController.text;
    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.key,
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.20),
              const ReLogoWidget(),
              const ReNotLoggedInWidget(title: "Sign up for free"),
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
                      onPressed: (phoneNumb.isNotEmpty)
                          ? () async {
                              if (controller.key.currentState!.validate()) {
                                await auth.verifyPhoneNumber(
                                    phoneNumber: phoneNumb.replaceFirst(
                                        RegExp(r'0'), '+62'),
                                    verificationCompleted:
                                        (PhoneAuthCredential cred) async =>
                                            await auth
                                                .signInWithCredential(cred),
                                    verificationFailed: (e) =>
                                        throw Exception(e.message),
                                    codeSent: (verificationId, _) async {
                                      Get.to(EnterOtpView(
                                          phoneNumber: phoneNumb,
                                          verificationId: verificationId));
                                    },
                                    codeAutoRetrievalTimeout:
                                        (verificationId) {});
                              }
                            }
                          : null,
                    ),
                    SizedBox(height: Get.height * 0.06),
                    ReBottomTextAuthScreenWidget(
                      text: "Already have an Account? ",
                      title: "Sign in",
                      onTap: () => Get.offAll(const SigninView()),
                    )
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
  State<SignupView> createState() => SignupController();
}
