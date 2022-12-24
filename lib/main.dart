import 'package:todo_sqflite/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "todo_sqflite",
    theme: ThemeData(
        primarySwatch: Colors.blue
    ),
    home: const HomePage(),
  ));
}
