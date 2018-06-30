import 'package:basic_widgets/pages/add_page.dart';
import 'package:basic_widgets/pages/home_page.dart';
import 'package:basic_widgets/pages/setting_page.dart';
import 'package:basic_widgets/pages/account_page.dart';
import 'package:basic_widgets/pages/tab_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BasicWidgets());

class BasicWidgets extends StatefulWidget {
  @override
  _BasicWidgetsState createState() => _BasicWidgetsState();
}

class _BasicWidgetsState extends State<BasicWidgets> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'พื้นฐาน Widgets',
        theme: ThemeData(
          primaryColor: Colors.purple,
          fontFamily: 'Lamoon',
        ),
        routes: <String, WidgetBuilder>{
          '/account': (BuildContext context) => AccountPage(1),
          '/setting': (BuildContext context) => SettingPage(),
          '/add': (BuildContext context) => AddPage(),
        },
        home: TabPage());
  }
}
