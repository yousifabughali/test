import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myfirbase/provaider/auth_provaider.dart';
import 'package:myfirbase/provaider/firestore_provaider.dart';
import 'package:myfirbase/views/login_screen.dart';
import 'package:myfirbase/views/splach_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'navigation/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (BuildContext context) {
            return  AuthProvider();
          },
        ),
        ChangeNotifierProvider<FirestoreProvaider>(
          create: (BuildContext context) {
            return  FirestoreProvaider();
          },

        ),
      ],
      child: MyApp1(),
    );
  }
}

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRouter.navKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SplachScreen(),
    );
  }
}
