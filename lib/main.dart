import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quizzy/View/screens/getstartScreen.dart';
import 'package:quizzy/View/screens/splashScreen.dart';
import 'package:quizzy/View/screens/startScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () =>const SplashScreen()),
      GetPage(name: '/GetstartScreen', page: () =>const GetstartScreen()),
       GetPage(name: '/startScreen', page: () =>const StartScreen()),
    ],
      debugShowCheckedModeBanner: false,
      title: 'quizzy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

   