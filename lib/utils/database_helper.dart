import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:synchronized/synchronized.dart';

class Member {
  int id;
  String first_name;
  String last_name;
  String birth_date;
  String email;
  String telephone;
  String image;

  Member();

  static final columns = [
    "id",
    "first_name",
    "last_name",
    "email",
    "telephone",
    "birth_date",
  ];

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['first_name'] = first_name;
    map['last_name'] = last_name;
    map['email'] = email;
    map['telephone'] = telephone;
    map['birth_date'] = birth_date;
    map['image'] = image;

    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  static fromMap(Map map) {
    Member member = new Member();
    member.id = map["id"];
    member.first_name = map["first_name"];
    member.last_name = map["last_name"];
    member.email = map["email"];
    member.telephone = map["telephone"];
    member.birth_date = map["birth_date"];
    member.image = map["image"];

    return member;
  }
}

class DatabaseHelper {
  static Database _db;

  final _lock = new Lock();

  final String table = 'members';

  String sqlCreate = '''
  create table if not exists members(
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    first_name TEXT, 
    last_name TEXT, 
    email TEXT, 
    telephone TEXT, 
    birth_date TEXT, 
    image TEXT)
  ''';

  Future<Database> getDb() async {
    if (_db == null) {
      io.Directory documentDirectory = await getApplicationDocumentsDirectory();

      String path = join(documentDirectory.path, 'members.db');

      await _lock.synchronized(() async {
        if (_db == null) {
          _db = await openDatabase(path, version: 1);
        }
      });
    }

    return _db;
  }

  Future initDatabase() async {
    var dbClient = await getDb();
    // Create table
    await dbClient.rawQuery(sqlCreate);
    print('Table is created');
  }

  Future<int> saveMember(Member member) async {
    var dbClient = await getDb();
    return await dbClient.insert('members', member.toMap());
  }

  Future<int> updateMember(Member member) async {
    var dbClient = await getDb();
    return await dbClient.update('members', member.toMap(),
        where: 'id=?', whereArgs: [member.id]);
  }

  Future<List<Map>> fetchAll() async {
    var dbClient = await getDb();
    return await dbClient.query(table);
  }

  Future<int> delete(int id) async {
    var dbClient = await getDb();
    return await dbClient.delete(table, where: 'id=?', whereArgs: [id]);
  }

  Future<List<Map>> getDetail(int id) async {
    var dbClient = await getDb();
    return await dbClient.query(table, where: 'id=?', whereArgs: [id]);
  }

//  Future<List<Map>> fetchAll() async {
//    var dbClient = await getDb();
//    var sql = '''
//      SELECT * FROM activities ORDER BY service_date DESC
//    ''';
//    List<Map> res = await dbClient.rawQuery(sql);
////    await dbClient.close();
//    return res;
//  }
//
  DatabaseHelper.internal();
}
