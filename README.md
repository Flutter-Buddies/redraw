# Redraw

Redraw is a Reddit client built with Flutter that focuses on simplicity by
re-drawing the official Reddit app's interface.

## Build

You'll need a `lib/secrets.dart` file with the following information.

```dart
/// `clientId` is the identifier associated with your authorized application on
/// Reddit. To get a client ID, create an authorized application
/// [here](http://www.reddit.com/prefs/apps).
const String clientId = "";

/// `userAgent` is an arbitrary identifier used by the Reddit API to
/// differentiate between client instances. This should be relatively unique.
const String userAgent = "";

/// [redirectUri] is the redirect URI associated with your Reddit application.
final Uri redirectUri = Uri.parse("");
```
