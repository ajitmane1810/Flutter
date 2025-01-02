
import 'package:books_library/screens/signin.dart';
import 'package:books_library/screens/signup.dart';
import 'package:books_library/widgets/customScaffold.dart';
import 'package:books_library/widgets/welcomeButton.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
          const Flexible(
              flex: 0,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Expanded(
                        child: WelcomeButton(
                      buttonText: 'Sign In',
                      onTap: SignInScreen(),
                      containerColor: Colors.transparent,
                      textColor: Colors.white,
                    )),
                    Expanded(
                        child: WelcomeButton(
                      buttonText: 'Sign Up',
                      onTap: SignUpScreen(),
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
