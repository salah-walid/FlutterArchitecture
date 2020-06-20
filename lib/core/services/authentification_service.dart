import 'dart:async';

import 'package:Architecture/core/models/user.dart';
import 'package:Architecture/locator.dart';
import 'api.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  User _user;
  User get user => _user;

  Future<bool> login(int userId) async {
    User fetchedUser = await _api.getUserProfile(userId);

    bool hasUser = fetchedUser != null;
    if(hasUser) {
      _user = fetchedUser;
    }

    return hasUser;
  }
}