import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:temperature_control_system/api.dart';

class Estimated_billWidget extends StatefulWidget {
  @override
  _Estimated_billWidgetState createState() => _Estimated_billWidgetState();
}

class _Estimated_billWidgetState extends State<Estimated_billWidget> {
  apiclass api = new apiclass();
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Estimated_billWidget - FRAME

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd26374),
        title: Text('Estimated Bill'),
      ),
      body: Container(
          width: 428,
          height: 926,
          decoration: BoxDecoration(
            color: Color.fromRGBO(253, 217, 217, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
              top: 655,
              left: 33,
              child: SvgPicture.asset('lib/assets/images/rectangle8.svg',
                  semanticsLabel: 'rectangle8'),
            ),
            Positioned(top: 650, left: 150, child: api.billWidget(context)),
            Positioned(
                top: 600,
                left: 55,
                child: Text(
                  'Your bill for this month is estimated as :',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
              top: 417,
              left: 33,
              child: SvgPicture.asset('lib/assets/images/rectangle10.svg',
                  semanticsLabel: 'rectangle10'),
            ),
            Positioned(
                top: 488,
                left: 137,
                child: Text(
                  '2.3 kw / per day',
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
                top: 445,
                left: 53,
                child: Text(
                  'Average electricty consumption :',
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
                top: 123,
                left: 30,
                child: Container(
                    width: 368,
                    height: 255,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/Image2.png'),
                          fit: BoxFit.fitWidth),
                    ))),
          ])),
    );
  }
}
