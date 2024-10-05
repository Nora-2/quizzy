import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizzy/Model/quizemodel.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
import 'package:quizzy/core/utils/appstring/app_string.dart';

class Answer extends StatelessWidget {
  final Map<int, dynamic> answer;
  final List<Question> question;

  Answer({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:appcolors.whicolor,
     appBar: AppBar(backgroundColor: appcolors.whicolor, centerTitle:true,title:const Text('Answers'),),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: question.length,
        itemBuilder: (context, index) {
          if (!answer.containsKey(index)) return Container();

          bool correct = question[index].correct_answer == answer[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: correct ? [Colors.green[100]!, Colors.green[200]!] : [Colors.red[100]!, Colors.red[200]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        HtmlUnescape().convert(question[index].question),
                        style: const TextStyle(
                          fontSize: 18.0,
                   
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Icon(
                            correct ? Icons.check_circle : Icons.cancel,
                            color: correct ? appcolors.green : appcolors.redcolor,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            HtmlUnescape().convert('${answer[index]}'),
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: correct ? Colors.black : Colors.red[800],
                            ),
                          ),
                        ],
                      ),
                      if (!correct) ...[
                        const SizedBox(height: 10.0),
                        Text(
                          '${Appstring.correct} ${HtmlUnescape().convert(question[index].correct_answer)}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            
          );
        },
      ),
    );
  }
}
