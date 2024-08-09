import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textField.dart';
import 'package:flutter/material.dart';

class LoginPages extends StatelessWidget {
  //email and pw text controllers
  final TextEditingController _emailControllar = TextEditingController();
  final TextEditingController _pwControllar = TextEditingController();

  //tap a go to register page

  final void Function()? onTap;

  //login methodo
  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();

    //try login
    try {
      await authService.signInWithEmailPassword(
          _emailControllar.text, _pwControllar.text);
    }

    //catch any error
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  LoginPages({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //LOGO
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            //WELCOME BACK MESSENGE
            Text(
              "Welcome Back, you have been missed!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            //EMAIL TEXTFIELD
            Mytextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailControllar,
            ),
            SizedBox(
              height: 10,
            ),
            //PW TEXTFIELD
            Mytextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwControllar,
            ),
            SizedBox(
              height: 25,
            ),
            //LOGIN BUTTON
            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),
            SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),

            //REGISTER NOW
          ],
        ),
      ),
    );
  }
}
