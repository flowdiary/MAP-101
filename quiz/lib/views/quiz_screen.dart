import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controllers/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.put(QuizController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          var question = controller.pages[controller.currentIndex.value];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Question ${controller.currentIndex.value + 1}/${controller.pages.length}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                question["question"],
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 30),
              ...List.generate(4, (index) {
                String optionKey = "option${index + 1}";
                String optionText = question[optionKey];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Obx(() => ElevatedButton(
                        onPressed: () => controller.selectOption(optionText),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              controller.selectedOption.value == optionText
                                  ? Colors.blue
                                  : Colors.grey[200],
                          foregroundColor:
                              controller.selectedOption.value == optionText
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        child: Text(optionText),
                      )),
                );
              }),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (controller.selectedOption.value.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please select an option",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    controller.nextQuestion();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("Next"),
              ),
              SizedBox(height: 100),
            ],
          );
        }),
      ),
    );
  }
}
