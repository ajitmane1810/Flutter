import 'package:flutter/material.dart';
import 'package:german_speaker/widgets/buttons.dart';
import 'package:german_speaker/login/signin.dart';
import 'package:german_speaker/login/signup.dart';
import 'package:german_speaker/widgets/customScaffold.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                          text: 'Welcome!\n',
                          style: TextStyle(
                             color: Colors.white, fontSize: 45, fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: '\nEnter personal details to your account',
                          style: TextStyle(
                            color: Colors.white,  fontSize: 23, fontWeight: FontWeight.w600))
                    ]),
                  ),
                ),
              )),
           Flexible(
              flex: 0,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Expanded(
                        child: WelcomeButton(
                      buttonText: 'Sign In',
                      onTap: SignIn(),
                      containerColor: Colors.transparent,
                      textColor: Colors.white,
                    )),
                   const Expanded(
                        child: WelcomeButton(
                      buttonText: 'Sign Up',
                      onTap: SignUp(),
                      containerColor: Colors.white,
                       textColor: Colors.blue,
                    )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}