import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:myfirbase/data/auth_helper.dart';
import 'package:myfirbase/data/firestore_helper.dart';
import 'package:myfirbase/model/appUser_Model.dart';
import 'package:myfirbase/navigation/router.dart';
import 'package:myfirbase/views/home_screen.dart';
import 'package:myfirbase/views/profail_screen.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

import '../views/login_screen.dart';

class AuthProvaider extends ChangeNotifier{
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  AppUser? appUser;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  nullvaliation(String? v){
    if(v == null || v.isEmpty){
      return"هذ الحقل مطلوب";
    }
  }
  passwrdvaliation(String v){
    if(v.isEmpty){
      return"هذه الحقل مطلوب";
    }
    else if(v.length < 6){
      return"يجب ان تكون كلمة المرور مكونة من 6 احرف عل الأقل";
    }
  }
  String? emailvaliation(String? v){
    if(v.isEmpty){
      return"هذه الحقل مطلوب";
    }
    else if(!isEmail(v)){
      return"صيغة ايميل خاطئة";
    }
  }
  signIn()async{
    if(loginKey.currentState!.validate()){
      UserCredential? userCredential =    await AuthHelper.authHelper.signIn(emailController.text, passwordController.text);
      appUser = await FirestoreHelper.firestoreHelper.getUserFromFirestore(userCredential!.user!.uid);

    if(userCredential != null){
      AppRouter.NavigateToWidget(ProfailScreen());
      passwordController.text = "";
      emailController.text = "";
    }
    }

  }
  register()async{
    if(registerKey.currentState!.validate()){
    UserCredential? userCredential = await AuthHelper.authHelper.signUp(emailController.text, passwordController.text);
    appUser = AppUser(email: emailController.text, userName: userNameController.text, city: cityController.text, phone: phoneController.text);
    await FirestoreHelper.firestoreHelper.addUserToFirestore(appUser!);
    if(userCredential != null){
      AppRouter.NavigateToWidget(ProfailScreen());
      passwordController.text = "";
      emailController.text = "";

    }
    }
  }

  checUser(){
     AuthHelper.authHelper.checUser();
    // if(id == null){
    //   AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
    // }
    // else{
    //   appUser = await FirestoreHelper.firestoreHelper.getUserFromFirestore(id);
    //   Provider.of<AuthProvaider>(AppRouter.navKey.currentContext!,listen: false).appUser = appUser;
    //   AppRouter.NavigateWithReplacemtnToWidget(ProfailScreen());
    // }
  }

  signOut(){
     AuthHelper.authHelper.signOut();
  }





}