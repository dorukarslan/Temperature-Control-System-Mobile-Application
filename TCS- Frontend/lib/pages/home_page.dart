import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temperature_control_system/main.dart';
import 'package:temperature_control_system/pages/automation.dart';
import 'package:temperature_control_system/pages/bill.dart';
import 'package:temperature_control_system/pages/energySaving.dart';
import 'package:temperature_control_system/pages/pair.dart';
import 'package:temperature_control_system/pages/recommended.dart';
import 'package:temperature_control_system/pages/user_page.dart';
import 'package:temperature_control_system/user.dart';

import '../auth/sign_in.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var temperatureValue;
  var selectedValue = 20;
  bool FirstCheck = false;

  List<Widget> textWidgetList = [];
  String infoMessage = "";
  showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 5.0,
                    ),
                  ),
                  CupertinoButton(
                      child: Text('Confirm'),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();

                          _onLoading();
                        });
                      }),
                ],
              ),
              Flexible(
                child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    itemExtent: 32.0,
                    children: textWidgetList),
              ),
            ],
          );
        });
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Setting new temperature value"),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
    });
  }

  @override
  void handleClick(String value) {
    switch (value) {
      case 'User Information':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => User_infoWidget()),
        );

        break;
      case 'Pair Components':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pairdevice()),
        );

        break;

      case 'Energy saving mode':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EnergysavingWidget()),
        );
        break;

      case 'Estimated Bill':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Estimated_billWidget()),
        );
        break;

      case 'Show Recommended adjustments':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecomendedWidget()),
        );
        break;

      case 'Autonomous options':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AutomationWidget()),
        );
        break;
    }
  }

  Color colorDef = Color(0xffd26374);
  Color color = Color.fromRGBO(255, 199, 199, 1);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          ),
        ),
        backgroundColor: Color(0xffd26374),
        title: Text('Home Page'),
        actions: <Widget>[
          PopupMenuButton<String>(
            color: Color(0xffdf919d),
            icon: Icon(Icons.menu),
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {
                'User Information',
                'Pair Components',
                'Estimated Bill',
                'Show Recommended adjustments',
                'Autonomous options',
                'Energy saving mode'
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage("lib/assets/images/dorukpp.jpeg"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 270,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Color.fromRGBO(246, 246, 246, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Welcome Doruk Arslan",
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 360,
                height: 172,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color.fromRGBO(246, 246, 246, 1),
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Current Address :",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(User.currentAddres,
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(User.currentCoordinate,
                            style: TextStyle(
                              fontSize: 14,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  child: Text(
                    "$infoMessage",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              // Figma Flutter Generator Ellipse2Widget - ELLIPSE
              Container(
                width: 223,
                height: 213,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(Radius.elliptical(223, 213)),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      if (!FirstCheck) {
                        for (int i = 0; i < 40; i++) {
                          textWidgetList.add(Text("$i °C"));
                        }
                        FirstCheck = true;
                      }

                      showPicker();
                    },
                    child: Text(
                      "$selectedValue °C",
                      style: TextStyle(color: Colors.red, fontSize: 40),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          selectedValue++;

                          if (selectedValue == 42) {
                            infoMessage =
                                "Warning ,Temperature value rises uncontrollably";
                            color = Colors.orange;
                          } else if (selectedValue >= 60) {
                            infoMessage =
                                "Very dangerous temperature value, firefighter calling.";
                            color = Colors.red;
                          }
                        });
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ), // T,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
