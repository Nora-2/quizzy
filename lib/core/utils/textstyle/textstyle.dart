// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
class textstyle {
  static TextStyle boldtext(Color color) =>
       TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color:  color);
  static TextStyle normaltext() =>  TextStyle(fontSize: 16,color: appcolors.whicolor);
  static TextStyle normal() => TextStyle(color: appcolors.seccolor);
  static TextStyle smalltext() => const TextStyle(fontSize: 14);
  static TextStyle extrasmalltext() => const TextStyle(fontSize: 12);
  static TextStyle extralarge() => const TextStyle(fontSize: 30);
  static TextStyle large() => const TextStyle(fontSize: 26);
  static TextStyle medium() =>  TextStyle(fontSize: 22,color: appcolors.primarycolor,fontWeight: FontWeight.bold);
  static TextStyle small(Color color) =>  TextStyle(fontSize: 24,color: color,);
  static TextStyle extrasmall() => const TextStyle(fontSize: 16);
  static TextStyle extrasmallbold() =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle bold() => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: appcolors.seccolor,
      );
  static TextStyle home() => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
  static TextStyle content() =>
      TextStyle(color: appcolors.primarycolor, fontSize: 16);
  static TextStyle author() => TextStyle(
      color: appcolors.redcolor,
      overflow: TextOverflow.ellipsis,
      fontSize: 16,
      fontWeight: FontWeight.bold);
}
