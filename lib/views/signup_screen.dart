import 'package:flutter/material.dart';
import 'package:myfirbase/provaider/auth_provaider.dart';
import 'package:myfirbase/views/widgets/custem_textfild.dart';
import 'package:provider/provider.dart';

import '../data/auth_helper.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
        centerTitle: true,
      ),
      body: Consumer<AuthProvaider>(
        builder: (context,provaider,x) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Form(
                  key: provaider.registerKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextfield(
                          title: "Email",
                          textInputType: TextInputType.emailAddress,
                          validator: provaider.emailvaliation,
                          controller: provaider.emailController
                      ),
                      CustomTextfield(
                          title: "Password",
                          validator: provaider.passwrdvaliation,
                          controller: provaider.passwordController
                      ),
                      CustomTextfield(
                          title: "User Name",
                          textInputType: TextInputType.name,
                          validator: provaider.nullvaliation,
                          controller: provaider.userNameController
                      ),

                      CustomTextfield(
                          title: "phone",
                          textInputType: TextInputType.phone,
                          validator: provaider.nullvaliation,
                          controller: provaider.phoneController
                      ),
                      CustomTextfield(
                          title: "city",
                          textInputType: TextInputType.name,
                          validator: provaider.nullvaliation,
                          controller: provaider.cityController
                      ),

                      ElevatedButton(onPressed: (){
                        provaider.register();

                      }, child:Text("SignUp")),




                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
