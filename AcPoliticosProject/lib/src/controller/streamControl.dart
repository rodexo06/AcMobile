import 'dart:async';

import 'package:AcPoliticos/src/database/select.dart';
import 'package:AcPoliticos/src/models/partido.dart';
import 'package:AcPoliticos/src/models/result_deputado.dart';
import 'package:AcPoliticos/src/models/ufs.dart';

class DeputadoBloc {
  var select = Select();
  var streamController = StreamController<List<String>>.broadcast();
  var _filtroController = StreamController<Map<String, dynamic>>.broadcast();

  StreamSink<List<String>> get _deputadosEntrada => streamController.sink;
  StreamSink<Map<String, dynamic>> get filtro => _filtroController.sink;

  Stream<List<String>> get deputadosSaida => streamController.stream;

  DeputadoBloc() {
    getOut();
    _filtroController.stream.listen(_handleAddNote);
  }

  void dispose() {
    streamController.close();
    _filtroController.close();
  }

  void getOut() async {
    // Retrieve all the notes from the database
    List<String> saida = List<String>();
    List<ResultDeputado> deputados = await select.getAllDeputados();
    deputados.forEach((e) => saida.add(e.nome));
    _deputadosEntrada.add(saida);
  }

  void _handleAddNote(Map<String, dynamic> formData) async {
    List<String> saida = List<String>();
    if (formData['typeSearch'] == "Deputado") {
      List<ResultDeputado> deputados = await select.getAllDeputados();
      deputados.forEach((e) => saida.add(e.nome));
    }
    if (formData['typeSearch'] == "UF") {
      List<ResultUfs> ufs = await select.getAllUfs();
      ufs.forEach((e) => saida.add(e.nome));
    }
    if (formData['typeSearch'] == "Partido") {
      List<Partido> partidos = await select.getAllPartidos();
      partidos.forEach((e) => saida.add(e.nome));
    }
    _deputadosEntrada.add(saida);
  }
}
