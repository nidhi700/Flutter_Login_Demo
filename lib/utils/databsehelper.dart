import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// ignore: camel_case_types
class databasehelper {

  static databasehelper _dbhelper; //Has to be in Singleton Object
  static Database _database; //DB
  String userTable='User',Username='Username',Email='Email',Pass='Password';
  //String id='Id';
  databasehelper._createInstance(); //Named Constructor for create singleton dbHelper onstance

  factory databasehelper(){
    if(_dbhelper==null){
      _dbhelper=databasehelper._createInstance(); //Will execute only once
    }
    return _dbhelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path
    Directory directory = await getApplicationDocumentsDirectory(); //Path provider Package
    String path = directory.path + 'Sample.db';

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDB);
    return notesDatabase;
  }

  void _createDB(Database db, int newVersion ) async{
    await db.execute(' CREATE TABLE $userTable($Username Text, $Email Text , $Pass Text)');
  }


}