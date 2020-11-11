import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'providers/reddit_state.dart';
import 'secrets.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reddit = Provider.of<RedditState>(context);

    return Drawer(
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
    );
  }

  void _onDetailsPressed() {
    final reddit = Reddit.createInstalledFlowInstance(
      clientId: clientId,
      userAgent: userAgent,
      redirectUri: redirectUri,
    );

    launch(
      reddit.auth.url([
        "read",
        "save",
        "account",
        "identity",
        "vote",
        "submit",
      ], "redraw-auth").toString(),
    );
  }
}
