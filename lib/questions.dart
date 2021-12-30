class Question {
  String question;
  bool answer;

  Question(this.question, this.answer);
}

class Questions {
  int _questionIndex = 0;

  final List<Question> _questions = [
    Question('Red is part of white light?', true),
    Question('All Impala have horns?', false),
    Question('Sushi is made from rice?', true),
    Question('Nairobi is a city in Africa?', true),
    Question('Pluto is a planet', false),
  ];

  void nextQuestion() {
    if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
    }
  }

  String getQuestion() {
    return _questions[_questionIndex].question;
  }

  bool getAnswer() {
    return _questions[_questionIndex].answer;
  }

  bool end() {
    return _questionIndex == _questions.length - 1;
  }

  void reset() {
    _questionIndex = 0;
  }
}
