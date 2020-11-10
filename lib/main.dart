import 'package:flutter/material.dart';

import 'home_page.dart';

void main() async {
  runApp(RedrawApp());
}

class RedrawApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redraw',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: RedrawPage(),
    );
  }
}

class RedrawPage extends StatefulWidget {
  RedrawPage({Key key}) : super(key: key);

  @override
  _RedrawPageState createState() => _RedrawPageState();
}

class _RedrawPageState extends State<RedrawPage> {
  int _pageIndex = 0;

  final List<HomePage> _pages = [
    HomePage(
      appBar: AppBar(
        title: Text("Home"),
      ),
      tabs: [
        Tab(text: "Home"),
        Tab(text: "Popular"),
      ],
      children: [
        Center(),
        Center(),
      ],
    ),
    HomePage(
      appBar: AppBar(
        title: Text("Subreddits"),
      ),
      tabs: [
        Tab(text: "Home"),
        Tab(text: "Popular"),
      ],
      children: [
        Center(),
        Center(),
      ],
    ),
    HomePage(
      appBar: AppBar(
        title: Text("Home"),
      ),
      tabs: [
        Tab(text: "Home"),
        Tab(text: "Popular"),
      ],
      children: [
        Center(),
        Center(),
      ],
    ),
    HomePage(
      appBar: AppBar(
        title: Text("Home"),
      ),
      tabs: [
        Tab(text: "Home"),
        Tab(text: "Popular"),
      ],
      children: [
        Center(),
        Center(),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages[_pageIndex].tabs.length,
      child: Scaffold(
        appBar: _pages[_pageIndex].appBar,
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.account_circle),
                ),
                accountName: Text('Anonymous'),
                accountEmail: Text(''),
              ),
              AboutListTile(
                applicationName: "Redraw",
                applicationVersion: "0.0.0",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: _pages[_pageIndex].children,
        ),
        bottomNavigationBar: BottomNavigationBar(
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
              activeIcon: Icon(Icons.add),
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: "Messages",
              activeIcon: Icon(Icons.mail),
              icon: Icon(Icons.mail_outline),
            )
          ],
          currentIndex: _pageIndex,
          onTap: _onTapNavigation,
        ),
      ),
    );
  }

  void _onTapNavigation(int index) {
    setState(() {
      _pageIndex = index;
    });
  }
}
