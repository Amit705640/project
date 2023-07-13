import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/draawer.dart';
import 'package:http/http.dart' as http;

class MyOrder extends StatefulWidget{
  MyOrder({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _MyOrder();
}
class _MyOrder extends State<MyOrder> {

  var api = "http://sabkamunafa.havflyinvitation.com/api/orders";
  var res, list;

  @override
  void initState() {
    // TODO: implement initState
    order('1');
  }

  void order(String reqToken) async{
    final  prefs = await SharedPreferences.getInstance();
    var token;
    print(token);
    if(reqToken == '1'){
      token = prefs.getString('token');
      print(token);
    }
    res = await http.post(Uri.parse(api),
        headers:{
          'x-auth-token': token });
    print(token);
    list = jsonDecode(res.body)['list'];
    print(list.toString());
    setState((){
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Order'),
          automaticallyImplyLeading: true,
          leading:  IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage(),));
          }, icon: Icon(Icons.arrow_back)),
          actions: [
            // Padding(
            //   padding: const EdgeInsets.only(right: 20),
            //   child: Icon(Icons.menu),
            // )
          ],
        ),

        body:
        Center(
        child: res != null? ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index) {
          return
            Card(
              elevation: 4,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 360,
                                  margin: EdgeInsets.only(top: 20, left: 10),
                                  child: Text(
                                    "${list[index]['postTitle']}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 190,
                                    margin: EdgeInsets.only(
                                        bottom: 10, right: 70),
                                    child: Text(
                                      "${list[index]['ordersummary']}",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: ElevatedButton(onPressed: () {
                                      showDialog(
                                          context: context, builder: (context) {
                                        return Container(
                                          child: AlertDialog(
                                            title: Text('Add remark'),
                                            actions: [
                                              TextField(
                                                onChanged: (value) {},
                                                decoration: InputDecoration(
                                                  hintText: 'Add Remark',
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  TextButton(onPressed: () {
                                                    Navigator.pop(context);
                                                  }, child: Text('Cancel')),

                                                  TextButton(onPressed: () {
                                                    Navigator.pop(context);
                                                  }, child: Text('ok'))
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                    },
                                        child: Text('Remark',
                                          style: TextStyle(fontSize: 10),)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
        }
        ): CircularProgressIndicator()

                  // Card(
                  //   elevation: 4,
                  //   child: SingleChildScrollView(
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //
                  //         SingleChildScrollView(
                  //           scrollDirection: Axis.horizontal,
                  //           child: Row(
                  //             children: [
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Container(
                  //                       width: 360,
                  //                       margin: EdgeInsets.only(top: 20, right: 50,left: 10),
                  //                       child: Text(
                  //                         "MUSTARD OIL 2 LTR PETJAR",
                  //                         style: TextStyle(
                  //                             fontSize: 15,
                  //                             fontWeight: FontWeight.bold),
                  //                       )),
                  //                   SizedBox(height: 10,),
                  //
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //
                  //                         width: 190,
                  //                         margin: EdgeInsets.only(
                  //                             bottom: 10, right: 70),
                  //                         child: Text(
                  //                           'Brand: Kabira\nProcessing Type: Cold Pressed',style: TextStyle(fontSize: 10),
                  //
                  //                         ),
                  //
                  //
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(right: 70),
                  //                         child: ElevatedButton(onPressed: (){
                  //                           showDialog(context: context, builder: (context){
                  //                             return Container(
                  //                               child: AlertDialog(
                  //                                 title: Text('Add remark'),
                  //                                 actions: [
                  //                                   TextField(
                  //                                     onChanged: (value){},
                  //                                     decoration: InputDecoration(
                  //                                       hintText: 'Add Remark',
                  //                                     ),
                  //                                   ),
                  //                                   Row(
                  //                                     children: [
                  //                                       TextButton(onPressed: (){
                  //                                         Navigator.pop(context);
                  //                                       }, child: Text('Cancel')),
                  //
                  //                                       TextButton(onPressed: (){
                  //                                         Navigator.pop(context);
                  //                                       }, child: Text('ok'))
                  //                                     ],
                  //                                   ) ,
                  //                                 ],
                  //                               ),
                  //                             );
                  //                           });
                  //                         }, child: Text('Remark',style: TextStyle(fontSize: 10),)),
                  //                       )
                  //
                  //                     ],
                  //                   ),
                  //
                  //
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   elevation: 4,
                  //   child: SingleChildScrollView(
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //
                  //         SingleChildScrollView(
                  //           scrollDirection: Axis.horizontal,
                  //           child: Row(
                  //             children: [
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Container(
                  //                       width: 360,
                  //                       margin: EdgeInsets.only(top: 20, right: 50,left: 10),
                  //                       child: Text(
                  //                         "MUSTARD OIL 2 LTR PETJAR",
                  //                         style: TextStyle(
                  //                             fontSize: 15,
                  //                             fontWeight: FontWeight.bold),
                  //                       )),
                  //                   SizedBox(height: 10,),
                  //
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //
                  //                         width: 190,
                  //                         margin: EdgeInsets.only(
                  //                             bottom: 10, right: 70),
                  //                         child: Text(
                  //                           'Oil Type: Mustard oil\nProcessing Type: Kachchi Ghani',style: TextStyle(fontSize: 10),
                  //
                  //                         ),
                  //
                  //
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(right: 70),
                  //                         child: ElevatedButton(onPressed: (){
                  //                           showDialog(context: context, builder: (context){
                  //                             return Container(
                  //                               child: AlertDialog(
                  //                                 title: Text('Add remark'),
                  //                                 actions: [
                  //                                   TextField(
                  //                                     onChanged: (value){},
                  //                                     decoration: InputDecoration(
                  //                                       hintText: 'Add Remark',
                  //                                     ),
                  //                                   ),
                  //                                   Row(
                  //                                     children: [
                  //                                       TextButton(onPressed: (){
                  //                                         Navigator.pop(context);
                  //                                       }, child: Text('Cancel')),
                  //
                  //                                       TextButton(onPressed: (){
                  //                                         Navigator.pop(context);
                  //                                       }, child: Text('ok'))
                  //                                     ],
                  //                                   ) ,
                  //                                 ],
                  //                               ),
                  //                             );
                  //                           });
                  //                         }, child: Text('Remark',style: TextStyle(fontSize: 10),)),
                  //                       )
                  //
                  //                     ],
                  //                   ),
                  //
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   elevation: 4,
                  //   child: SingleChildScrollView(
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //
                  //         SingleChildScrollView(
                  //           scrollDirection: Axis.horizontal,
                  //           child: Row(
                  //             children: [
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Container(
                  //                       width: 360,
                  //                       margin: EdgeInsets.only(top: 20, right: 50,left: 10),
                  //                       child: Text(
                  //                         "Kachi Ghani Mustard Oil",
                  //                         style: TextStyle(
                  //                             fontSize: 15,
                  //                             fontWeight: FontWeight.bold),
                  //                       )),
                  //                   SizedBox(height: 10,),
                  //
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //
                  //                         width: 190,
                  //                         margin: EdgeInsets.only(
                  //                             bottom: 10, right: 70),
                  //                         child: Text(
                  //                           'Brand: Jiyo Raw\nPackaging Size: 1 Litre',style: TextStyle(fontSize: 10),
                  //
                  //                         ),
                  //
                  //
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(right: 70),
                  //                         child: ElevatedButton(onPressed: (){
                  //                           showDialog(context: context, builder: (context){
                  //                             return Container(
                  //                               child: AlertDialog(
                  //                                 title: Text('Add remark'),
                  //                                 actions: [
                  //                                   TextField(
                  //                                     onChanged: (value){},
                  //                                     decoration: InputDecoration(
                  //                                       hintText: 'Add Remark',
                  //                                     ),
                  //                                   ),
                  //                                   Row(
                  //                                     children: [
                  //                                       TextButton(onPressed: (){
                  //                                         Navigator.pop(context);
                  //                                       }, child: Text('Cancel')),
                  //
                  //                                       TextButton(onPressed: (){
                  //                                         Navigator.pop(context);
                  //                                       }, child: Text('ok'))
                  //                                     ],
                  //                                   ) ,
                  //                                 ],
                  //                               ),
                  //                             );
                  //                           });
                  //                         }, child: Text('Remark',style: TextStyle(fontSize: 10),)),
                  //                       )
                  //
                  //                     ],
                  //                   ),
                  //
                  //
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
        )
    );
  }
}