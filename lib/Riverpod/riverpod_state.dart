import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_repository.dart';
@immutable
abstract class RiverPodState {
  // const factory RiverPodState.initial() = _UserInitial;
  // const factory RiverPodState.loading() = _UserLoading;
  // const factory RiverPodState.success(dynamic user) = _UserLoadedSuccess;
  // const factory RiverPodState.error([String message]) = _UserLoadedError;
}

class APILoadingState extends RiverPodState {
  @override
  List<Object?> get props => [];
}

class APILoadedState extends RiverPodState {
  final dynamic users;
  APILoadedState(this.users);
  @override
  List<Object?> get props => [users];
}


class APIErrorState extends RiverPodState {
  final String error;
  APIErrorState(this.error);
  @override
  List<Object?> get props => [error];
}


class UserStateNotifier extends StateNotifier<RiverPodState> {
  UserRepository repository = UserRepository();
  UserStateNotifier(this.repository) : super(APILoadingState());

  getUser() async{
    try{
      state = APILoadingState();
      var data = await repository.getUsers();
      return state = APILoadedState(data);
    }catch(e){
      return state = APIErrorState("$e");
    }
  }
}

final clientProvider = Provider<UserRepository>((_) => UserRepository());

final userStateNotifierProvider = StateNotifierProvider(
    (ref) => UserStateNotifier(ref.watch(clientProvider)));



// class UserStateNotifier extends StateNotifier<RiverPodState> {
//   UserRepository repository = UserRepository();
//   UserStateNotifier(this.repository) : super(APILoadingState());

//   getUser() async{
//     try{
//       state =  APILoadingState();
//       var data = await repository.getUsers();
//       return state = APILoadedState(data);
//     }catch(e){
//       return state = APIErrorState("$e");
//     }

//   }
// }