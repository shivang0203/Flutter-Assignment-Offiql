import 'dart:convert'; // For decoding the JSON response from the API
import 'package:http/http.dart' as http; // For making HTTP requests
import '../models/user.dart'; // Importing the User model to map the API data

// Repository class responsible for fetching user data from the API
class UserRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Method to fetch a list of users from the API
  Future<List<User>> getUsers() async {
    try {
      // Sending a GET request to fetch the users data
      final response = await http.get(Uri.parse('$baseUrl/users'));

      // If the response is successful (HTTP status code 200)
      if (response.statusCode == 200) {
        // Decoding the JSON response body
        final List<dynamic> jsonData = json.decode(response.body);

        // Mapping the decoded JSON data to a list of User objects
        return jsonData.map((json) => User.fromJson(json)).toList();
      } else {
        // If the response status code is not 200, throwing an exception
        throw Exception('Failed to load users');
      }
    } catch (e) {
      // Catching any errors that occur during the HTTP request and decoding
      throw Exception('Failed to connect to the server');
    }
  }
}
