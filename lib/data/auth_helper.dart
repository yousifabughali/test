import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirbase/data/firestore_helper.dart';
import 'package:myfirbase/model/appUser_Model.dart';
import 'package:myfirbase/navigation/router.dart';
import 'package:myfirbase/provaider/auth_provaider.dart';
import 'package:myfirbase/views/login_screen.dart';
import 'package:myfirbase/views/profail_screen.dart';
import 'package:myfirbase/views/signup_screen.dart';
import 'package:myfirbase/views/widgets/dialog.dart';
import 'package:provider/provider.dart';

import '../provaider/firestore_provaider.dart';
import '../views/home_screen.dart';

class AuthHelper {

  AuthHelper._();

  static AuthHelper authHelper = AuthHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signUp(String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomDialog.showDialogfunction('The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }

 Future<UserCredential?>  signIn(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialog.showDialogfunction('No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomDialog.showDialogfunction('Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }

  }

   checUser() async {
   User? user =   firebaseAuth.currentUser;
   if(user == null){
     AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
   }else{
     AppRouter.NavigateToWidget(HomeScreen());
   }
  }

  signOut()async{
    await firebaseAuth.signOut();
    AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());

  }

  ForgetPassurd(String email)async{}

  }