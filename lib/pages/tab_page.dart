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
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ) // See the next step!
        );
  }
}
