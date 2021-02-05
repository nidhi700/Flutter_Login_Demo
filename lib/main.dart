import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/screens/login.dart';
import 'package:login_demo/screens/registration.dart';
void main() {
  //runApp(MyApp());
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Registration(),
      )
  );
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}
