import 'package:Architecture/UI/views/home_view.dart';
import 'package:Architecture/UI/views/login_view.dart';

import 'package:flutter/material.dart';

class RoutesManager {
  static const String login = "/";
  static const String homePage = "/homePage";

  static Route<dynamic> generateRoutes(RouteSettings settings){
    
    switch (settings.name) {
      case RoutesManager.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutesManager.homePage:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          )
        );
      }
    }

}