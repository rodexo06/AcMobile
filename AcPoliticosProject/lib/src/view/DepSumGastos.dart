import 'package:AcPoliticos/src/controller/GastosBloc.dart';
import 'package:AcPoliticos/src/models/despesa_deputado.dart';
import 'package:AcPoliticos/src/view/DepGastos.dart';
import 'package:AcPoliticos/src/view/widget/SwitchMesWidget.dart';
import 'package:flutter/material.dart';

class DepSumGastos extends StatefulWidget {
  final Map<String, dynamic> formData;
  const DepSumGastos({Key key, this.formData}) : super(key: key);
  @override
  _DepSumGastosState createState() => _DepSumGastosState();
}

class _DepSumGastosState extends State<DepSumGastos> {
  GastosBloc gastosBloc;
  Widget headerWidget;
  String mes;
  List<RadioModel> mesList = new List<RadioModel>();
  @override
  void initState() {
    super.initState();
    double tam = 50;
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '1', Color(0XFF004A2F)));
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '2', Color(0XFF004A2F)));
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '3', Color(0XFF004A2F)));
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '4', Color(0XFF004A2F)));
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '5', Color(0XFF004A2F)));
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '6', Color(0XFF004A2F)));
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '7', Color(0XFF004A2F)));
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '8', Color(0XFF004A2F)));
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '9', Color(0XFF004A2F)));
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '10', Color(0XFF004A2F)));
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '11', Color(0XFF004A2F)));
    mesList.add(new RadioModel(false, tam, tam, Color(0XFF1DA838), Colors.white,
        '12', Color(0XFF004A2F)));
  }

  Widget loadHeader(Map<String, dynamic> formData) {
    if (formData['typeSearch'] == "Deputado") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nome: ${formData['select'].nome}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Partido: ${formData['select'].siglaPartido}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "UF: ${formData['select'].siglaUf}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mês: ${formData['mes']}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Ano: ${formData['ano']}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Total: ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      );
    }
    if (formData['typeSearch'] == "UF") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "UF: ${formData['select'].sigla}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Estado: ${formData['select'].nome}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mês: ${formData['mes']}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Ano: ${formData['ano']}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Total: ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      );
    }
    if (formData['typeSearch'] == "Partido") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sigla: ${formData['select'].sigla}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Nome: ${formData['select'].nome}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mês: ${formData['mes']}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Ano: ${formData['ano']}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Total: ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    gastosBloc = GastosBloc(widget.formData);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0XFF004A2F),
          ),
          Column(
            children: [
              Container(
                // height: size.height * 0.10,
                color: Color(0xFF013421),
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 180,
                      child: Column(
                        children: [
                          GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: mesList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 6),
                              itemBuilder: (BuildContext context, int i) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  child: InkWell(
                                    onTap: () {
                                      mes = (i + 1).toString();
                                      widget.formData['mes'] = mes;
                                      gastosBloc.filtro.add(widget.formData);
                                      setState(() {
                                        mesList.forEach((element) =>
                                            element.isSelected = false);
                                        mesList[i].isSelected = true;
                                      });
                                    },
                                    child: Container(
                                      child: SwitchMesWidget(mesList[i]),
                                    ),
                                  ),
                                );
                              }),
                          Text(
                            "Selecione o Mês",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: new BoxDecoration(
                      color: Color(0xFF013421),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  width: size.width,
                  height: size.height * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: StreamBuilder<Map<String, dynamic>>(
                          stream: gastosBloc.despesaSaida,
                          builder: (BuildContext context,
                              AsyncSnapshot<Map<String, dynamic>> snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.length == 0) {
                                return Center(
                                    child: Text('Sem Dados',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20)));
                              }
                              var keys = snapshot.data.keys.toList();
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Container(
                                        width: size.width,
                                        height: size.height * 0.1,
                                        decoration: new BoxDecoration(
                                            color: Color(0XFF004A2F),
                                            borderRadius: BorderRadius.only(
                                              topLeft:
                                                  const Radius.circular(25.0),
                                              topRight:
                                                  const Radius.circular(25.0),
                                            )),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: loadHeader(widget.formData),
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 15, vertical: 7.5),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.end,
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.center,
                                    //     children: [
                                    //       Text("Ordernar Por:",
                                    //           style: TextStyle(
                                    //               color: Colors.white)),
                                    //       SizedBox(width: 5),
                                    //       Container(
                                    //         height: size.height * 0.03,
                                    //         width: size.width * 0.225,
                                    //         decoration: BoxDecoration(
                                    //             border: Border.all(
                                    //                 color: Color(0XFF707070))),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
                                    Expanded(
                                      child: DepSumDataWidget(
                                          despesas: snapshot.data,
                                          keys: keys,
                                          formData: widget.formData),
                                    ),
                                  ]);
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
        ],
      ),
    );
  }
}

// fazer um widget generico, que ele vai ser defionido la em cim no future builçder

class DepSumDataWidget extends StatefulWidget {
  final Map<String, dynamic> formData;
  final Map<String, dynamic> despesas;
  final List<String> keys;

  const DepSumDataWidget({Key key, this.despesas, this.keys, this.formData})
      : super(key: key);
  @override
  _DepSumDataWidgetState createState() => _DepSumDataWidgetState();
}

class _DepSumDataWidgetState extends State<DepSumDataWidget> {
  // List<Objetfodace> listSumDep = List<Objetfodace>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.36,
      child: ListView.builder(
        itemCount: widget.keys.length,
        itemBuilder: (context, index) {
          double despesasSum = 0;
          List<DespesasDeputado> listDepesas =
              widget.despesas[widget.keys[index]];
          listDepesas.forEach((e) => despesasSum += e.valorDocumento);
          return Material(
            color: Color(0xFF013421),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DepGastos(
                          formData: widget.formData, despesas: listDepesas)),
                );
              },
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Container(
                            width: size.width * 0.55,
                            child: RichText(
                              text: TextSpan(
                                text: widget.keys[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "R\$: ${despesasSum.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.blueGrey)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
// child: Center(
//                               child: RichText(
//                                 text: TextSpan(
//                                   text: 'Tabela comparativa em ',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                         text: '${widget.formData['ano']}',
//                                         style: TextStyle(
//                                             color: Color(0XFF707070),
//                                             fontWeight: FontWeight.bold)),
//                                     TextSpan(text: ', na Legislatura '),
//                                     TextSpan(
//                                         text:
//                                             '${widget.formData['legislatura']}',
//                                         style: TextStyle(
//                                             color: Color(0XFF707070),
//                                             fontWeight: FontWeight.bold)),
//                                   ],
//                                 ),
//                               ),
//                             ),
