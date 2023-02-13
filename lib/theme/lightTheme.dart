import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme=ThemeData(
  appBarTheme: AppBarTheme(

    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 30,
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'LightFont',
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    headline1: TextStyle(
      fontFamily: 'LightFont',
      fontSize: 20,
      color: HexColor('4d6d53'),
      fontWeight: FontWeight.bold,
    ),
    caption: TextStyle(
      fontFamily: 'LightFont',
      fontSize: 20,
    ),
  ),
);