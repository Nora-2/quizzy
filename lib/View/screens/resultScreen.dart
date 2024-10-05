// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/Model/quizemodel.dart';
import 'package:quizzy/View/screens/answersScreen.dart';
import 'package:quizzy/View/widgets/cardoption.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
import 'package:quizzy/core/utils/appstring/app_string.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
class Result extends StatelessWidget {
  final List<Question> question;
  final Map<int, dynamic> answer;

  const Result({Key? key, required this.question, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int correct = 0;
    answer.forEach((index, value) {
      if (question[index].correct_answer == value) correct++;
    });
    final score = (correct / question.length * 100).toStringAsFixed(1);
    final totalQuestions = question.length;
    final percent = (correct / totalQuestions * 100).toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed:() {
                  Get.to(Answer(question: question, answer: answer));
                }, icon:const Icon(Icons.question_answer))],title: Text(
                      'Results',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: appcolors.primarycolor,
                      ),
                    ),centerTitle: true,),
      backgroundColor: appcolors.whicolor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [appcolors.whicolor, appcolors.whicolor],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
             
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildScoreCard(score, correct, totalQuestions),
                        const SizedBox(height: 14),
                        _buildDetailCard(correct, totalQuestions),
                        const SizedBox(height: 14),
                        _buildEfficiencyIndicator(correct, totalQuestions), // Updated method
                      ],
                    ),
                  ),
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16),
                child: CustomCard(name: 'Back to Home', onPressed:() {
                  Navigator.pop(context);
                }, backGroundColor: appcolors.primarycolor),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEfficiencyIndicator(int correct, int total) {
    final completedTasks = correct;
    final createdTasks = total > 0 ? total : 1; // Avoid division by zero
    final percent = (correct / createdTasks * 100).toStringAsFixed(1);

    return Center(
      child: CircularStepProgressIndicator(
        totalSteps: createdTasks,
        currentStep: completedTasks,
        stepSize: 20,
        selectedColor: appcolors.green,
        unselectedColor: Colors.grey[200],
        padding: 0,
        width: 200,
        height: 200,
        selectedStepSize: 22,
        roundedCap: (_, __) => true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$percent%",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 4),
            const Text(
              "Efficiency",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  // Other existing methods (score card, detail card, etc.) remain unchanged
}


  Widget _buildScoreCard(String score, int correct, int total) {
    return Card(
   color: appcolors.whicolor,
              shadowColor: appcolors.whitecontainer, 
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              Appstring.score,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: appcolors.primarycolor),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: appcolors.yellow, size: 38),
                const SizedBox(width: 16),
                Text(
                  '$score%',
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: appcolors.primarycolor),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '$correct out of $total correct',
              style: TextStyle(fontSize: 18, color: appcolors.primarycolor.withOpacity(0.8)),
            ),
          ],
        ),
      ),
    );
  }

  

  Widget _buildDetailCard(int correct, int total) {
    return Card(
      elevation: 8,
      color: appcolors.whicolor,
              shadowColor: Colors.white.withOpacity(0.48), 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildDetailRow('Correct Answers', '$correct', Icons.check_circle, Colors.green),
            const Divider(height: 24),
            _buildDetailRow('Incorrect Answers', '${total - correct}', Icons.cancel, Colors.red),
            const Divider(height: 24),
            _buildDetailRow('Total Questions', '$total', Icons.quiz, appcolors.primarycolor),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 12),
            Text(label, style: TextStyle(fontSize: 18, color: appcolors.primarycolor)),
          ],
        ),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }



