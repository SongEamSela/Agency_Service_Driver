import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

class PinMapScreen extends StatefulWidget {

  double currentLat, currentLong;

  PinMapScreen ({Key key , this.currentLat, this.currentLong}) : super(key: key);
  @override
  _PinMapScreenState createState() => _PinMapScreenState();
}

class _PinMapScreenState extends State<PinMapScreen> {

  PickResult selectedPlace;
  String address = "";

  @override
  Widget build(BuildContext context) {
    Set<Marker> _markers = {};
    Completer<GoogleMapController> _controller = Completer();
    return Scaffold(
      body: SizedBox(
        child:
          Stack(
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
                    target: LatLng(widget.currentLat, widget.currentLong),
                    zoom: 15
                ),
                markers: Set<Marker>.of(
                  <Marker>[
                    Marker(
                      onTap: (){
                        print("Marker clicked");
                      },
                      draggable: true,
                      markerId: MarkerId("1"),
                      position: LatLng(widget.currentLat, widget.currentLong),
                      onDragEnd: ((value) {
                        print(value.latitude);
                        print(value.longitude);
                        address = _getUserLocation(value.latitude,value.longitude);
                      }),
                      icon: BitmapDescriptor.defaultMarker,
                      infoWindow: const InfoWindow(
                        title: 'Marker',
                      ),
                    )
                  ],
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Text('${address}', style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                            child: Text('Hello address'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],

          ),
      ),
    );
  }


  _getUserLocation(double lat, double long) async {//call this async method from whereever you need

    final coordinates = new Coordinates(
        lat, long);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    var first = addresses.first;
    print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    var add = ' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}';
    return add;
  }

  void _modalBottomSheetMenu(){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return new Container(
            height: 350.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                  child: new Text("This is a modal sheet"),
                )),
          );
        }
    );
  }


}
