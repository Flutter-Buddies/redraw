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
        bottom: TabBar(
          tabs: [
            Tab(text: "Home"),
            Tab(text: "Popular"),
          ],
        ),
      ),
      children: [
        Center(),
        Center(),
      ],
      length: 2,
    ),
    HomePage(
      appBar: AppBar(
        title: Text("Subreddits"),
        bottom: TabBar(
          tabs: [
            Tab(text: "Subscriptions"),
            Tab(text: "Custom Feeds"),
          ],
        ),
      ),
      children: [
        Center(),
        Center(),
      ],
      length: 2,
    ),
    HomePage(
      appBar: AppBar(
        title: Text("Create"),
        bottom: TabBar(
          tabs: [],
        ),
      ),
      children: [],
      length: 0,
    ),
    HomePage(
      appBar: AppBar(
        title: Text("Messages"),
        bottom: TabBar(
          tabs: [
            Tab(text: "Notifications"),
            Tab(text: "Messages"),
            Tab(text: "Mod mail"),
          ],
        ),
      ),
      children: [
        Center(),
        Center(),
        Center(),
      ],
      length: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages[_pageIndex].length,
      child: Scaffold(
        appBar: _pages[_pageIndex].appBar,
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: LayoutBuilder(
                    builder: (context, constraint) => Icon(
                      Icons.account_circle,
                      size: constraint.biggest.height,
                    ),
                  ),
                ),
                accountName: Text('Anonymous'),
                accountEmail: Text(''),
                onDetailsPressed: _onDetailsPressed,
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
              activeIcon: Icon(Icons.add_circle),
              icon: Icon(Icons.add_circle_outline),
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

  @override
  void initState() {
    super.initState();
  }

  void _onDetailsPressed() async {}

  void _onTapNavigation(int index) {
    setState(() {
      _pageIndex = index;
    });
  }
}
