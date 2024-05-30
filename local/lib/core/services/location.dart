import 'package:geolocator/geolocator.dart';

import '../utility/log_utility.dart';

abstract class LocationService {
  Future<Position> getCurrentLocation();

  Stream<Position> watchLocationUpdates();

  Stream<Position> streamUserLocationUpdates();

  Future<LocationPermission> requestLocationPermission();
}

class GeoLocatorLocationService implements LocationService {
  final GeolocatorPlatform _geolocator;

  GeoLocatorLocationService() : _geolocator = GeolocatorPlatform.instance;

  @override
  Future<Position> getCurrentLocation() async {
    try {
      return await _geolocator.getCurrentPosition(
          locationSettings:
              const LocationSettings(accuracy: LocationAccuracy.high));
    } catch (e) {
      LogUtility.error('Error getting current location: $e', error: e);
      rethrow;
    }
  }

  @override
  Stream<Position> watchLocationUpdates() {
    return _geolocator.getPositionStream(
      locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high, distanceFilter: 10),
    );
  }

  @override
  Stream<Position> streamUserLocationUpdates() async* {
    try {
      await for (var position in _geolocator.getPositionStream()) {
        yield position;
      }
    } catch (e) {
      LogUtility.error('Error streaming location updates: $e', error: e);
      rethrow;
    }
  }

  @override
  Future<LocationPermission> requestLocationPermission() async {
    final permission = await _geolocator.requestPermission();
    return permission;
  }
}

// Location Wrapper Example for blocking if location not available
/*

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationWrapper extends StatefulWidget {
  final Widget child;

  const LocationWrapper({required this.child});

  @override
  _LocationWrapperState createState() => _LocationWrapperState();
}

class _LocationWrapperState extends State<LocationWrapper> {
  late GeolocatorLocationService _locationService;
  bool _isLocationEnabled = false;

  @override
  void initState() {
    super.initState();
    _locationService = GeolocatorLocationService();
    _checkLocationEnabled();
  }

  @override
  void dispose() {
    _locationService.dispose();
    super.dispose();
  }

  Future<void> _checkLocationEnabled() async {
    final locationEnabled = await _locationService.isLocationEnabled();
    setState(() {
      _isLocationEnabled = locationEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLocationEnabled) {
      return Scaffold(
        body: Center(
          child: Text('Please enable location to use this app.'),
        ),
      );
    }

    return widget.child;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationWrapper(
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text('Welcome to my app!'),
      ),
    );
  }
}

*/
