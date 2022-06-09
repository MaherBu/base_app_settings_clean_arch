import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/base/utils/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  static const String route = '/';

  static MaterialPageRoute get pageRoute => MaterialPageRoute(builder: (context) => const SplashPage());

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    setState(
          () {
        // finish(context);
        // BankingWalkThrough().launch(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    // testContext = context.isArabic;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topLeft,
                colors: [Banking_Primary, Banking_palColor],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Banking_lbl_app_Name",
                  // style: boldTextStyle(color: TEXT_COLOR, size: 30),
                ).paddingOnly(bottom: 20),
                const Text("Banking_lbl_app_Sub_title"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
