import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_hotel/api/hotel_reservation.dart';

class HotelSelect extends StatefulWidget {
  final Map<String, dynamic> hotelList; // 호텔 이름을 저장할 변수

  const HotelSelect({
    super.key,
    required this.hotelList,
  });
  @override
  _HotelSignUpState createState() => _HotelSignUpState();
}

class _HotelSignUpState extends State<HotelSelect> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // 폼 키 선언
  var userNameController = TextEditingController();
  var userPhoneController = TextEditingController();
  var guestCountController = TextEditingController();
  var nightCountController = TextEditingController();
  var hotelPriceController = TextEditingController();
  var roomCountController = TextEditingController();
  var startDateController = TextEditingController(); // 시작 날짜 컨트롤러
  var endDateController = TextEditingController(); // 종료 날짜 컨트롤러
  bool resvConfirm = false;
  @override
  void initState() {
    super.initState();
    roomCountController.addListener(updatePrice);
    nightCountController.addListener(updatePrice);
  }

  void updatePrice() {
    int roomCount = int.tryParse(roomCountController.text) ?? 0;
    int nightCount = int.tryParse(nightCountController.text) ?? 0;
    int basePrice = 0;
    if (widget.hotelList['hotel_price'] != null) {
      String priceStr = widget.hotelList['hotel_price']
          .toString()
          .replaceAll(",", ""); // 콤마 제거
      basePrice =
          int.tryParse(priceStr) ?? 0; // 콤마가 제거된 문자열을 int로 변환, 실패할 경우 0을 사용
    }

    int totalPrice = basePrice * roomCount * nightCount;
    hotelPriceController.text = totalPrice.toString();
  }

  hotelReservation(confirm) async {
    if (confirm == true) {
      print('true');
      print(hotelPriceController);
      try {
        print('yes');
        var res = await http.post(
          Uri.parse(HotelReservation.reservation),
          body: {
            "hotel_id": widget.hotelList['hotel_id'].toString(),
            "inquirer_name": userNameController.text.trim(),
            "inquirer_tel": userPhoneController.text.trim(),
            "guest_count": guestCountController.text.trim(),
            "night_count": nightCountController.text.trim(),
            "room_count": roomCountController.text.trim(),
            "hotel_price": hotelPriceController.text.trim(),
          },
        );

        if (res.statusCode == 200) {
          print('200');
          var resReservation = jsonDecode(res.body);
          reservationComplete();

          if (resReservation['success'] == true) {
            userNameController.clear();
            userPhoneController.clear();
            guestCountController.clear();
            nightCountController.clear();
            roomCountController.clear();
            hotelPriceController.clear();
          }
        }
      } catch (e) {
        print(e);
      }
    }
  }

  reservationComplete() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('예약이 접수 되었습니다.', textAlign: TextAlign.center)));
  }

  reservationFiled() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('예약이 취소 되었습니다.', textAlign: TextAlign.center)));
  }

  @override
  Widget build(BuildContext context) {
    String hotelName = widget.hotelList['hotel_name'];
    String hotelAddress = widget.hotelList['hotel_address'];
    String hotelRating = widget.hotelList['hotel_rating'].toString();
    String hotelPrice = widget.hotelList['hotel_price'].toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(hotelName,
            style: const TextStyle(
                fontFamily: 'Pretendard', fontWeight: FontWeight.bold)),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Container(
            color: const Color.fromRGBO(247, 242, 250, 1),
            width: 750,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 250,
                  child: const Text('사진',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                      textAlign: TextAlign.center),
                ),
                const SizedBox(height: 50),
                Container(
                  color: Colors.white,
                  width: 500,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('평점: ',
                              style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24)),
                          Text(hotelRating,
                              style: const TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24)),
                          const Icon(Icons.star, color: Colors.yellowAccent)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('위치: ',
                              style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400)),
                          Text(hotelAddress,
                              style: const TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('가격: ',
                              style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400)),
                          Text(hotelPrice,
                              style: const TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('예약 확인',
                                  style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.bold)),
                              content: SingleChildScrollView(
                                child: Form(
                                  key: _formKey, // 폼 키를 여기에 할당
                                  child: Column(
                                    children: buildFormFields(),
                                  ),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pop(context);

                                      setState(() {
                                        resvConfirm = true;
                                      });
                                      hotelReservation(resvConfirm);
                                    }
                                  },
                                  child: const Text('확인',
                                      style: TextStyle(
                                          fontFamily: 'Pretendard',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);

                                    setState(() {
                                      resvConfirm = false;
                                    });
                                    hotelReservation(resvConfirm);
                                  },
                                  child: const Text('취소',
                                      style: TextStyle(
                                          fontFamily: 'Pretendard',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Text('예약하기',
                        style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildFormFields() {
    return [
      buildTextField('Name', userNameController, 'Please enter a name',
          TextInputType.name),
      buildTextField('Phone Number', userPhoneController,
          'Please enter a phone number', TextInputType.phone),
      buildTextField('Number of Guests', guestCountController,
          'Please enter number of guests', TextInputType.number),
      buildTextField('Number of Rooms', roomCountController,
          'Please enter number of rooms', TextInputType.number),
      buildTextField(
          'Total Price', hotelPriceController, '', TextInputType.number,
          isReadOnly: true),
      buildDateRangeField(
          'Select Date Range', startDateController, endDateController),
    ];
  }

  Widget buildTextField(String label, TextEditingController controller,
      String errorMessage, TextInputType keyboardType,
      {bool isReadOnly = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        readOnly: isReadOnly,
        validator: (value) {
          if (!isReadOnly && (value == null || value.isEmpty)) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }

  Widget buildDateRangeField(
      String label,
      TextEditingController startController,
      TextEditingController endController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: TextEditingController(
            text: '${startController.text} - ${endController.text}'),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        readOnly: true,
        onTap: () async {
          DateTimeRange? pickedRange = await showDateRangePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime(2030),
            initialDateRange:
                startController.text.isNotEmpty && endController.text.isNotEmpty
                    ? DateTimeRange(
                        start: DateTime.parse(startController.text),
                        end: DateTime.parse(endController.text))
                    : null,
          );
          if (pickedRange != null) {
            setState(() {
              startController.text =
                  "${pickedRange.start.year}-${pickedRange.start.month.toString().padLeft(2, '0')}-${pickedRange.start.day.toString().padLeft(2, '0')}";
              endController.text =
                  "${pickedRange.end.year}-${pickedRange.end.month.toString().padLeft(2, '0')}-${pickedRange.end.day.toString().padLeft(2, '0')}";
            });
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a date range';
          }
          return null;
        },
      ),
    );
  }
}
