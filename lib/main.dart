// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'pages/navbar.dart';
// import 'pages/home.dart';
// import 'pages/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navbar(),
    );
  }
}
