import 'package:flutter/material.dart';
import 'package:flutter_bloc_mgt/user_model.dart';

@immutable
abstract class APIState{}

class APILoadingState extends APIState {
  @override
  List<Object?> get props => [];
}

class APILoadedState extends APIState {
  final dynamic users;
  APILoadedState(this.users);
  @override
  List<Object?> get props => [users];
}

class APILoaded1State extends APIState {
  final dynamic users1;
  APILoaded1State(this.users1);
  @override
  List<Object?> get props => [users1];
}

class APIErrorState extends APIState {
  final String error;
  APIErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class DemoAdd extends APIState {
  String? inputText;
  DemoAdd({this.inputText});
}