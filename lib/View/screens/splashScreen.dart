import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/View/screens/getstartScreen.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
import 'package:quizzy/core/utils/appimage/app_images.dart';
import 'package:quizzy/core/utils/appstring/app_string.dart';
import 'package:quizzy/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:quizzy/core/utils/textstyle/textstyle.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.primarycolor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Appimage.splach, width: 280, height: 280),
              sized.s20,
              Text(Appstring.letsDiscover, style: textstyle.boldtext(appcolors.whicolor)),
              sized.s20,
            ],
          ),
        ),
      
    );
  }

  Future<void> _initializeDependencies() async {
  
    await Future.delayed(const Duration(seconds: 3));

    Get.off(() => const GetstartScreen());
  }
}
