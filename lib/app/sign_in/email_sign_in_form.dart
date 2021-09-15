import 'package:flutter/material.dart';
import 'package:flutter_app/common_widget/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {
  const EmailSignInForm({Key? key}) : super(key: key);

  List<Widget> _buildChildren() {
    return [
      TextField(
        decoration:
            InputDecoration(labelText: 'メールアドレス', hintText: 'test@test.com'),
      ),
      SizedBox(
        height: 8.0,
      ),
      TextField(
        decoration: InputDecoration(labelText: 'パスワード'),
        obscureText: true,
      ),
      SizedBox(
        height: 8.0,
      ),
      FormSubmitButton(
        text: 'サインイン',
        onPressed: () {},
      ),
      SizedBox(
        height: 8.0,
      ),
      TextButton(onPressed: () {}, child: Text('新規登録'))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
