//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/dao/userOperation.dart';
import 'package:login_demo/models/users.dart';
import 'package:login_demo/screens/home.dart';
import 'package:login_demo/utils/databsehelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Auth {

  //For Value Pass
  TextEditingController emailCon= TextEditingController();
  TextEditingController passCon= TextEditingController();
  TextEditingController userCon = TextEditingController();

  databasehelper db=new databasehelper(); //For DB Creation
  userOperation uo=new userOperation();  //For CRUD Operation

  Users user = Users();  //Model
  //userOperation uo
  void register(BuildContext context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("username", this.userCon.text);
    sp.setString("email", this.emailCon.text);
    sp.setString("password", this.passCon.text);
    this.user = Users(
      Email: this.emailCon.text,
      Pass: this.passCon.text,
      Username: this.userCon.text
    );
    this.uo.insertUser(this.user);
    debugPrint("User Inserted");
    Navigator.push(context,MaterialPageRoute(builder: (context) =>MyApp()),);
  }

  void login(BuildContext context) async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String email = sp.getString("email");
    String pass= sp.getString("password");
    if(this.emailCon.text==email && this.passCon.text==pass){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()),);
    }
    else{
      alertBoxDemo(context);
    }
  }

  Future<List<Map<String, dynamic>>> getAllUser() {
    return uo.getUserMapList();
  }

  alertBoxDemo(BuildContext context) {
    var altbox= AlertDialog(
      title: Text("Error"),
      content: Text("Your E-mail or Password is Wrong"),
    );
    showDialog(
        context: context,
        builder: (BuildContext contest) => altbox
    );
  }

}