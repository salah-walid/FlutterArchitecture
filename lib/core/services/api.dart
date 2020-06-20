import 'dart:convert';

import 'package:Architecture/core/models/user.dart';
import 'package:http/http.dart' as http;

class Api{

  static const endpoint = 'https://jsonplaceholder.typicode.com';

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    var response = await http.get('$endpoint/users/$userId');

    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

}