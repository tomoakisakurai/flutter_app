import 'package:flutter/material.dart';
import 'package:flutter_app/app/sign_in/email_sign_in_form.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('サインイン'),
          elevation: 2.0,
        ),
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(child: EmailSignInForm()),
              ),
            ),
          ],
        ));
  }
}
