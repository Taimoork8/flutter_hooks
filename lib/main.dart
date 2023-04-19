import 'package:flutter/material.dart';
import 'package:testingflutterhooks/example3.dart';

void main() async {
  runApp(
    MaterialApp(
      title: 'Flutter Hooks Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const ExampleThree(),
    ),
  );
}
