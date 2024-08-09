import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textField.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailControllar = TextEditingController();
  final TextEditingController _pwControllar = TextEditingController();
  final TextEditingController _confirmControllar = TextEditingController();

  final void Function()? onTap;

  //login methodo
  void register(BuildContext context ) {
    //get auth service
    final _auth = AuthService();
  // password match -> create user 
    if (_pwControllar.text == _confirmControllar.text){
      try{
      _auth.signInWithEmailPassword(
      _emailControllar.text,
      _pwControllar.text ,
      );
      }catch(e){
        showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
      }
    } 
    //password  dont match -> tell user to fix 
    else{
      showDialog(
        context: context,
        builder: (context) =>  const AlertDialog(
          title: Text("password dont match"),
        ),
      );

    }
  }

  RegisterPage({super.key, required this.onTap});

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
              "Lets create  an account for you",
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
            // confirm PW TEXTFIELD
            Mytextfield(
              hintText: " Confirm Password",
              obscureText: true,
              controller: _confirmControllar,
            ),
            SizedBox(
              height: 25,
            ),
            //LOGIN BUTTON
            MyButton(
              text: "Rigistro",
              onTap: () => register(context),
            ),
            SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
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
