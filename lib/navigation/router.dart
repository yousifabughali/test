import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter{

  static  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();


  static Future<String?> NavigateToWidget(Widget widget) async {
    String? x = await
    Navigator.of(navKey.currentContext!).push(MaterialPageRoute(builder: (context) { return widget;}));
    return x;
  }

  static NavigateWithReplacemtnToWidget(Widget widget) {
    Navigator.of(navKey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
  static popraoter() {
    Navigator.of(navKey.currentContext!).pop();
  }


}