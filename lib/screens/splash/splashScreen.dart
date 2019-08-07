// home screen contents
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 2;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var _duration = new Duration(seconds: splashDuration);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Navigator.of(context).pushReplacementNamed("/Home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/images/location-logo.jpg'),
                  fit: BoxFit.contain,
                ),
                color: Colors.white),
          ),
        ],
      ),
    ));
  }
}
