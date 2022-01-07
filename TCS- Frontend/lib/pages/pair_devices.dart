import 'package:flutter/material.dart';

class Pair_devicesWidget extends StatefulWidget {
  @override
  _Pair_devicesWidgetState createState() => _Pair_devicesWidgetState();
}

class _Pair_devicesWidgetState extends State<Pair_devicesWidget> {
  List MYDevices = ["Xiamoi Temp 4420", "Vestel C520 radiator"];
  List avlDevices = ["Arçelik FA12 Sensor", "MI heat 313"];
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Pair_devicesWidget - FRAME

    return Scaffold(
      appBar: AppBar(),
      body: Container(
          width: 428,
          height: 926,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 199, 199, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 480,
                left: 38,
                child: Container(
                    width: 345,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                      color: Color.fromRGBO(248, 248, 248, 1),
                    ))),
            Positioned(
                top: 495,
                left: 167,
                child: Text(
                  'My devices:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
              top: 340,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: avlDevices.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        avlDevices[index],
                      ),
                      trailing: PopupMenuButton(
                        onSelected: (result) {
                          setState(() {
                            if (result == 0) {}
                          });
                        },
                        itemBuilder: (ctx) => [
                          PopupMenuItem(
                            child: Text("Pair"),
                            value: 0,
                            onTap: () {
                              setState(() {
                                MYDevices.add(avlDevices[index]);
                                avlDevices.removeAt(index);
                              });
                            },
                          ),
                          PopupMenuItem(
                            child: Text("Ignore"),
                            value: 1,
                            onTap: () {
                              setState(() {
                                avlDevices.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 540,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: MYDevices.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 6),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          MYDevices[index],
                        ),
                        trailing: PopupMenuButton(
                          onSelected: (result) {
                            setState(() {
                              if (result == 0) {}
                            });
                          },
                          itemBuilder: (ctx) => [
                            PopupMenuItem(
                              child: Text("Delete"),
                              value: 0,
                              onTap: () {
                                setState(() {
                                  MYDevices.removeAt(index);
                                  print(MYDevices);
                                });
                              },
                            ),
                            PopupMenuItem(
                              child: Text("Edit"),
                              value: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
                top: 280,
                left: 38,
                child: Container(
                    width: 345,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                      color: Color.fromRGBO(248, 248, 248, 1),
                    ))),
            Positioned(
                top: 295,
                left: 139,
                child: Text(
                  'Avaliable devices: ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 12,
                left: 38,
                child: Container(
                    width: 369,
                    height: 239,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/Image1.png'),
                          fit: BoxFit.fitWidth),
                    ))),
          ])),
    );
  }
}
