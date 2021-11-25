import 'package:chat_app/components/primary_button.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/chats/chats_screen.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Image.asset(
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? 'assets/images/Logo_light.png'
                : 'assets/images/Logo_dark.png',
            height: 140,
          ),
          Spacer(),
          PrimaryButton(
              text: 'Sign In',
              press: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ChatsScreen()))),
          SizedBox(
            height: kDefaultPadding * 1.5,
          ),
          PrimaryButton(
              color: Theme.of(context).colorScheme.secondary,
              text: 'Sign Up',
              press: () {}),
          Spacer(
            flex: 2,
          )
        ],
      )),
    );
  }
}
