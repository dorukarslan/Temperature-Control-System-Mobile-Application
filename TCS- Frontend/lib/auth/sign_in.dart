import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:temperature_control_system/api.dart';
import 'package:temperature_control_system/pages/home_page.dart';

import '../pages/admin/adminPage.dart';
import '../pages/registerFirstInfo.dart';
import '../user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;

  Widget passwordWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Password", style: TextStyle(fontFamily: 'Opensans')),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: MediaQuery.of(context).size.height / 20,
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Please enter your Password',
                suffixIcon: Icon(Icons.vpn_key_rounded),
              ),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget emailWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email", style: TextStyle(fontFamily: 'Opensans')),
        SizedBox(
          height: MediaQuery.of(context).size.height / 25,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: MediaQuery.of(context).size.height / 15,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Please enter your email',
                suffixIcon: Icon(Icons.email_outlined)),
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
          ),
        )
      ],
    );
  }

  apiclass api = new apiclass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 199, 199, 1),
                    Color(0xffd26374),
                  ]),
            ),
          ),
          Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding:
                    EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                          fontFamily: 'Opensans',
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    emailWidget(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    passwordWidget(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(10),
                          elevation: 7,
                          color: Colors.white,
                          child: Text(
                            " Login",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Color(0xFF527DFF)),
                          ),
                          onPressed: () async {
                            var response =
                                await api.LoginUser(_email, _password);

                            var body = jsonDecode(response.body);
                            if (body["status"] == "success") {
                              User.Addresses = [];
                              User.FullAddresses = [];
                              User.currentAddres = "";
                              print(apiclass.userToken);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homepage()),
                              );
                            } else if (body["status"] == "admin") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminWidget()));
                            }
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: RaisedButton(
                          padding: EdgeInsets.all(10),
                          elevation: 12,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text("Sign Up",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  color: Color(0xFF527DFF))),
                          onPressed: () async {
                            var response = await api.RegUser(_email, _password);

                            var body = jsonDecode(response.body);
                            if (body["status"] == "success") {
                              User.Addresses = [];
                              User.FullAddresses = [];
                              User.currentAddres = "";
                              print(apiclass.userToken);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirstinfoWidget()),
                              );
                            }
                          }),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
