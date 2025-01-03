import 'package:flutter/material.dart';
import '../models/user.dart'; 
import '../screens/user_detail_screen.dart'; 

class ResponsiveGrid extends StatelessWidget {
  final List<User> users; // List of users to display in the grid

  const ResponsiveGrid({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    // Using LayoutBuilder to determine the grid layout based on screen width
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine number of columns based on the available width
        final crossAxisCount = constraints.maxWidth < 600
            ? 1 // 1 column for small screens
            : constraints.maxWidth < 900
                ? 2 // 2 columns for medium screens
                : 3; // 3 columns for large screens

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Number of columns based on screen size
            mainAxisSpacing: 10, 
            crossAxisSpacing: 10,
            mainAxisExtent: 135, 
          ),
          itemCount: users.length, // Total number of users in the grid
          itemBuilder: (context, index) {
            final user = users[index]; // Getting the user at the current index
            return Card(
              child: InkWell(
                onTap: () {
                  // Navigate to the UserDetailScreen when a user card is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailScreen(user: user),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Displaying the user's name and username in a row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            user.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold, 
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis, // Truncate if too long
                          ),
                          Text(
                            '@${user.username}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.grey[600], // Grey color for the username
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      
                      // Displaying the user's email with an icon
                      Row(
                        children: [
                          const Icon(Icons.email, size: 16), // Email icon
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              user.email, // User email
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis, // Truncate if too long
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      
                      // Displaying the user's phone number with an icon
                      Row(
                        children: [
                          const Icon(Icons.phone, size: 16), // Phone icon
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              user.phone, // User phone number
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis, // Truncate if too long
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      
                      // Displaying the user's website with an icon
                      Row(
                        children: [
                          const Icon(Icons.web, size: 16), // Website icon
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'www.${user.website}', // Displaying user website
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis, // Truncate if too long
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
