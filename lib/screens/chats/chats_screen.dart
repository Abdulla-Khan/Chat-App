import 'package:chat_app/components/body.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buldAppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.person_add_alt_1_sharp, color: Colors.white)),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  BottomNavigationBar buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: selected,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        setState(() {
          selected = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage('assets/images/user_2.png'),
            ),
            label: 'Profile')
      ],
    );
  }

  AppBar buldAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: Text('Chats'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
    );
  }
}
