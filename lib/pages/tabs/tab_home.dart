import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  List users = [];
  bool loading = true;

  Future<Null> _getUsers() async {
    String url =
        'https://randomuser.me/api/?results=20&inc=gender,name,email,picture';
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse['results']);

        setState(() {
          loading = false;
          users = jsonResponse['results'];
        });
      } else {
        setState(() {
          loading = false;
        });
        print('error');
      }
    } catch (error) {
      print(error);
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return FlatButton(
                  onPressed: () {},
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(users[index]['picture']['medium']),
                    ),
                    title: Text(
                      '${users[index]['name']['title']} ${users[index]['name']['first']} ${users[index]['name']['last']}',
                      style: TextStyle(fontSize: 20.5),
                    ),
                    subtitle: Text(users[index]['email']),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ));
            },
            itemCount: users != null ? users.length : 0,
          );
  }
}
