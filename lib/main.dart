import 'package:flutter/material.dart';

void main() => runApp(BasicWidgets());

class BasicWidgets extends StatefulWidget {
  @override
  _BasicWidgetsState createState() => _BasicWidgetsState();
}

class _BasicWidgetsState extends State<BasicWidgets> {
  // Step 2
  int pageIndex = 0; // first page
  List<Widget> pages = [HomePage(), AccountPage(), SettingPage()];

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
            onPressed: () {
              print('Account Clicked!');
            }),
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('Setting Clicekd!');
            }),
      ],
    );

    // Step 1
    FloatingActionButton floatingActionButton = FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
      backgroundColor: Colors.red,
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
                  Icons.home,
                  color: Colors.purple,
                ),
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
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

    return MaterialApp(
      title: 'พื้นฐาน Widgets',
      theme: ThemeData(
        primaryColor: Colors.purple,
        fontFamily: 'Lamoon',
      ),
      home: Scaffold(
        appBar: appBar,
        body: pages[pageIndex],
//        floatingActionButton: floatingActionButton,
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text(
            'เพิ่ม',
            style: TextStyle(fontSize: 25.0),
          ),
          backgroundColor: Colors.purple,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//        bottomNavigationBar: bottomNavigationBar,
        bottomNavigationBar: bottomAppBar,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Row rowWidget = Row(
      children: <Widget>[
        Expanded(
            child: Container(
          color: Colors.orange,
        )),
        Expanded(
            child: Container(
          color: Colors.pink,
        )),
        Expanded(
            child: Container(
          color: Colors.teal,
        )),
      ],
    );

    Column columnWidget = Column(
      children: <Widget>[
        Container(
          color: Colors.red,
          height: 100.0,
        ),
        Container(
          color: Colors.green,
          height: 100.0,
        ),
        Container(
          color: Colors.blue,
          height: 100.0,
        ),
        Expanded(
          child: rowWidget,
        )
      ],
    );

    return columnWidget;
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('จัดการข้อมูลส่วนตัว'),
    );
  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ตั้งค่าการใช้งาน'),
    );
  }
}
