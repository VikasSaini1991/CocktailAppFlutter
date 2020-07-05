import 'package:flutter/material.dart';

import 'homepage.dart';
const Color myColor=Colors.pink;

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cocktail App",
      theme: ThemeData(
         primarySwatch: myColor,
             fontFamily: "Pacifico"

      ),
      home: HomePage(),
    );
  }
}
