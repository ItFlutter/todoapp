import 'package:flutter/material.dart';

import 'package:to_do_app/core/constant/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? isReadOnly;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {Key? key,
      required this.hint,
      required this.controller,
      this.suffixIcon,
      this.isReadOnly,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      readOnly: isReadOnly ?? false,
      controller: controller,
      cursorColor: AppColor.grey,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.grey)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.redColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.redColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.grey)),
        hintText: hint,
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(fontSize: 17),
      ),
    );
  }
}
