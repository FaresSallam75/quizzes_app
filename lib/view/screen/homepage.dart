import 'package:first/controller/question_controller.dart';
import 'package:first/view/widget/custombuttonhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionControllerImp controller = Get.put(QuestionControllerImp());
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Are You Ready For Questions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                CustomButtonHome(
                  title: "YES",
                  colr: Colors.redAccent,
                  onPressed: () {
                    controller.goToQuestions();
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomButtonHome(
                  title: "NO",
                  colr: Colors.orange,
                  onPressed: () {
                    controller.goToBack();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
