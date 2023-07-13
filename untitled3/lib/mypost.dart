import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/draawer.dart';
import 'package:http/http.dart' as http;

class MyPost extends StatefulWidget{
  MyPost({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyPost();
}

class _MyPost extends State<MyPost> with TickerProviderStateMixin{
  late TabController _tabController;
  var api = "http://sabkamunafa.havflyinvitation.com/api/posts";
  var res, list;
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
    fetchdata('1');
  }




  void fetchdata(String reqToken) async{
    final  prefs = await SharedPreferences.getInstance();
    var token;
    if(reqToken == '1'){
      token = prefs.getString('token');
    }
    res = await http.get(Uri.parse(api),
        headers:{
          'x-auth-token': token });
    print(token);
    list = jsonDecode(res.body)['list'];
    print(list.toString());
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        title: Text('My Posts'),
        automaticallyImplyLeading: true,
        leading:  IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage(),));
        }, icon: Icon(Icons.arrow_back)),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 20),
          //   child: Icon(Icons.menu),
          // )
        ],
      ),
      body:Column(
        children: [
          TabBar( // create custom tab bar in product category
            unselectedLabelColor: Colors.black,
            labelColor: Colors.red,
            tabs: [
              Tab(
                text: 'General',
              ),
              Tab(
                text: 'Buy',
              ),
              Tab(
                text: 'Sel',
              ),
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(children: [
              Center(
                  child: res != null? ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context,index){
                        return  Card(
                          elevation: 7,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.arrow_circle_right_rounded),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "${list[index]['title']}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: IconButton(onPressed: (){

                                  }, icon: Icon(Icons.edit), ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50, bottom: 5),
                              child: Container(
                                width: 250,
                                child: Text(
                                    "${list[index]['description']}",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ]
                          ),
                        );
                      }): CircularProgressIndicator()
              ),

            ]),
          )
        ],
      ),
    ),);
  }
}

