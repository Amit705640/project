import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:untitled3/Api.dart';
import 'package:untitled3/ai.dart';
import 'package:untitled3/my%20order.dart';
import 'package:untitled3/mypost.dart';


class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Homepage();
}

class _Homepage extends State<Homepage>  {

  var api = "http://sabkamunafa.havflyinvitation.com/api/posts";
  var res, list;

  @override
  void initState() {
    // TODO: implement initState
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
    list = jsonDecode(res.body)['list'];
    print(list.toString());
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('sbka munfa'),
     ),
     endDrawer: Drawer(
       child: Column(
         children: [
           AppBar(
             title: Row(children: [ Container(
                 height: 40, width: 40,
                 child: Image.asset('assert/Logo-.png')),
               Text(
                 'Sbka Munfa',
                 style: TextStyle(
                   fontSize: 25,
                   fontStyle: FontStyle.italic,
                 ),
               ),
             ]
             ),
             automaticallyImplyLeading: false,
           ),
           // ListTile(
           //   title: Text('Subscription'),
           //   leading: Icon(Icons.subscriptions),onTap: (){
           //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Subscrition()));
           // },
           // ),
           ListTile(
             title: Text('My Order'),onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> MyOrder()));
           },
             leading: Icon(Icons.account_circle_rounded),
           ),
           // ListTile(
           //   title: Text('Profile'),onTap: (){
           //   Navigator.push(context, MaterialPageRoute(builder: (context)=>  TwoTabBar()
           //   ));
           // },
           //   leading: Icon(Icons.account_box_rounded,),
           // ),
           ListTile(
             title: Text('My Post'),
             leading: Icon(Icons.post_add),onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> MyPost()));
           },
           ),
           // ListTile(
           //   title: Text('Contact Us'),
           //   leading: Icon(Icons.contact_phone),onTap: ()  {
           //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Contact()));
           // },
           // ),
           // ListTile(
           //   title: Text('About Us'),onTap: (){
           //   Navigator.push(context, MaterialPageRoute(builder: (context)=> About()));
           // },
           //   leading: Icon(Icons.account_box),
           // ),
           // ListTile(
           //   title: Text('Log Out'),
           //   leading: Icon(Icons.login_outlined ),onTap: () async {
           //   var sharedPref = await SharedPreferences.getInstance();
           //   sharedPref.setBool('login', false);
           //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> login_page()));
           // },
           // ),
         ],
       ),
     ),
     body:

     Column(
       children: [
         // Card(
         //   elevation: 7,
         //   child: Row(
         //     children: [
         //       Padding(
         //         padding: const EdgeInsets.only(top: 10, left: 5,bottom: 25),
         //         child: CircleAvatar(
         //             backgroundColor: Colors.black12 ,
         //             child: Image.asset('assert/Logo-.png')),
         //       ),
         //       SizedBox(width: 7,),
         //       Padding(
         //         padding: const EdgeInsets.only(bottom: 25, top: 10),
         //         child: Container(
         //           height: 50,
         //           width: 280,
         //           decoration: BoxDecoration(color: Colors.black12,
         //             borderRadius: BorderRadius.circular(12),
         //           ),
         //           child: InkWell(onTap: (){
         //             Navigator.push(context, MaterialPageRoute(builder: (context)=> AddnewPost()));
         //           },
         //             child: Padding(
         //               padding: const EdgeInsets.all(15.0),
         //               child: Text('Write something here...'),
         //             ),
         //           ),
         //         ),
         //       ),
         //     ],
         //   ),
         // )

                   Container(
                     height: 230.0,
                     width: 180,
                     decoration: BoxDecoration(
                       border: Border.all(width: 2)
                     ),
                     child:
                     Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(top: 20),
                               child: Container(
                                 height: 20,
                                 width: 60,
                                 color: Colors.orangeAccent,
                                 child: Text('percentage'),
                               ),
                             ),
                             Image.network('https://www.shutterstock.com/image-photo/usb-flash-drive-closuep-on-260nw-510031489.jpg',fit: BoxFit.cover,
                               width: 80, height: 100.0,
                             ),
                           ],
                         ),
                         SizedBox(height: 20,),
                         ElevatedButton(
                             style: ElevatedButton.styleFrom(
                                 minimumSize: Size.fromHeight(40),
                                 backgroundColor: Color(0xff072044)
                             ),
                             onPressed: (){}, child: Text('Add To Cart',style: TextStyle(color: Colors.white),)),
                         Text('Pen Drive',style: TextStyle(fontSize: 20),),
                         SizedBox(height: 3,),
                         Container(
                           height: 1,
                           color: Colors.black,
                         ),
                         SizedBox(height: 5,),
                         Row(mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Rs 500',style: TextStyle(fontSize: 20),),
                             SizedBox(width: 4,),
                             Text('Rs 800', style: TextStyle(fontSize: 20, decoration: TextDecoration.lineThrough),),
                           ],
                         )
                       ],
                     ),
     // Expanded(flex: 7,
     //   child:
     //   Center(
     //     child: res != null? ListView.builder(
     //       itemCount: list.length,
     //         itemBuilder: (context,index){
     //         return  Card(
     //                     elevation: 7,
     //                     child: Padding(
     //                       padding: const EdgeInsets.all(8.0),
     //                       child: Column(
     //                           children: [
     //                         Row(
     //                           children: [
     //                             Icon(Icons.arrow_circle_right_rounded),
     //                             Padding(
     //                               padding: const EdgeInsets.all(4.0),
     //                               child: Text(
     //                                 "${list[index]['title']}",
     //                                 style: TextStyle(
     //                                     fontSize: 15,
     //                                     fontStyle: FontStyle.normal,
     //                                     fontWeight: FontWeight.bold
     //                                 ),
     //                               ),
     //                             ),
     //                           ],
     //                         ),
     //                         Padding(padding: const EdgeInsets.only(right: 30, bottom: 5),
     //                           child: Container(
     //                             width: 250,
     //                             child: Text(
     //                               "${list[index]['description']}",
     //                               style: TextStyle(
     //                                   fontSize: 10,
     //                                   fontStyle: FontStyle.normal,
     //                                   fontWeight: FontWeight.w500),
     //                             ),
     //                           ),
     //                         ),
     //                       ]),
     //                     ),
     //                   );
     //     }): CircularProgressIndicator()
     //   ),
     // )
     //   Center(
     //     child: FutureBuilder(
     //       future: fetchdata('1'),
     //       builder: (context, snapshot) {
     //         if (snapshot.hasData) {
     //           return Center(
     //               child: res != null? ListView.builder(
     //                   itemCount: list.length,
     //                   itemBuilder: (context,index){
     //                     return  Card(
     //                       elevation: 7,
     //                       child: Padding(
     //                         padding: const EdgeInsets.all(8.0),
     //                         child: Column(
     //                             children: [
     //                               Row(
     //                                 children: [
     //                                   Icon(Icons.arrow_circle_right_rounded),
     //                                   Padding(
     //                                     padding: const EdgeInsets.all(4.0),
     //                                     child: Text(
     //                                       "${list[index]['title']}",
     //                                       style: TextStyle(
     //                                           fontSize: 15,
     //                                           fontStyle: FontStyle.normal,
     //                                           fontWeight: FontWeight.bold
     //                                       ),
     //                                     ),
     //                                   ),
     //                                 ],
     //                               ),
     //                               Padding(padding: const EdgeInsets.only(right: 30, bottom: 5),
     //                                 child: Container(
     //                                   width: 250,
     //                                   child: Text(
     //                                     "${list[index]['description']}",
     //                                     style: TextStyle(
     //                                         fontSize: 10,
     //                                         fontStyle: FontStyle.normal,
     //                                         fontWeight: FontWeight.w500),
     //                                   ),
     //                                 ),
     //                               ),
     //                             ]),
     //                       ),
     //                     );
     //                   }): CircularProgressIndicator()
     //           )
     //         } else if (snapshot.hasError) {
     //           return Text("${snapshot.error}");
     //         }
     //         return CircularProgressIndicator();
     //       },
     //     ),
     //   ),
     // ),
                   )
       ],
     ),
    );
  }
}

class AddnewPost extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_AddnewPost();
}

class _AddnewPost extends State<AddnewPost> {
  API api =  API();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
        actions: [
          Drawer(
            backgroundColor: Colors.cyan,
          )
        ],
      ),
      body: Column(
          children: [
            Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 25),
                    child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        child: Image.asset('assert/Logo-.png')),
                  ),
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.only(top: 25,),
                    child: Text('Sbka Munfa', style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),),
                  )
                ]
            ), Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 400, // <-- TextField width
                height: 50, // <-- TextField height
                child: TextField(
                  controller: title,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(filled: true, hintText: 'Title'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 400, // <-- TextField width
                height: 120, // <-- TextField height
                child: TextField(
                  controller: description,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      filled: true, hintText: 'Write Something here..'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(40)
                ),
                onPressed: () async {
                  final Map<String, dynamic> data = {
                    "title": title.text, "description":description.text,
                  };
                  var response = await api.Post('api/post/add', data, '1');
                  if(response['status'] == 1){
                   // print('response sucessful');
                    print(response.toString());
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Homepage()));
                  }else{
                    print('response not sucessful');
                  }
                }, child: Text('Post', style: TextStyle(fontSize: 24),),),
            )
          ]
      ),
    );
  }
}



