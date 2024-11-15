import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   // Create a FocusNode to track the focus state of the TextField
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 328,
          height: 473,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Welcome to MovieHub',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      fontSize: 28.0),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Please sign up below.',
                  style: TextStyle(
                      color: Color(0xFF737373),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Enter Mobile Number",
                  style: TextStyle(
                      color: Color(0xFFE5E5E5),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      // Redraw the widget when focus changes
                    });
                  },
                  child: TextField(
                    focusNode: _focusNode,
                     cursorColor: Colors.white, 
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lato'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,  // Only allows digits (0-9)
                    ],
                    decoration: InputDecoration(
                      hintText: _focusNode.hasFocus? null :'Enter Your Number',
                      hintStyle: const TextStyle(
                        color: Color(0xFFA3A3A3),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF262626),
                      
                      // Border without color change on focus
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,  // Grey color for border when not focused
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.transparent,  // Remove the border color when focused
                          width: 1.0,  // Maintain border width
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 319,
                  height: 18,
                  margin: EdgeInsets.only(left: 15),
                  child: const Text.rich(
                    TextSpan(
                      text: 'By Signing Up, I Accept ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.00),
                      children: [
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                              fontSize: 10.00),
                        ),
                        TextSpan(
                          text: ' &',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 10.0),
                        ),
                        TextSpan(
                          text: ' Privacy policy',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Lato',
                              fontSize: 10.00,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( bottom: 16.0),
                child: Container(
                  width: 328,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFC72D65),
                        Color(0xFFD23760),
                        Color(0xFFD23755),
                        Color(0xFFC72D65),
                        Color(0xFFD23760),
                        Color(0xFFD23760),
                      ],
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      // Your onPressed action here
                    },
                    child: const Text('Continue With Mobile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 288,
                  height: 16,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 40,),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                          endIndent: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: 328,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      // Your onPressed action here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/google.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        const Text(
                          ' Sign up with Google',
                          style: TextStyle(
                            color: Color(0xFFF5F5F5),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFD4D4D4),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Login Page when "Login" is clicked
                    },
                    child: const Text(
                      ' Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue, 
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
