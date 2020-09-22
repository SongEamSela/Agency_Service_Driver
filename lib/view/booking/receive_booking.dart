import 'package:Agency_Service_Driver/view/booking/accept_booking.dart';
import 'package:flutter/material.dart';

class ReceiveBooking extends StatefulWidget {
  @override
  _ReceiveBookingState createState() => _ReceiveBookingState();
}

class _ReceiveBookingState extends State<ReceiveBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: Column(children: [
          Center(
            child: Text(
              'FIXED FARE',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              '5\$',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Car CM',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('2.5 KM'),
                        Text('Cash'),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('U Wisara Road'),
                          Text('U Wisara Road, Yangon, Myanmar'),
                          Text('(Burma), RGN'),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    height: 125,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('Shwedagon Pagoda'),
                            Text('Township, Yangon, Myanmar (Burma)'),
                            Text('RGN'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 180.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0))),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AcceptBooking(),
                  ));
                },
                child: Center(
                  child: Text(
                    'ACCEPT JOB',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
