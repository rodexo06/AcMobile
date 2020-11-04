import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:AcPoliticos/src/models/despesa_deputado.dart';
import 'package:AcPoliticos/src/models/result_deputado.dart';
import 'package:AcPoliticos/src/models/legislatura.dart';
import 'package:AcPoliticos/src/models/ufs.dart';
import 'package:AcPoliticos/src/models/partido.dart';

class PortalTransparencia {
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

<<<<<<< HEAD
  // LEGISLATURA PRONTA
  static Future<List<Legislatura>> fetchLegislatura() async {
    final response = await http.get(
        'https://dadosabertos.camara.leg.br/api/v2/legislaturas?ordem=DESC');
    if (response.statusCode == 200) {
      var legislaturaJson = json.decode(response.body)['dados'];
      return legislaturaJson
          .map<Legislatura>((json) => new Legislatura.fromJson(json))
          .toList();
    } else {
      throw Exception('Requisição inválida!');
=======
  // PARTIDOS PRONTO
  static Future fetchPartidos({int idLegislatura, int ano, int mes}) async{
    final response = await http.get('https://dadosabertos.camara.leg.br/api/v2/partidos?dataInicio=$ano-$mes-01&idLegislatura=$idLegislatura&itens=10000&ordem=ASC&ordenarPor=sigla');
    if (response.statusCode == 200){
      var partidosJson = json.decode(response.body);
      // ignore: omit_local_variable_types
      List<String> listaPartidos = [];
      for(var u in partidosJson['dados']){
        var partido = Partidos(u['id'], u['sigla'], u['nome'], u['uri']);
        var sigla = u['sigla'];
        var boolean = sigla.contains('*');
        if(boolean == false){
        listaPartidos.add(partido.sigla);
        }
      }
      return listaPartidos;
    }else{
    throw Exception('Requisição inválida');
>>>>>>> d88b99105461cd0152e9c3fee75e5b7ffd2ac67a
    }
  }

  // PARTIDOS PRONTO
  static Future<List<Partido>> fetchPartidos(int idLegislatura) async {
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

  static Future<List<ResultDeputado>> fetchDeputados(int idLegislatura) async {
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

  static Future<Map> fetchDespesa(
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
}
