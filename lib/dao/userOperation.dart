// Insert Operation: Insert a Note object to database
import 'package:flutter/cupertino.dart';
import 'package:login_demo/models/users.dart';
import 'package:login_demo/utils/databsehelper.dart';
import 'package:sqflite/sqflite.dart';

class userOperation{

  databasehelper _dbhelper=new databasehelper();
  String userTable='User',Username='Username',Email='Email',Pass='Password';

  Future<int> insertUser(Users user) async {
    Database db = await _dbhelper.database;
    debugPrint("In Inset");
    var result = await db.insert(userTable, user.toMap());
    return result;
  }

  Future<List<Map<String, dynamic>>> getUserMapList() async {
    Database db = await _dbhelper.database;
    var result = await db.query(userTable);
    return result;
  }
// Get the 'Map List' [ List<Map> ] and convert it to 'User List' [ List<Users> ]
  Future<List<Users>> getUserList() async {
    var userMapList = await getUserMapList(); // Get 'Map List' from database
    int count = userMapList.length;        // Count the number of map entries in db table
    List<Users> userList = <Users>[];
    // For loop to create a 'User List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      userList.add(Users.fromMapObject(userMapList[i]));
    }
    return userList;
  }
}
