// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'HomePage_.dart';

void main(List<String> args) async {
  //init the hive
  await Hive.initFlutter();
  //open a box
  var box = await Hive.openBox('myBox');

  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.pink),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
