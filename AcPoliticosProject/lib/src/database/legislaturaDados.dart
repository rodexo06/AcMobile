import 'package:AcPoliticos/src/database/databaseHelper.dart';
import 'package:AcPoliticos/src/models/legislatura.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sqflite/sqflite.dart';

class LegislaturaDados {
  final dbHelper = DatabaseHelper.instance;

  Future<bool> verifica() async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('legislatura');
    return maps.length > 0 ? true : false;
  }

  Future<void> insertLegis(Legislatura legislatura) async {
    final Database db = await dbHelper.database;
    await db.insert(
      'legislatura',
      legislatura.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Legislatura>> getAllLegislaturas() async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('legislatura');
    return maps
        .map<Legislatura>((json) => new Legislatura.fromJsonDb(json))
        .toList();
  }

  Future<List<Legislatura>> fetchLegislatura() async {
    final response = await http.get(
        'https://dadosabertos.camara.leg.br/api/v2/legislaturas?ordem=DESC');
    if (response.statusCode == 200) {
      var legislaturaJson = json.decode(response.body)['dados'];
      return legislaturaJson
          .map<Legislatura>((json) => new Legislatura.fromJson(json))
          .toList();
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
