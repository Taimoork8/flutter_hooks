import 'package:flutter/material.dart';
import 'exmaple1.dart';

void main() async {
  runApp(
    MaterialApp(
      title: 'Flutter Hooks Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    ),
  );
}
