import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;
  final List<Map<String, dynamic>> _questions = [
    {"question": "Apakah Flutter menggunakan bahasa Dart?", "answer": true},
    {"question": "Apakah Flutter framework untuk backend?", "answer": false},
    {"question": "Apakah YES berarti YA?", "answer": true},
  ];

  int get currentQuestionIndex => _currentQuestionIndex;
  int get correctAnswers => _correctAnswers;
  List<Map<String, dynamic>> get questions => _questions;

  void answerQuestion(bool userAnswer) {
    final correctAnswer = _questions[_currentQuestionIndex]['answer'] as bool;
    final isCorrect = userAnswer == correctAnswer;

    if (isCorrect) {
      _correctAnswers++;
    }

    _currentQuestionIndex++;
    notifyListeners();
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _correctAnswers = 0;
    notifyListeners();
  }
}