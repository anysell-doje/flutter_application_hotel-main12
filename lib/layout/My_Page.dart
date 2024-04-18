import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import '../login/both_login.dart';

class My_Page extends StatefulWidget {
  const My_Page({super.key});

  @override
  State<My_Page> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<My_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '마이페이지',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5399F5),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: SafeArea(
          child: ContainedTabBarView(
            tabs: const [
              Text(
                '내 정보',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                '예약 정보',
                style: TextStyle(color: Colors.black),
              ),
            ],
            views: [
              Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const bothLogin()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5399F5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Text(
                            '로그인',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  )),
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const bothLogin()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5399F5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Text(
                          '로그인',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              )
            ],
            onChange: (index) => print(index),
          ),
        ),
      ),
    );
  }
}
