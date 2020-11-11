import 'package:device_info/device_info.dart';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';

import '../secrets.dart';

// ignore: prefer_mixin
class RedditState with ChangeNotifier {
  Reddit reddit;

  Future<Reddit> anonymous() async {
    reddit = await Reddit.createUntrustedReadOnlyInstance(
      clientId: clientId,
      userAgent: userAgent,
      deviceId: (await DeviceInfoPlugin().androidInfo).androidId,
    );
    return reddit;
  }

  Reddit login() {
    reddit = Reddit.createInstalledFlowInstance(
      clientId: clientId,
      userAgent: userAgent,
      redirectUri: redirectUri,
    );
    return reddit;
  }

  Reddit restore(String credentials) {
    final reddit = Reddit.restoreInstalledAuthenticatedInstance(
      credentials,
      clientId: clientId,
      userAgent: userAgent,
      redirectUri: redirectUri,
    );
    return reddit;
  }
}
