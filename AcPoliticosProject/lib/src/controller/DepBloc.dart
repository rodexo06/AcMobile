import 'dart:async';

import 'package:AcPoliticos/src/database/deputadosDados.dart';
import 'package:AcPoliticos/src/database/partidoDados.dart';
import 'package:AcPoliticos/src/database/ufDados.dart';

class DeputadoBloc {
  PartidoDados partidoDados = PartidoDados();
  DeputadoDados deputadoDados = DeputadoDados();
  UfDados ufDados = UfDados();
  var streamController = StreamController<List<dynamic>>.broadcast();
  var _filtroController = StreamController<Map<String, dynamic>>.broadcast();

  StreamSink<List<dynamic>> get _deputadosEntrada => streamController.sink;
  StreamSink<Map<String, dynamic>> get filtro => _filtroController.sink;

  Stream<List<dynamic>> get deputadosSaida => streamController.stream;

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
    List<dynamic> deputados = await deputadoDados.getAllDeputados();
    _deputadosEntrada.add(deputados);
  }

  void _handleAddNote(Map<String, dynamic> formData) async {
    List<dynamic> saida;
    if (formData['typeSearch'] == "Deputado") {
      saida = await deputadoDados.getAllDeputados();
    }
    if (formData['typeSearch'] == "UF") {
      saida = await ufDados.getAllUfs();
    }
    if (formData['typeSearch'] == "Partido") {
      saida = await partidoDados.getAllPartidos();
    }
    _deputadosEntrada.add(saida);
  }
}
