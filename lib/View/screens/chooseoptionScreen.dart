import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quizzy/Controller/api_helper.dart';
import 'package:quizzy/Model/categorymodel.dart';
import 'package:quizzy/Model/quizemodel.dart';
import 'package:quizzy/View/screens/quizScreen.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
import 'package:quizzy/core/utils/appicons/app_icons.dart';
import 'package:quizzy/core/utils/appstring/app_string.dart';
import 'package:quizzy/core/utils/textstyle/textstyle.dart';
import 'package:quizzy/core/utils/widgets/sizedbox/sizedbox.dart';
import '../widgets/cardoption.dart';

class ChooseOption extends StatefulWidget {
  const ChooseOption({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  _ChooseOptionState createState() => _ChooseOptionState();
}

class _ChooseOptionState extends State<ChooseOption> {
  late int _noOfQuestion;
  late String _difficulty;
  late bool processing;

  @override
  void initState() {
    _noOfQuestion = 10;
    _difficulty = Appstring.easy;
    processing = false;
    super.initState();
  }

  _selectedQuestion(int question) {
    setState(() {
      _noOfQuestion = question;
    });
  }

  _selectedDifficulty(String difficulty) {
    setState(() {
      _difficulty = difficulty;
    });
  }

  _startQuiz() async {
    if (mounted) {
      setState(() {
        processing = true;
      });
    }

    try {
      List<Question> questions =
          await getQuestions(widget.category, _noOfQuestion, _difficulty);
      if (questions.isEmpty) {
        _showToast(Appstring.noquestion);
      } else {
        Get.off(() => Quiz(
          category: widget.category,
          question: questions,
        ));
      }
    } on SocketException catch (_) {
      _showToast(Appstring.cantreach);
    } catch (err) {
      _showToast(Appstring.unexpected);
    } finally {
      if (mounted) {
        setState(() {
          processing = false;
        });
      }
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      backgroundColor: appcolors.primarycolor,
      msg: message,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.whicolor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Appicons.arrowback),
            ),
            sized.s10,
            Center(
              child: Image.asset(
                widget.category.image,
                width: 600,
                height: 400,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: appcolors.seccolor, spreadRadius: 3, blurRadius: 5)],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: appcolors.whicolor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 800,
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          sized.s10,
                          Text(
                            Appstring.selecttotal,
                            textAlign: TextAlign.center,
                            style: textstyle.small(Colors.black87),
                          ),
                          _buildQuestionOptions(),
                          sized.s40,
                          Text(
                            Appstring.selectdifficulty,
                            textAlign: TextAlign.center,
                            style: textstyle.small(Colors.black87),
                          ),
                          _buildDifficultyOptions(),
                          _buildStartQuizButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionOptions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [10, 20, 30, 40].map((int num) => CustomCard(
        name: num.toString(),
        backGroundColor: _noOfQuestion == num ? appcolors.yellow : appcolors.seccolor,
        onPressed: () => _selectedQuestion(num),
      )).toList(),
    );
  }

  Widget _buildDifficultyOptions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Appstring.easy, Appstring.mediumtext, Appstring.hardtext].map((String diff) => CustomCard(
        name: diff,
        onPressed: () => _selectedDifficulty(diff),
        backGroundColor: _difficulty == diff ? appcolors.yellow : appcolors.seccolor,
      )).toList(),
    );
  }

 Widget _buildStartQuizButton() {
  return processing
      ? Center(
          child: CircularProgressIndicator(
            color: appcolors.primarycolor,
          ),
        )
      : CustomCard(
          name:Appstring.startquiz,
          onPressed: _startQuiz,
          backGroundColor: appcolors.primarycolor,
        );
}


  Center load() {
    return Center(
      child: CircularProgressIndicator(
        color: appcolors.primarycolor,
      ),
    );
  }
}
