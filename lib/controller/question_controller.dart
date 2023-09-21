import 'dart:io';
import 'package:first/controller/handlingdata_controller.dart';
import 'package:first/core/class/statusrequest.dart';
import 'package:first/core/services/services.dart';
import 'package:first/data/questiondata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class QuestionController extends GetxController {
  getData();
  goToQuestions();
  goToBack();
  checkAnswer(bool correctAnswer);
}

class QuestionControllerImp extends QuestionController {
  //late final QuestionsModel questionsModel;
  QuestionData questionData = QuestionData(Get.find());
  List data = [];
  int questionNumber = 0;
  List<Widget> scoreResult = [];
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await questionData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToBack() {
    exit(0);
  }

  @override
  goToQuestions() {
    Get.toNamed(
      "/QuizPage",
    );
  }

  goToMainPage() {
    Get.defaultDialog(
      title: "alert",
      middleText: "Are You Sure To quit ?",
      onConfirm: () {
        Get.offAllNamed(
          "/home",
        );
      },
      onCancel: () {},
      confirmTextColor: Colors.white,
    );
  }

  @override
  checkAnswer(correctAnswer) {
    if (data.length - 1 >= questionNumber) {
      if (correctAnswer == true) {
        if (data[questionNumber]['question_answer'] == "true") {
          scoreResult.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreResult.add(
            const Icon(Icons.close, color: Colors.redAccent),
          );
        }
      }
      // false
      if (correctAnswer == false) {
        if (data[questionNumber]['question_answer'] == "false") {
          scoreResult.add(
            const Icon(
              Icons.check,
              color: Colors.greenAccent,
            ),
          );
        } else {
          scoreResult.add(
            const Icon(Icons.close, color: Colors.redAccent),
          );
        }
      }
      questionNumber++;
    } else {
      Get.defaultDialog(title: "Watchout", middleText: "Question Ended ...?");
    }

    update();
  }

  checkName() {
    // var ind = data[questionNumber]['question_name'];
    return Center(
      child: data.length - 1 >= questionNumber
          ? Text(
              "${data[questionNumber]['question_name']}",
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          : const Text(
              "End OF Questions",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
    );
  }
}
