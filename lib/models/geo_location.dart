
// GeoLocation class holds information about geographical location (latitude and longitude)
class GeoLocation {
  final String lat;
  final String lng;

  GeoLocation({required this.lat, required this.lng});

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}