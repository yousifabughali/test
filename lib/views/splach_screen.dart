import 'package:flutter/material.dart';
import 'package:myfirbase/data/auth_helper.dart';
import 'package:myfirbase/provaider/auth_provaider.dart';
import 'package:provider/provider.dart';

import '../navigation/router.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({Key? key}) : super(key: key);

  fun(BuildContext context)async{
    await  Future.delayed(Duration(seconds: 5));
      AuthHelper.authHelper.checUser();
  }


  @override
  Widget build(BuildContext context) {
    fun(context);
    return Scaffold(
      body: Center(
        child: Text("Splach",style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
