part of 'user_bloc.dart';

// Abstract class representing the state of the user data.
// All user-related states will extend this class.
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

// State containing the list of all users and optionally the filtered users
// The filteredUsers list will be used when the user performs a search
class UserLoaded extends UserState {
  final List<User> users; // The full list of users
  final List<User>
      filteredUsers; // The filtered list of users based on search query

  // Constructor allows for filtered users to be passed, defaults to all users if null
  UserLoaded(this.users, {List<User>? filteredUsers})
      : filteredUsers = filteredUsers ?? users;
}

class UserError extends UserState {
  final String message; 
  UserError(this.message);
}
