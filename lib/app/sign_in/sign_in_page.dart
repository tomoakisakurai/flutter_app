// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/sign_in/sign_in_button.dart';
import 'package:flutter_app/app/sign_in/social_sign_in_button.dart';
import 'package:flutter_app/services/auth.dart';

class SignInPage extends StatelessWidget {
  // final void Function(User?) onSignIn;
  final AuthBase auth;

  const SignInPage({Key? key, required this.auth}) : super(key: key);

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
      // print('${user?.uid}');
      // onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ふらったー'),
          elevation: 2.0,
        ),
        backgroundColor: Colors.grey[200],
        body: _buildContent());
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'ログイン',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Google でログイン',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Facebook でログイン',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Email でログイン',
            textColor: Colors.white,
            color: Color(0xFF00796B),
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'ログイン',
            textColor: Colors.black,
            color: Color(0xFFDCE775),
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
