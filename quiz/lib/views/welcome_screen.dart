import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/views/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(() => QuizScreen()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text("Start Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
