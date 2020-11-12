import 'dart:developer' as developer;

import 'package:device_info/device_info.dart';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../secrets.dart';

class RedditService with ChangeNotifier {
  Reddit _reddit;

  RedditService() {
    loginAnonymously();
  }

  Reddit get api => _reddit;

  Reddit login() {
    final reddit = Reddit.createInstalledFlowInstance(
      clientId: clientId,
      userAgent: userAgent,
      redirectUri: redirectUri,
    );

    notifyListeners();
    return reddit;
  }

  Future<Reddit> loginAnonymously() async {
    final uuidv4 = Uuid().v4();
    final androidId = (await DeviceInfoPlugin().androidInfo).androidId;

    developer.log(
      'login anonymously with parameters: '
      '$clientId, $androidId, $uuidv4, $userAgent',
    );

    _reddit = await Reddit.createUntrustedReadOnlyInstance(
      clientId: clientId,
      deviceId: uuidv4,
      userAgent: userAgent,
    );

    notifyListeners();
    return _reddit;
  }

  Reddit restore(String credentials) {
    _reddit = Reddit.restoreInstalledAuthenticatedInstance(
      credentials,
      clientId: clientId,
      userAgent: userAgent,
      redirectUri: redirectUri,
    );
    return _reddit;
  }
}
