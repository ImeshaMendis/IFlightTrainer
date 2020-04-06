import 'dart:async';
import 'dart:typed_data';

import 'package:flight_training/models/user_location.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Map extends StatefulWidget {
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();
  Marker marker;
  Uint8List image;
  getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context)
        .load("lib/assets/images/plane.png");
    this.image = byteData.buffer.asUint8List();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMarker();
  }

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);

    return new Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              markers: Set.from([
                Marker(
                    markerId: MarkerId("home"),
                    position:
                        LatLng(userLocation.latitude, userLocation.longitude),
                    rotation: userLocation.head,
                    draggable: false,
                    zIndex: 2,
                    flat: true,
                    anchor: Offset(0.5, 0.5),
                    icon: BitmapDescriptor.fromBytes(image))
              ]),
              initialCameraPosition: CameraPosition(
                target: LatLng(userLocation.latitude, userLocation.longitude),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
                top: 5,
                left: 5,
                child: Text(
                  "Height:" + userLocation.altitude.toString() + "m",
                  style: GoogleFonts.juliusSansOne(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                )),
            Positioned(
                top: 5,
                right: 5,
                child: Text(
                  "Head:" + userLocation.head.toString(),
                  style: GoogleFonts.juliusSansOne(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
