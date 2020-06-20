import 'dart:async';

import 'package:Architecture/core/models/dialog_models.dart';

class DialogService {
  Function(DialogRequest) _showDialogListener;
  Completer<DialogResponse> _dialogCompleter;

  void registerDialogListener(Function(DialogRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<DialogResponse> showDialog(
      {String title, String description, String buttonTitle = 'OK'}) {
    _dialogCompleter = Completer<DialogResponse>();
    _showDialogListener(DialogRequest(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
    ));
    return _dialogCompleter.future;
  }

  void dialogComplete(DialogResponse response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}
