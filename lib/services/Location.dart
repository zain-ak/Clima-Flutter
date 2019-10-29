import 'package:geolocator/geolocator.dart';

class Location {
  double long, lat;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      this.long = position.longitude;
      this.lat = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}