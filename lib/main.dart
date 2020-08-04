import'package:flutter/material.dart';
import 'HomePage.dart';

void main()  =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScratchWin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       // primarySwatch:Colors.accents,
        primaryColor: Colors.amberAccent,
      ),
      home: HomePage(),
    );
  }
}