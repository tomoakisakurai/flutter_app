import 'package:flutter/material.dart';
import 'package:flutter_app/common_widget/custom_button.dart';

class FormSubmitButton extends CustomButton {
  FormSubmitButton({
    required String text,
    VoidCallback? onPressed,
  }) : super(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            color: Colors.indigo,
            height: 44.0,
            borderRadius: 4.0,
            onPressed: onPressed);
}
