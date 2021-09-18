import 'package:flutter/material.dart';
import 'package:flutter_app/app/sign_in/email_sign_in_form.dart';
import 'package:flutter_app/providers/main_provider.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailSignInPage extends HookWidget {
  const EmailSignInPage({required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    final int count = useProvider(counterProvider).state;
    print('email_sign_in_page');
    print(count);

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
                child: Card(
                    child: EmailSignInForm(
                  auth: auth,
                )),
              ),
            ),
            TextButton(
                onPressed: () {
                  context.read(counterProvider).state =
                      context.read(counterProvider).state + 2;
                },
                child: Text('push'))
          ],
        ));
  }
}
