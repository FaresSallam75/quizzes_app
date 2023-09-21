import 'package:first/controller/question_controller.dart';
import 'package:first/core/class/handlingdataview.dart';
import 'package:first/view/widget/custombuttonhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizzPage extends GetView<QuestionControllerImp> {
  const QuizzPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: const Text('Quizz Application'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              controller.goToMainPage();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: GetBuilder<QuestionControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 7, child: controller.checkName()),
                CustomButtonHome(
                  title: "True",
                  colr: Colors.redAccent,
                  onPressed: () {
                    controller.checkAnswer(true);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonHome(
                  title: "False",
                  colr: Colors.blue,
                  onPressed: () {
                    controller.checkAnswer(false);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    // scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: controller.scoreResult,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
