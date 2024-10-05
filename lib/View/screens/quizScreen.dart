// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizzy/Model/categorymodel.dart';
import 'package:quizzy/Model/quizemodel.dart';
import 'package:quizzy/View/screens/resultScreen.dart';
import 'package:quizzy/View/widgets/cardoption.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
import 'package:quizzy/core/utils/appstring/app_string.dart';
import 'package:quizzy/core/utils/widgets/sizedbox/sizedbox.dart';

class Quiz extends StatefulWidget {
  final List<Question> question;
  final Category category;
  const Quiz({
    super.key,
    required this.category,
    required this.question,
  });

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};

  @override
  Widget build(BuildContext context) {
    Question question = widget.question[_currentIndex];
    final List<dynamic> options = question.incorrect_answer;
    if (!options.contains(question.correct_answer)) {
      options.add(question.correct_answer);
      options.shuffle();
    }
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: appcolors.whicolor,
        appBar: AppBar(
          backgroundColor: appcolors.whicolor
        
        ),
        body: Column(
          children: [
         
            Center(
              child: Image.asset(
               widget.category.image,
            width: 500,
            height: 200,
            fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                   color: appcolors.whicolor,
                  shadowColor: appcolors.whitecontainer,
                  elevation: 8,
                  child: Column(
                    children: [
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: appcolors.whicolor,
                              ),
                              child: Text(
                                '${_currentIndex + 1}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: appcolors.primarycolor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Text(
                                HtmlUnescape().convert(
                                  widget.question[_currentIndex].question,
                                ),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: appcolors.blach64
                                ),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                   
                      ...options.map((e) => RadioListTile(
                            activeColor: appcolors.primarycolor,
                            title: Text(
                              HtmlUnescape().convert(e),
                              style: TextStyle(
                                color: appcolors.primarycolor,
                                fontSize: 18
                              ),
                            ),
                            groupValue: _answers[_currentIndex],
                            value: e.toString(),
                            onChanged: (value) {
                              setState(() {
                                _answers[_currentIndex] = value;
                              });
                            },
                          )),
                      
                     
                    ],
                  ),
                ),
              ),
            ),
            sized.s10,
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: CustomCard(
                      onPressed: () async {
                        _submit();
                      },
                      name: _currentIndex == (widget.question.length - 1)
                          ? Appstring.submit
                          : Appstring.next,
                          backGroundColor: appcolors.yellow,
                    ),
             ),
                  
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_answers[_currentIndex] == null) {
      Fluttertoast.showToast(
        backgroundColor: Theme.of(context).primaryColor,
        msg: 'Please select the answer',
        gravity: ToastGravity.BOTTOM,
      );
    } else if (_currentIndex < (widget.question.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => Result(
              answer: _answers,
              question: widget.question,
            ),
          ));
    }
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text(
            'All your current progress will be lost',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              style: TextButton.styleFrom(),
              child: Text(
                'Ok',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(),
              child: Text(
                'Cancel',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
  }
}
