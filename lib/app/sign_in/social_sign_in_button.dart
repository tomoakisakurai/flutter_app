import 'package:flutter/material.dart';
import 'package:flutter_app/common_widget/custom_button.dart';

class SocialSignInButton extends CustomButton {
  SocialSignInButton({
    required String assetName,
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback? onPressed,
  }) : super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(assetName),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 15.0),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Image.asset(assetName),
                ),
              ],
            ),
            color: color,
            height: 50.0,
            borderRadius: 2.0,
            onPressed: onPressed);
}
