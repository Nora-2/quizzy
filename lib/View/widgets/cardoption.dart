import 'package:flutter/material.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
class CustomCard extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final Color backGroundColor;

  const CustomCard({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.backGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 500,
          minHeight: 50,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor, // Set the background color here
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          onPressed: onPressed,
          child: Text(
            name,
            style: TextStyle(
              color: appcolors.whicolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
