import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist_firebase/CategoryPage.dart';

class WelcomePage extends StatelessWidget {

  String username;
   WelcomePage({super.key,required this.username });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromRGBO(13, 12, 56, 1),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 120,bottom: 70),
            width: 217,
            height: 194,
            child: const Image(
              image: AssetImage("images/image.png")),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
           child:   Text('Build the future by completing tasks.',
          style: GoogleFonts.asapCondensed(
            color:const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 20,fontWeight: FontWeight.w700
          ),),
          ) ,
          Container(
            height: 84,
            width: 278,
            margin: const EdgeInsets.only(top: 30,bottom: 60,left: 50,right: 50),
          child:   Text("Your tasks are bridges leading to the future. By completing them, reach your potential and your dreams.",
          textAlign: TextAlign.center,
          style: GoogleFonts.asapCondensed(
            color:const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 16,fontWeight: FontWeight.w700 
          ),),
          ),
          ElevatedButton(
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.horizontal(
                      start: Radius.circular(50),
                      end: Radius.circular(50)
                  )
                )
              ),
              fixedSize: MaterialStatePropertyAll(Size(160,42)),
              backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(65, 201, 226, 1))
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(username:username),));
            }, 
            child:  Text('Continue',
            style: GoogleFonts.asapCondensed(
              color:const Color.fromRGBO(27, 26, 85, 0.65),
              fontSize: 20,fontWeight: FontWeight.w700
            ),))
        ],
      ),
    );
  }
}