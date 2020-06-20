import 'package:Architecture/core/managers/dialog_manager.dart';
import 'package:Architecture/locator.dart';
import 'package:flutter/material.dart';

import 'core/services/navigation_service.dart';

import 'core/managers/Route_manager.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      navigatorKey: locator<NavigationService>().navigationKey,

      builder: (context , widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(
            child: widget,
          )
        ),
      ),

      theme: ThemeData(
        
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      initialRoute: RoutesManager.login,
      onGenerateRoute: RoutesManager.generateRoutes,
    );
  }
}

