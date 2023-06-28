import 'package:chatify/module/signin/widget/component/re_remember_widget.dart';
import 'package:chatify/module/signin/widget/component/re_textformfield_widget.dart';
import 'package:chatify/shared/widget/re_button_widget.dart';
import 'package:chatify/shared/widget/re_logo_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  Widget build(context, SigninController controller) {
    controller.view = this;
    String input = controller.textController.text;
    AuthService authService = AuthService();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.key,
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.20),
              const ReLogoWidget(),
              SizedBox(height: Get.height * 0.09),
              SizedBox(
                width: Get.width * 0.74,
                height: Get.height * 0.04,
                child: Text(
                  "Sign in to your Account",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Get.height * 0.04),
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
                      title: "Sign in",
                      width: Get.width * 0.77,
                      height: Get.height * 0.06,
                      onPressed: (input.isEmpty)
                          ? null
                          : () async {
                              if (controller.key.currentState!.validate()) {
                                await authService.signUsingPhoneNumber(
                                    input: input);
                                Get.to(const EnterOtpView());
                              }
                            },
                    ),
                    SizedBox(height: Get.height * 0.06),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Did You have an Account? ",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.offAll(const SignupView()),
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF31C48D),
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
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
  State<SigninView> createState() => SigninController();
}


// for testing
// +44 7444 555666 123456