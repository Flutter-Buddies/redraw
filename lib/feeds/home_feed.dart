import 'package:flutter/material.dart';

import '../enums/sort.dart';

class HomeFeed extends StatefulWidget {
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  SortValue _selection = SortValue.best;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              PopupMenuButton<SortValue>(
                initialValue: _selection,
                child: Text(homeSorts[_selection].text),
                onSelected: (result) => setState(() => _selection = result),
                itemBuilder: (context) => homeSorts.values
                    .map((value) => PopupMenuItem<SortValue>(
                          value: value.value,
                          child: Text(value.text),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
