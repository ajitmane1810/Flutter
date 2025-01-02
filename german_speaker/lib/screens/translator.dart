import 'package:flutter/material.dart';
import 'package:fontresoft/fontresoft.dart';
import 'package:german_speaker/list/list.dart';
import 'package:translator/translator.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Translator extends StatefulWidget {
  const Translator({super.key});

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  final outputController = TextEditingController();
  final translator = GoogleTranslator();
  final FlutterTts _flutterTts = FlutterTts();

  String inputText = "  ";
  String inputLanguage = "en";
  String outputLanguage = "de";

  void initState() {
    super.initState();
    setState(() {
      _flutterTts.setLanguage('de-DE');
    });
  }

  Future translateText() async {
    final translated = await translator.translate(inputText,
        from: inputLanguage, to: outputLanguage);
    setState(() {
      outputController.text = translated.text;
    });
  }

  void _speaktranslated() {
    setState(() {
      _flutterTts.speak(outputController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/frame1.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 120),
              child: Text(
                "TEXT TRANSLATOR",
                style: fonts[3].copyWith(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 300, left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter text to translate"),
                      onChanged: (value) {
                        setState(() {
                          inputText = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: translateText, child: Text("Translate")),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: outputController,
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: " Result Here ..."),
                      onChanged: (value) {
                        setState(() {
                          inputText = value;
                        });
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            _speaktranslated();
                          },
                          child: Text("Speak")),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}