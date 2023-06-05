import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color.fromARGB(255, 178, 178, 178),
    iconTheme: IconThemeData(color: aiWhite),
    primarySwatch: Colors.blue,
  );
}


var aiWhite = const Color(0xffdddeee);
var aiPurple = Colors.purple;
var aiBlack = Colors.black54;
var aiDarkGrey = Colors.grey[800]!;
var aiGrey = Colors.grey[700]!;
var aiDarkPurple = const Color(0xff03001C);
var aiLightPurple = const Color.fromARGB(255, 4, 0, 45);