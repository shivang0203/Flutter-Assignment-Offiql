import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_screen.dart';
import 'bloc/user_bloc.dart';
import 'repositories/user_repository.dart';


void main() {
  // Wrapping the app with BlocProvider to provide global access to UserBloc
  runApp(
    BlocProvider(
      // Creating an instance of UserBloc and injecting the UserRepository dependency
      create: (context) => UserBloc(
        repository: UserRepository(),
      )..add(FetchUsers()), // Triggering the initial event to fetch users
      child: const MyApp(), 
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Management App', 
      theme: ThemeData(
        primarySwatch: Colors.blue, // Setting the primary color theme
        useMaterial3: true, // Enabling Material Design 3
      ),
      home: const HomeScreen(), 
      debugShowCheckedModeBanner: false, 
    );
  }
}
