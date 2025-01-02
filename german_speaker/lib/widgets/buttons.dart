import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final String? buttonText;
  final Widget? onTap;
  final Color? containerColor;
  final Color? textColor;
  const WelcomeButton({super.key, this.buttonText, this.onTap, this.containerColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => onTap!),
  (Route<dynamic> route) => false, // This will remove all previous routes
);
      },
      child: Container(
          padding: EdgeInsets.all(30),
          decoration:  BoxDecoration(
              color: containerColor!,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
          child: Text(
            textAlign: TextAlign.center,
            buttonText!,
            style:  TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold,color: textColor!
              ),
          )),
    );
  }
}
