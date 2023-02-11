import 'package:first_app/answer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppstate();
  }
}

class _MyAppstate extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favourite color ?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 7},
        {'text': 'white', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favourite animal ?',
      'answers': [
        {'text': 'goat', 'score': 16},
        {'text': 'pig', 'score': 5},
        {'text': 'ram', 'score': 2},
        {'text': 'camel', 'score': 17}
      ],
    },
    {
      'questionText': 'what\'s your favourite sport ?',
      'answers': [
        {'text': 'basketball', 'score': 15},
        {'text': 'hocky', 'score': 4},
        {'text': 'football', 'score': 10},
        {'text': 'golf', 'score': 9}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalscore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;

    setState(() {
      _questionIndex += 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutter app',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter app'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalscore, _resetQuiz),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ));
  }
}
