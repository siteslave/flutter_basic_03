import 'package:basic_widgets/pages/account_page.dart';
import 'package:basic_widgets/pages/setting_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Step 2
  int pageIndex = 0; // first page

  @override
  Widget build(BuildContext context) {
    TextStyle myStyle = TextStyle(
      fontSize: 25.0,
    );

    // Step 0
    AppBar appBar = AppBar(
      title: Text(
        'พื้นฐาน Widgets',
        style: myStyle,
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AccountPage(1)))),
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context).pushNamed('/setting')),
      ],
    );

    // Step 1
    FloatingActionButton floatingActionButton = FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
      backgroundColor: Colors.red,
    );

    FloatingActionButton floatingActionButtonExtend =
        FloatingActionButton.extended(
      backgroundColor: Colors.red,
      icon: const Icon(Icons.add),
      label: const Text(
        'เพิ่ม',
        style: TextStyle(fontSize: 20.0),
      ),
      onPressed: () => Navigator.of(context).pushNamed('/add'),
    );
    // Step 2

    BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('Account')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Settings')),
        ]);

    // Step 3

    BottomAppBar bottomAppBar = BottomAppBar(
        hasNotch: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.purple,
                ),
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                }),
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.purple,
                ),
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                }),
          ],
        ));

    return Scaffold(
      appBar: appBar,
      body: pageIndex == 1 ? AccountPage(1) : SettingPage(),
      floatingActionButton: floatingActionButtonExtend,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomAppBar,
    );
  }
}
