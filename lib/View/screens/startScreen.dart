import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/View/screens/home_screen.dart';
import 'package:quizzy/View/widgets/button.dart';
import 'package:quizzy/View/widgets/customformfield.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
import 'package:quizzy/core/utils/appicons/app_icons.dart';
import 'package:quizzy/core/utils/appimage/app_images.dart';
import 'package:quizzy/core/utils/appstring/app_string.dart';
import 'package:quizzy/core/utils/textstyle/textstyle.dart';
import 'package:quizzy/core/utils/widgets/sizedbox/sizedbox.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController email = TextEditingController();
  String name='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.primarycolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           sized.s100,

            Image.asset(Appimage.started, width: 280, height: 350,fit: BoxFit.cover,),
            
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: appcolors.whicolor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sized.s40,
                    Center(
                        child: Text(
                      Appstring.letsDiscover,
                      style: textstyle.boldtext(appcolors.primarycolor),
                    )),
                    sized.s40,
                    CustomTextFormField(
                      iconData: Appicons.edit,
                      controller: email,
                      onSaved: (value) {
                        setState(() {
                          name=value!;
                        });
                      },
                      labelText: Appstring.name,
                      labelColor: appcolors.primarycolor,
                    ),
                    sized.s40,
                    custombutton(
                      text: Appstring.title,
                      onTap: () {
                        Get.offAll( Home(name:name ,));
                      },
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
