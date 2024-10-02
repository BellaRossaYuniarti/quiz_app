import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/quiz_provider.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (quizProvider.currentQuestionIndex <
                    quizProvider.questions.length) ...[
                  Text(
                    'Pertanyaan ${quizProvider.currentQuestionIndex + 1}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 332,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF2C2C2C)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        quizProvider
                                .questions[quizProvider.currentQuestionIndex]
                            ['question'],
                        style: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Pilih jawaban anda!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => quizProvider.answerQuestion(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4287FF),
                        ),
                        child: Text(
                          'Benar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () => quizProvider.answerQuestion(false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF04646),
                        ),
                        child: Text(
                          'Salah',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  Text(
                    'Quiz Selesai!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Nilai anda: ${(quizProvider.correctAnswers / quizProvider.questions.length * 100).toInt()}',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => quizProvider.resetQuiz(),
                    child: Text('Ulangi Quiz'),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
