import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/View/screens/startScreen.dart';
import 'package:quizzy/View/widgets/button.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
import 'package:quizzy/core/utils/appimage/app_images.dart';
import 'package:quizzy/core/utils/appstring/app_string.dart';
import 'package:quizzy/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:quizzy/core/utils/textstyle/textstyle.dart';

class GetstartScreen extends StatefulWidget {
  const GetstartScreen({Key? key}) : super(key: key);

  @override
  _GetstartScreenState createState() => _GetstartScreenState();
}

class _GetstartScreenState extends State<GetstartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.whicolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                sized.s160,
            Image.asset(Appimage.getstarted, width: 300, height: 350,fit: BoxFit.fill,),
            sized.s20,
            Text(Appstring.letsDiscover,
                style: textstyle.boldtext(appcolors.primarycolor)),
            
           
            sized.s80,
            custombutton(text: Appstring.getstarted,onTap: () {
          Get.to(const StartScreen());
        },)
          ],
        ),
      ),
    );
  }
}
