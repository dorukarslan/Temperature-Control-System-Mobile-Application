import 'package:flutter/material.dart';

class RecomendedWidget extends StatefulWidget {
  @override
  _RecomendedWidgetState createState() => _RecomendedWidgetState();
}

class _RecomendedWidgetState extends State<RecomendedWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator RecomendedWidget - FRAME

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd26374),
        title: Text('Energy Saving Mode'),
      ),
      body: Container(
          width: 428,
          height: 926,
          decoration: BoxDecoration(
            color: Color.fromRGBO(254, 218, 218, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 149,
                left: 29,
                child: Container(
                    width: 400,
                    height: 197.6608123779297,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/Image5.png'),
                          fit: BoxFit.fitWidth),
                    ))),
            Positioned(
                top: 450,
                left: 29,
                child: Text(
                  'The weather looks like',
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
                top: 500,
                left: 34,
                child: Text(
                  'it will be hot today!',
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
                top: 600,
                left: 55,
                child: Text(
                  "Today's temperature setting",
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
                top: 630,
                left: 55,
                child: Text(
                  'we recommend for you is',
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
                top: 700,
                left: 100,
                child: Text(
                  ' 20 °C ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 64,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 705,
                left: 360,
                child: FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Set',
                    child: const Icon(Icons.check))),
          ])),
    );
  }
}
