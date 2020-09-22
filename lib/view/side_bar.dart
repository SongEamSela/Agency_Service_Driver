import 'package:Agency_Service_Driver/view/mapscreen.dart';
import 'package:Agency_Service_Driver/view/pin_mapscreen.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.only(top:30, left:16),
            child: Column(
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/images/user-color2.png'),radius: 30,),
                SizedBox(height: 10,),
                Text(
                  'Chiura Miura',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            title: Text('Driver Menu'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MenuScreen(),
            )),
          ),
          ListTile(
            title: Text('Driver Menu'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MenuScreen(),
            )),
          ),
          ListTile(
            title: Text('Driver Menu'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MenuScreen(),
            )),
          ),
          ListTile(
            title: Text('Driver Menu'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MenuScreen(),
            )),
          ),
        ],
      )),
      body: ListView(
        children: [
          SizedBox(child: MapScreen(), height: 500,),
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                height: 100,
                alignment: Alignment.bottomCenter,
                color: Colors.black,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('TaxiDriver',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.verified_user,
                              color: Colors.white,
                            ),
                            Text(
                              '4.5%',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text('Acceptance',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.stars, color: Colors.white),
                            Text(
                              '2.5',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              'Ratings',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                            Text(
                              '4.5%',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              'Cancellation',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
