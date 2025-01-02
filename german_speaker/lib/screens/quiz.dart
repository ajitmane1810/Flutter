import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:german_speaker/list/list.dart';
import 'package:german_speaker/screens/alphabets.dart';
import 'package:german_speaker/screens/screen1.dart';
import 'package:german_speaker/screens/speechtranslator.dart';
import 'package:german_speaker/screens/textspeaker.dart';
import 'package:german_speaker/screens/translator.dart';
import 'package:german_speaker/widgets/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Map> Questions = [
    {
      "question": "What is the word for Dance",
      "options": ["Spielen", "Tanzen", "Leben", "Schlafen"],
      "correctAnswer": 1
    },
    {
      "question": "Good Morning in German Language",
      "options": ["Guten Abend", "Gute Nacht", "Guten Tag", "Guten Morgen"],
      "correctAnswer": 3
    },
    {
      "question": "A in German Language",
      "options": ["Bey", "Aa", "Upsilon", "Tsey"],
      "correctAnswer": 1
    },
    {
      "question": "F in German Language",
      "options": ["Bey", "Aa", "Ef", "Tsey"],
      "correctAnswer": 2
    },
    {
      "question": "M in German Laanguage",
      "options": ["Em", "Aa", "Upsilon", "Tsey"],
      "correctAnswer": 0
    }
  ];
  int questionindex = 0;
  int selectedAnsIndex = -1;
  int count = 0;
  bool quizFinish = false;
  WidgetStatePropertyAll<Color?>? checkAns(int buttonIndex) {
    if (selectedAnsIndex != -1) {
      if (buttonIndex == selectedAnsIndex) {
        if (selectedAnsIndex == Questions[questionindex]["correctAnswer"]) {
          if (quizFinish == true) {
            count++;
          }
          return const WidgetStatePropertyAll(Colors.green);
        } else {
          return const WidgetStatePropertyAll(Colors.red);
        }
      } else {
        if (buttonIndex == Questions[questionindex]["correctAnswer"]) {
          return const WidgetStatePropertyAll(Colors.green);
        }
      }
    } else {
      return const WidgetStatePropertyAll(Colors.blue);
    }
    return const WidgetStatePropertyAll(Colors.blue);
  }

  Widget scoreScreen() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/frame1.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            margin: const EdgeInsets.only(top: 120, left: 50),
            child: Text("Result",
                style: fonts[3].copyWith(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 400),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      count >= 3
                          ? "Congratulations !"
                          : "Keep Trying, you will improve!",
                      style: const TextStyle(fontSize: 20,fontFamily: AutofillHints.telephoneNumberExtension),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Your Score is : ${count} out of ${questionindex}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          questionindex = 0;
                          count = 0;
                        });
                      },
                      child: const Text("Try again"),
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blue),
                          fixedSize: WidgetStatePropertyAll(Size(150, 50))),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questionindex == Questions.length) {
      return scoreScreen();
    }
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/frame1.png"), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        drawer:CustomDrawer(),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Column(
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Questions :",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      "${questionindex + 1}/${Questions.length}",
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                    "Q${questionindex + 1}. ${Questions[questionindex]["question"]}",
                    style: const TextStyle(fontSize: 20)),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: quizFinish
                      ? null
                      : () {
                          setState(() {
                            selectedAnsIndex = 0;
                            quizFinish = !quizFinish;
                          });
                        },
                  child: Text("A. ${Questions[questionindex]["options"][0]}"),
                  style: ButtonStyle(
                      backgroundColor: checkAns(0),
                      fixedSize: const WidgetStatePropertyAll(
                        Size(300, 50),
                      ))),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: quizFinish
                      ? null
                      : () {
                          setState(() {
                            selectedAnsIndex = 1;
                            quizFinish = !quizFinish;
                          });
                        },
                  child: Text("B. ${Questions[questionindex]["options"][1]}"),
                  style: ButtonStyle(
                      backgroundColor: checkAns(1),
                      fixedSize: const WidgetStatePropertyAll(
                        Size(300, 50),
                      ))),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: quizFinish
                      ? null
                      : () {
                          setState(() {
                            selectedAnsIndex = 2;
                            quizFinish = !quizFinish;
                          });
                        },
                  child: Text("C. ${Questions[questionindex]["options"][2]}"),
                  style: ButtonStyle(
                      backgroundColor: checkAns(2),
                      fixedSize: const WidgetStatePropertyAll(
                        Size(300, 50),
                      ))),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: quizFinish
                      ? null
                      : () {
                          setState(() {
                            selectedAnsIndex = 3;
                            quizFinish = !quizFinish;
                          });
                        },
                  child: Text("D. ${Questions[questionindex]["options"][3]}"),
                  style: ButtonStyle(
                      backgroundColor: checkAns(3),
                      fixedSize: const WidgetStatePropertyAll(
                        Size(300, 50),
                      ))),
            ],
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            if (questionindex < Questions.length) {
              setState(() {
                selectedAnsIndex = -1;
                questionindex++;
                quizFinish = false;
              });
            } else {
              setState(() {
                questionindex = 0;
                count = 0;
              });
            }
          },
          tooltip: 'Increment',
          child: const Icon(Icons.forward),
        ),
      ),
    );
  }
}
