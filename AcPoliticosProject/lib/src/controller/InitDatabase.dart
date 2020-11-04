import 'package:AcPoliticos/src/database/deputadosDados.dart';
import 'package:AcPoliticos/src/database/legislaturaDados.dart';
import 'package:AcPoliticos/src/database/partidoDados.dart';
import 'package:AcPoliticos/src/database/ufDados.dart';
import 'package:AcPoliticos/src/models/legislatura.dart';
import 'package:AcPoliticos/src/models/partido.dart';
import 'package:AcPoliticos/src/models/result_deputado.dart';
import 'package:AcPoliticos/src/models/ufs.dart';

class InitDatabase {
  PartidoDados partidoDados = PartidoDados();
  DeputadoDados deputadoDados = DeputadoDados();
  UfDados ufDados = UfDados();
  LegislaturaDados legislaturaDados = LegislaturaDados();
  Future<void> funcaoInit() async {
    var verifica = await legislaturaDados.verifica();
    if (verifica) {
      return;
    }
    List<Legislatura> listLegis;
    List<ResultUfs> listUf;
    List<Partido> listPartido = List<Partido>();
    List<ResultDeputado> listDeputado = List<ResultDeputado>();
    // Catch Legislatura
    await legislaturaDados.fetchLegislatura().then((value) => listLegis = value
        .where((element) =>
            DateTime.parse(element.dataInicio).isAfter(DateTime(2014, 01, 01)))
        .toList());
    // Catch Uf
    await ufDados.fetchUf().then((value) => listUf = value);
    // Catch Partidos por Legislatura
    for (var i = 0; i < listLegis.length; i++) {
      await partidoDados
          .fetchPartidos(listLegis[i].id)
          .then((value) => listPartido..addAll(value));
    }
    // Catch Deputado por Legislatura
    for (var i = 0; i < listLegis.length; i++) {
      await deputadoDados
          .fetchDeputados(listLegis[i].id)
          .then((value) => listDeputado..addAll(value));
    }
    listLegis.forEach((element) async {
      await legislaturaDados.insertLegis(element);
    });
    listDeputado.forEach((element) async {
      await deputadoDados.insertDeputado(element);
    });
    listUf.forEach((element) async {
      await ufDados.insertUf(element);
    });
    listPartido.forEach((element) async {
      await partidoDados.insertPartido(element);
    });
    // var deputadosNorm = listDeputado.distinct((e) => e.siglaPartido).toList();
    // var IntermediateDepLes = listDeputado
    //     .map((x) => {'id_legis': x.idLegislatura, 'id_dep': x.idDeputado})
    //     .toList();
  }
}
