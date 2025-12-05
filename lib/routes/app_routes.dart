import 'package:flutter/material.dart';
import 'package:flutter_application_api/screens/Info_screen.dart';
import 'package:flutter_application_api/screens/home_screen.dart';

class AppRoutes {
  static const initialRoute = '/home';

  static final menuOptions = [
    {
      'route': '/home',
      'name': 'Home Screen',
      'screen': const HomeScreen(title: 'Rick and Morty Enciclopedia'),
    },
    {
      'route': '/info',
      'name': 'Info Screen',
      'screen': const InfoScreen(title: 'Contacto'),
    },
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      '/home': (BuildContext context) =>
          const HomeScreen(title: 'Rick and Morty Enciclopedia'),
      '/info': (BuildContext context) => const InfoScreen(title: 'Contacto'),
    });

    return appRoutes;
  }
}
