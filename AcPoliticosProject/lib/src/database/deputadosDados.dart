import 'package:AcPoliticos/src/models/result_deputado.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import 'databaseHelper.dart';

class DeputadoDados {
  final dbHelper = DatabaseHelper.instance;

  Future<void> insertDeputado(ResultDeputado deputado) async {
    final Database db = await dbHelper.database;
    await db.insert(
      'deputado',
      deputado.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ResultDeputado>> getAllDeputadosbyLegis(String idLegis) async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db
        .rawQuery('SELECT * FROM deputado where id_legislatura = ?', [idLegis]);
    return maps
        .map<ResultDeputado>((json) => new ResultDeputado.fromJsonDb(json))
        .toList();
  }

  Future<List<ResultDeputado>> getAllDeputadosbyUf(
      String idLegis, String siglaUf) async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM deputado where id_legislatura = $idLegis and sigla_uf = '$siglaUf'");
    return maps
        .map<ResultDeputado>((json) => new ResultDeputado.fromJsonDb(json))
        .toList();
  }

  Future<List<ResultDeputado>> getAllDeputadosbyPartido(
    String idLegis,
    String siglaPartido,
  ) async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM deputado where id_legislatura =  $idLegis and sigla_partido = '$siglaPartido'");
    return maps
        .map<ResultDeputado>((json) => new ResultDeputado.fromJsonDb(json))
        .toList();
  }

  Future<List<ResultDeputado>> getAllDeputados() async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('deputado');
    return maps
        .map<ResultDeputado>((json) => new ResultDeputado.fromJsonDb(json))
        .toList();
  }

  Future<List<ResultDeputado>> fetchDeputados(int idLegislatura) async {
    // Enviar requisição para dados abertos e obter response para armazenar num modelo de dados
    final response = await http.get(
        'https://dadosabertos.camara.leg.br/api/v2/deputados?idLegislatura=$idLegislatura&itens=100000&ordem=ASC&ordenarPor=nome');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['dados'];
      return jsonData
          .map<ResultDeputado>((json) => new ResultDeputado.fromJson(json))
          .toList();
    } else {
      throw Exception('Requisição inválida');
    }
  }
}
