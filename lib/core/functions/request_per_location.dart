import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

double? latitude;
double? longitude;
requestPerLocation() async {
  bool serviceEnabled;
  Position myPosition;
  LocationPermission locationPermission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  print(
      "serviceEnabled========================================================${serviceEnabled}");
  if (serviceEnabled) {
    locationPermission = await Geolocator.checkPermission();
    print(
        "checkPermission========================================================${locationPermission}");

    if (locationPermission == LocationPermission.denied) {
      print("Enter denied");
      locationPermission = await Geolocator.requestPermission();
      print(
          "requestPermission========================================================${locationPermission}");
      if (locationPermission == LocationPermission.denied) {
        print("Please Give the App Permission");
      }
      if (locationPermission == LocationPermission.deniedForever) {
        print("The App Not Work Corrctly");
      }
    }
    if (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse) {
      myPosition = await Geolocator.getCurrentPosition();
      latitude = myPosition.latitude;
      longitude = myPosition.longitude;
      List<Placemark> placemarks =
          await placemarkFromCoordinates(34.7335501, 36.7346266);
      // print(placemarks[5]);
      List<Location> locations =
          await locationFromAddress("Syria,Homs,Al Zahra");
      print(locations);
      // print(
      //     "placemarks[0].administrativeArea ${placemarks[0].administrativeArea}");
      // print("placemarks[0].country${placemarks[0].country}");
      // print("placemarks[0].isoCountryCode${placemarks[0].isoCountryCode}");
      // print("placemarks[0].locality${placemarks[0].locality}");
      // print("placemarks[0].name${placemarks[0].name}");
      // print("placemarks[0].postalCode${placemarks[0].postalCode}");
      // print("placemarks[0].street${placemarks[0].street}");
      // print(
      //     "placemarks[0].subAdministrativeArea${placemarks[0].subAdministrativeArea}");
      // print("placemarks[0].subLocality${placemarks[0].subLocality}");
      // print("placemarks[0].subThoroughfare${placemarks[0].subThoroughfare}");
      // print("placemarks[0].thoroughfare${placemarks[0].thoroughfare}");
      // print("myPosition.accuracy ${myPosition.accuracy}");
      // print("myPosition.altitude${myPosition.altitude}");
      // print("myPosition.altitudeAccuracy${myPosition.altitudeAccuracy}");
      // print("myPosition.floor${myPosition.floor}");
      // print("myPosition.heading${myPosition.heading}");
      // print("myPosition.headingAccuracy${myPosition.headingAccuracy}");
      // print("myPosition.isMocked${myPosition.isMocked}");
      // print("myPosition.latitude${myPosition.latitude}");
      // print("myPosition.longitude${myPosition.longitude}");
      // print("myPosition.speed${myPosition.speed}");
      // print("myPosition.speedAccuracy${myPosition.speedAccuracy}");
      // print("myPosition.timestamp${myPosition.timestamp}");
      print(
          "myPosition========================================================${myPosition}");
    }
  }
}
