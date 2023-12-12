import 'package:flutter/material.dart';
import 'package:flutter_bloc_mgt/api_repository.dart';

class UserProvider extends  ChangeNotifier {
  List getUserList = [];
  UserRepository  services = UserRepository();
  
  getUserAPI ()async {
    getUserList = await services.getUsers();
    notifyListeners();
  }
}