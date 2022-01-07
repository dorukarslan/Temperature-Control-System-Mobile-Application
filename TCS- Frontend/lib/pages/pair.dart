import 'package:flutter/material.dart';

class pairdevice extends StatefulWidget {
  const pairdevice({Key? key}) : super(key: key);

  @override
  _pairdeviceState createState() => _pairdeviceState();
}

class _pairdeviceState extends State<pairdevice> {
  @override
  List MYDevices = [];
  List avlDevices = ["Home-TCU", "Arçelik FA12 Sensor", "MI heat 313"];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 199, 199, 1),
      appBar: AppBar(
        title: Text('Pair Device'),
        backgroundColor: Color(0xffd26374),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
                width: 369,
                height: 239,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/images/Image1.png'),
                      fit: BoxFit.fitWidth),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 345,
                height: 40,
                child: Center(
                  child: Text(
                    'Avaliable devices: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  color: Color.fromRGBO(248, 248, 248, 1),
                )),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
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
            Container(
                width: 345,
                height: 40,
                child: Center(
                  child: Text(
                    'My devices: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  color: Color.fromRGBO(248, 248, 248, 1),
                )),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: MYDevices.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6),
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
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
