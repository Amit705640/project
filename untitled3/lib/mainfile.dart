import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/draawer.dart';
import 'package:untitled3/main.dart';



class login_page extends StatefulWidget {
  login_page({Key? key}): super(key: key);
  @override
  State<StatefulWidget> createState() => _login_page();
}

class _login_page extends State<login_page> {

  bool _isNotValidate = false;

  bool _hidden = true;
  var EmailText = TextEditingController();
  var PasswordText = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }
  var myformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 190),
                      child: Center(
                        child: Container(
                            height: 80,
                            width: 120,
                            child: Image.asset('assert/Logo-.png',)),
                      ),
                    ),
                    Center(
                      child: Text('Please sign in to continue',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),),
                    )
                  ],
                ),
              ),


              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 350),
                  child: Container(
                    width: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(
                            key: myformKey,
                            child: TextFormField(
                                controller: EmailText,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: BorderSide(
                                          width: 2, color: Color(hexColor('#b27f4a'))),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(11),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.blueAccent)),
                                    prefixIcon: IconButton(
                                        icon: Icon(
                                          Icons.email,
                                        ),
                                        onPressed: () {
                                          print('abc@gmail.com');
                                        })),
                                validator: (val){
                                  if(val!.isEmpty){
                                    return null;
                                  }else{
                                    return 'Enter Your Email';
                                  }
                                }
                            ),
                          ),
                          Container(
                            height: 22,
                          ),
                          TextFormField(
                              controller: PasswordText,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                filled: true,
                                prefixIcon : Icon(Icons.lock),

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.orange)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.blueAccent)),
                                // suffix: InkWell(
                                //   onTap: _togglePasswordView,
                                //   child: Icon(_hidden ? Icons.visibility : Icons
                                //       .visibility_off),),

                              )),
                          Row(
                            children: [
                              Padding(

                                padding: const EdgeInsets.only(
                                    left: 190, top: 20),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    loginUser(
                                        EmailText.text, PasswordText.text);
                                    var sharedPref = await SharedPreferences
                                        .getInstance();
                                    sharedPref.setBool('login', true);
                                    String uEmail = EmailText.text.toString();
                                    String upass = PasswordText.text;
                                    print('$uEmail');
                                    print('$upass');
                                    print('Email: $uEmail, Password: #upass');
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Sign In'), // <-- Text
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon( // <-- Icon
                                        Icons.arrow_forward,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 150),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  TextButton(
                                    onPressed: () {



                                    }, child: Text('Sign Up'),

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void loginUser() async {
  //   if(EmailText.text.isNotEmpty && PasswordText.text.isNotEmpty) {
  //     var url = 'http://sabkamunafa.havflyinvitation.com/auth/login';
  //     var data = {"username": EmailText.text, "password": PasswordText.text
  //     };
  //     var bodyy = jsonEncode(data);
  //     var urlParse = Uri.parse(url);
  //     http.Response response = await http.post(
  //         urlParse, body: bodyy, headers: {'Content-Type': 'application/json'});
  //     var jsonResponse = jsonDecode(response.body);
  //     print(jsonResponse['status']);
  //     if(jsonResponse['status']){
  //       var myToken = jsonResponse['token'];
  //       prefs.setString('token', myToken);
  //       Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) =>
  //               drawerNavigation(token: myToken,))
  //       );
  //     }else {
  //       print('something went wrong');
  //     }
  //     }else{
  //         setState(() {
  //           _isNotValidate = true;
  //         });
  //   }
  // }
  loginUser(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      "username": EmailText.text, "password": PasswordText.text
    };
    var jsonResponse = null;
    var response = await http.post(
        Uri.parse('http://sabkamunafa.havflyinvitation.com/auth/login'),
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isNotValidate = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) =>MyApp()), (
            Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isNotValidate = false;
      });
      print(response.body);
    }
  }

  // password hide and unhide function
  void _togglePasswordView() {
    setState(() {
      _hidden = !_hidden;
    });
  }
  int hexColor(String s) {
    String sColor = '0xff' + s;
    sColor = sColor.replaceAll('#', '');
    int dColor = int .parse(sColor);
    return dColor;
  }
}




