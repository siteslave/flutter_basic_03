import 'package:basic_widgets/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class AddPage extends StatefulWidget {
  int id;

  AddPage(this.id);

  @override
  _AddPageState createState() => _AddPageState(this.id);
}

class _AddPageState extends State<AddPage> {
  int id;

  _AddPageState(this.id);

  DateTime dateBirthDate;

  DatabaseHelper databaseHelper = DatabaseHelper.internal();

  final _formKey = GlobalKey<FormState>();

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
        initialDate:
            DateTime(_currentDate.year, _currentDate.month, _currentDate.day),
        firstDate: DateTime(_currentDate.year - 100),
        lastDate:
            DateTime(_currentDate.year, _currentDate.month, _currentDate.day));

    if (_birthDate != null) {
      setState(() {
        var strDate = new DateFormat.MMMMd('th_TH').format(_birthDate) +
            ' ${_birthDate.year + 543}';
        _ctrlBirthDate.text = strDate;
        dateBirthDate = _birthDate;
      });
    }
  }

  String _validateEmail(String value) {
    if (value.isEmpty) return 'กรุณาระบุอีเมล์';

    final RegExp nameExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!nameExp.hasMatch(value)) return 'กรุณาระบุให้ถูกรูปแบบ';
    return null;
  }

  String _validatePhoneNumber(String value) {
    final RegExp phoneExp = new RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value))
      return '(###) ###-#### - Enter a US phone number.';
    return null;
  }

  Future<Null> _saveData() async {
    Member member = new Member();
    if (id != null) {
      member.id = id;
    }
    member.first_name = _ctrlFirstName.text;
    member.last_name = _ctrlLastName.text;
    member.email = _ctrlEmail.text;
    member.telephone = _ctrlTelephone.text;
    member.birth_date = dateBirthDate.toString();

    if (id != null) {
      await databaseHelper.updateMember(member);
    } else {
      await databaseHelper.saveMember(member);
    }

    Navigator.of(context).pop({"refresh": true});
  }

  Future<Null> _getDetail(int id) async {
    var member = await databaseHelper.getDetail(id);

    _ctrlFirstName.text = member[0]['first_name'];
    _ctrlLastName.text = member[0]['last_name'];
    _ctrlBirthDate.text = member[0]['birth_date'];
    _ctrlEmail.text = member[0]['email'];
    _ctrlTelephone.text = member[0]['telephone'];

    var date = DateTime.parse(member[0]['birth_date']);
    var strDate =
        new DateFormat.MMMMd('th_TH').format(date) + ' ${date.year + 543}';
    _ctrlBirthDate.text = strDate;
    dateBirthDate = date;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (id != null) {
      _getDetail(id);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _ctrlTelephone.dispose();
    _ctrlEmail.dispose();
    _ctrlLastName.dispose();
    _ctrlFirstName.dispose();
    _ctrlBirthDate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('เพิ่มผู้ใช้งาน'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _saveData();
                } else {
                  print('Failed');
                }
              },
              icon: Icon(Icons.save),
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'กรุณาระบุชื่อ';
                          }
                        },
                        controller: _ctrlFirstName,
                        decoration: InputDecoration(labelText: 'ชื่อ'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'ระบุนามสกุล';
                          }
                        },
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
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'ระบุวันเกิด';
                    }
                  },
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
                  validator: _validateEmail,
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
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'ระบุหมายเลขโทรศัพท์';
                    }
                  },
                  controller: _ctrlTelephone,
                  keyboardType: TextInputType.phone,
                  decoration:
                      InputDecoration(labelText: 'โทรศัพท์', hintText: ''),
                ),
              ),
            ],
          ),
        ));
  }
}
