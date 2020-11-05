import 'package:AcPoliticos/src/controller/DepBloc.dart';
import 'package:AcPoliticos/src/models/legislatura.dart';
import 'package:flutter/material.dart';

import 'widget/itemsList.dart';

enum TypeSearch { Deputado, UF, Partido }

class DepSearch extends StatefulWidget {
  @override
  _DepSearchState createState() => _DepSearchState();
}

class _DepSearchState extends State<DepSearch> {
  // List<Legislatura> listLegis = List<Legislatura>();
  TypeSearch _tipoBusca = TypeSearch.Deputado;
  List<Legislatura> listLegis = [
    new Legislatura(56, "", "2019-02-01", "2023-01-31"),
    new Legislatura(55, "", "2015-02-01", "2019-01-31")
  ];
  DeputadoBloc _deputadoBloc;

  String dropdownValueLes = "56",
      dropdownValueAno = "2020",
      dropdownValueMes = "10";
  String filterText = "";
  List<dynamic> listSaida = List<dynamic>();

  var listAno = [for (var i = 2020; i >= 2015; i -= 1) i.toString()];
  var listMes = [for (var i = 12; i >= 1; i -= 1) i.toString()];
  Map<String, dynamic> formData;

  selectLegis(String tipo, String value) {
    if (tipo == "ano") {
      setState(() {
        formData['ano'] = value;
        dropdownValueAno = value;
        var data =
            DateTime(int.parse(formData['ano']), int.parse(formData['mes']));
        listLegis.forEach((e) {
          if (data.isAfter(DateTime.parse(e.dataInicio)) &&
              data.isBefore(DateTime.parse(e.dataFim))) {
            formData['legislativo'] = e.id.toString();
            dropdownValueLes = e.id.toString();
          }
        });
      });
    }
    if (tipo == "mes") {
      setState(() {
        formData['mes'] = value;
        dropdownValueMes = value;
        var data =
            DateTime(int.parse(formData['ano']), int.parse(formData['mes']));
        listLegis.forEach((e) {
          if (data.isAfter(DateTime.parse(e.dataInicio)) &&
              data.isBefore(DateTime.parse(e.dataFim))) {
            formData['legislativo'] = e.id.toString();
            dropdownValueLes = e.id.toString();
          }
        });
      });
    }
    _deputadoBloc.filtro.add(formData);
  }

  @override
  void initState() {
    super.initState();
    _deputadoBloc = DeputadoBloc();
  }

  @override
  void dispose() {
    // itemsListBloc.dispose();
    super.dispose();
  }

  _DepSearchState() {
    formData = {
      'legislativo': "56",
      'ano': "2020",
      'mes': "10",
      'select': "Escolha um",
      'typeSearch': 'Deputado'
    };
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0XFF004A2F),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.10,
                        color: Color(0xFF013421),
                        //#013421
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Color(0xFF013421),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    width: size.width,
                    height: size.height * 0.85,
                    child: Padding(
                      padding: const EdgeInsets.all(17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Conheça as verbas e recursos a que um deputador tem direito para o exercicio parlamentar",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text("Legislatura",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold))),
                                    SizedBox(height: size.height * 0.01),
                                    // dropDownLegislatura
                                    Container(
                                      decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      width: size.width * 0.25,
                                      height: size.height * 0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Center(
                                          child: DropdownButton<String>(
                                            value: dropdownValueLes,
                                            elevation: 16,
                                            isExpanded: true,
                                            isDense: true,
                                            style: TextStyle(
                                                color: Colors.deepPurple),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                dropdownValueLes = newValue;
                                              });
                                            },
                                            items: listLegis
                                                .map<DropdownMenuItem<String>>(
                                                    (Legislatura value) {
                                              return DropdownMenuItem<String>(
                                                value: value.id.toString(),
                                                child: Center(
                                                    child: Text(
                                                        value.id.toString())),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text("Ano",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold))),
                                    SizedBox(height: size.height * 0.01),
                                    // dropDownAno
                                    Container(
                                      decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      width: size.width * 0.25,
                                      height: size.height * 0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Center(
                                          child: DropdownButton<String>(
                                            value: dropdownValueAno,
                                            elevation: 16,
                                            isExpanded: true,
                                            isDense: true,
                                            style: TextStyle(
                                                color: Colors.deepPurple),
                                            onChanged: (String newValue) {
                                              selectLegis("ano", newValue);
                                              // setState(() {
                                              //   dropdownValueAno = newValue;
                                              // });
                                            },
                                            items: listAno
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child:
                                                    Center(child: Text(value)),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text("Mês",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold))),
                                    SizedBox(height: size.height * 0.01),
                                    // dropDownMes
                                    Container(
                                      decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      width: size.width * 0.25,
                                      height: size.height * 0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Center(
                                          child: DropdownButton<String>(
                                            value: dropdownValueMes,
                                            elevation: 16,
                                            isExpanded: true,
                                            isDense: true,
                                            style: TextStyle(
                                                color: Colors.deepPurple),
                                            onChanged: (String newValue) {
                                              selectLegis("mes", newValue);
                                              // setState(() {
                                              //   dropdownValueMes = newValue;
                                              // });
                                            },
                                            items: listMes
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child:
                                                    Center(child: Text(value)),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Buscar Por:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          // groupRadioBuscaPor
                          Theme(
                            data: ThemeData.dark(),
                            child: Row(
                              children: [
                                Radio(
                                  value: TypeSearch.Deputado,
                                  groupValue: _tipoBusca,
                                  onChanged: (TypeSearch value) {
                                    setState(() {
                                      _tipoBusca = value;
                                      formData['typeSearch'] =
                                          value.toString().split('.').last;
                                    });
                                    _deputadoBloc.filtro.add(formData);
                                  },
                                ),
                                Text("Deputado",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                Radio(
                                  value: TypeSearch.UF,
                                  groupValue: _tipoBusca,
                                  onChanged: (TypeSearch value) {
                                    setState(() {
                                      _tipoBusca = value;
                                      formData['typeSearch'] =
                                          value.toString().split('.').last;
                                    });
                                    _deputadoBloc.filtro.add(formData);
                                  },
                                ),
                                Text("UF",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                Radio(
                                  value: TypeSearch.Partido,
                                  groupValue: _tipoBusca,
                                  onChanged: (TypeSearch value) {
                                    setState(() {
                                      _tipoBusca = value;
                                      formData['typeSearch'] =
                                          value.toString().split('.').last;
                                    });
                                    _deputadoBloc.filtro.add(formData);
                                  },
                                ),
                                Text("Partido",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(_tipoBusca.toString().split('.').last,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(height: size.height * 0.02),
                          Container(
                            height: size.height * 0.48,
                            child: Container(
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              height: size.height * 0.235,
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Pesquisar',
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    onChanged: (text) {
                                      setState(() {
                                        filterText = text;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: StreamBuilder<List<dynamic>>(
                                      stream: _deputadoBloc.deputadosSaida,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<dynamic>>
                                              snapshot) {
                                        if (snapshot.hasData) {
                                          if (snapshot.data.length == 0) {
                                            return Center(
                                                child: Text('Sem Dados',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20)));
                                          }
                                          // listSaida.clear();
                                          listSaida = snapshot.data;
                                          return ItemsList(
                                              items: snapshot.data,
                                              filter: filterText,
                                              deputadoBloc: this._deputadoBloc,
                                              formData: formData);
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// child: DropDownField(
//   // required: true,
//   hintText: 'Escreva o nome do deputado',
//   labelText: _tipoBusca
//       .toString()
//       .split('.')
//       .last,
//   items: listSaida,
//   itemsVisibleInDropdown: 5,
//   strict: true,
//   setter: (dynamic newValue) {
//     formData['deputado'] = newValue;
//   },
// ),
