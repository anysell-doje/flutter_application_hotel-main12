import 'package:flutter_application_hotel/layout/Search.dart';

class HotelName {
  String hotelName;
  HotelName(this.hotelName);

  factory HotelName.fromJson(Map<String, dynamic> json) => HotelName(
        json['hotel_names'],
      );

  Map<String, dynamic> toJson() => {'hotel_name': hotelName};
}
