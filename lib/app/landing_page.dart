import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/home_page.dart';
import 'package:flutter_app/app/sign_in/sign_in_page.dart';
import 'package:flutter_app/services/auth.dart';
// import 'package:flutter_app/services/auth_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class LandingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // final auth = AuthProvider.of(context);
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            if (user == null) {
              return SignInPage();
            }
            return HomePage();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
