import 'dart:convert';

import 'package:http/http.dart';

class UserRepository {
  String userUrl = 'https://reqres.in/api/users?page=2';

  Future<dynamic> getUsers() async {
    Response response = await get(Uri.parse(userUrl));
   
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result;
      //.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
  
  Future<dynamic> getUsers1() async {
    String userUrl1 = 'https://reqres.in/api/users?page=1';
    Response response = await get(Uri.parse(userUrl1));
   
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result;
      //.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
  
}