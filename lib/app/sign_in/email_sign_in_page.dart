import 'package:flutter/material.dart';
import 'package:flutter_app/app/sign_in/email_sign_in_form.dart';
import 'package:flutter_app/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('サインイン'),
          elevation: 2.0,
        ),
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
                child: EmailSignInForm(
              auth: auth,
            )),
          ),
        ));
  }
}
