import 'package:Architecture/core/models/user.dart';
import 'package:Architecture/core/services/authentification_service.dart';
import 'package:Architecture/core/services/dialog_service.dart';
import 'package:Architecture/core/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  Widget showUser(){

    User user = _authenticationService.user;

    return Container(

      width: 350,

      child: Card(
        elevation: 5.0,
        child: Text("Name : ${user.name}\n"
                    "Username : ${user.username}",
                    
                    textAlign: TextAlign.center,),
      ),
    );

  }

  void goBack(){

    _navigationService.pop();

  }

  void showDialog() async{

    //returns the result
    await _dialogService.showDialog(title: "Hello", description: "It's me");

  }
  
}