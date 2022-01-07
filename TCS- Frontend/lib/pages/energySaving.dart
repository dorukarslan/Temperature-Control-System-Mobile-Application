import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnergysavingWidget extends StatefulWidget {
  @override
  _EnergysavingWidgetState createState() => _EnergysavingWidgetState();
}

class _EnergysavingWidgetState extends State<EnergysavingWidget> {
  bool _switchValue = false;
  String status = "Off";

  Color defaultColor = Color.fromARGB(255, 231, 179, 179);
  @override
  Color color = Color.fromARGB(255, 231, 179, 179);
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator EnergysavingWidget - FRAME

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd26374),
        title: Text('Energy Saving Mode'),
      ),
      body: Container(
          width: 428,
          height: 926,
          decoration: BoxDecoration(color: color),
          child: Stack(children: <Widget>[
            Positioned(
                top: 88,
                left: -26,
                child: Container(
                    width: 395,
                    height: 284,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/Image4.png'),
                          fit: BoxFit.fitWidth),
                    ))),
            Positioned(
                top: 442,
                left: 15,
                child: Text(
                  'Save your energy',
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
              top: 660,
              left: 180,
              child: Container(
                child: CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                      if (status == "Off") {
                        status = "On";
                        color = Colors.green;
                      } else {
                        status = "Off";
                        color = defaultColor;
                        ;
                      }
                    });
                  },
                ),
              ),
            ),
            Positioned(
                top: 502,
                left: 67,
                child: Text(
                  'Protect the nature',
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
                top: 562,
                left: 171,
                child: Text(
                  'Lower your bill',
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
          ])),
    );
  }
}
