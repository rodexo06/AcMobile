import 'package:AcPoliticos/src/database/databaseHelper.dart';
import 'package:AcPoliticos/src/models/legislatura.dart';
import 'package:AcPoliticos/src/models/partido.dart';
import 'package:AcPoliticos/src/models/result_deputado.dart';
import 'package:AcPoliticos/src/models/ufs.dart';
import 'package:sqflite/sqflite.dart';

class Select {
  final dbHelper = DatabaseHelper.instance;

  Future<List<Legislatura>> getAllLegislaturas() async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('legislatura');
    return maps
        .map<Legislatura>((json) => new Legislatura.fromJsonDb(json))
        .toList();
  }

  Future<List<Partido>> getAllPartidos() async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('partido');
    return maps.map<Partido>((json) => new Partido.fromJsonDb(json)).toList();
  }

  Future<List<ResultDeputado>> getAllDeputados() async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('deputado');
    return maps
        .map<ResultDeputado>((json) => new ResultDeputado.fromJsonDb(json))
        .toList();
  }

  Future<List<ResultDeputado>> getAllDeputadosbyLegis(String idLegis) async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db
        .rawQuery('SELECT * FROM deputado where id_legislatura = ?', [idLegis]);
    return maps
        .map<ResultDeputado>((json) => new ResultDeputado.fromJsonDb(json))
        .toList();
  }

  Future<List<ResultUfs>> getAllUfs() async {
    final Database db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('uf');
    return maps
        .map<ResultUfs>((json) => new ResultUfs.fromJsonDb(json))
        .toList();
  }
}
