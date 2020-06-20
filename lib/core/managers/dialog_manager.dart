import 'package:Architecture/core/models/dialog_models.dart';
import 'package:Architecture/core/services/dialog_service.dart';
import 'package:Architecture/core/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../locator.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(DialogRequest request) {
    Alert(
      context: context,
      title: request.title,
      desc: request.description,
      closeFunction: () =>
          _dialogService.dialogComplete(DialogResponse(confirmed: false)),
      buttons: [
        DialogButton(
          child: Text(request.buttonTitle),
          onPressed: () {
            _dialogService.dialogComplete(DialogResponse(confirmed: true));
            Navigator.of(context).pop();
          },
        )
      ]).show();
  }
}
