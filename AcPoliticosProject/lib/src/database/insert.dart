import 'package:AcPoliticos/src/database/databaseHelper.dart';
import 'package:AcPoliticos/src/models/legislatura.dart';
import 'package:AcPoliticos/src/models/partido.dart';
import 'package:AcPoliticos/src/models/result_deputado.dart';
import 'package:AcPoliticos/src/models/ufs.dart';
import 'package:sqflite/sqflite.dart';

class Insert {
  final dbHelper = DatabaseHelper.instance;

  Future<void> insertLegis(Legislatura legislatura) async {
    final Database db = await dbHelper.database;
    await db.insert(
      'legislatura',
      legislatura.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertUf(ResultUfs ufs) async {
    final Database db = await dbHelper.database;
    await db.insert(
      'uf',
      ufs.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertDeputado(ResultDeputado deputado) async {
    final Database db = await dbHelper.database;
    await db.insert(
      'deputado',
      deputado.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertPartido(Partido partido) async {
    final Database db = await dbHelper.database;
    await db.insert(
      'partido',
      partido.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> verifica() async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('legislatura');
    return maps.length > 0 ? true : false;
  }
}
