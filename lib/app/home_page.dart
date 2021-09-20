import 'package:flutter/material.dart';
import 'package:flutter_app/common_widget/bottom_bar.dart';
import 'package:flutter_app/common_widget/show_dialog.dart';
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

  Future<void> _confirmSignOut(BuildContext context) async {
    final signOut = await showAlertDialog(context,
        title: 'ログアウト',
        content: 'ログアウトしますか？',
        cancelActionText: 'キャンセル',
        defaultActionText: 'ログアウト');
    if (signOut == true) {
      _signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
        actions: [
          TextButton(
              onPressed: () => _confirmSignOut(context),
              child: Text('ログアウト',
                  style: TextStyle(fontSize: 18.0, color: Colors.white)))
        ],
      ),
      body: BottomBarScreen(),
    );
  }
}
