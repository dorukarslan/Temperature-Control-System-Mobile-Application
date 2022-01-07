import 'package:flutter/material.dart';

import 'home_page.dart';

class FirstinfoWidget extends StatefulWidget {
  @override
  _FirstinfoWidgetState createState() => _FirstinfoWidgetState();
}

class _FirstinfoWidgetState extends State<FirstinfoWidget> {
  String name = "";
  String lastname = "";
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator FirstinfoWidget - FRAME

    return Scaffold(
      body: Container(
          width: 428,
          height: 926,
          decoration: BoxDecoration(
            color: Color.fromRGBO(254, 218, 218, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 197,
                left: 60,
                child: Container(
                    width: 307,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Color.fromRGBO(199, 199, 199, 1),
                    ),
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Please enter your name',
                        ),
                        onChanged: (value) {
                          setState(() {
                            name = value.trim();
                          });
                        },
                      ),
                    ))),
            Positioned(
                top: 388,
                left: 60,
                child: Container(
                  width: 307,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Color.fromRGBO(199, 199, 199, 1),
                  ),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Please enter your last name',
                      ),
                      onChanged: (value) {
                        setState(() {
                          lastname = value.trim();
                        });
                      },
                    ),
                  ),
                )),
            Positioned(
                top: 149,
                left: 149,
                child: Text(
                  'Your name',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 313,
                left: 128,
                child: Text(
                  'Your Last Name',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
              top: 470,
              left: 120,
              child: Center(
                child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Center(child: Text("Add profile picture")))),
              ),
            ),
            Positioned(
                top: 550,
                left: 120,
                child: Container(
                    width: 200,
                    height: 100,
                    child: IconButton(
                        iconSize: 50,
                        onPressed: () {
                          if (name != "" && lastname != "") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homepage()),
                            );
                          }
                        },
                        icon: Icon(Icons.check_circle_sharp)))),
          ])),
    );
  }
}
