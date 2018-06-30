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
    TextStyle myStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

    // Step 0
    AppBar appBar = AppBar(
      title: Text('Basic Scaffold'),
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
      title: 'Basic widgets',
      theme: ThemeData(primaryColor: Colors.purple),
      home: Scaffold(
        appBar: appBar,
        body: pages[pageIndex],
//        floatingActionButton: floatingActionButton,
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text('Add'),
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
    return Center(
      child: Text('Home page'),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Account page'),
    );
  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Setting page'),
    );
  }
}
