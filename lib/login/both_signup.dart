import 'package:flutter/material.dart';
import 'hotel_login.dart' as hotel;
import 'travel_login.dart' as travel;
import 'travel_signup.dart' as travelsign;
import 'hotel_signup.dart' as hotelsign;

class bothSignUp extends StatelessWidget {
  const bothSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    String confirm = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '회원가입',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 145,
              height: 130,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const hotelsign.HotelSignUp()));
                    confirm = "hotel";
                    print(confirm);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.hotel,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        '호텔 회원가입',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 130,
              child: VerticalDivider(
                  color: Color.fromARGB(255, 211, 211, 211),
                  width: 75,
                  thickness: 2.0),
            ),
            SizedBox(
              width: 145,
              height: 130,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const travelsign.travelSignUp()));
                    confirm = "travel";
                    print(confirm);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.airplane_ticket,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        '여행사 회원가입',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
