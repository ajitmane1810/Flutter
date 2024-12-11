import 'package:ecommerce_app/utlis/colors.dart';
import 'package:flutter/material.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.23,
      width: size.width,
      color: bannerColor,
      child:  Padding(
        padding: const  EdgeInsets.only(left: 27),
        child:  Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "NEW COLLECTIONS",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -2),
                ),
                const Row(
                  children: [
                    Text(
                      "20 ",
                      style: TextStyle(
                          fontSize: 40,
                          height: 0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -3),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        Text(
                          "%",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "OFF",
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: -1.5,
                              fontWeight: FontWeight.bold,
                              height: 0.6),
                        )
                      ],
                    )
                  ],
                ),
                MaterialButton(onPressed: () {},
                color: Colors.black,
                child: const Text("SHOP NOW",style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
                ),),
                )
              ],
            ),
            Align(alignment: Alignment.bottomRight,
            child: Image.asset('assets/girls.png',height: size.height*0.19,),)
          ],
        ),
      ),
    );
  }
}
