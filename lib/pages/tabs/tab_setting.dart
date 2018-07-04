import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:basic_widgets/pages/camera.dart';

class TabSetting extends StatefulWidget {
  List<CameraDescription> cameras;

  TabSetting(this.cameras);

  @override
  _TabSettingState createState() => _TabSettingState(this.cameras);
}

class _TabSettingState extends State<TabSetting> {
  List<CameraDescription> cameras;

  _TabSettingState(this.cameras);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Text('Satit Rianpit'),
            subtitle: Text('rianpit@gmail.com'),
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text('AB'),
            ),
            trailing: PopupMenuButton<String>(
              onSelected: _showMenuSelection,
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    const PopupMenuItem<String>(
                        value: 'EDIT_PERSON',
                        child: ListTile(
                          leading: Icon(Icons.edit),
                          title: Text(
                            'แก้ไขข้อมูลส่วนตัว',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )),
                    const PopupMenuItem<String>(
                        enabled: false,
                        value: 'CHANGE_PASSWORD',
                        child: ListTile(
                          leading: Icon(Icons.vpn_key),
                          title: Text(
                            'เปลี่ยนรหัสผ่าน',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )),
                    const PopupMenuItem<String>(
                        enabled: true,
                        value: 'CHANGE_IMAGE',
                        child: ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text(
                            'เปลี่ยนรูปภาพ',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )),
                  ],
            ),
          ),
        )
      ],
    );
  }

  void _showMenuSelection(String value) {
    if (value == 'CHANGE_IMAGE') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CameraPage(cameras)));
    }
  }
}
