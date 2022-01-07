import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutomationWidget extends StatefulWidget {
  @override
  _AutomationWidgetState createState() => _AutomationWidgetState();
}

class _AutomationWidgetState extends State<AutomationWidget> {
  bool _switchValue = false;
  String status = "Off";
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator AutomationWidget - FRAME

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd26374),
        title: Text('Automation options'),
      ),
      body: Container(
          width: 428,
          height: 926,
          decoration: BoxDecoration(
            color: Color.fromRGBO(254, 218, 218, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 108,
                left: 13,
                child: Text(
                  'Everything is easier',
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
                top: 158,
                left: 13,
                child: Text(
                  'when it becomes ',
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
                top: 209,
                left: 13,
                child: Text(
                  'automatic!',
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
                top: 270,
                left: 55,
                child: Container(
                    width: 363,
                    height: 321,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/Image3.png'),
                          fit: BoxFit.fitWidth),
                    ))),
            Positioned(
                top: 600,
                left: 125,
                child: Container(
                  width: 165,
                  height: 36,
                  child: CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                        if (status == "Off") {
                          status = "On";
                        } else {
                          status = "Off";
                        }
                      });
                    },
                  ),
                )),
            Positioned(
              top: 640,
              left: 135,
              child: Text(
                'Automation: $status',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),
            Positioned(
                top: 680,
                left: 145,
                child: Container(
                  width: 120,
                  height: 120,
                  child: TextField(
                    textAlign: TextAlign.center,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Bill limit in ₺',
                    ),
                  ),
                ))
          ])),
    );
  }
}
