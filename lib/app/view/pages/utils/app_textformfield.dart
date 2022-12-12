import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final int maxLines;
  const AppTextFormField({
    Key? key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.onChange,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChange,
        // keyboardType: TextInputType.multiline,
        minLines: maxLines, //Normal textInputField will be displayed
        maxLines: maxLines, // when user presses enter it will adapt to it
        // cursorColor: context.theme.primaryColor,
        decoration: InputDecoration(
          isDense: true,
          labelText: label,
          // labelStyle: const TextStyle(
          //   color: Colors.black,
          // ),
          // errorStyle: const TextStyle(
          //   color: Colors.redAccent,
          // ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: const BorderSide(
                // color: Color(0xFFBDBDBD),
                ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: const BorderSide(
                // color: Color(0xFFBDBDBD),
                ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: const BorderSide(
                // color: Color(0xFFBDBDBD),
                ),
          ),
          filled: true,
          // fillColor: Colors.white,
        ),
      ),
    );
  }
}
