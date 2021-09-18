
import 'package:cant_lib/src/routes/routes_string.dart';
import 'package:cant_lib/src/screens/home_page/home_screen.dart';
import 'package:cant_lib/src/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {

      //ib-Banking-AIBL
      //
      case Routes.HOME:
       
          return CupertinoPageRoute(builder: (context) =>  HomeScreen());
       
        case Routes.LOGIN:
       
          return CupertinoPageRoute(builder: (context) =>  LoginScreen());
       

      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
