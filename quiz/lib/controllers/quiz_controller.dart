import 'package:get/get.dart';
import 'package:quiz/views/result_screen.dart';
import 'package:quiz/views/welcome_screen.dart';

class QuizController extends GetxController {
  var currentIndex = 0.obs;
  var score = 0.obs;
  var selectedOption = "".obs;

  void selectOption(String option) {
    selectedOption.value = option;
  }

  void nextQuestion() {
    if (selectedOption.value == pages[currentIndex.value]["answer"]) {
      score.value++;
    }

    if (currentIndex.value < pages.length - 1) {
      currentIndex.value++;
      selectedOption.value = "";
    } else {
      Get.to(() => const ResultScreen());
    }
  }

  void restartQuiz() {
    currentIndex.value = 0;
    score.value = 0;
    selectedOption.value = "";
    Get.offAll(() => const WelcomeScreen());
  }

  List pages = [
    {
      "question": "Which widget is the root of most Flutter applications?",
      "option1": "MaterialApp",
      "option2": "Scaffold",
      "option3": "Container",
      "option4": "WidgetApp",
      "answer": "MaterialApp",
    },
    {
      "question": "Which programming language is used to write Flutter apps?",
      "option1": "Java",
      "option2": "Kotlin",
      "option3": "Dart",
      "option4": "Swift",
      "answer": "Dart",
    },
    {
      "question": "What command is used to check for Flutter setup errors?",
      "option1": "flutter help",
      "option2": "flutter doctor",
      "option3": "flutter check",
      "option4": "flutter fix",
      "answer": "flutter doctor",
    },
    {
      "question":
          "Which widget is used for repeating content in a scrollable list?",
      "option1": "Column",
      "option2": "Stack",
      "option3": "ListView",
      "option4": "Expanded",
      "answer": "ListView",
    },
    {
      "question": "What is the function of 'pubspec.yaml'?",
      "option1": "Writing app logic",
      "option2": "Managing dependencies and assets",
      "option3": "Designing the UI",
      "option4": "Compiling the code",
      "answer": "Managing dependencies and assets",
    },
    {
      "question": "Which folder contains the source code of a Flutter project?",
      "option1": "android",
      "option2": "ios",
      "option3": "lib",
      "option4": "test",
      "answer": "lib",
    },
    {
      "question":
          "What widget would you use to overlay widgets on top of each other?",
      "option1": "Column",
      "option2": "Row",
      "option3": "Stack",
      "option4": "Container",
      "answer": "Stack",
    },
    {
      "question":
          "Which state management tool is built into Flutter by default?",
      "option1": "Provider",
      "option2": "Bloc",
      "option3": "setState",
      "option4": "Riverpod",
      "answer": "setState",
    },
    {
      "question": "What does 'hot reload' do in Flutter?",
      "option1": "Restarts the whole app",
      "option2": "Clears the cache",
      "option3": "Injects code changes without losing state",
      "option4": "Compiles the app for release",
      "answer": "Injects code changes without losing state",
    },
    {
      "question":
          "Which widget provides a default app bar and floating action button?",
      "option1": "Container",
      "option2": "Scaffold",
      "option3": "Center",
      "option4": "SizedBox",
      "answer": "Scaffold",
    },
    {
      "question": "What is the entry point of every Dart program?",
      "option1": "runApp()",
      "option2": "start()",
      "option3": "main()",
      "option4": "init()",
      "answer": "main()",
    },
    {
      "question":
          "Which widget is used to make a widget take up all remaining space?",
      "option1": "Padding",
      "option2": "Expanded",
      "option3": "Flexible",
      "option4": "ConstrainedBox",
      "answer": "Expanded",
    },
    {
      "question": "How do you define a constant variable in Dart?",
      "option1": "final",
      "option2": "static",
      "option3": "const",
      "option4": "fixed",
      "answer": "const",
    },
    {
      "question": "Which widget is used to add padding around another widget?",
      "option1": "Margin",
      "option2": "Spacer",
      "option3": "Padding",
      "option4": "Align",
      "answer": "Padding",
    },
    {
      "question": "What is the use of 'MainAxisAlignment' in a Row?",
      "option1": "Aligns items vertically",
      "option2": "Aligns items horizontally",
      "option3": "Sets the background color",
      "option4": "Determines the row width",
      "answer": "Aligns items horizontally",
    },
    {
      "question": "Which widget allows for user text input?",
      "option1": "Label",
      "option2": "TextField",
      "option3": "TextOutput",
      "option4": "FormBox",
      "answer": "TextField",
    },
    {
      "question": "What does SDK stand for?",
      "option1": "Software Design Kit",
      "option2": "System Development Kit",
      "option3": "Software Development Kit",
      "option4": "Standard Development Kit",
      "answer": "Software Development Kit",
    },
    {
      "question": "Which widget creates a circular loading indicator?",
      "option1": "LinearProgressIndicator",
      "option2": "CircularProgressIndicator",
      "option3": "LoadingSpinner",
      "option4": "RefreshIndicator",
      "answer": "CircularProgressIndicator",
    },
    {
      "question":
          "How many types of widgets are there in Flutter fundamentally?",
      "option1": "One",
      "option2": "Two",
      "option3": "Three",
      "option4": "Four",
      "answer": "Two",
    },
    {
      "question": "Which widget is best for creating a button with text?",
      "option1": "TextButton",
      "option2": "PressButton",
      "option3": "Clickable",
      "option4": "Link",
      "answer": "TextButton",
    },
    {
      "question": "What keyword is used to import a library in Dart?",
      "option1": "using",
      "option2": "include",
      "option3": "import",
      "option4": "require",
      "answer": "import",
    },
    {
      "question": "Which widget is used to display an image from a URL?",
      "option1": "Image.asset",
      "option2": "Image.file",
      "option3": "Image.network",
      "option4": "Image.memory",
      "answer": "Image.network",
    },
    {
      "question": "What is the purpose of the 'build' method?",
      "option1": "To initialize variables",
      "option2": "To describe the UI part",
      "option3": "To handle user input",
      "option4": "To dispose of resources",
      "answer": "To describe the UI part",
    },
    {
      "question": "Which widget makes its child look like a card with shadows?",
      "option1": "Container",
      "option2": "Card",
      "option3": "Paper",
      "option4": "Box",
      "answer": "Card",
    },
    {
      "question": "What does the 'async' keyword do?",
      "option1": "Runs code synchronously",
      "option2": "Marks a function as asynchronous",
      "option3": "Speeds up code execution",
      "option4": "Declares a new thread",
      "answer": "Marks a function as asynchronous",
    },
    {
      "question": "Which operator is used for null-aware access?",
      "option1": "!",
      "option2": "??",
      "option3": "?.",
      "option4": "&&",
      "answer": "?.",
    },
    {
      "question": "What is used to navigate between screens?",
      "option1": "RouteManager",
      "option2": "Navigator",
      "option3": "ScreenSwitcher",
      "option4": "PageController",
      "answer": "Navigator",
    },
    {
      "question": "Which widget provides a material design drawer?",
      "option1": "SideMenu",
      "option2": "Drawer",
      "option3": "MenuPanel",
      "option4": "NavigationRail",
      "answer": "Drawer",
    },
    {
      "question": "What is the purpose of the 'pub get' command?",
      "option1": "To upload a package",
      "option2": "To download dependencies",
      "option3": "To run the app",
      "option4": "To clean the project",
      "answer": "To download dependencies",
    },
    {
      "question": "Which widget is used for basic alignment of its child?",
      "option1": "Align",
      "option2": "Positioned",
      "option3": "Transform",
      "option4": "OverflowBox",
      "answer": "Align",
    },
    {
      "question": "How do you declare a private variable in Dart?",
      "option1": "private var",
      "option2": "@private var",
      "option3": "_varName",
      "option4": "varName!",
      "answer": "_varName",
    },
    {
      "question": "What is the return type of the build method?",
      "option1": "void",
      "option2": "Dynamic",
      "option3": "Widget",
      "option4": "Context",
      "answer": "Widget",
    },
    {
      "question": "Which widget is used to detect gestures like taps?",
      "option1": "GestureDetector",
      "option2": "TapListener",
      "option3": "TouchHandler",
      "option4": "ActionWidget",
      "answer": "GestureDetector",
    },
    {
      "question": "Which collection type stores unique items in Dart?",
      "option1": "List",
      "option2": "Map",
      "option3": "Set",
      "option4": "Queue",
      "answer": "Set",
    },
    {
      "question": "What is the purpose of the 'key' property in widgets?",
      "option1": "To encrypt the widget",
      "option2": "To identify widgets uniquely",
      "option3": "To set the background color",
      "option4": "To define the widget's route",
      "answer": "To identify widgets uniquely",
    },
    {
      "question": "Which command creates a new Flutter project?",
      "option1": "flutter init",
      "option2": "flutter new",
      "option3": "flutter create",
      "option4": "flutter start",
      "answer": "flutter create",
    },
    {
      "question": "What widget is used to handle single child scrolling?",
      "option1": "ScrollableView",
      "option2": "SingleChildScrollView",
      "option3": "ListView",
      "option4": "CustomScrollView",
      "answer": "SingleChildScrollView",
    },
    {
      "question":
          "Which widget is used to give a fixed height/width to a child?",
      "option1": "Container",
      "option2": "SizedBox",
      "option3": "Padding",
      "option4": "ConstrainedBox",
      "answer": "SizedBox",
    },
    {
      "question": "Which design language does Flutter primarily follow?",
      "option1": "Fluent Design",
      "option2": "Cupertino",
      "option3": "Material Design",
      "option4": "Ant Design",
      "answer": "Material Design",
    },
    {
      "question": "How do you display a snackbar?",
      "option1": "ScaffoldMessenger.of(context).showSnackBar()",
      "option2": "SnackBar.show()",
      "option3": "Messenger.showSnackBar()",
      "option4": "Navigator.showSnackBar()",
      "answer": "ScaffoldMessenger.of(context).showSnackBar()",
    },
    {
      "question": "Which widget would you use for a grid layout?",
      "option1": "GridView",
      "option2": "Table",
      "option3": "Flex",
      "option4": "Wrap",
      "answer": "GridView",
    },
    {
      "question": "What is a 'Stream' in Dart?",
      "option1": "A sequence of asynchronous events",
      "option2": "A list of strings",
      "option3": "A UI component",
      "option4": "A memory management tool",
      "answer": "A sequence of asynchronous events",
    },
    {
      "question": "Which widget allows you to create a circle shape?",
      "option1": "CircleAvatar",
      "option2": "RoundBox",
      "option3": "OvalWidget",
      "option4": "ClipRRect",
      "answer": "CircleAvatar",
    },
    {
      "question": "What is the purpose of 'initState'?",
      "option1": "To build the UI",
      "option2": "To handle user taps",
      "option3": "To initialize state for a Statefull widget",
      "option4": "To delete the widget",
      "answer": "To initialize state for a Statefull widget",
    },
    {
      "question": "Which widget is used to create a vertical list of widgets?",
      "option1": "Row",
      "option2": "Column",
      "option3": "Stack",
      "option4": "Grid",
      "answer": "Column",
    },
    {
      "question": "Which Dart feature is used to handle exceptions?",
      "option1": "try-catch",
      "option2": "if-else",
      "option3": "switch-case",
      "option4": "error-catch",
      "answer": "try-catch",
    },
    {
      "question": "What widget do you use to show a dialog?",
      "option1": "showDialog()",
      "option2": "AlertDialog.show()",
      "option3": "Popup()",
      "option4": "Modal()",
      "answer": "showDialog()",
    },
    {
      "question": "Which keyword refers to the current instance of a class?",
      "option1": "self",
      "option2": "this",
      "option3": "current",
      "option4": "super",
      "answer": "this",
    },
    {
      "question": "What is the default axis for a Column?",
      "option1": "Horizontal",
      "option2": "Vertical",
      "option3": "Z-axis",
      "option4": "Diagonal",
      "answer": "Vertical",
    },
    {
      "question": "Which package is used for HTTP requests in Flutter?",
      "option1": "flutter_http",
      "option2": "dio",
      "option3": "http",
      "option4": "requests",
      "answer": "http",
    },
  ];
}
