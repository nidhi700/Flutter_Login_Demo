//import 'package:flutter/material.dart';

class Users{
  String Username,Email,Pass;
  //int id;

  Users(
      {this.Username,this.Email,this.Pass}
  );
  /*Users.withId(Map map){
    Username=map['UserName'];
    Email=map['Email'];
    Pass=map['Pass'];
  }*/

  //int get Id=>id;
  String get username=>Username;
  String get email=>Email;
  String get pass=>Pass;

  /*set username(String userName){
    this.Username=userName;
  }

  set email(String email){
    this.Email=email;
    print(email+"In model");
  }

  set password(String pass){
    this.Pass=pass;
  }*/

  // Convert a Users object into a Map object coz db only accepts map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (Username != null && Email!=null && Pass!=null) {
      //map['Id']=id;
      map['Email'] = Email;
      map['Username']=Username;
      map['Password']=Pass;
    }
    return map;
  }

  // Extract a Users object from a Map object coz we have to print in String
  Users.fromMapObject(Map<String, dynamic> map) {
    //this.id = map['Id'];
    this.Email = map['Email'];
    this.Username = map['Username'];
    this.Pass = map['Password'];
  }
}