import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screen/quiz_screen.dart';
import 'package:quiz_app/provider/quiz_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: const FigmaToCodeApp(),
    ),
  );
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              QuizScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
