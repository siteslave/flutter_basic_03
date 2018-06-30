import 'dart:io';
import 'package:basic_widgets/pages/setting_page.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        // The number of tabs / content sections we need to display
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'หน้าหลัก',
                ),
                Tab(icon: Icon(Icons.account_circle), text: 'สมาชิก'),
                Tab(
                  icon: Icon(Icons.settings),
                  text: 'ตั้งค่า',
                ),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.home),
              Icon(Icons.account_circle),
              Icon(Icons.settings),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('Satit Rianpit'),
                  accountEmail: Text('rianpit@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/med/women/2.jpg'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('หน้าหลัก'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('ข้อมูลสมาชิก'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/account');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('ตั้งค่าการใช้งาน'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SettingPage()));
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('ออกจากแอพลิเคชั่น'),
                  onTap: () => exit(0),
                ),
              ],
            ),
          ),
        ) // See the next step!
        );
  }
}
