import 'package:chatify/module/signin/widget/component/re_remember_widget.dart';
import 'package:chatify/module/signin/widget/component/re_textformfield_widget.dart';
import 'package:chatify/shared/enum/authstate.dart';
import 'package:chatify/shared/widget/re_bottotextauthscreen_widget.dart';
import 'package:chatify/shared/widget/re_button_widget.dart';
import 'package:chatify/shared/widget/re_loading_widget.dart';
import 'package:chatify/shared/widget/re_logo_widget.dart';
import 'package:chatify/shared/widget/re_notloggedin_widget.dart';
import 'package:flutter/material.dart';
import 'package:chatify/core.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  Widget build(context, SigninController controller) {
    controller.view = this;
    String phoneNumb = controller.textController.text;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.key,
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.20),
              const ReLogoWidget(),
              if (controller.authState == AuthState.notLoggedIn)
                const ReNotLoggedInWidget(title: "Sign in to your Account")
              else
                const ReLoadingWidget(),
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
                      onPressed: (phoneNumb.isNotEmpty)
                          ? () {
                              if (controller.key.currentState!.validate()) {
                                controller.signUsingPhoneNumber();
                              }
                            }
                          : null,
                    ),
                    SizedBox(height: Get.height * 0.06),
                    ReBottomTextAuthScreenWidget(
                      text: "Did You have an Account? ",
                      title: "Sign up",
                      onTap: () => Get.offAll(const SignupView()),
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
