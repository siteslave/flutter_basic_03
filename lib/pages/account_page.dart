import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  var id;

  AccountPage(this.id);

  @override
  _AccountPageState createState() => _AccountPageState(this.id);
}

class _AccountPageState extends State<AccountPage> {
  var id;

  _AccountPageState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
      ),
      body: Text('ข้อมูลส่วนตัว'),
    );
  }
}
