import 'package:chat_app/components/filled_outline_button.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/messages/messages_screen.dart';
import 'package:chat_app/models/Chat.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'chat_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late BannerAd inlineAd;
  bool inlineAdLoaded = false;
  static const AdRequest request = AdRequest();
  void loadInlineBannerAd() {
    inlineAd = BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        request: request,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            inlineAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();

          print('ad failed to load ${error.message}');
        }));

    inlineAd.load();
  }

  @override
  void initState() {
    loadInlineBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: 'Recent Meassages'),
              SizedBox(
                width: kDefaultPadding,
              ),
              FillOutlineButton(
                press: () {},
                text: 'Active',
                isFilled: false,
              ),
            ],
          ),
        ),
        if (inlineAdLoaded)
          SizedBox(
            child: AdWidget(
              ad: inlineAd,
            ),
            width: inlineAd.size.width.toDouble(),
            height: inlineAd.size.height.toDouble(),
          ),
        Expanded(
            child: ListView.builder(
                itemCount: chatsData.length,
                itemBuilder: (context, index) {
                  return ChatCard(
                    chat: chatsData[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MessageScreen())),
                  );
                }))
      ],
    );
  }
}
