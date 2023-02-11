import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    var resultText;
    if (resultScore <= 8) {
      resultText = 'you are awesome and innocent !';
    } else if (resultScore <= 12) {
      resultText = 'pretty likeable';
    } else if (resultScore <= 16) {
      resultText = 'pretty likeable';
    } else {
      resultText = "you are so bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(onPressed: resetHandler, child: Text('restart Quiz'))
      ],
    );
  }
}
