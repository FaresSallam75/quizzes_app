import 'package:first/binding/myminding.dart';
import 'package:first/core/services/services.dart';
import 'package:first/view/screen/homepage.dart';
import 'package:first/view/screen/quizzespage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return  GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      getPages: [
        GetPage(
          name: "/home", page: () =>   const HomePage()  ,
         ),
        GetPage(
          name: "/QuizPage", page: () =>   const QuizzPage()  ,
         ),
       /*  GetPage(
          name: "/hometwo", page: () =>   const QuizzApplication()  ,
         ), */
      ],
    );
  }
}

