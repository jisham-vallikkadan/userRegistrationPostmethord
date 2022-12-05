import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loginapipostmethord/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Registationpage.dart';
import 'apiclass.dart';
import 'deatilspage.dart';
import 'widgets/buttons.dart';
import 'widgets/fiels.dart';

import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context)  {

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Registationpage(),
    );
  }
}

