import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:AcPoliticos/src/models/despesa_deputado.dart';
import 'package:AcPoliticos/src/models/result_deputado.dart';
import 'package:AcPoliticos/src/models/legislatura.dart';
import 'package:AcPoliticos/src/models/ufs.dart';
import 'package:AcPoliticos/src/models/partidos.dart';

class PortalTransparencia {
    static Future<List> fetchUf() async{
    final response = await http.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados');
    if (response.statusCode == 200){
      var ufsJson = json.decode(response.body);
      // ignore: omit_local_variable_types
      List<ResultUfs> ufs = [];
      for (var u in ufsJson){
        var uf = ResultUfs(u['id'], u['sigla'], u['nome']);
        ufs.add(uf);
      }
      return ufs;
      }else{
        throw Exception('Requisição inválida!');
      }
    }

  // LEGISLATURA PRONTA 
  static Future fetchLegislatura({int ano}) async{
    final response = await http.get('https://dadosabertos.camara.leg.br/api/v2/legislaturas?data=$ano-01-02&ordem=DESC&ordenarPor=id');
    if (response.statusCode == 200){
      var legislaturaJson = json.decode(response.body)['dados'][0];
      var legislatura = Legislatura(legislaturaJson['id'], legislaturaJson['uri'],legislaturaJson['dataInicio'], legislaturaJson['dataFim']);
      return legislatura;
    }else{
      throw Exception('Requisição inválida!');
    }
  }

  // PARTIDOS PRONTO
  static Future fetchPartidos({int idLegislatura}) async{
    final response = await http.get('https://dadosabertos.camara.leg.br/api/v2/partidos?idLegislatura=$idLegislatura&itens=100000&ordem=ASC&ordenarPor=sigla');
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
    }
  }

  static Future<List> fetchDeputadosByPartidos({String partido, int idLegislatura}) async {
    // Enviar requisição para dados abertos e obter response para armazenar num modelo de dados
    final response = await http.get(
        'https://dadosabertos.camara.leg.br/api/v2/deputados?idLegislatura=$idLegislatura&siglaUf=&siglaPartido=$partido&itens=100000&ordem=ASC&ordenarPor=nome');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      // ignore: omit_local_variable_types
      List<ResultDeputado> listaDeputados = [];
      for (var u in jsonData['dados']){
        var deputado = ResultDeputado(u['id'], u['uri'], u['nome'], u['siglaPartido'], u['uriPartido'], u['siglaUf'], u['idLegislatura'], u['urlFoto'], u['email']);
        listaDeputados.add(deputado);
      }
      return listaDeputados;
    } else {
      throw Exception('Requisição inválida');
    }
  }
  static Future<List> fetchDeputadosByUf({String uf, int idLegislatura}) async {
    // Enviar requisição para dados abertos e obter response para armazenar num modelo de dados
    final response = await http.get(
        'https://dadosabertos.camara.leg.br/api/v2/deputados?idLegislatura=$idLegislatura&siglaUf=$uf&itens=100000&ordem=ASC&ordenarPor=nome');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      // ignore: omit_local_variable_types
      List<ResultDeputado> listaDeputados = [];
      for (var u in jsonData['dados']){
        var deputado = ResultDeputado(u['id'], u['uri'], u['nome'], u['siglaPartido'], u['uriPartido'], u['siglaUf'], u['idLegislatura'], u['urlFoto'], u['email']);
        listaDeputados.add(deputado);
      }
      return listaDeputados;
    } else {
      throw Exception('Requisição inválida');
    }
  }
  static Future<Map> fetchDespesa({int id, int idLegislatura, int ano, int mes}) async {
    final response = await http.get(
        'https://dadosabertos.camara.leg.br/api/v2/deputados/$id/despesas?idLegislatura=$idLegislatura&ano=$ano&mes=$mes&itens=10000&ordem=ASC&ordenarPor=ano');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      // ignore: omit_local_variable_types
      List<DespesasDeputado> despesa = [];
      for(var u in jsonData['dados']){
        var despesaDep = DespesasDeputado(u['ano'], u['mes'], u['cnpjCpfFornecedor'], u['tipoDespesa'], u['codDocumento'], 
        u['dataDocumento'], u['numDocumento'], u['valorDocumento'], u['urlDocumento'], u['nomeFornecedor'],
        u['valorLiquido'], u['valorGlosa'], u['codLote'], u['parcela']);
        despesa.add(despesaDep);
      }
      // ignore: prefer_collection_literals
      var despesaSumarizada = Map();
      for(var u in despesa){
        if (despesaSumarizada.containsKey(u.tipoDespesa)){
          despesaSumarizada[u.tipoDespesa] = despesaSumarizada[u.tipoDespesa] + u.valorLiquido;
        }else{
          despesaSumarizada[u.tipoDespesa] = u.valorLiquido;
        }
      } 
      return despesaSumarizada;
    } else {
      throw Exception('Requisão Inválida');
    }
  }
}
