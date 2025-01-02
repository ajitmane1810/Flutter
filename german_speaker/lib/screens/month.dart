import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fontresoft/fontresoft.dart';
import 'package:german_speaker/screens/alphabets.dart';
import 'package:german_speaker/screens/screen1.dart';
import 'package:german_speaker/screens/speechtranslator.dart';
import 'package:german_speaker/screens/textspeaker.dart';
import 'package:german_speaker/screens/translator.dart';
import 'package:german_speaker/widgets/drawer.dart';
import '../list/list.dart';

class Month extends StatefulWidget {
  const Month({super.key});

  @override
  State<Month> createState() => _MonthState();
}

class _MonthState extends State<Month> {
  final FlutterTts _flutterTts = FlutterTts();

  void initState() {
    super.initState();
    setState(() {
      _flutterTts.setLanguage('de-DE');
    });
  }

  void _speakmonth(String months) {
    setState(() {
      _flutterTts.speak(germanmonth[months]!);
    });
  }

  Widget germanText(String months) {
    return Text(
      germanmonth[months]!,
      style: fonts[8].copyWith(fontSize: 30.0, fontWeight: FontWeight.w400),
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
            child: Text(
              "Month Speaker",
              style: fonts[3].copyWith(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView.builder(
              itemCount: months.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Center(
                                child: Text(
                              months[index],
                              style: fonts[3].copyWith(
                                  fontSize: 30.0, fontWeight: FontWeight.w500),
                            )),
                            Text(
                              " : ",
                              style: fonts[8].copyWith(
                                  fontSize: 30.0, fontWeight: FontWeight.w400),
                            ),
                            germanText(
                              months[index],
                            ),
                            InkWell(
                              child: Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    color: Colors.blue[100]),
                                child: IconButton(
                                    onPressed: () => _speakmonth(months[index]),
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