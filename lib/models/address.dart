import 'package:flutter_assignment/models/geo_location.dart';

// Address class holds the user's address information
class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoLocation geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: GeoLocation.fromJson(json['geo']),
    );
  }
}
