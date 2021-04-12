import 'package:flutter/material.dart';

class TitleAppSection extends StatelessWidget {
  //---------- attributes ----------------//
  final String appTitle;

  //------------ contructor ---------------//
  const TitleAppSection({Key key, @required this.appTitle}) : super(key: key);

  //----------------- ovoride methode -------//
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Center(
          child: Text(appTitle,
              style: TextStyle(
                  color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold)),
        ));
  }
}