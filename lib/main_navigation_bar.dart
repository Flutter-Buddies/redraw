import 'dart:core';

import 'package:flutter/material.dart';

class MainNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MainNavigationBar({
    Key key,
    @required this.currentIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: "Home",
          activeIcon: Icon(Icons.home_filled),
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: "Subreddits",
          activeIcon: Icon(Icons.list),
          icon: Icon(Icons.list_outlined),
        ),
        BottomNavigationBarItem(
          label: "Create",
          activeIcon: Icon(Icons.add_circle),
          icon: Icon(Icons.add_circle_outline),
        ),
        BottomNavigationBarItem(
          label: "Messages",
          activeIcon: Icon(Icons.mail),
          icon: Icon(Icons.mail_outline),
        )
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
