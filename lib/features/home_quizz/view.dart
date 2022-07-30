import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizzer_modelizing/data/model/quizz_qusetion_model.dart';

class QuizzeScreen extends StatefulWidget {
  const QuizzeScreen({Key? key}) : super(key: key);

  @override
  State<QuizzeScreen> createState() => _QuizzeScreenState();
}

class _QuizzeScreenState extends State<QuizzeScreen> {
  var questionNumber = 0;
  bool isFinish = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            isFinish==true? Expanded(
        flex: 6,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(rate.toString(),style: TextStyle(fontSize: 50),),
                  rate<3?const Text("😔",style: TextStyle(fontSize: 50),):rate<5?Text("🥰",style: TextStyle(fontSize: 50),):Text("😍",style: TextStyle(fontSize: 50),)
                ],
              ),
            )):Expanded(
                flex: 6,
                child: Center(
                  child: Text(questionText(questionNumber)),
                )),
            isFinish==true?Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    setState(() {
                        isFinish=false;
                        questionNumber=0;
                        rate=0;
                        icon=[];

                    });
                  },
                  child: const Text("Play Agin"),
                )): Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    setState(() {
                      if (questionNumber < quizzQuestion.length - 1) {
                        questionNumber++;
                        chechQuestion(questionNumber, true);
                      }
                      else{
                        isFinish=true;
                      }
                    });
                  },
                  child: const Text("True"),
                )),
            const SizedBox(height: 10),
            isFinish==true?Container():Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    setState(() {
                      if (questionNumber < quizzQuestion.length - 1) {
                        questionNumber++;
                        chechQuestion(questionNumber, false);
                      }else{
                        isFinish=true;
                      }
                    });
                  },
                  child: const Text("False"),
                )),
            isFinish==true?Container():Container(
              height: 20,
              child: Row(
                children: icon,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
