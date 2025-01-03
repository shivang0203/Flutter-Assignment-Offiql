part of 'user_bloc.dart';

// Abstract class representing a User event. All events will extend this class.
abstract class UserEvent {}

// Event to fetch the list of users from the repository
class FetchUsers extends UserEvent {}

// Event to add a new user to the list
class AddUser extends UserEvent {
  final User user; 
  AddUser(this.user);
}

// Event to trigger user search based on a query string
class SearchUsers extends UserEvent {
  final String query; 
  SearchUsers(this.query);
}
