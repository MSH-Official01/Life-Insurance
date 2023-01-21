import 'package:flutter/material.dart';

import 'App_Register/LogIn/log_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Insurance',
      debugShowCheckedModeBanner: false,
      home: LogInPage(),
    );
  }
}
