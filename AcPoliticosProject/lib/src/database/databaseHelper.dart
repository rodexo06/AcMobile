import 'dart:io';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  initDb() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "database.db");
    var exists = await databaseExists(path);
    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets", "database.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    } else {}
    return await openDatabase(path);
  }
}
