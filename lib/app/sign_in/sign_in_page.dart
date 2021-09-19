// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/app/sign_in/email_sign_in_page.dart';
import 'package:flutter_app/app/sign_in/sign_in_bloc.dart';
import 'package:flutter_app/app/sign_in/sign_in_button.dart';
import 'package:flutter_app/app/sign_in/social_sign_in_button.dart';
import 'package:flutter_app/services/auth.dart';
// import 'package:flutter_app/services/auth_provider.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  static Widget create(BuildContext context) {
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(),
      child: SignInPage(),
    );
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    final bloc = Provider.of<SignInBloc>(context, listen: false);
    try {
      bloc.setIsLoading(true);

      // final auth = AuthProvider.of(context);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
      // print('${user?.uid}');
      // onSignIn(user);
    } catch (e) {
      print(e.toString());
      bloc.setIsLoading(false);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    final bloc = Provider.of<SignInBloc>(context, listen: false);
    try {
      bloc.setIsLoading(true);

      // final auth = AuthProvider.of(context);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
      bloc.setIsLoading(false);
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true, builder: (context) => EmailSignInPage()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SignInBloc>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text('ふらったー'),
          elevation: 2.0,
        ),
        backgroundColor: Colors.grey[200],
        body: StreamBuilder<bool>(
            stream: bloc.isLoadingStream,
            initialData: false,
            builder: (context, snapshot) {
              return _buildContent(context, snapshot.data);
            }));
  }

  Widget _buildContent(BuildContext context, bool? isLoading) {
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
            onPressed: () => _signInWithGoogle(context),
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
            onPressed: () => _signInWithEmail(context),
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
            onPressed: () => _signInAnonymously(context),
          ),
        ],
      ),
    );
  }
}
