import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/reddit.service.dart';

class DrawerInfo {
  final String accountName;
  final String accountEmail;
  final Widget currentAccountPicture;

  DrawerInfo({
    @required this.accountName,
    @required this.accountEmail,
    @required this.currentAccountPicture,
  });
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reddit = Provider.of<RedditService>(context);
    final drawerInfo = _getDrawerInfo(reddit);

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: drawerInfo.currentAccountPicture,
            accountName: Text(drawerInfo.accountName),
            accountEmail: Text(drawerInfo.accountEmail),
            onDetailsPressed: () => _onDetailsPressed(reddit),
          ),
          AboutListTile(
            applicationName: "Redraw",
            applicationVersion: "0.0.0",
          )
        ],
      ),
    );
  }

  DrawerInfo _getDrawerInfo(RedditService reddit) {
    if (!reddit.api.readOnly) {
      return DrawerInfo(
        accountName: 'Anonymous',
        accountEmail: '',
        currentAccountPicture: CircleAvatar(
          child: LayoutBuilder(
            builder: (context, constraint) => Icon(
              Icons.account_circle,
              size: constraint.biggest.height,
            ),
          ),
        ),
      );
    }

    return DrawerInfo(
      accountName: 'Anonymous',
      accountEmail: '',
      currentAccountPicture: CircleAvatar(
        child: LayoutBuilder(
          builder: (context, constraint) => Icon(
            Icons.account_circle,
            size: constraint.biggest.height,
          ),
        ),
      ),
    );
  }

  void _onDetailsPressed(RedditService reddit) async {
    // developer.log('service: ${reddit.api}');

    // const subreddits = <Subreddit>[];
    // try {
    //   await for (final value in reddit.api.user.subreddits()) {
    //     subreddits.add(value);
    //   }
    // } on Exception catch (e) {
    //   developer.log('Failed to get all subreddits', error: e);
    // }

    // final displayNames = subreddits.map((e) => e.displayName).join(', ');
    // developer.log('subreddits: $displayNames');
  }
}
