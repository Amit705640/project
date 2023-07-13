import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/draawer.dart';
import 'package:untitled3/mainfile.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan
      ),
      home: Homepage(),
    );
  }
}
class SplassScreen extends StatefulWidget{
  SplassScreen({Key? key}): super (key: key);
  @override
  State<StatefulWidget> createState() => splassScreen();
}

class splassScreen extends State<SplassScreen>{

  @override
  void initState(){
    super.initState();
    whertogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 180,
                width: 180,
               // child: Image.asset('assert/Logo-.png'),
            ),
            ],
          ))),
    );
  }

  // shared perference login screen and home screen
  void whertogo() async{

    var sharedpref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedpref.getBool("login");
    Timer(Duration(seconds: 2,), () async{
      if(isLoggedIn!=null){
        if(isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyApp()));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> login_page()));
        }
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> login_page()));
      }
    });
  }
}














