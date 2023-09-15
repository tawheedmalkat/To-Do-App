import 'package:flutter/material.dart';
import 'package:flutter_app09/screens/home.dart';
import 'package:flutter_app09/screens/tasks.dart';

import 'package:flutter_app09/widgets/taskview.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(),
     debugShowCheckedModeBanner: false,
      routes: {
        '/home' : (c) => HomeScreen(),
        '/add' : (c) => AddScreen()
      },
      initialRoute: '/home',
    );
  }
}






