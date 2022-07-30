import 'package:flutter/material.dart';
class Question {
  String question;
  bool questionResult;
  Question({required this.question,required this.questionResult});
}


List<Question> quizzQuestion =[
  Question(question: 'Some cats are actually allergic to humans', questionResult: false),
  Question(question: 'You can lead a cow down stairs but not up stairs.', questionResult: false),
  Question(question: 'Ali hassan elmahdy ', questionResult: false),
  Question(question: 'Approximately one quarter of human bones are in the feet.', questionResult: true),
  Question(question: 'A slug\'s blood is green.', questionResult: true),
  Question(question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',questionResult: true),
  Question(question: 'It is illegal to pee in the Ocean in Portugal.',questionResult: true),
];

String questionText (int questionNum){
  return quizzQuestion[questionNum].question;
}

 nextQestion (int questionNum){
  if(questionNum < quizzQuestion.length-1){
    return questionNum=questionNum+1;

  }
}
List<Widget> icon = [];
int rate = 0;
 chechQuestion (int questionNum,bool isQuestion){
  if(quizzQuestion[questionNum].questionResult==isQuestion){
    rate++;
    return icon.add(const Icon(
        Icons.done,
        color: Colors.green,

      ));
  }else {
    return icon.add(const Icon(
      Icons.close,
      color: Colors.red,
    ));
  }
}
