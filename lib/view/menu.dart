import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Driver Menu',
            style: TextStyle(color: Colors.black),
          ),
        ),
        //bottom: BottomNavigationBar(items: ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(blurRadius: 2, color: Color(0xFFC3C3C3)),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '2:31 pm',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/google-logo.png'),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alisha Walker',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Person in charge: Chiura Miura',
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          FlatButton(
                              onPressed: () {},
                              child: Text('Change',
                                  style: TextStyle(color: Colors.black)))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ClipRRect(
                          //   child: CircleAvatar(
                          //     backgroundColor: Colors.pink,
                          //   ),
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Today\'s operation status',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Number',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Sales',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Operating time',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '5 cases',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '34,000 yen',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '235 minutes',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          ClipRRect(
                              child: Image(
                                  image: AssetImage('assets/images/docs.png'))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(blurRadius: 2, color: Color(0xFFC3C3C3)),
                ],
              ),
              
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Number of logins (1h)',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Average waiting time',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Number of working',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Number of machine',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Number of transfer',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '150',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '20 minutes',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '213 units',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '136 units',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '77 units',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _button(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _disableButton() {
    return IgnorePointer(
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          'Empty car',
        ),
      ),
    );
  }

  Widget _button() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      elevation: 1.0,
      color: Colors.blueAccent,
      onPressed: () {},
      child: Text(
        'Empty car',
      ),
    );
  }
}
