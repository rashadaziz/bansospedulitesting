import 'package:flutter/material.dart';
import 'bansos_report.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Report Dashboard',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BansosReportPage());
  }
}
