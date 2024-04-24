import 'package:flutter/material.dart';
import 'package:flutter_application_hotel/index/index.dart';
import 'package:flutter_application_hotel/layout/Search.dart';
import 'package:side_navigation/side_navigation.dart';
import 'Search.dart';

class travel_index extends StatefulWidget {
  const travel_index({
    super.key,
  });

  @override
  createState() => _MainViewState();
}

class _MainViewState extends State<travel_index> {
  List<Widget> views = [
    const Center(),
    const searchBar(),
    const Center(
      child: Text('chatting'),
    ),
    const Center(
      child: Text('graph'),
    ),
    const Center(
      child: Text('myPage'),
    )
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'AnyStay',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'CantoraOne',
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const bothLogin()),
                        (route) => false);
                  },
                  icon: const Icon(Icons.logout)))
        ],
        shape:
            Border(bottom: BorderSide(width: 3, color: Colors.grey.shade200)),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.grey[200],
            child: SideNavigationBar(
              selectedIndex: selectedIndex,
              items: const [
                SideNavigationBarItem(
                  icon: Icons.dashboard,
                  label: '메인화면',
                ),
                SideNavigationBarItem(
                  icon: Icons.search_outlined,
                  label: '호텔검색',
                ),
                SideNavigationBarItem(
                  icon: Icons.chat,
                  label: '채팅',
                ),
                SideNavigationBarItem(
                  icon: Icons.auto_graph_outlined,
                  label: '통계',
                ),
                SideNavigationBarItem(
                  icon: Icons.person,
                  label: '마이페이지',
                ),
              ],
              theme: SideNavigationBarTheme(
                itemTheme: SideNavigationBarItemTheme(
                    unselectedItemColor: Colors.black,
                    selectedItemColor: Colors.black26,
                    iconSize: 32.5,
                    labelTextStyle:
                        const TextStyle(fontSize: 15, color: Colors.black)),
                togglerTheme: SideNavigationBarTogglerTheme.standard(),
                dividerTheme: SideNavigationBarDividerTheme.standard(),
              ),
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              toggler: SideBarToggler(
                  expandIcon: Icons.menu,
                  shrinkIcon: Icons.menu,
                  onToggle: () {}),
            ),
          ),
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
