import 'package:flutter/material.dart';

@immutable
abstract class UserEvent  {
  const UserEvent();
}

class LoadUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class LoadUser1Event extends UserEvent {
  @override
  List<Object?> get props => [];
}

class AddFloatBtnEvent extends UserEvent {
  @override
  String get props => "";
}