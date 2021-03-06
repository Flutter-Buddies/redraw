import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feeds/home_feed.dart';
import 'home_page.dart';
import 'main_drawer.dart';
import 'main_navigation_bar.dart';
import 'services/reddit.service.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RedditService>(
      create: (_) => RedditService(),
      lazy: false,
      child: MaterialApp(
        title: 'Redraw',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

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
        HomeFeed(),
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
      length: _pages[_currentIndex].length,
      child: Scaffold(
        appBar: _pages[_currentIndex].appBar,
        drawer: MainDrawer(),
        body: TabBarView(
          children: _pages[_currentIndex].children,
        ),
        bottomNavigationBar: MainNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTapNavigation,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void _onTapNavigation(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
