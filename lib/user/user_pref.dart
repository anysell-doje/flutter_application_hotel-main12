import 'dart:convert';

import 'package:flutter_application_hotel/login/travel_signup.dart';
import 'package:flutter_application_hotel/model/hotel_user.dart';
import 'package:flutter_application_hotel/model/travel_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUser {
  static Future<void> saveRememberUserInfo(HotelUser userInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await preferences.setString("currentUser", userJsonData);
  }
}

class RememberTravel {
  static Future<void> saveRememberTravelInfo(TravelUser travelInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String travelJsonData = jsonEncode(travelInfo.toJson());
    await preferences.setString("currentUser", travelJsonData);
  }
}
