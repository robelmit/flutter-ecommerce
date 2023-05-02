import 'dart:convert';
import 'dart:math';
import 'package:app/models/ads.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  //IndiDealCard(
  //     isLeft: false,
  ///   isSelected: true,
  // ),
  var baseURL = "http://10.0.2.2:5000";
  static var isnowdistributed = false;
  static var isnowverified = false;

//  http://192.168.43.59:8000/api/master_list/1
  Future<dynamic> Register(name, phoneNumber, email, password) async {
    final url = Uri.parse(baseURL + '/api/users');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'phoneNumber': phoneNumber,
          'email': email,
          'password': password,
        }));
    if (response.statusCode == 201) {
      //return Post.fromJson(jsonDecode(response.body));
      print('registering user was successful');
      var miki = jsonDecode(response.body);
      print(miki['full_name']);
      print(miki);
//

      return jsonDecode(response.body);
      // return jsonDecode(utf8.decode(response.bodyBytes, allowMalformed: true));
    } else {
      print(jsonDecode(response.body));
      throw Exception('Failed to load profile: ');
    }
  }

  Future<dynamic> login(email, password) async {
    print('cool');
    final url = Uri.parse(baseURL + "/api/users/login");
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));
    if (response.statusCode == 200) {
      print('login was successful');

      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to distribute: ');
    }
  }

  Future<List<Ads>> getadds() async {
    print('cool is nice');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final url = Uri.parse(baseURL + "/api/adds");
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer ' + token!
      },
    );
    if (response.statusCode == 200) {
      print('bbb');

      var ads = AdsPro(response.body);
      print(ads);

      return ads;
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }
}
