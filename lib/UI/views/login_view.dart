import 'package:Architecture/UI/components/login_header.dart';
import 'package:Architecture/core/viewmodels/base_model.dart';
import 'package:Architecture/core/viewmodels/login_model.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class LoginView extends StatelessWidget {

  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BaseView<LoginModel>(
        builder: (context, model, child) => 
          Scaffold(

            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                LoginHeader(
                  validationMessage: model.errorMessage,
                  controller: _idController,
                ),

                model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      color: Colors.grey,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        model.login(_idController.text);
                      },
                  )

              ],
            ),

          ),
      ),
    );
  }
}