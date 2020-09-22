import 'dart:async';
import 'dart:collection';

import 'package:Agency_Service_Driver/view/booking/chat_room.dart';
import 'package:Agency_Service_Driver/view/mapscreen.dart';
import 'package:Agency_Service_Driver/view/booking/dropoff.dart';
import 'package:Agency_Service_Driver/view/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AcceptBooking extends StatefulWidget {
  @override
  _AcceptBookingState createState() => _AcceptBookingState();
}

class _AcceptBookingState extends State<AcceptBooking> {
  Set<Marker> _markers = HashSet<Marker>();

  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;
  Completer<GoogleMapController> _controller = Completer();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  Timer timer;
  bool loading = false;
  String _address = "";
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
//    focusNode = FocusNode();
    _textController = TextEditingController(text: _address);
    _textController.addListener(() {
      setState(() {});
    });
    timer = Timer.periodic(Duration(seconds: 20), (timer) {
      _getCurrentLocation();
      _setMarkerIcon();
    });
  }

  bool state = false;
  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
//    focusNode.dispose();
    super.dispose();
    timer.cancel();
    _textController.dispose();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/car.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    setState(() {
      _markers.add(
        Marker(
          position:
              LatLng(_currentPosition.latitude, _currentPosition.longitude),
          infoWindow: InfoWindow(
            title: 'hdvfgvf',
            snippet: 'vdghcvgsvchvf',
          ),
          icon: _markerIcon,
          markerId: MarkerId("0"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10.0, left: 10.0, top: 20),
              //height: 120,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              //decoration: BoxDecoration(color:Colors.black),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              Text(
                                'Pick-Up',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                              Text(
                                'Testthein',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          //height: 50,
                          decoration: BoxDecoration(color: Colors.grey[850]),
                          child: Column(
                            children: [
                              Text(
                                'Drop-Off',
                                style: TextStyle(
                                    color: Colors.green[700], fontSize: 20),
                              ),
                              Text(
                                'Testthein',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  //Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('U Wisara Road, Yangon,',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Myanmar (Burma)',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Car Mn 5\$',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 10.0),
                          child:
                              RoundButton(icon: Icons.near_me, onTap: () {})),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 355,
              child: _currentPosition == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      children: [
                        GoogleMap(
                          mapType: MapType.normal,
                          mapToolbarEnabled: false,
                          scrollGesturesEnabled: true,
                          zoomGesturesEnabled: true,
                          zoomControlsEnabled: false,
                          trafficEnabled: true,
                          compassEnabled: true,
                          indoorViewEnabled: true,
                          rotateGesturesEnabled: true,
                          tiltGesturesEnabled: true,
                          myLocationButtonEnabled: true,
                          myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(_currentPosition.latitude,
                                _currentPosition.longitude),
                            zoom: 14.4746,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ],
                    ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            RoundButton(
                              icon: Icons.phone,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Call',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            RoundButton(
                              icon: Icons.chat_bubble,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatRoom(),
                                ));
                              },
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Chat',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            RoundButton(
                              icon: Icons.cancel,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        // Column(
                        //   children: [
                        //     Switch(
                        //       onChanged: (bool v) {
                        //         setState(() {
                        //           state = v;
                        //         });
                        //       },
                        //       value: state,
                        //       activeColor: Colors.green,
                        //     ),
                        //     // RoundButton(
                        //     //   icon: Icons.power_settings_new,
                        //     //   onTap: () {
                        //     //     bool v;
                        //     //     setState(() {
                        //     //       state = v;
                        //     //     });
                        //     //   },
                        //     // ),
                        //     SizedBox(height: 5),
                        //     Text(
                        //       state == true ? 'Available' : 'Not Available',
                        //       style: TextStyle(
                        //         color:
                        //             state == true ? Colors.green : Colors.white,
                        //       ),
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 40,
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0))),
                            child: GestureDetector(
                              child: Center(
                                child: Text(
                                  'I\'m here',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          flex: 60,
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0))),
                            child: IgnorePointer(
                              ignoring: false,
                              child: GestureDetector(
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DropOff(),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Pick-Up',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final onTap;
  const RoundButton({Key key, this.icon, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[850],
      ),
      padding: EdgeInsets.all(5.0),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: onTap,
      ),
      height: 50,
      width: 50,
    );
  }
}
