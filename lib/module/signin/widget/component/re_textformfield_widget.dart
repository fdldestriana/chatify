import 'package:chatify/shared/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:chatify/state_util.dart';

class ReTextFormFieldWidget extends StatelessWidget {
  const ReTextFormFieldWidget(
      {super.key, required this.controller, this.onFieldSubmitted});

  final TextEditingController controller;
  final void Function(String)? onFieldSubmitted;

  String? validator(input) {
    if (!Validator.isNumber(input)) {
      return "Input is not a number";
    }
    if (Validator.isLengthInRange(input, 10, 12)) {
      return "Input does not have a valid length";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        // to change the color, set filled to true and set the color in fillColor
        filled: true,
        fillColor: const Color(0xFFFEFEFE),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
                style: BorderStyle.none, color: Color(0xFFFEFEFE), width: 0),
            borderRadius: BorderRadius.circular(Get.width * 0.06)),
        prefixIcon: const Icon(Icons.phone),
        prefixIconColor: const Color(0xFF000000),
        contentPadding: EdgeInsets.only(
            left: Get.width * 0.08,
            top: Get.height * 0.01,
            bottom: Get.height * 0.01),
        labelText: "Phone Number",
      ),
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
    );
  }
}
