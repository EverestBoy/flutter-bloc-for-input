/*
 * Copyright (c) 2022. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:flutter/material.dart';
import 'package:login_bloc/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Login Application',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class BackgroundPage extends StatefulWidget {
  @override
  _BackgroundPageState createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(child: CircularProgressIndicator(
        color: Colors.blue,
      )),
    );
  }
}