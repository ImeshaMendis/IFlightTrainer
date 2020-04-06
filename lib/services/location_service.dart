import 'dart:async';
import 'package:flight_training/models/user_location.dart';
import 'package:location/location.dart';

class LocationService {
  UserLocation _currentLocation;

  Location location = Location();

  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  Stream<UserLocation> get locationStream => _locationController.stream;

  LocationService() {
    // Request permission to use location
    location.requestPermission().then((state) {
      if (state == PermissionStatus.GRANTED) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged().listen((locationData) {
      
        if (locationData != null) {
            _locationController.add(
              UserLocation(
                  latitude: locationData.latitude,
                  longitude: locationData.longitude,
                  altitude: locationData.altitude,
                  speed: locationData.speed,
                  head: locationData.heading),
            );
          }
        });
      }
    });
  }

}
