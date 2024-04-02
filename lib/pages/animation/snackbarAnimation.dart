import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

void showDialogbox(BuildContext context, int totalSelectCount, int mainSelectCount) {
  if (totalSelectCount >= mainSelectCount) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
         shape: StadiumBorder(),
          backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(30),
      elevation: 30,
        content: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'You can only select up to $mainSelectCount items.',
                textStyle: TextStyle(fontSize: 16),
                speed: Duration(milliseconds: 100),
              ),
            ],
            isRepeatingAnimation: false,
          ),
        ),
      ),
    );
  }
}