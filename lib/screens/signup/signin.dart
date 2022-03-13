import 'package:chat_app/components/primary_button.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/screens/chats/chats_screen.dart';
import 'package:chat_app/screens/signup/otp_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_auth/local_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FlutterLocalNotificationsPlugin? local;
  void initState() {
    super.initState();
    _check();
    getAvailable();
    var and = const AndroidInitializationSettings('icon');
    var i = const IOSInitializationSettings();
    var initial = InitializationSettings(android: and, iOS: i);
    local = FlutterLocalNotificationsPlugin();
    local!.initialize(initial);
    super.initState();
  }

  Future show() async {
    var detail = const AndroidNotificationDetails('channelId', 'Local',
        channelDescription: 'Description of Notification',
        importance: Importance.high);
    var ios = const IOSNotificationDetails();
    var gene = NotificationDetails(android: detail, iOS: ios);
    await local!.show(0, 'Logged In', 'You logged in using Fingerprint', gene);
  }

  LocalAuthentication _local = LocalAuthentication();
  late bool check;
  List<BiometricType> _available = [];
  String auth = 'Not Authorized';

  Future<void> _check() async {
    late bool cancheck;
    try {
      cancheck = await _local.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      check = cancheck;
    });
  }

  Future<void> getAvailable() async {
    List<BiometricType> available = [];
    try {
      available = await _local.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _available = available;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    Future<void> _auth() async {
      bool authenticate = false;
      try {
        authenticate = await _local.authenticate(
            biometricOnly: true,
            localizedReason: 'Scan your finger to authenticate',
            useErrorDialogs: false,
            stickyAuth: false);
      } on PlatformException catch (e) {
        print(e);
      }

      if (!mounted) return;
      setState(() {
        auth = authenticate ? 'Authorize Success' : 'Failed to Authenticate';
        if (authenticate) {
          show();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => ChatsScreen()));
        }
        print(auth);
      });
    }

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
              text: 'Sign In With Fingerprint',
              press: () {
                _auth();
              }),
          SizedBox(
            height: kDefaultPadding * 1.5,
          ),
          PrimaryButton(
              color: Theme.of(context).colorScheme.secondary,
              text: 'Sign Up Using OTP',
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              }),
          Spacer(
            flex: 2,
          )
        ],
      )),
    );
  }
}
