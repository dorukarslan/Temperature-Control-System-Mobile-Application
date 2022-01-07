import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temperature_control_system/api.dart';
import 'package:temperature_control_system/pages/home_page.dart';
import 'package:temperature_control_system/user.dart';

class User_infoWidget extends StatefulWidget {
  @override
  _User_infoWidgetState createState() => _User_infoWidgetState();
}

class _User_infoWidgetState extends State<User_infoWidget> {
  apiclass api = new apiclass();
  User user = new User();
  String roomNumber = "";
  String size = "";
  String addressPlace = "";
  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();

    var selectedValue;
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
                            User.currentAddres = User.Addresses[selectedValue];
                            Navigator.of(context).pop();
                            print(User.currentAddres);
                            roomNumber = user.addressRoomInfo(selectedValue);
                            addressPlace = user.addressPlaceInfo(selectedValue);
                            size = user.addressSizeInfo(selectedValue);
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
                    children: User.Addresses.map((element) => ListTile(
                            title:
                                Text(element, style: TextStyle(fontSize: 18))))
                        .toList(),
                  ),
                ),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Information Page'),
        backgroundColor: Color(0xffd26374),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => homepage()),
          ),
        ),
      ),
      body: Container(
          width: 428,
          height: 926,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 199, 199, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 75,
                left: 10,
                child: Container(
                    width: 410,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                        color: Color(0xffdf919d)))),
            Positioned(
                top: 400,
                left: 10,
                child: Container(
                    width: 410,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                        color: Color(0xffdb828f)))),
            Positioned(
                top: 430,
                left: 39,
                child: Text(
                  User.currentAddres + ' Information:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                )),
            Positioned(
                top: 100,
                left: 130,
                child: Text(
                  'Choose address:',
                  textAlign: TextAlign.center,
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
              top: 140,
              left: 125,
              child: Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))),
                    onPressed: () async {
                      await user.getAddresses();
                      showPicker();
                    },
                    child: Text("Change address "),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 250,
                left: 20,
                child: SizedBox(
                  height: 100,
                  width: 390,
                  child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: _controller.clear,
                            icon: Icon(Icons.clear),
                          ),
                          hintText: "Add new address",
                          hintStyle: TextStyle(color: Colors.black26),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          )),
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        api.addAddress(_controller.text);
                      }),
                )),
            Positioned(
                top: 320,
                left: 49,
                child: Column(
                  children: [
                    Text(
                      "Please add your address as",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 13),
                    ),
                    Text(
                      "  NAME-ADDRESS-ROOM NUMBER-SIZE IN M2",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Positioned(
                top: 470,
                left: 39,
                child: Text(
                  'Address' + addressPlace,
                  textAlign: TextAlign.center,
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
                top: 510,
                left: 39,
                child: Text(
                  'Overall size in m2: ' + size,
                  textAlign: TextAlign.center,
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
                top: 550,
                left: 39,
                child: Text(
                  'Room number: ' + roomNumber,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
          ])),
    );
  }
}
