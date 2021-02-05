import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/controller/auth.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home>{

  Auth auth=new Auth();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      title: "Home Page",
      home: Scaffold(
        appBar: AppBar(title: Text("Home Page"),),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/nature1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder(
            future: auth.getAllUser(),
            initialData: [],
            builder: (context,userData){
              return userData.hasData?
                  ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: userData.data.length,
                    itemBuilder: (context, i){
                      return ListTile(
                        title: Text(userData.data[i].toString()),
                        leading: Icon(Icons.person),
                      );
                    },
                  )
              :Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}