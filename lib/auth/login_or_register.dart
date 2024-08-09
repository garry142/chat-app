import 'package:chat_app/pages/login_pages.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially, show login page

  bool showLoginPage = true;

  //toogle between login  and register page

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPages(
        onTap: togglePages,
      );
      
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
