import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/Model/categorymodel.dart';
import 'package:quizzy/View/screens/chooseoptionScreen.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
import 'package:quizzy/core/utils/textstyle/textstyle.dart';
import 'package:quizzy/core/utils/widgets/sizedbox/sizedbox.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Category category = categories[index];

    return GestureDetector(
      onTap: () {
        Get.to(ChooseOption(
          category: category,
        ));
      },
      child: Container(
        height: 160,
        margin: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(4, 6),
            ),
          ],
        ),
        child: Card(
          color: appcolors.whicolor,
          shadowColor: Colors.white.withOpacity(0.48), // Apply opacity
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      category.image,
                      width: 130,
                      height: 180,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                  sized.s10,
                Text(category.name, style: textstyle.medium()),
              
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
