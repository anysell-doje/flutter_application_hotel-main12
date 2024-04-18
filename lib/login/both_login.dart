import 'package:flutter/material.dart';
import 'hotel_login.dart' as hotel;
import 'travel_login.dart' as travel;

class bothLogin extends StatelessWidget {
  const bothLogin({super.key});

  @override
  Widget build(BuildContext context) {
    String confirm = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '로그인',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
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
                            builder: (context) => const hotel.Login()));
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
                        '호텔 로그인',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
                height: 50,
                child: SizedBox(
                    width: 130,
                    child: Divider(
                        color: Color.fromARGB(255, 211, 211, 211),
                        thickness: 2.0))),
            SizedBox(
              width: 145,
              height: 130,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const travel.Login()));
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
                        '여행사 로그인',
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
