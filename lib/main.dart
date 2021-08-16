import 'package:flutter/material.dart';
import 'package:learning_flutter/answer.dart';
import 'package:learning_flutter/question.dart';
import 'package:learning_flutter/quiz.dart';

void main() {
  runApp(MyApp());
}

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
      'questionText': 'Whats your favourite color?',
      'answers': ['Black', 'White', 'Purple', 'Green'],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': ['Tiger', 'Lion', 'Elephant', 'Rhino'],
    },
    {
      'questionText': 'What\'s is your favourite language?',
      'answers': ['JavaScript', 'Java', 'Python', 'Dart'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print("Question Answered");

    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("First Flutter App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Center(
                child: Text("You did it"),
              ),
      ),
    );
  }
}
