import 'package:chat_app/auth/login_or_register.dart';
import 'package:chat_app/pages/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user  is logged in
          if (snapshot.hasData) {
            return const Homepage();
          }
          //user is not logged
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
