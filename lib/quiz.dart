import "package:flutter/material.dart";
import "./question.dart";
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]["questionText"] as String,
        ),
        ...(questions[questionIndex]["answer"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer["score"]), answer["text"]);
        }).toList()
      ],
    );
  }
}

/*

import "package:flutter/material.dart";
import "./question.dart";
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({@required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0), // Add 16.0 units of padding to the top and bottom
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0), // Add 16.0 units of padding on all sides
            child: Question(
              questions[questionIndex]["questionText"] as String,
            ),
          ),
          ...(questions[questionIndex]["answer"] as List<Map<String, Object>>).map((answer) {
            return ElevatedButton(
              onPressed: () => answerQuestion(answer["score"]),
              child: Text(answer["text"]),
            );
          }).toList()
        ],
      ),
    );
  }
}

*/
