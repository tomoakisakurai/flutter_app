import 'package:flutter/material.dart';
import 'package:flutter_app/common_widget/show_dialog.dart';
import 'package:flutter_app/services/auth.dart';
// import 'package:flutter_app/services/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  // final VoidCallback onSignOut;

  Future<void> _signOut(BuildContext context) async {
    try {
      // final auth = AuthProvider.of(context);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
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
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          TextButton(
              onPressed: () => _confirmSignOut(context),
              child: Text('ログアウト',
                  style: TextStyle(fontSize: 18.0, color: Colors.white)))
        ],
      ),
    );
  }
}
