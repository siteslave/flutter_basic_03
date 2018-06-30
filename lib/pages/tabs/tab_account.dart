import 'package:flutter/material.dart';

class TabAccount extends StatefulWidget {
  @override
  _TabAccountState createState() => _TabAccountState();
}

class _TabAccountState extends State<TabAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('yyyy'),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            ),
          );
        },
        itemCount: 5,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/add'),
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }
}
