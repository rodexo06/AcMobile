import 'package:AcPoliticos/src/models/despesa_deputado.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'databaseHelper.dart';

class DespesaDados {
  final dbHelper = DatabaseHelper.instance;

  Future<Map> fetchDespesa(
      {int id, int idLegislatura, int ano, int mes}) async {
    final response = await http.get(
        'https://dadosabertos.camara.leg.br/api/v2/deputados/$id/despesas?idLegislatura=$idLegislatura&ano=$ano&mes=$mes&itens=10000&ordem=ASC&ordenarPor=ano');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['dados'];
      return jsonData
          .map<DespesasDeputado>((json) => new DespesasDeputado.fromJson(json))
          .toList();
    } else {
      throw Exception('Requisão Inválida');
    }
  }

  static Future<Map> fetchDespesaPereira(
      {int id, int idLegislatura, int ano, int mes}) async {
    final response = await http.get(
        'https://dadosabertos.camara.leg.br/api/v2/deputados/$id/despesas?idLegislatura=$idLegislatura&ano=$ano&mes=$mes&itens=10000&ordem=ASC&ordenarPor=ano');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      // ignore: omit_local_variable_types
      List<DespesasDeputado> despesa = [];
      for (var u in jsonData['dados']) {
        var despesaDep = DespesasDeputado(
            u['ano'],
            u['mes'],
            u['cnpjCpfFornecedor'],
            u['tipoDespesa'],
            u['codDocumento'],
            u['dataDocumento'],
            u['numDocumento'],
            u['valorDocumento'],
            u['urlDocumento'],
            u['nomeFornecedor'],
            u['valorLiquido'],
            u['valorGlosa'],
            u['codLote'],
            u['parcela']);
        despesa.add(despesaDep);
      }
      // ignore: prefer_collection_literals
      var despesaSumarizada = Map();
      for (var u in despesa) {
        if (despesaSumarizada.containsKey(u.tipoDespesa)) {
          despesaSumarizada[u.tipoDespesa] =
              despesaSumarizada[u.tipoDespesa] + u.valorLiquido;
        } else {
          despesaSumarizada[u.tipoDespesa] = u.valorLiquido;
        }
      }
      return despesaSumarizada;
    } else {
      throw Exception('Requisão Inválida');
    }
  }
}
