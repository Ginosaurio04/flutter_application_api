import 'dart:math';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final items = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
        icon: Icon(Icons.contact_mail),
        label: 'Info',
      ),
    ];

    final validatedIndex = max(0, min(currentIndex, items.length - 1));

    return BottomNavigationBar(
      items: items,
      backgroundColor: Colors.black,
      currentIndex: validatedIndex,
      selectedItemColor: const Color.fromARGB(255, 76, 175, 80),
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/info');
            break;
        }
      },
    );
  }
}
