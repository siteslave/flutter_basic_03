import 'package:flutter/material.dart';

void main() => runApp(BasicWidgets());

class BasicWidgets extends StatefulWidget {
  @override
  _BasicWidgetsState createState() => _BasicWidgetsState();
}

class _BasicWidgetsState extends State<BasicWidgets> {
  @override
  Widget build(BuildContext context) {
    TextStyle myStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

    return MaterialApp(
      title: 'Basic widgets',
      theme: ThemeData(primaryColor: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic widgets'),
        ),
        body: Center(
          child: Text(
            'Welcome to Flutter!!!',
            style: myStyle,
          ),
        ),
      ),
    );
  }
}
