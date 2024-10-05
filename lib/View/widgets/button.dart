// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
import 'package:quizzy/core/utils/textstyle/textstyle.dart';

class custombutton extends StatelessWidget {
  custombutton({
    required this.text,
    required this.onTap,
    super.key,
  });
  String text;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 350,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: appcolors.primarycolor),
          child: Center(
              child: Text(
            text,
            style: textstyle.small(appcolors.whicolor),
          )),
        ));
  }
}
