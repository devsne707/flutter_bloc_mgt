import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api_repository.dart';
import 'app_event.dart';
import 'app_state.dart';

class UserBloc extends Bloc<UserEvent, APIState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(APILoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(APILoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(APILoadedState(users));
      } catch (e) {
        emit(APIErrorState(e.toString()));
      }
    });
      

    on<LoadUser1Event>((event, emit) async {
      emit(APILoadingState());
      try {
        final users = await _userRepository.getUsers1();
        emit(APILoaded1State(users));
      } catch (e) {
        emit(APIErrorState(e.toString()));
      }
    });
  } 
}
