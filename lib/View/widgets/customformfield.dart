// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CustomTextFormField({
    required this.iconData,
    required this.onSaved,
    required this.controller,
    required this.labelText,
    required this.labelColor,
  });
  final IconData iconData;
  final TextEditingController controller;
  final String labelText;
   final void Function(String?)? onSaved;
  final Color labelColor;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        onChanged: widget.onSaved,
        controller: widget.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.iconData, color: appcolors.primarycolor),
            fillColor: appcolors.whicolor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            hintText: (widget.labelText),
            hintStyle: TextStyle(
              color: widget.labelColor,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: appcolors.seccolor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: appcolors.primarycolor,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: appcolors.primarycolor,
              ),
            )),
      ),
    );
  }
}
