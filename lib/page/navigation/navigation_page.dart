import 'package:flutter/material.dart';
import 'package:yen/page/home/home_page.dart';
import 'package:yen/page/login/login_page.dart';
import 'package:yen/page/member/member_page.dart';
import 'package:yen/page/post/post_page.dart';
import 'package:yen/page/profile/profile_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ProfilePage(),
    PostPage(),
    MemberPage(),
    LoginPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('HOME'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('PROFILE'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_comment),
            title: Text('POST'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            title: Text('MEMBER'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('CHAT'),
          ),
        ],
        currentIndex: _selectedIndex,
        elevation: 8,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xff007EC4),
        onTap: _onItemTapped,
      ),
    );
  }
}
