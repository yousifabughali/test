import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfirbase/model/appUser_Model.dart';

class FirestoreHelper{
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();

  CollectionReference<Map<String, dynamic>> firestoreinstance = FirebaseFirestore.instance.collection("user");

  addUserToFirestore(AppUser appUser)async{
     await firestoreinstance.doc(appUser.id).set(appUser.toMap());
  }

  Future<AppUser> getUserFromFirestore(String id)async{
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestoreinstance.doc(id).get();
    Map<String, dynamic>? dataMap = documentSnapshot.data();
    return AppUser.fromeMap(dataMap!);

  }



  Future<List<AppUser>>   getAllUserFromFirestore1()async{
    QuerySnapshot<Map<String, dynamic>> documentSnapshots = await firestoreinstance.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> data = documentSnapshots.docs;
    List<Map<String, dynamic>> listData =  data.map((e) => e.data()).toList();
    print(listData);
    AppUser appUser = AppUser.fromeMap(listData[0]);
    List<AppUser> users = List<AppUser>.filled(listData.length, appUser);
    for(int i = 0;i<listData.length;i++){
     users[i]  =  AppUser.fromeMap(listData[i]) ;
     print(users[i].toMap());
    }

   return users;


  }

  Future<List> getAllUserFromFirestore2()async{
    QuerySnapshot<Map<String, dynamic>> documentSnapshots = await firestoreinstance.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> data = documentSnapshots.docs;
    List<Map<String, dynamic>> listData =  data.map((e) => e.data()).toList();

    Map<int,dynamic> mapuser = Map();

    for(int i = 0;i<listData.length;i++){
      mapuser[i] = {i, AppUser.fromeMap(listData[0])};
    }

    List users = mapuser.values.toList();
    return users;
  }







}