import 'package:flutter/material.dart';
import 'auth.dart';

class AuthProvider extends InheritedWidget {
  final AuthBase auth;
  final Widget child;

  AuthProvider({required this.auth, required this.child})
      : super(child: Text('data'));

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  // final auth = AuthProvider.of(context);
  static AuthBase of(BuildContext context) {
    AuthProvider? provider =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    return provider!.auth;
  }
}
