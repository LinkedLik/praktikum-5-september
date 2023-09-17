import 'package:flutter/material.dart';
import 'package:praktikum_5_sep/Stopwatch.dart';
import 'package:praktikum_5_sep/login_screen.dart';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget{
  Widget build ( BuildContext context){
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}