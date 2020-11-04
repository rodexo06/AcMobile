import 'package:AcPoliticos/src/models/ufs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import 'databaseHelper.dart';

class UfDados {
  final dbHelper = DatabaseHelper.instance;

  Future<void> insertUf(ResultUfs ufs) async {
    final Database db = await dbHelper.database;
    await db.insert(
      'uf',
      ufs.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ResultUfs>> getAllUfs() async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('uf');
    return maps
        .map<ResultUfs>((json) => new ResultUfs.fromJsonDb(json))
        .toList();
  }

  static Future<List<ResultUfs>> fetchUf() async {
    final response = await http
        .get('https://servicodados.ibge.gov.br/api/v1/localidades/estados');
    if (response.statusCode == 200) {
      var ufsJson = json.decode(response.body);
      return ufsJson
          .map<ResultUfs>((json) => new ResultUfs.fromJson(json))
          .toList();
      // ignore: omit_local_variable_types
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
