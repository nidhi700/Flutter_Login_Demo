import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/screens/login.dart';
import 'package:login_demo/screens/registration.dart';

import 'StudentModel.dart';
import 'package:http/http.dart' as http;
void main() {
  //runApp(MyApp());
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HttpScreen(),
      )
  );
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}


class HttpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<StudentModel>(
          future: getStudent(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              final student = snapshot.data;

              return Text("Page : ${student.page} \n Per Page : ${student.per_page} \n Total : ${student.total}");

            }else if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<StudentModel> getStudent() async {
  final url = "https://reqres.in/api/users?page=2";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonStudent = jsonDecode(response.body);
    return StudentModel.fromJson(jsonStudent);
  } else {
    throw Exception();
  }
}