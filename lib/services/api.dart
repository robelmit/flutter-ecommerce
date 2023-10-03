import 'dart:convert';
import 'dart:io';
//import 'dart:html';
import 'dart:math';
import 'package:app/models/ads.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/adsmine.dart';

class Api {
  //IndiDealCard(
  //     isLeft: false,
  ///   isSelected: true,
  // ),
  var baseURL = "http://robel.eu-4.evennode.com";
  // var baseURL = "http://10.0.2.2:5000";
  // var baseURL = "http://localhost:5000";

  // var baseURL = "http://192.168.43.34:5000";
  // var baseURL = "http://192.168.101.8:5000";
  // var baseURL = "http://192.168.137.1:5000";
  static var isnowdistributed = false;
  static var isnowverified = false;

  Future<dynamic> Register(name, phoneNumber, email, password) async {
    final url = Uri.parse('$baseURL/api/users');
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
    if (response.statusCode == 201 || response.statusCode == 304) {
      //return Post.fromJson(jsonDecode(response.body));
      print('registering user was successful');
      var miki = jsonDecode(response.body);
      // print(mikiprint(miki);
//

      return jsonDecode(response.body);
      // return jsonDecode(utf8.decode(response.bodyBytes, allowMalformed: true));
    } else {
      print(jsonDecode(response.body));
      throw Exception('Failed to load profile: ');
    }
  }

  Future<dynamic> login(phoneNumber, password) async {
    print('cool');
    final url = Uri.parse("$baseURL/api/users/login");
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'phoneNumber': phoneNumber,
          'password': password,
        }));
    if (response.statusCode == 200) {
      print('login was successful');

      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to distribute: ');
    }
  }

  Future<List<Ads>> getadds(String? keyword, int page) async {
    print('cool is nice');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl;
    if (keyword != null && page != null) {
      maurl = baseURL + '/api/adds/getadd?keyword=$keyword&pageNumber=$page';
    } else
      maurl = baseURL + "/api/adds/getadd?pageNumber=$page";
    final url = Uri.parse(maurl);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'authorization': 'Bearer ' + token!
      },
    );

    if (response.statusCode == 200) {
      //print(response.body);
      var res = jsonDecode(response.body);
      print('cool');
      print(res['adds']);

      var ads = AdsPro(jsonEncode(res['adds']));
      print(ads);

      return ads;
    } else {
      print('hhh');
      print(response);
      throw Exception('Failed to load adds');
    }
  }

  Future<List<Ads>> getaddsbyfilters(
      String? keyword, Map filters, int page) async {
    // print('cool');
    print('filters');
    print(filters);
    Map finalfilters = {};
    if (filters['region'] != 'all' && filters['region'] != null) {
      finalfilters['region'] = filters['region'];
    }
    if (filters['city'] != null) {
      finalfilters['city'] = filters['city'];
    }
    if (filters['color'] != null) {
      finalfilters['color'] = filters['color'];
    }
    if (filters['model'] != null) {
      finalfilters['model'] = filters['model'];
    }
    if (filters['year'] != null) {
      finalfilters['year'] = filters['year'];
    }
    if (filters['fuel'] != null) {
      finalfilters['fuel'] = filters['fuel'];
    }
    if (filters['engineSize'] != null) {
      finalfilters['EngineSize'] = filters['engineSize'];
    }
    if (filters['transmission'] != null) {
      finalfilters['transmission'] = filters['transmission'];
    }
    if (filters['maincatagory'] != null) {
      finalfilters['maincatagory'] = filters['maincatagory'];
    }

    if (filters['catagory'] != '' && filters['catagory'] != null) {
      finalfilters['catagory'] = filters['catagory'];
    }
    if (filters['detailcatagory'] != null &&
        filters['detailcatagory'] != [] &&
        filters['detailcatagory'] != '[]') {
      print('some bug');
      print(filters['subcatagory']);
      finalfilters['detailcatagory'] = filters['detailcatagory'];
    }
    if (filters['status'] != 'all' && filters['status'] != null) {
      finalfilters['status'] = filters['status'];
    }
    if (filters['filter'] != '' && filters['filter'] != null) {
      finalfilters['filter'] = filters['filter'];
    }
    if (filters['distance'] != 0.0 && filters['distance'] != null) {
      finalfilters['distance'] = double.parse(filters['distance']);
    }
    if (filters['latitude'] != 0.0 &&
        filters['latitude'] != '' &&
        filters['latitude'] != null) {
      finalfilters['latitude'] = filters['latitude'];
    }
    if (filters['longitude'] != 0.0 &&
        filters['longitude'] != '' &&
        filters['longitude'] != null) {
      finalfilters['longitude'] = filters['longitude'];
    }
    if (filters['minprice'] != '' &&
        filters['minprice'] != 0 &&
        filters['minprice'] != null) {
      finalfilters['minprice'] = filters['minprice'];
    }
    if (filters['maxprice'] != '' &&
        filters['maxprice'] != 0 &&
        filters['maxprice'] != null) {
      finalfilters['maxprice'] = filters['maxprice'];
    }
    print('finalfilters');
    print(finalfilters);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl;
    if (keyword != null) {
      maurl = baseURL + '/api/adds/getadd?keyword=$keyword&pageNumber=$page';
    } else
      maurl = baseURL + "/api/adds/getadd?pageNumber=$page";
    final url = Uri.parse(maurl);
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'latitude': double.parse(latitude),
          // 'longitude': double.parse(longitude),
          // 'tags': tags,
        },
        body: jsonEncode(finalfilters));

    if (response.statusCode == 200) {
      print('bbb');

      var res = jsonDecode(response.body);
      print('cool');
      print(res['adds']);

      var ads = AdsPro(jsonEncode(res['adds']));
      return ads;
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<List<Ads>> getaddsbylocation(String? keyword, double latitude,
      double longitude, int distance, int page) async {
    print('cool is nice');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl;
    if (keyword != null) {
      maurl = baseURL + '/api/adds/getadd?keyword=$keyword&pageNumber=$page';
    } else
      maurl = baseURL + "/api/adds/getadd?pageNumber=$page";
    final url = Uri.parse(maurl);
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //  'latitude': double.parse(latitude),
          // 'longitude': double.parse(longitude),
          // 'tags': tags,
          // 'distance':int.parse(distance)
          // 'authorization': 'Bearer ' + token!
        },
        body: jsonEncode(<String, dynamic>{
          'latitude': latitude,
          'longitude': longitude,
          'distance': distance,
        }));

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print('cool');
      print(res['adds']);

      var ads = AdsPro(jsonEncode(res['adds']));

      return ads;
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<List<Ads>> getaddsfull(String? keyword, double latitude,
      double longitude, int distance, List tags, int page) async {
    print('cool is nice');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl;
    if (keyword != null) {
      maurl = baseURL + '/api/adds/getadd?keyword=$keyword&pageNumber=$page';
    } else
      maurl = baseURL + "/api/adds/getadd?pageNumber=$page";
    final url = Uri.parse(maurl);
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //  'latitude': double.parse(latitude),
          // 'longitude': double.parse(longitude),
          // 'tags': tags,
          // 'distance':int.parse(distance)
          // 'authorization': 'Bearer ' + token!
        },
        body: jsonEncode(<String, dynamic>{
          'latitude': latitude,
          'longitude': longitude,
          'distance': distance,
          'tags': tags,
        }));

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print('cool');
      print(res['adds']);

      var ads = AdsPro(jsonEncode(res['adds']));

      return ads;
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> getrooms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + "/api/rooms";
    final url = Uri.parse(maurl);
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer ' + token!
      },
    );
    if (response.statusCode == 200) {
      print('bbb');

      //var ads = AdsPro(response.body);
      print(json.decode(response.body));

      return json.decode(response.body);
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> getroommessage(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + '/api/messages/${id}';
    final url = Uri.parse(maurl);
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer ' + token!
      },
    );
    if (response.statusCode == 200) {
      print('bbb');

      //var ads = AdsPro(response.body);
      print(json.decode(response.body));

      return json.decode(response.body);
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> getaddsbyid(id) async {
    print(id);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + "/api/adds/$id";
    final url = Uri.parse(maurl);
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'authorization': 'Bearer ' + token!
      },
    );
    if (response.statusCode == 200) {
      print('bbb');

      //var ads = AdsPro(response.body);
      print(json.decode(response.body));

      return json.decode(response.body);
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> getaddsbyuserid(id) async {
    print(id);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + "/api/adds/user";
    final url = Uri.parse(maurl);
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer ' + token!
      },
    );
    if (response.statusCode == 200) {


//var ads = AdsPro(response.body);
      // print(json.decode(response.body));

      // return json.decode(response.body);


      var res = jsonDecode(response.body);
      print(res);
      print('cool');
      // print(res['adds']);

      // var ads = AdsPro(jsonEncode(res['adds']));

      //var ads = AdsPro(response.body);
      var ads = AdsPro(response.body);
      print('ads');
      print(ads);

      return ads;
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> getaddofuserid(id) async {
    print(id);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + "/api/adds/adduser/${id}";
    final url = Uri.parse(maurl);
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer ' + token!
      },
    );
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print(res);
      print('cool');
      // print(res['adds']);

      // var ads = AdsPro(jsonEncode(res['adds']));

      //var ads = AdsPro(response.body);
      var ads = AdsPro(response.body);
      print('ads');
      print(ads);

      return ads;
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> savelocation(lat, long) async {
    print(lat + long);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + "/api/users/location";
    final url = Uri.parse(maurl);
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': 'Bearer ' + token!
        },
        body: jsonEncode(<String, dynamic>{
          'latitude': lat,
          'longitude': long,
        }));
    if (response.statusCode == 200) {
      print(response.body);

      return json.decode(response.body);
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> addtofavourites(id) async {
    print(id);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + "/api/users/favourites";
    final url = Uri.parse(maurl);
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': 'Bearer ' + token!
        },
        body: jsonEncode(<String, String>{
          'favourite': id,
        }));
    if (response.statusCode == 200) {
      print('bbb');

      //var ads = AdsPro(response.body);
      print(json.decode(response.body));

      return json.decode(response.body);
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> deletefavourites(id) async {
    print(id);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + "/api/users/favourites";
    final url = Uri.parse(maurl);
    final response = await http.delete(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': 'Bearer ' + token!
        },
        body: jsonEncode(<String, String>{
          'favourite': id,
        }));
    if (response.statusCode == 200) {
      print('bbb');

      //var ads = AdsPro(response.body);
      print(json.decode(response.body));

      return json.decode(response.body);
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> deleteaddofuser(id) async {
    print(id);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + "/api/adds/user/${id}";
    final url = Uri.parse(maurl);
    final response = await http.delete(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': 'Bearer ' + token!
        },
        body: jsonEncode(<String, String>{
          // 'favourite': id,
        }));
    if (response.statusCode == 200) {
      print('bbb');

      //var ads = AdsPro(response.body);
      print(json.decode(response.body));

      return json.decode(response.body);
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> deleteaccount(id) async {
    print(id);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + "/api/users/user";
    final url = Uri.parse(maurl);
    final response = await http.delete(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': 'Bearer ' + token!
        },
        body: jsonEncode(<String, String>{
          // 'favourite': id,
        }));
    if (response.statusCode == 200) {
      print('bbb');

      //var ads = AdsPro(response.body);
      print(json.decode(response.body));

      return json.decode(response.body);
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> getfavourites() async {
    //print(id);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + "/api/users/favourites";
    final url = Uri.parse(maurl);
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer ' + token!
      },
    );
    if (response.statusCode == 200 || response.statusCode == 304) {
      print('clean');

      var res = jsonDecode(response.body);
      print(res);
      print('cool');
      // print(res['adds']);

      // var ads = AdsPro(jsonEncode(res['adds']));

      //var ads = AdsPro(response.body);
      var ads = AdsPro(response.body);
      print('ads');
      print(ads);

      return ads;
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> uploadphotos(dynamic images) async {
    print('cool is nice');
    List<http.MultipartFile> newList = [];

    for (var img in images!) {
      if (img != "") {
        var multipartFile = await http.MultipartFile.fromPath(
          'image',
          File(img).path,
          filename: img.split('/').last,
        );
        newList.add(multipartFile);
      }
    }
    //print(newList.toList().toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    }; // ignore this headers if there is no authentication

//add headers
    var url = baseURL + "/api/adds/image";
    var request = http.MultipartRequest("POST", Uri.parse(url));

    request.headers.addAll(headers);
    request.files.addAll(newList);

//adding params
//request.fields['id'] = userid;
// request.fields['firstName'] = 'abc';
// request.fields['lastName'] = 'efg';

// send
    //var response = await request.send();

    // print(response.statusCode);
    //  print(response);
    http.Response response1 =
        await http.Response.fromStream(await request.send());
    print("Result: ${response1.statusCode}");
    return response1.body;
    //return response;
    // var formData = new FormData();
    // for (var file in images) {
    //   print(file);
    //   formData.files.addAll(
    //     [
    //       MapEntry(
    //           "image",
    //           MultipartFile.fromFileSync(
    //             file,
    //             filename: file.toString().split('/').last,
    //             // contentType: ('image','jpg')
    //           )),
    //     ],
    //   );
    // }
    // Dio dio = Dio();
    // dio.options.connectTimeout = Duration(seconds: 40);

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    // String maurl = "http:/10.0.2.2:5000" + "/api/adds/image";
    // Response response;
    // print(formData.toString());
    // try {
    //   response = await dio.post(maurl,
    //       options: Options(headers: {
    //         //   'Accept': 'application/json',
    //         'Content-Type': 'Content-Type": "multipart/form-data',
    //         'authorization': 'Bearer $token'
    //       }),
    //       data: formData);

    //   if (response.statusCode == 200) {
    //     print('bbb');

    //     // var ads = AdsPro(response.data);
    //     //print(ads);

    //     return 'ads';
    //   } else {
    //     print('hhh');

    //     // throw Exception('Failed to upload image');
    //   }
    // } on DioError catch (er) {
    //   if (er.response != null) {
    //     print(er.response!.data['message']);
    //   }
    //   if (er.type == DioErrorType.connectionTimeout) {
    //     print('connection timed out');
    //   } else {
    //     print('object');
    //   }
    // }
  }

  Future<dynamic> uploadphotos1(dynamic images) async {
    print('cool is nice');
    List<http.MultipartFile> newList = [];

    // for (var img in images!) {
    //   if (img != "") {
    //     var multipartFile = await http.MultipartFile.fromPath(
    //       'image',
    //       File(img),
    //       filename: img.split('/').last,
    //     );
    //     newList.add(multipartFile);
    //   }
    // }
//     final uri = Uri.parse('https://myendpoint.com');
// var request = new http.MultipartRequest('POST', uri);
// final httpImage = http.MultipartFile.fromBytes('files.myimage', bytes, filename: 'myImage.png');
// request.files.add(httpImage);
// // final response = await request.send();
    for (var img in images!) {
      print(img);
      if (img != "") {
        var multipartFile = await http.MultipartFile('images',
            File(img).readAsBytes().asStream(), File(img).lengthSync(),
            filename: img.split("/").last);
        newList.add(multipartFile);
      }
    }
    //print(newList.toList().toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    }; // ignore this headers if there is no authentication

//add headers
    var url = baseURL + "/api/adds/image";
    var request = http.MultipartRequest("POST", Uri.parse(url));

    request.headers.addAll(headers);
    request.files.addAll(newList);

//adding params
//request.fields['id'] = userid;
// request.fields['firstName'] = 'abc';
// request.fields['lastName'] = 'efg';

// send
    //var response = await request.send();

    // print(response.statusCode);
    //  print(response);
    http.Response response1 =
        await http.Response.fromStream(await request.send());
    print("Result: ${response1.statusCode}");
    return response1.body;
    //return response;
    // var formData = new FormData();
    // for (var file in images) {
    //   print(file);
    //   formData.files.addAll(
    //     [
    //       MapEntry(
    //           "image",
    //           MultipartFile.fromFileSync(
    //             file,
    //             filename: file.toString().split('/').last,
    //             // contentType: ('image','jpg')
    //           )),
    //     ],
    //   );
    // }
    // Dio dio = Dio();
    // dio.options.connectTimeout = Duration(seconds: 40);

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    // String maurl = "http:/10.0.2.2:5000" + "/api/adds/image";
    // Response response;
    // print(formData.toString());
    // try {
    //   response = await dio.post(maurl,
    //       options: Options(headers: {
    //         //   'Accept': 'application/json',
    //         'Content-Type': 'Content-Type": "multipart/form-data',
    //         'authorization': 'Bearer $token'
    //       }),
    //       data: formData);

    //   if (response.statusCode == 200) {
    //     print('bbb');

    //     // var ads = AdsPro(response.data);
    //     //print(ads);

    //     return 'ads';
    //   } else {
    //     print('hhh');

    //     // throw Exception('Failed to upload image');
    //   }
    // } on DioError catch (er) {
    //   if (er.response != null) {
    //     print(er.response!.data['message']);
    //   }
    //   if (er.type == DioErrorType.connectionTimeout) {
    //     print('connection timed out');
    //   } else {
    //     print('object');
    //   }
    // }
  }

  Future<dynamic> uploadadd(title, description, catagory, maincatagory,
      detailcatagory, price, images, status, Map map) async {
    print('maincatagory');
    print(maincatagory);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var body = <String, dynamic>{
      'title': title,
      'description': description,
      'catagory': catagory,
      "maincatagory": maincatagory,
      "detailcatagory": detailcatagory,
      'price': price,
      'status': status,
      'images': images,
    };
    if (map['transmission'] != null) {
      body['transmission'] = map['transmission'];
    }
    if (map['engineSize'] != null) {
      body['engineSize'] = map['engineSize'];
    }
    if (map['fuel'] != null) {
      body['fuel'] = map['fuel'];
    }

     if (map['model'] != null) {
      body['model'] = map['model'];
    }
     if (map['color'] != null) {
      body['color'] = map['color'];
    }
     if (map['year'] != null) {
      body['year'] = map['year'];
    }
    if (map['mileAge'] != null) {
      body['mileAge'] = map['mileAge'];
    }
    final response = await http.post(Uri.parse(baseURL + '/api/adds'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(body));
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

  Future<dynamic> updateadd(id, title, description, catagory, maincatagory,
      detailcatagory, price, images, status, Map map) async {
    print('maincatagory');
    print(maincatagory);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var body = <String, dynamic>{
      'title': title,
      'description': description,
      'catagory': catagory,
      "maincatagory": maincatagory,
      "detailcatagory": detailcatagory,
      'price': price,
      'status': status,
      'images': images,
    };
    if (map['transmission'] != null) {
      body['transmission'] = map['transmission'];
    }
    if (map['engineSize'] != null) {
      body['engineSize'] = map['engineSize'];
    }
    if (map['fuel'] != null) {
      body['fuel'] = map['fuel'];
    }
    if (map['mileAge'] != null) {
      body['mileAge'] = map['mileAge'];
    }
    final response = await http.put(Uri.parse(baseURL + '/api/adds/' + id),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(body));
    if (response.statusCode == 201 || response.statusCode == 200) {
      //return Post.fromJson(jsonDecode(response.body));
      print('registering user was successful');
      var miki = jsonDecode(response.body);
      print(miki['full_name']);
      print(miki);
//

      return jsonDecode(response.body);
      // return jsonDecode(utf8.decode(response.bodyBytes, allowMalformed: true));
    } else {
      throw Exception('Failed to load profile: ');
    }
  }

  Future<dynamic> getaddsbycatagory(catagory) async {
    //print(catagory);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String maurl = baseURL + "/api/adds/catagory?catagory=$catagory";
    final url = Uri.parse(maurl);
    http.Request request = http.Request('GET', url);
    // request.headers['Authorization'] = 'Bearer $token';
    http.Response response =
        await http.Response.fromStream(await request.send());
    print("Result: ${response.statusCode}");

    print('response');
    if (response.statusCode == 200) {
      print('bbb');

      var ads = AdsPro(response.body);
      print('ads');
      print(ads);

      return ads;
    } else {
      print('hhh');

      throw Exception('Failed to load adds');
    }
  }

  Future<dynamic> createroom(userfrom, userto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.post(Uri.parse(baseURL + '/api/rooms'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(<String, dynamic>{
          'userfrom': userfrom,
          'userto': userto,
        }));
    if (response.statusCode == 201 || response.statusCode == 200) {
      //return Post.fromJson(jsonDecode(response.body));
      print('Creating a room was successful');
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

  Future<dynamic> changepassword(current, newpassword, retypepassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response =
        await http.post(Uri.parse(baseURL + '/api/users/changepassword'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              "Authorization": "Bearer $token"
            },
            body: jsonEncode(<String, dynamic>{
              'currentPassword': current,
              'newPassword': newpassword,
              'confirmNewPassword': retypepassword,
            }));
    if (response.statusCode == 201 || response.statusCode == 200) {
      //return Post.fromJson(jsonDecode(response.body));
      print('Creating a room was successful');
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

  Future<dynamic> islocationsaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final url = Uri.parse('$baseURL/api/users/islocationenabled');
    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load profile: ');
    }
  }

  Future<dynamic> getsetting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final url = Uri.parse('$baseURL/api/users/getaddsetting');
    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load profile: ');
    }
  }

  Future<dynamic> sendpayment(amount, id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response =
        await http.post(Uri.parse(baseURL + '/api/users/sendpayment'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              "Authorization": "Bearer $token"
            },
            body: jsonEncode(<String, dynamic>{
              'amount': amount,
              'id': id,
            }));
    if (response.statusCode == 201 || response.statusCode == 200) {
      //return Post.fromJson(jsonDecode(response.body));

//

      return jsonDecode(response.body);
      // return jsonDecode(utf8.decode(response.bodyBytes, allowMalformed: true));
    } else {
      print(jsonDecode(response.body));
      throw Exception('Failed to send payment ');
    }
  }
}
