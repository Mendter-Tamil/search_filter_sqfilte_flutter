import 'package:flutter/material.dart';
import 'package:sqfliteSearch/sqlSearchMain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Search Filter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SqlSearch(),
    );
  }
}
