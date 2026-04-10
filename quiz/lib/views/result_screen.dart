import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controllers/quiz_controller.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.find<QuizController>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Quiz Completed!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Obx(() => Text(
                    "Your Score: ${controller.score.value} / ${controller.pages.length}",
                    style: const TextStyle(fontSize: 24),
                  )),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => controller.restartQuiz(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text("Restart Quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
