import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/home_page.dart';
import 'package:flutter_app/app/sign_in/sign_in_page.dart';
import 'package:flutter_app/services/auth.dart';

class LandingPage extends StatefulWidget {
  final AuthBase auth;

  const LandingPage({Key? key, required this.auth}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

  @override
  void initState() {
    print('初期化');
    super.initState();
    _updateUser(widget.auth.currentUser);
  }

  void _updateUser(User? user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(auth: widget.auth, onSignIn: _updateUser);
    }
    return HomePage(
      auth: widget.auth,
      onSignOut: () => _updateUser(null),
    );
  }
}
