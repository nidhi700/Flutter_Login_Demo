import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/main.dart';
import 'package:login_demo/screens/registration.dart';
import 'package:login_demo/controller/auth.dart';

class MyAppState extends State<MyApp>{

  var _formkey=GlobalKey<FormState>();
  Auth auth=new Auth();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Demo",
      theme: ThemeData(
        primaryColor: Colors.black,
        //accentColor: Colors.amberAccent,
        //brightness: Brightness.dark,
      ),
      home: Scaffold(
        //appBar: AppBar(title: Text("Login Demo"),),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/nature3.jpg"),
              fit: BoxFit.cover,
            ),
          ),

          child: Form(
            key: _formkey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Center(
                    child:Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            "DISCOVERY",
                            style: TextStyle(
                              fontFamily: 'Monda',
                              fontWeight: FontWeight.w400,
                              fontSize: 30,
                              //letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            "Travel Community app",
                            style: TextStyle(
                              fontFamily: 'JosefinSlab',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              //letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120,left: 30,right: 30),
                  child: TextFormField(
                    validator: (String value){
                      if(value.isEmpty){
                        return "Your E-mail is null";
                      }
                      else{
                        return '';
                      }
                    },
                    controller: auth.emailCon,
                    style: TextStyle(
                      //backgroundColor: Colors.black45,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: "E-Mail",
                      hintText: "example@gmail.com",
                      /*counterText:  "E-Mail",
                      semanticCounterText: "Email",*/
                      labelStyle: TextStyle(color: Colors.orangeAccent,),
                      //counterStyle: TextStyle(color: Colors.orangeAccent,),
                      hintStyle: TextStyle(color: Colors.white,),
                      filled: true,
                      fillColor: Colors.black54,
                      /*suffixIcon: Icon(Icons.email_outlined),*/
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.orangeAccent,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        //borderSide:
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:20,bottom: 20,left: 30,right: 30),
                  child: TextFormField(
                    controller: auth.passCon,
                    validator: (String value){
                      if(value.isEmpty){
                        return "Your Password is null";
                      }
                      else{
                        return '';
                      }
                    },
                    style: TextStyle(
                      //backgroundColor: Colors.black45,
                      color: Colors.white,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password",
                      counterText:  "Forgot Password",
                      //semanticCounterText: "Email",
                      labelStyle: TextStyle(color: Colors.orangeAccent,),
                      counterStyle: TextStyle(color: Colors.white,),
                      hintStyle: TextStyle(color: Colors.white,),
                      filled: true,
                      fillColor: Colors.black54,
                      /*suffixIcon: Icon(Icons.email_outlined),*/
                      prefixIcon: Icon(Icons.lock_outline,color: Colors.orangeAccent,),
                      suffixIcon: Icon(Icons.remove_red_eye,color: Colors.orangeAccent,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        //borderSide:
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Center(
                    child:Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontFamily: "JosefinSlab",
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: FlatButton(
                            //onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
                            onPressed: () {
                              debugPrint("Create One Clicked!!");
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Registration();
                              }));
                            },
                            child: Text(
                              "Create One!",
                              style: TextStyle(
                                  fontFamily: "JosefinSlab",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orangeAccent,
                                  letterSpacing: 1,
                                  fontSize: 13
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ButtonTheme(
                    //minWidth: 100.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        "LOGIN",
                      ),
                      color: Colors.orangeAccent,
                      onPressed: () async{
                        auth.login(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}