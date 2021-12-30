import "package:flutter/material.dart";
import "package:quizapp/questions.dart";
import "package:quizapp/button.dart";

void main() => runApp(const QuizApp());

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  QuizAppState createState() => QuizAppState();
}

class QuizAppState extends State<QuizApp> {
  Questions questions = Questions();

  var correctAnswers = 0;
  var end = false;

  void answerQuestion(answer) {
    if (answer == questions.getAnswer()) {
      correctAnswers++;
    }
    setState(() {
      end = questions.end();
      questions.nextQuestion();
    });
  }

  reset() {
    setState(() {
      questions.reset();
      correctAnswers = 0;
      end = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: const Text('Quiz App'), backgroundColor: Colors.teal),
          body: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25.0),
              child: !end
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          questions.getQuestion(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Button(
                              buttonType: 'primary',
                              buttonText: 'True',
                              onPressed: () => answerQuestion(true),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Button(
                              buttonType: 'secondary',
                              buttonText: 'False',
                              onPressed: () => answerQuestion(false),
                            )
                          ],
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'You got $correctAnswers / 5',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                          ),
                        ),
                        TextButton(
                          onPressed: reset,
                          child: const Text('Reset'),
                        ),
                      ],
                    ))),
    );
  }
}
