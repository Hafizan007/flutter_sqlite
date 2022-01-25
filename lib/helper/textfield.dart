import 'package:flutter/material.dart';
import 'package:ukur_test/helper/schema.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: Divider.createBorderSide(context),
    );
    final enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: kBlack.withOpacity(0.7),
      ),
      borderRadius: BorderRadius.circular(12.0),
    );

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: enabledBorder,
        enabledBorder: inputBorder,
        filled: true,
        fillColor: kGreyColor2,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
