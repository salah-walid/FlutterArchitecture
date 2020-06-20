import 'package:Architecture/core/viewmodels/home_model.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BaseView<HomeModel>(
        builder: (context, model, child) => 
          Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[

                  model.showUser(),

                  SizedBox(height: 20,),

                  MaterialButton(
                    onPressed: model.goBack,
                    child: Icon(Icons.backspace),
                  ),

                  MaterialButton(
                    onPressed: model.showDialog,
                    child: Text("Show dialog", style: TextStyle(fontSize: 20),),
                    color: Colors.grey,
                  ),

                ],

              ),
            ),
          ),
      ),
    );
  }
}