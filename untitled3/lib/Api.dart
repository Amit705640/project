import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'package:untitled3/ai.dart';

class API {

  var data;

  // Url base
  String baseUrl = 'http://sabkamunafa.havflyinvitation.com/';


  Future Post(String url, Object body, String reqToken) async {
    final prefs = await SharedPreferences.getInstance();
    if (url != '') {
      url = baseUrl + url;
    }
    print('$url');

    var token;
    if (reqToken == '1') {
      token = prefs.getString("token");
    }

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': reqToken == '1' ? token : ''
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      var apiResponse = jsonDecode(response.body);
      if (apiResponse['status'] == 1) {
        return apiResponse;
      } else {
        return 0;
        // return show dialog box
      }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
  Future Get(String url, Object body, String reqToken) async {

    final  prefs = await SharedPreferences.getInstance();
    if(url != '') {
      url = baseUrl + url;
    }
    var token ;
    if(reqToken == '1') {
      token = prefs.getString("token");
    }
    final response = await http.get(
      Uri.parse( url ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token' : reqToken == '1' ? token : ''
      },
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      //print(response.body);
      var apiResponse = jsonDecode(response.body);
      if(apiResponse['status'] == 1) {
        return apiResponse;
      } else {
        return 0;
        // return show dialog box
      }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

}


class servicewrapper {

  var baseurl = "http://androidtutorial.blueappsoftware.com//";
  var apifolder = "webapi/";
// see complete url --
// http://androidtutorial.blueappsoftware.com/webapi/get_jsondata.php

  Future getProdCall() async {
    var url = baseurl+ apifolder+"get_jsondata.php";
    final body ={ 'language': 'default', 'securecode': '123'};
    final bodyjson = json.encode(body);
    // pass headers parameters if any
    final response  = await http.post( Uri.parse(url),
        headers: <String, String>{ 'Content-Type': 'application/json; charset=UTF-8' },
        body: bodyjson );
    print(" url call from "+ url);
    if (response.statusCode == 200) {
      print('url hit successful'+response.body);
      String  data = response.body;
      print(' prod name - '+ jsonDecode(data)['Information'][0]['name']);
      return  json.decode(response.body );
    } else {
      print('failed to get data');
      throw Exception('Failed to get data');
    }
  }

}

// Future<List<User>> fetchCategories() async {
//   const String apiUrl =
//       "http://sabkamunafa.havflyinvitation.com/api/posts";
//
//   final response = await http.get(Uri.parse(apiUrl));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     List categories = (json.decode(response.body) as List)
//         .map((data) => User.fromJson(data))
//         .toList();
// // It retuen list of categories
//     return User;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load');
//   }
// }



