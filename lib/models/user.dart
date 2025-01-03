import 'package:flutter_assignment/models/address.dart';
import 'package:flutter_assignment/models/company.dart';

// The User class holds information about a user and its associated data.
class User {
  final int? id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  // Constructor for User class to initialize properties
  User({
    this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  // Factory constructor that converts JSON data to a User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
    );
  }

  // Method to create a copy of the User object with optional modifications
  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  // Method to convert the User object back to JSON format for API requests
  //(CAN REMOVE THIS as not required)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': {
        'street': address.street,
        'suite': address.suite,
        'city': address.city,
        'zipcode': address.zipcode,
        'geo': {
          'lat': address.geo.lat,
          'lng': address.geo.lng,
        },
      },
      'phone': phone,
      'website': website,
      'company': {
        'name': company.name,
        'catchPhrase': company.catchPhrase,
        'bs': company.bs,
      },
    };
  }

}









