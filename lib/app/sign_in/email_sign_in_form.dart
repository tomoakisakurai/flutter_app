import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/app/sign_in/validators.dart';
import 'package:flutter_app/common_widget/form_submit_button.dart';
import 'package:flutter_app/services/auth.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidators {
  EmailSignInForm({required this.auth});

  final AuthBase auth;

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  bool _submiteed = false;
  bool _isLoading = false;

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  void _submit() async {
    setState(() {
      _submiteed = true;
      _isLoading = true;
    });

    try {
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmail(_email, _password);
      } else {
        await widget.auth.createUserWithEmail(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('サインインに失敗しました。'),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('確認'))
              ],
            );
          });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _emailEdittingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  void _toggleFormType() {
    setState(() {
      _submiteed = false;
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText =
        _formType == EmailSignInFormType.signIn ? 'サインイン' : '新規登録';
    final secondaryText =
        _formType == EmailSignInFormType.signIn ? '新規登録' : 'サインイン';

    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) &&
        !_isLoading;

    return [
      _buildEmailTextField(),
      SizedBox(height: 8.0),
      _buildPasswordTextField(),
      SizedBox(height: 8.0),
      FormSubmitButton(
        text: primaryText,
        onPressed: submitEnabled ? _submit : null,
      ),
      SizedBox(height: 8.0),
      TextButton(
        child: Text(secondaryText),
        onPressed: !_isLoading ? _toggleFormType : null,
      ),
    ];
  }

  TextField _buildPasswordTextField() {
    bool showErrorText =
        _submiteed && !widget.passwordValidator.isValid(_password);
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        labelText: 'パスワード',
        errorText: showErrorText ? widget.invalidPasswordErrorText : null,
        enabled: _isLoading == false,
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
      onChanged: (pass) => _updateState(),
    );
  }

  TextField _buildEmailTextField() {
    bool showErrorText = _submiteed && !widget.emailValidator.isValid(_email);
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        labelText: 'メールアドレス',
        hintText: 'test@test.com',
        errorText: showErrorText ? widget.invalidEmailErrorText : null,
        enabled: _isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: _emailEdittingComplete,
      onChanged: (email) => _updateState(),
    );
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

  void _updateState() {
    setState(() {});
  }
}
