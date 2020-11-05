import 'package:AcPoliticos/src/models/partido.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import 'databaseHelper.dart';

class PartidoDados {
  final dbHelper = DatabaseHelper.instance;

  Future<void> insertPartido(Partido partido) async {
    final Database db = await dbHelper.database;
    await db.insert(
      'partido',
      partido.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Partido>> getAllPartidos() async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('partido');
    return maps.map<Partido>((json) => new Partido.fromJsonDb(json)).toList();
  }

  Future<List<Partido>> fetchPartidos(int idLegislatura) async {
    final response = await http.get(
        '''https://dadosabertos.camara.leg.br/api/v2/partidos?idLegislatura=$idLegislatura&itens=100000&ordem=ASC&ordenarPor=sigla''');
    if (response.statusCode == 200) {
      var partidosJson = json.decode(response.body);
      var partidos = partidosJson['dados'];
      return partidos
          .map<Partido>((json) => new Partido.fromJson(json, idLegislatura))
          .toList();
    } else {
      throw Exception('Requisição inválida');
    }
  }
}
