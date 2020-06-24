/*
 * Deppendency ingection manager
*/

import 'package:Architecture/core/services/dialog_service.dart';
import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/services/authentification_service.dart';
import 'core/services/navigation_service.dart';

//! Global locator variable
GetIt locator = GetIt.instance;

//! Function to be called before the runApp function
void setupLocator(){
  //Add services here
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => DialogService());

}
