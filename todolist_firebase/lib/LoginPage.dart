
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist_firebase/WelcomePage.dart';

class LoginPage extends StatelessWidget {
 
 String username = '';
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 12, 56, 1),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100,left: 40,bottom: 30),
                  child:  Text('Welcome',
                  style: GoogleFonts.averageSans(
                    fontSize: 40,fontWeight: FontWeight.w400,color:const Color.fromRGBO(255, 255, 255, 1)
                  )),
                ),
              ],
            ),
            Container(
              width: 221,
              height: 251,
              child: const Image(image: AssetImage('images/login.png'),fit: BoxFit.cover),
            ),
            Container(
              margin: const EdgeInsets.only(right: 160,top: 30),
              child:  Text('Enter Name',style: GoogleFonts.averageSans(
                color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18
                ),),
            ),
            Container(
             margin: const EdgeInsets.only(left: 50,right: 50,top: 20,bottom: 50),
              child:  TextFormField(
                onChanged: (value) {
                
                  username = value ;
                },
                initialValue: '',
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 1)
                    )
                  ),
                  fillColor: Color.fromRGBO(217, 217, 217, 1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue
                    )
                  )
                ),
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                 fixedSize: MaterialStatePropertyAll(Size(180, 50)),
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(65, 201, 226, 1)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))
                  ))
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage(username: username),));
              }, 
              child:  Text('GET STARTED',style: GoogleFonts.asapCondensed(
                color: Color.fromRGBO(27, 26, 85, 0.65),
                fontWeight: FontWeight.w700,fontSize: 22
              ),) 
              )
          ],
        ),
      ),
    );
  }
}