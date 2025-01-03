import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_assignment/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/user_repository.dart';

// Import the event and state definitions for the UserBloc
part 'user_event.dart';
part 'user_state.dart';

// UserBloc handles the states and events related to user data
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository
      repository; // The repository responsible for fetching users
  List<User> _users = []; // Stores the list of fetched users locally

  UserBloc({required this.repository}) : super(UserInitial()) {
    // Event handler registration
    on<FetchUsers>(_onFetchUsers); // Fetch users from the repository
    on<AddUser>(_onAddUser); // Add a new user to the list
    on<SearchUsers>(_onSearchUsers); // Search users based on the query
  }

  // Handles fetching the list of users from the repository
  Future<void> _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading()); // Emit loading state before fetching data
    try {
      // Fetch users from the repository
      _users = await repository.getUsers();
      // Emit the loaded state with the fetched users
      emit(UserLoaded(_users));
    } catch (e) {
      // Emit error state if fetching users fails
      emit(UserError(e.toString()));
    }
  }

  // Handles adding a new user to the list of users
  void _onAddUser(AddUser event, Emitter<UserState> emit) {
    final newUser = event.user; // Get the new user from the event
    _users = [..._users, newUser]; // Add the new user to the list
    emit(UserLoaded(_users)); // Emit the updated list of users
  }

  // Handles searching users based on a query string
  void _onSearchUsers(SearchUsers event, Emitter<UserState> emit) {
    if (state is UserLoaded) {
      final filteredUsers = _users
          .where((user) =>
                  user.name.toLowerCase().contains(event.query.toLowerCase())
              // || user.email.toLowerCase().contains(event.query.toLowerCase())
              )
          .toList();
      // Emit the loaded state with the filtered users
      emit(UserLoaded(_users, filteredUsers: filteredUsers));
    }
  }
}
