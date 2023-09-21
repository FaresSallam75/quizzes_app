/*  import 'package:first/controller/question_controller.dart';
import 'package:first/questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

QuestionControllerImp controller = Get.put(QuestionControllerImp());
List<Questions> dd = List.from(controller.data);

 var currentAnswer;
  int questionNumber = 0;
  List scoreResult = [];

 class ShowAnswer {
 static  checkAnswer(bool CorrectAnswer) {
    var currentAnswer = dd[questionNumber].questionAnswer;
    // True
    if (CorrectAnswer == true) {
      if (currentAnswer == true) {
        scoreResult.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreResult.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
    } else {
      if (currentAnswer == false) {
        scoreResult.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreResult.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
    }

    if (questionNumber == controller.data.length - 1) {
      Get.defaultDialog(title: "Watchout", middleText: "Questions Ended");
    } else {
      questionNumber++;
      print("questionNumber  : $questionNumber ");
    }
  }
}
  */