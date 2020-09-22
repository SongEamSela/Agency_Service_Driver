import 'package:Agency_Service_Driver/view/menu.dart';
import 'package:flutter/material.dart';

class ListingScreen extends StatefulWidget {
  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  int _page = 0;

  void _onItemTapped(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      MenuScreen(),
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Notifications',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Text('Screen2'),
          ),
        ),
      ),
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Profile',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Text('Screen3'),
          ),
        ),
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 68),
            child: _children.elementAt(_page),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _bottomNavigationBar,
          )
        ],
      ),
    );
  }

  Widget get _bottomNavigationBar {
    return ClipRRect(
      child: SizedBox(
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), title: Text('notification')),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle),
                title: Text('profile')),
          ],
          currentIndex: _page,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
