import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_hotel/main.dart';
import '../login/both_login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: const MaterialApp(
        title: 'app',
        home: Login_My_Page(),
      ),
    );
  }
}

class Login_My_Page extends StatefulWidget {
  const Login_My_Page({super.key});

  @override
  State<Login_My_Page> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login_My_Page> {
  static String name = "최환";
  static String phone = "01093249539";
  static String email = "kks93319539@gmail.com";

  final TextEditingController _nameController =
      TextEditingController(text: name);
  final TextEditingController _phoneController =
      TextEditingController(text: phone);
  final TextEditingController _emailController =
      TextEditingController(text: email);
  void _valueSave() {
    print(name + phone + email);
  }

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
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            children: [
                              Text(
                                '사용자명: $name',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '전화번호: $phone',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '이메일: $email',
                                style: const TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                            width: 250,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  label: Text('사용자명'),
                                  contentPadding:
                                      EdgeInsets.only(bottom: 5, top: 10)),
                              controller: _nameController,
                              onChanged: (value) => name = value,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                              width: 250,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('전화번호'),
                                    contentPadding:
                                        EdgeInsets.only(bottom: 5, top: 10)),
                                onChanged: (value) => phone = value,
                                controller: _phoneController,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                              width: 250,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('이메일'),
                                    contentPadding:
                                        EdgeInsets.only(bottom: 5, top: 10)),
                                onChanged: (value) => email = value,
                                controller: _emailController,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: ElevatedButton(
                              onPressed: () {
                                _valueSave();
                                setState(() {
                                  name = name;
                                  phone = phone;
                                  email = email;
                                });
                              },
                              child: const Text('저장하기')),
                        ),
                      ],
                    ),
                  )),
              Container(
                color: Colors.white,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
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
