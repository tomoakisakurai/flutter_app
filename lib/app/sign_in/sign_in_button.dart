import 'package:flutter/material.dart';
import 'package:flutter_app/common_widget/custom_button.dart';

class SignInButton extends CustomButton {
  SignInButton({
    required String text,
    required Color color,
    required Color textColor,
    double? height = 50,
    required VoidCallback onPressed,
  }) : super(
            child:
                Text(text, style: TextStyle(color: textColor, fontSize: 15.0)),
            color: color,
            height: height,
            borderRadius: 2.0,
            onPressed: onPressed);
}
