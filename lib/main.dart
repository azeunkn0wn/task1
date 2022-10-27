import 'package:flutter/material.dart';

import 'screen1/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      theme: ThemeData(
        // primarySwatch: ,
        primaryColor: const Color(0xFF25BAFB),

        brightness: Brightness.light,
        fontFamily: 'OpenSans',
      ),
      home: const Screen1(),
    );
  }
}
