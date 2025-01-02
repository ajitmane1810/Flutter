import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fontresoft/fontresoft.dart';
import 'package:german_speaker/list/list.dart';
import 'package:german_speaker/screens/alphabets.dart';
import 'package:german_speaker/screens/screen1.dart';
import 'package:german_speaker/screens/speechtranslator.dart';
import 'package:german_speaker/screens/textspeaker.dart';
import 'package:german_speaker/screens/translator.dart';
import 'package:german_speaker/widgets/drawer.dart';

class Numbers extends StatefulWidget {
  const Numbers({super.key});

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  final FlutterTts _flutterTts = FlutterTts();

  void initState() {
    super.initState();
    setState(() {
      _flutterTts.setLanguage('de-DE');
    });
  }

  void _speakNumbers(String num) {
    setState(() {
      _flutterTts.speak(germanNumbers[num]!);
    });
  }

  Widget germanNumber(String num) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Text(
        germanNumbers[num]!,
        style: fonts[8].copyWith(fontSize: 25.0, fontWeight: FontWeight.w400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/frame1.png"), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        drawer: CustomDrawer(),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            margin: EdgeInsets.only(left: 8, top: 40),
            child: Text("Number Speaker",
                style: fonts[3].copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
          ),
          Container(
            margin: EdgeInsets.only(top: 190, left: 20),
            child: ListView.builder(
              itemCount: num.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(20),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Colors.yellow,
                                        Colors.grey,
                                        Colors.blue,
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: Center(
                                  child: Container(
                                child: Text(num[index],
                                    style: fonts[8].copyWith(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              )),
                            ),
                            Text(
                              " : ",
                              style: fonts[8].copyWith(
                                  fontSize: 20.0, fontWeight: FontWeight.w400),
                            ),
                            germanNumber(
                              num[index],
                            ),
                            InkWell(
                              child: Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    color: Colors.blue[100]),
                                child: IconButton(
                                    onPressed: () => _speakNumbers(num[index]),
                                    icon: Icon(Icons.volume_up)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}