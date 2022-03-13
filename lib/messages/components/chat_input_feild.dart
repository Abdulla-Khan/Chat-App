import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ChatInputFeild extends StatelessWidget {
  const ChatInputFeild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: SafeArea(
        child: Row(
          children: [
            Icon(
              Icons.mic,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 32,
                        color: Color(0xFF087949).withOpacity(0.08))
                  ]),
              child: Row(
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.64),
                  ),
                  SizedBox(
                    width: kDefaultPadding / 4,
                  ),
                  Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                    hintText: 'Type message',
                    border: InputBorder.none,
                  ))),
                  Icon(
                    Icons.attach_file,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.64),
                  ),
                  SizedBox(
                    width: kDefaultPadding / 4,
                  ),
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.64),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
