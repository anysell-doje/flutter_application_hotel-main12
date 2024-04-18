import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_hotel/api/hotel_name_api.dart';
import 'package:flutter_application_hotel/model/hotel_query.dart';
import 'package:http/http.dart' as http;

class searchBar extends StatefulWidget {
  const searchBar({super.key});

  @override
  State<searchBar> createState() => _searchBarState();
}

var queryController = TextEditingController();
List<dynamic> hotelName = [];

class _searchBarState extends State<searchBar> {
  Future<void> querySearch(String query) async {
    try {
      var response = await http
          .get(Uri.parse('${HotelNameApi.hotelName}?=hotel_name=$query'));

      print(queryController);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        bool success = jsonData['success'];

        if (success == true) {
          print('성공');
          setState(() {
            hotelName = jsonDecode(response.body)['hotel_names'];
          });
        } else {
          throw Exception(const Text('오류발생'));
        }
      } else {
        throw Exception(const Text('HTTP 요청 실패'));
      }
    } catch (e) {
      throw Exception(const Text('검색 실패'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 600,
          child: TextFormField(
            controller: queryController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: '호텔을 검색하세요.',
                suffixIcon: IconButton(
                    onPressed: () {
                      String query = queryController.text;
                      if (query.isNotEmpty) {
                        querySearch(query);
                      }
                    },
                    icon: const Icon(Icons.search))),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: hotelName.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(hotelName[index]),
            );
          },
        ))
      ],
    );
  }
}
