import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  DateTime dateBirthDate;

  String strFirstName;
  String strLastName;
  String strEmail;
  String strTelephone;
  String strBirthDate;

  TextEditingController _ctrlFirstName = TextEditingController();
  TextEditingController _ctrlLastName = TextEditingController();
  TextEditingController _ctrlEmail = TextEditingController();
  TextEditingController _ctrlTelephone = TextEditingController();
  TextEditingController _ctrlBirthDate = TextEditingController();

  void _showDatePicker() async {
    DateTime _currentDate = DateTime.now();
    DateTime _birthDate = await showDatePicker(
        // locale: const Locale('th'),
        context: context,
        initialDate: DateTime(_currentDate.year),
        firstDate: DateTime(_currentDate.year - 100),
        lastDate: DateTime(_currentDate.year));

    if (_birthDate != null) {
      setState(() {
        var strDate = new DateFormat.MMMMd('th_TH').format(_birthDate) +
            ' ${_birthDate.year + 543}';
        _ctrlBirthDate.text = strDate;
        dateBirthDate = _birthDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('เพิ่มผู้ใช้งาน'),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.save),
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onFieldSubmitted: (String value) {},
                      controller: _ctrlFirstName,
                      decoration: InputDecoration(labelText: 'ชื่อ'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _ctrlLastName,
                      decoration: InputDecoration(
                        labelText: 'สกุล',
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _ctrlBirthDate,
                decoration: InputDecoration(
                    labelText: 'วันเกิด',
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.date_range),
                      onTap: () => _showDatePicker(),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _ctrlEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'อีเมล์',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _ctrlTelephone,
                keyboardType: TextInputType.phone,
                decoration:
                    InputDecoration(labelText: 'โทรศัพท์', hintText: ''),
              ),
            ),
          ],
        ));
  }
}
