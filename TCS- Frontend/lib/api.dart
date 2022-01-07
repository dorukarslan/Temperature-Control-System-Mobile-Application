import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class apiclass {
  static var userToken = "";
  Future LoginUser(String email, String password) async {
    final json = '{"email": "$email", "password": "$password"}';
    final headers = {"Content-type": "application/json"};

    final url = Uri.parse('http://51.144.72.217:8080/authorization/login/');
    var response = await http.post(url, headers: headers, body: json);

    var body = jsonDecode(response.body);
    userToken = body["token"];

    return response;
  }

  Future RegUser(String email, String password) async {
    final json = '{"email": "$email", "password": "$password"}';
    final headers = {"Content-type": "application/json"};

    final url = Uri.parse('http://51.144.72.217:8080/authorization/register/');
    var response = await http.post(url, headers: headers, body: json);

    var body = jsonDecode(response.body);
    userToken = body["token"];

    return response;
  }

  Future getAddress() async {
    final url = Uri.parse(
        'http://51.144.72.217:8080/user/address/get/?token=$userToken');
    var response = await http.get(url);

    return response;
  }

  Future addAddress(String address) async {
    final url = Uri.parse(
        'http://51.144.72.217:8080/user/address/add/?token=$userToken');
    final headers = {"Content-type": "application/json"};
    final json = '{"full": "$address"}';
    var response = await http.post(url, headers: headers, body: json);

    var body = jsonDecode(response.body);

    return response;
  }

  Future<String> getBill() async {
    final url = Uri.parse(
        'http://51.144.72.217:8080/user/estimated-bill/?token=$userToken');

    final headers = {"Content-type": "application/json"};

    var response = await http.get(url);

    String body = jsonDecode(response.body).toString();

    return body;
  }

  Widget billWidget(BuildContext context) {
    return FutureBuilder<String>(
      future: getBill(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
            return Center(
                child: new Text('${snapshot.data}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Roboto',
                        fontSize: 40,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height:
                            1))); // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    );
  }
}
