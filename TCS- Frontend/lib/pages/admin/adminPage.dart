import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temperature_control_system/api.dart';
import 'package:temperature_control_system/pages/admin/readlogs.dart';
import 'package:temperature_control_system/pages/home_page.dart';

class AdminWidget extends StatefulWidget {
  @override
  _AdminWidgetState createState() => _AdminWidgetState();
}

class _AdminWidgetState extends State<AdminWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator AdminWidget - FRAME
    String textValue = "Choose user";
    var selectedValue;
    apiclass api = new apiclass();
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
                            print(api.getBill());
                            Navigator.of(context).pop();
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
                      children: [
                        Text("Doruk Arslan"),
                        Text("Alp Eren Keskin"),
                        Text("Doğuhan Cumaoğlu"),
                        Text("Hasanalp Temiz"),
                      ]),
                ),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd26374),
        title: Text('Admin Page'),
      ),
      body: Container(
          width: 428,
          height: 926,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 199, 199, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 138,
                left: 74,
                child: Text(
                  'Welcome Admin',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 36,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 393,
                left: 124,
                child: Container(
                  width: 182,
                  height: 39,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        showPicker();
                      },
                      child: Text("Users")),
                )),
            Positioned(
                top: 554,
                left: 74,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => homepage()));
                    },
                    child: Text(
                      "Home Page",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
            Positioned(
                top: 554,
                left: 256,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogsWidget()));
                    },
                    child: Text(
                      "Read Logs",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
            Positioned(
                top: 354,
                left: 144,
                child: Text(
                  '$textValue',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 525,
                left: 40,
                child: Text(
                  'Go to user’s profile',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 525,
                left: 262,
                child: Text(
                  'Read Logs',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
          ])),
    );
  }
}
