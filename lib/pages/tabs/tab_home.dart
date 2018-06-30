import 'package:flutter/material.dart';

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return FlatButton(
            onPressed: () {},
            child: ListTile(
              title: Text(
                'User index $index',
                style: TextStyle(fontSize: 20.5),
              ),
              subtitle: Text('yyyyyyy'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ));
      },
      itemCount: 10,
    );
  }
}
