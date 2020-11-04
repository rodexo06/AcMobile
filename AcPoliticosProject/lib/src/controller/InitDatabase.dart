import 'package:AcPoliticos/src/database/insert.dart';
import 'package:AcPoliticos/src/models/legislatura.dart';
import 'package:AcPoliticos/src/models/partido.dart';
import 'package:AcPoliticos/src/models/result_deputado.dart';
import 'package:AcPoliticos/src/models/ufs.dart';
import 'package:AcPoliticos/src/services/service.dart';

class InitDatabase {
  var insert = Insert();
  Future<void> funcaoInit() async {
    var verifica = await insert.verifica();
    if (verifica) {
      return;
    }
    List<Legislatura> listLegis;
    List<ResultUfs> listUf;
    List<Partido> listPartido = List<Partido>();
    List<ResultDeputado> listDeputado = List<ResultDeputado>();
    // Catch Legislatura
    await PortalTransparencia.fetchLegislatura().then((value) => listLegis =
        value
            .where((element) => DateTime.parse(element.dataInicio)
                .isAfter(DateTime(2014, 01, 01)))
            .toList());
    // Catch Uf
    await PortalTransparencia.fetchUf().then((value) => listUf = value);
    // Catch Partidos por Legislatura
    for (var i = 0; i < listLegis.length; i++) {
      await PortalTransparencia.fetchPartidos(listLegis[i].id)
          .then((value) => listPartido..addAll(value));
    }
    // Catch Deputado por Legislatura
    for (var i = 0; i < listLegis.length; i++) {
      await PortalTransparencia.fetchDeputados(listLegis[i].id)
          .then((value) => listDeputado..addAll(value));
    }
    listLegis.forEach((element) async {
      await insert.insertLegis(element);
    });
    listDeputado.forEach((element) async {
      await insert.insertDeputado(element);
    });
    listUf.forEach((element) async {
      await insert.insertUf(element);
    });
    listPartido.forEach((element) async {
      await insert.insertPartido(element);
    });
    // var deputadosNorm = listDeputado.distinct((e) => e.siglaPartido).toList();
    // var IntermediateDepLes = listDeputado
    //     .map((x) => {'id_legis': x.idLegislatura, 'id_dep': x.idDeputado})
    //     .toList();
  }
}
