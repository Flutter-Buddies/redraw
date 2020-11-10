import 'package:flutter/material.dart';

class HomePage {
  final PreferredSizeWidget appBar;
  final List<Widget> tabs;
  final List<Widget> children;

  HomePage({
    @required this.appBar,
    @required this.tabs,
    @required this.children,
  });
}
