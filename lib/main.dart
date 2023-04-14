import "package:flutter/material.dart";
import "package:flutter_quizapp/result.dart";
import "./quiz.dart";
import "./result.dart";
import 'ui/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What is Leave No Trace?",
      "answer": [
        {
          "text": "A program that teaches people about outdoor ethics",
          "score": 2
        },
        {"text": "A type of hiking trail ", "score": 1},
        {"text": "A method for starting a campfire", "score": 0}
      ],
    },
    {
      "questionText": "What is the best type of footwear for hiking?",
      "answer": [
        {"text": "Flip flops", "score": 0},
        {"text": "Running shoes", "score": 1},
        {"text": "Hiking boots", "score": 2},
      ],
    },
    {
      "questionText": "What should you do if you get lost while hiking?",
      "answer": [
        {"text": "Stay calm and dont panic", "score": 2},
        {"text": "Try to retrace your steps to find your way back", "score": 1},
        {"text": "cry", "score": 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print("we have more questions");
    } else {
      print("no more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hiking quiz',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.lightGreen[100],
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
