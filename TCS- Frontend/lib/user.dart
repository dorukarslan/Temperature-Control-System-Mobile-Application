import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:temperature_control_system/api.dart';

class User {
  static List Addresses = [];
  static List FullAddresses = [];
  static String currentAddres = "";
  static String currentCoordinate = "";
  apiclass api = new apiclass();
  void addAddress(String add) {
    Addresses.add(add);
  }

  String getCurrentAddress() {
    return currentAddres;
  }

  Future getAddresses() async {
    var response = await api.getAddress();
    var body = jsonDecode(response.body);

    FullAddresses = body["data"];
    print("bastı şuanda $FullAddresses");
    addressNames();
  }

  void addressNames() {
    for (int i = 0; i < FullAddresses.length; i++) {
      String current = FullAddresses[i];

      List divided = current.split("-");

      if (!Addresses.contains(divided[0])) {
        Addresses.add(divided[0]);
      }
    }
  }

  String addressRoomInfo(int index) {
    List divided = FullAddresses[index].split("-");
    return divided[2];
  }

  String addressPlaceInfo(int index) {
    List divided = FullAddresses[index].split("-");
    currentCoordinate = divided[1];
    return divided[1];
  }

  String addressSizeInfo(int index) {
    List divided = FullAddresses[index].split("-");
    return divided[3];
  }
}
