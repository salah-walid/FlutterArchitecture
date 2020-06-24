import 'package:Architecture/core/managers/Route_manager.dart';
import 'package:Architecture/core/services/authentification_service.dart';
import 'package:Architecture/core/services/navigation_service.dart';

import '../../locator.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String errorMessage;

  void login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    // Not a number
    if(userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return;
    }

    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);

    //login succesful
    if (success) {
      _navigationService.navigateTo(RoutesManager.homePage);
    }
  }
}
