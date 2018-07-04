import 'dart:async';
import 'package:basic_widgets/pages/add_page.dart';
import 'package:flutter/material.dart';
import 'package:basic_widgets/utils/database_helper.dart';

class TabAccount extends StatefulWidget {
  @override
  _TabAccountState createState() => _TabAccountState();
}

class _TabAccountState extends State<TabAccount> {
  DatabaseHelper databaseHelper = DatabaseHelper.internal();

  var _members = [];

  Future _getMembers() async {
    var members = await databaseHelper.fetchAll();
    setState(() {
      _members = members;
    });
  }

  Future _removeMember(int id) async {
    await databaseHelper.delete(id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMembers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return FlatButton(
              onPressed: () async {
                Map result = await Navigator
                    .of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return AddPage(_members[index]['id']);
                }));
                if (result != null) {
                  print(result);
                  _getMembers();
                }
              },
              child: ListTile(
                title: Text(
                    '${_members[index]['first_name']} ${_members[index]['last_name']}'),
                subtitle: Text(_members[index]['email']),
                trailing: IconButton(
                  onPressed: () async {
                    showDialog<Null>(
                        context: context,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            title: Text('ยืนยัน'),
                            content: new SingleChildScrollView(
                              child: new ListBody(
                                children: <Widget>[
                                  Text('ต้องการลบรายการ ใช่หรือไม่',
                                      style: TextStyle(fontSize: 20.0)),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text(
                                  'ยกเลิก',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              new FlatButton(
                                child: new Text(
                                  'ใช่',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  await _removeMember(_members[index]['id']);
                                  await _getMembers();
                                },
                              ),
                            ],
                          );
                        });
                  },
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                  ),
                ),
              ));
        },
        itemCount: _members != null ? _members.length : 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map result = await Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return AddPage(null);
          }));
          if (result != null) {
            print(result);
            _getMembers();
          }
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }
}
