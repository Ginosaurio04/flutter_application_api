import 'package:flutter/material.dart';
import 'package:flutter_application_api/screens/home_screen.dart';

class AppRoutes {
  static const initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      '/home': (BuildContext context) => const HomeScreen(title: 'Home'),
    });

    return appRoutes;
  }
}
