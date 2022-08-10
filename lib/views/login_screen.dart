

import 'package:flutter/material.dart';
import 'package:myfirbase/data/auth_helper.dart';
import 'package:myfirbase/data/firestore_helper.dart';
import 'package:myfirbase/model/appUser_Model.dart';
import 'package:myfirbase/provaider/auth_provaider.dart';
import 'package:myfirbase/provaider/firestore_provaider.dart';
import 'package:myfirbase/views/profail_screen.dart';
import 'package:myfirbase/views/signup_screen.dart';
import 'package:myfirbase/views/widgets/custem_textfild.dart';
import 'package:provider/provider.dart';

import '../navigation/router.dart';

class LoginScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvaider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Sign-In',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: Form(
              key: provider.loginKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: provider.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          label: Text('E-mail'), border: OutlineInputBorder()),
                      validator: provider.emailValidation,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: provider.passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          label: Text('Password'),
                          border: OutlineInputBorder()),
                      validator: provider.passwordValidation,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        provider.signIn();
                      },
                      child: Text('Sign In'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        provider.signUp();
                      },
                      child: Text('Sign Up'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        provider.forgetPassword();
                      },
                      child: Text('Forget Password?'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

  }
}
