import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../widgets/responsive_grid.dart';
import 'add_user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showSearch = false; // Boolean to control the visibility of the search bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Display search bar when _showSearch is true, otherwise display the default title
        title: _showSearch
            ? TextField(
                autofocus: true, // Autofocus when search bar is shown
                decoration: const InputDecoration(
                  hintText: 'Search user...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black38),
                ),
                style: const TextStyle(color: Colors.black),
                onChanged: (query) {
                  // Trigger the search event in UserBloc whenever the text changes
                  context.read<UserBloc>().add(SearchUsers(query));
                },
              )
            : const Text('Users'),
        actions: [
          // IconButton to toggle between search and close icons
          IconButton(
            icon: Icon(_showSearch ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _showSearch = !_showSearch; // Toggle search bar visibility
              });
              if (!_showSearch) {
                // Clear search when closing search bar
                context.read<UserBloc>().add(SearchUsers(''));
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        // BlocBuilder listens to the state of UserBloc and rebuilds the UI accordingly
        builder: (context, state) {
          if (state is UserLoading) {
            // Show loading indicator when users are being fetched
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            // If users are loaded, display them in a responsive grid
            return ResponsiveGrid(users: state.filteredUsers);
          } else if (state is UserError) {
            // Display an error message if fetching users failed
            return Center(child: Text('Error loading data from API : ${state.message}'));
          }
          return const SizedBox(); // Empty widget when no state is available
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to AddUserScreen when the floating action button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddUserScreen()),
          );
        },
        // extendedPadding: EdgeInsets.all(4),
        label: const Text('Add User'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
