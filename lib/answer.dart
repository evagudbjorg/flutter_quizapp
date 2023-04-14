import "package:flutter/material.dart";
import "package:flutter/src/painting/edge_insets.dart";


class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
