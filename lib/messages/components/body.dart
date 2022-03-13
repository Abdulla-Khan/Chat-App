import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import 'chat_input_feild.dart';
import 'message.dart';
import 'text_message.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) {
                return Messages(
                  message: demeChatMessages[index],
                );
              }),
        )),
        ChatInputFeild()
      ],
    );
  }
}
