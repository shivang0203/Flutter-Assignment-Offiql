import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/address.dart';
import 'package:flutter_assignment/models/company.dart';
import 'package:flutter_assignment/models/geo_location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../models/user.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _websiteController = TextEditingController();
  final _companyNameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    _companyNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New User'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Associating the form with the global key
          child: Column(
            children: [
              // TextField for Full Name input
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // TextField for Username input
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // TextField for Email input
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  // Validation for empty email or incorrect email format
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // TextField for Phone input
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // TextField for Website input
              TextFormField(
                controller: _websiteController,
                decoration: const InputDecoration(labelText: 'Website'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a website';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // TextField for Company Name input
              TextFormField(
                controller: _companyNameController,
                decoration: const InputDecoration(labelText: 'Company Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a company name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Submit Button for adding a new user
              ElevatedButton(
                onPressed: () {
                  // Validate the form before submitting
                  if (_formKey.currentState!.validate()) {
                    final user = User(
                      name: _nameController.text,
                      username: _usernameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      website: _websiteController.text,
                      company: Company(
                        name: _companyNameController.text,
                        catchPhrase: 'N/A',
                        bs: 'N/A',
                      ),
                      address: Address(
                        street: 'N/A',
                        suite: 'N/A',
                        city: 'N/A',
                        zipcode: 'N/A',
                        geo: GeoLocation(lat: '0', lng: '0'),
                      ),
                    );
                    // Dispatch the AddUser event to the UserBloc with the newly created user
                    context.read<UserBloc>().add(AddUser(user));
                    Navigator.pop(
                        context); // Close the AddUserScreen after submission
                  }
                },
                child: const Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
