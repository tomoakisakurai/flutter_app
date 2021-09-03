import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';

class HomePage extends StatelessWidget {
  // final VoidCallback onSignOut;
  final AuthBase auth;

  const HomePage({Key? key, required this.auth}) : super(key: key);

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      // onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          TextButton(
              onPressed: _signOut,
              child: Text('ログアウト',
                  style: TextStyle(fontSize: 18.0, color: Colors.white)))
        ],
      ),
    );
  }
}
