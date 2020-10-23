import 'package:AcPoliticos/src/controller/items_list_bloc.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

class DepSearch extends StatefulWidget {
  @override
  _DepSearchState createState() => _DepSearchState();
}

class _DepSearchState extends State<DepSearch> {
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
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: Container(
                //     decoration: new BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.all(Radius.circular(10.0))),
                //     width: size.width * 0.85,
                //     height: size.height * 0.07,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: DepSearchMainWidget(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum TipoBusca { Deputado, UF, Partido }

class DepSearchMainWidget extends StatefulWidget {
  @override
  DepSearchMainWidgetState createState() => DepSearchMainWidgetState();
}

class DepSearchMainWidgetState extends State<DepSearchMainWidget> {
  TipoBusca _tipoBusca = TipoBusca.Deputado;
  String dropdownValueLes = "56",
      dropdownValueAno = "2020",
      dropdownValueMes = "10";
  String filterText = "";
  List<String> deputados = [
    "Gustavo",
    "Gustava",
    "Gusta",
    "Rafa",
    "Fernando",
  ];
  var listLegis = [for (var i = 56; i >= 1; i -= 1) i.toString()];
  var listAno = [for (var i = 2020; i >= 2010; i -= 1) i.toString()];
  var listMes = [for (var i = 12; i >= 1; i -= 1) i.toString()];
  Map<String, dynamic> formData;
  final ItemsListBloc itemsListBloc = ItemsListBloc();

  @override
  void dispose() {
    itemsListBloc.dispose();
    super.dispose();
  }

  DepSearchMainWidgetState() {
    formData = {
      'legislativo': "56",
      'ano': "2020",
      'mes': "10",
      'deputado': "Escolha um"
    };
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: new BoxDecoration(
          color: Color(0xFF013421),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      width: size.width,
      height: size.height * 0.76,
      child: Padding(
        padding: const EdgeInsets.all(17),
        // child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // labelInicio
            Text(
                "Conheça as verbas e recursos a que um deputador tem direito para o exercicio parlamentar",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14)),
            SizedBox(height: size.height * 0.03),
            // labelLegislatura
            Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        width: size.width * 0.3,
                        height: size.height * 0.05,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Center(
                            child: DropdownButton<String>(
                              value: dropdownValueLes,
                              elevation: 16,
                              isExpanded: true,
                              isDense: true,
                              style: TextStyle(color: Colors.deepPurple),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValueLes = newValue;
                                });
                              },
                              items: listLegis.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Center(child: Text(value)),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        width: size.width * 0.25,
                        height: size.height * 0.05,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Center(
                            child: DropdownButton<String>(
                              value: dropdownValueAno,
                              elevation: 16,
                              isExpanded: true,
                              isDense: true,
                              style: TextStyle(color: Colors.deepPurple),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValueAno = newValue;
                                });
                              },
                              items: listAno.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Center(child: Text(value)),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        width: size.width * 0.2,
                        height: size.height * 0.05,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Center(
                            child: DropdownButton<String>(
                              value: dropdownValueMes,
                              elevation: 16,
                              isExpanded: true,
                              isDense: true,
                              style: TextStyle(color: Colors.deepPurple),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValueMes = newValue;
                                });
                              },
                              items: listMes.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Center(child: Text(value)),
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

            SizedBox(height: size.height * 0.01),
            // labelBuscaPor
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    value: TipoBusca.Deputado,
                    groupValue: _tipoBusca,
                    onChanged: (TipoBusca value) {
                      setState(() {
                        _tipoBusca = value;
                      });
                    },
                  ),
                  Text("Deputado",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  Radio(
                    value: TipoBusca.UF,
                    groupValue: _tipoBusca,
                    onChanged: (TipoBusca value) {
                      setState(() {
                        _tipoBusca = value;
                      });
                    },
                  ),
                  Text("UF",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  Radio(
                    value: TipoBusca.Partido,
                    groupValue: _tipoBusca,
                    onChanged: (TipoBusca value) {
                      setState(() {
                        _tipoBusca = value;
                      });
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
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(_tipoBusca.toString().split('.').last,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: size.height * 0.01),
            // dropDownTipoBusca
            FutureBuilder(
              future: buildFutures(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  default:
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      if (snapshot.data != null) {
                        return Expanded(
                          child: Container(
                            height: size.height * 0.235,
                            child: DropDownField(
                              value: formData['deputado'],
                              required: true,
                              hintText: 'Escreva o nome do deputado',
                              labelText: 'Deputado',
                              items: deputados,
                              itemsVisibleInDropdown: 2,
                              strict: true,
                              setter: (dynamic newValue) {
                                formData['deputado'] = newValue;
                              },
                            ),
                          ),
                        );
                      }
                    }
                }
              },
            ),
            SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }

  Future<bool> buildFutures() async {
    return true;
  }
}
