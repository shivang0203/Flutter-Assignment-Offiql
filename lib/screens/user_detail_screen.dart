import 'package:flutter/material.dart';
import '../models/user.dart';


// Screen to display user details
class UserDetailScreen extends StatelessWidget {
  // The user data passed to this screen to display, which is required to display the user details
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Basic Information',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text('Username'),
                        subtitle: Text('@${user.username}'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: const Text('Email'),
                        subtitle: Text(user.email),
                      ),
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: const Text('Phone'),
                        subtitle: Text(user.phone),
                      ),
                      ListTile(
                        leading: const Icon(Icons.web),
                        title: const Text('Website'),
                        subtitle: Text(user.website),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Address',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.location_on),
                        title: Text(user.address.street),
                        subtitle: Text('${user.address.suite}\n${user.address.city}, ${user.address.zipcode}'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.map),
                        title: const Text('Coordinates'),
                        subtitle: Text('Lat: ${user.address.geo.lat}\nLng: ${user.address.geo.lng}'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Company',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.business),
                        title: Text(user.company.name),
                        subtitle: Text(user.company.catchPhrase),
                      ),
                      ListTile(
                        leading: const Icon(Icons.work),
                        title: const Text('Business'),
                        subtitle: Text(user.company.bs),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}