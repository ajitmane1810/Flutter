import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:german_speaker/list/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class TextSpeaker extends StatefulWidget {
  const TextSpeaker({Key? key}) : super(key: key);

  @override
  State<TextSpeaker> createState() => _TextSpeakerState();
}

class _TextSpeakerState extends State<TextSpeaker> {
  final FlutterTts _flutterTts = FlutterTts();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _flutterTts.setLanguage('de-DE'); // Set language to German
  }

  void _speakText() {
    _flutterTts.speak(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/frame1.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 120, left: 5),
            child: Text(
              "Text to Speck",
              style: fonts[3].copyWith(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 300, left: 10, right: 10),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter text to speak',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _speakText,
                  child: const Text('Speak'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}