import 'dart:async';

import 'package:AcPoliticos/src/database/deputadosDados.dart';
import 'package:AcPoliticos/src/database/despesasDados.dart';
import 'package:AcPoliticos/src/models/despesa_deputado.dart';

class GastosBloc {
  DespesaDados despesaDados = DespesaDados();
  DeputadoDados deputadoDados = DeputadoDados();
  var streamController = StreamController<Map<String, dynamic>>.broadcast();
  var _filtroController = StreamController<Map<String, dynamic>>.broadcast();
  StreamSink<Map<String, dynamic>> get despesaEntrada => streamController.sink;
  StreamSink<Map<String, dynamic>> get filtro => _filtroController.sink;
  Stream<Map<String, dynamic>> get despesaSaida => streamController.stream;

  GastosBloc(Map<String, dynamic> formData) {
    _funcaoCalcula(formData);
    _filtroController.stream.listen(_funcaoCalcula);
  }
  void dispose() {
    streamController.close();
    _filtroController.close();
  }

  void getOut() async {
    // List<dynamic> deputados = await deputadoDados.getAllDeputados();
    // despesaEntrada.add(deputados);
  }

  void _funcaoCalcula(Map<String, dynamic> formData) async {
    List<DespesasDeputado> saida = List<DespesasDeputado>();
    var legis = formData['legislativo'];
    var ano = formData['ano'];
    var mes = formData['mes'];
    if (formData['typeSearch'] == "Deputado") {
      saida = await despesaDados.fetchDespesa(
          formData['select'].idDeputado, legis, ano, mes);
    }
    if (formData['typeSearch'] == "UF") {
      var deputado = await deputadoDados.getAllDeputadosbyUf(
          legis, formData['select'].sigla);
      for (var i = 0; i < deputado.length; i++) {
        var despesa = await despesaDados.fetchDespesa(
            deputado[i].idDeputado, legis, ano, mes);
        saida..addAll(despesa);
      }
    }
    if (formData['typeSearch'] == "Partido") {
      var deputado = await deputadoDados.getAllDeputadosbyPartido(
          legis, formData['select'].sigla);
      for (var i = 0; i < deputado.length; i++) {
        var despesa = await despesaDados.fetchDespesa(
            deputado[i].idDeputado, legis, ano, mes);
        saida..addAll(despesa);
      }
    }
    Map<String, List<DespesasDeputado>> depesas =
        Map<String, List<DespesasDeputado>>();
    saida.forEach((e) {
      if (depesas.containsKey(e.tipoDespesa)) {
        depesas[e.tipoDespesa].add(e);
      } else {
        depesas[e.tipoDespesa] = [e];
      }
    });
    despesaEntrada.add(depesas);
  }
}
