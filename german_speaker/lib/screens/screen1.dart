import 'package:flutter/material.dart';
import 'package:german_speaker/list/list.dart';
import 'package:fontresoft/fontresoft.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/frame2.png"), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Container(
                margin: EdgeInsets.only(left: 20, top: 80),
                child: Text(
                  "GERMAN SPEAKER",
                  style: fonts[3].copyWith(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )),
            Container(
              margin: EdgeInsets.only(top: 180),
              child: Center(
                child: CarouselSlider.builder(
                  itemCount: imgList.length,
                  itemBuilder: (context, index, realIndex) {
                    return Column(
                      children: [
                        InkWell(
                          child: Container(
                            height: 250,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(100, 150)),
                                image: DecorationImage(
                                    image: AssetImage(imgList[index]),
                                    fit: BoxFit.fill)),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => categoryWidgets[index],
                                ));
                          },
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Text(
                              category[index],
                              style: fonts[3].copyWith(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ))
                      ],
                    );
                  },
                  options: CarouselOptions(
                    height: 400.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 16 / 9,
                    initialPage: 0,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}