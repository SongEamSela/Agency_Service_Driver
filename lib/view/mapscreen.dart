import 'dart:async';
import 'dart:collection';

import 'package:Agency_Service_Driver/view/pin_mapscreen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
  Timer _timer;
  int _start = 15;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

//  FocusNode focusNode;

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
    return Container(
      child: Scaffold(
        body: Stack(
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
                    // myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          11.562108, 104.888535),
                      zoom: 14.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
//          Container(
//            alignment: Alignment.bottomCenter,
//            padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
//            child: Text('Transport project'),
//          ),
                  
                ],
              ),
      ),
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng(position);
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng(position) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      String name = place.name;
      String subLocality = place.subLocality;
      String locality = place.locality;
      String administrativeArea = place.administrativeArea;
      String postalCode = place.postalCode;
      String country = place.country;
      String address =
          "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
      setState(() {
        _address = address;
        print(address);
      });
    } catch (e) {
      print(e);
    }
  }
}
