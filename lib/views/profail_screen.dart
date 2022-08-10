import 'package:flutter/material.dart';
import 'package:myfirbase/model/appUser_Model.dart';
import 'package:myfirbase/provaider/auth_provaider.dart';
import 'package:provider/provider.dart';

class ProfailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profail"),

      ),
      body: Consumer<AuthProvaider>(
        builder: (context,provider,x) {
          return SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(provider.appUser!.userName),
                  Text(provider.appUser!.email),
                  Text(provider.appUser!.phone),
                  Text(provider.appUser!.city),
                  ElevatedButton(onPressed: (){
                    provider.signOut();
                  }, child: Text("تسجيل خروج"))
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
