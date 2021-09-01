import 'package:flutter/material.dart';
import 'package:learning_flutter/quiz.dart';
import 'package:learning_flutter/result.dart';

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
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1},
        {'text': 'Purple', 'score': 5},
        {'text': 'Green', 'score': 5}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Tiger', 'score': 10},
        {'text': 'Lion', 'score': 9},
        {'text': 'Elephant', 'score': 2},
        {'text': 'Horse', 'score': 3}
      ],
    },
    {
      'questionText': 'What\'s is your favourite language?',
      'answers': [
        {'text': 'Java', 'score': 9},
        {'text': 'Javascript', 'score': 9},
        {'text': 'Python', 'score': 5},
        {'text': 'Flutter', 'score': 7}
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
    _totalScore = _totalScore + score;

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
      debugShowCheckedModeBanner: false,
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
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
