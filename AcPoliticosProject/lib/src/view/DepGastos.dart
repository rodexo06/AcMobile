import 'package:AcPoliticos/src/models/despesa_deputado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:intl/intl.dart';

class DepGastos extends StatefulWidget {
  final Map<String, dynamic> formData;
  final List<DespesasDeputado> despesas;

  const DepGastos({Key key, this.formData, this.despesas}) : super(key: key);
  @override
  _DepGastosState createState() => _DepGastosState();
}

class _DepGastosState extends State<DepGastos> {
  final formatCurrency = new NumberFormat.currency(locale: "pt_BR", symbol: "");

  Widget loadHeader(Map<String, dynamic> formData,
      List<DespesasDeputado> despesas, Size size) {
    double total = 0;
    despesas.forEach((e) => total += e.valorDocumento);
    if (formData['typeSearch'] == "Deputado") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              width: size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Nome: ${formData['select'].nome}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
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
                RichText(
                  text: TextSpan(
                    text: "Total: ${formatCurrency.format(total)}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    if (formData['typeSearch'] == "UF") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              width: size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UF: ${formData['select'].sigla}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Estado: ${formData['select'].nome}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
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
                RichText(
                  text: TextSpan(
                    text: "Total: ${formatCurrency.format(total)}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    if (formData['typeSearch'] == "Partido") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              width: size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sigla: ${formData['select'].sigla}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Nome: ${formData['select'].nome}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
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
                RichText(
                  text: TextSpan(
                    text: "Total: ${formatCurrency.format(total)}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0XFF004A2F),
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 27),
              child: Container(
                decoration: new BoxDecoration(
                    color: Color(0xFF013421),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                width: size.width,
                height: size.height * 0.95,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: size.width,
                                height: size.height * 0.13,
                                decoration: new BoxDecoration(
                                    color: Color(0XFF004A2F),
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(25.0),
                                      topRight: const Radius.circular(25.0),
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: loadHeader(
                                      widget.formData, widget.despesas, size),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7.5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: size.height * 0.03,
                                    width: size.width * 0.225,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0XFF707070))),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: DepGastoListWidget(
                                  despesas: widget.despesas,
                                  formData: widget.formData),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class DepGastoListWidget extends StatefulWidget {
  final Map<String, dynamic> formData;
  final List<DespesasDeputado> despesas;

  const DepGastoListWidget({Key key, this.formData, this.despesas})
      : super(key: key);

  @override
  _DepGastoListWidgetState createState() => _DepGastoListWidgetState();
}

class _DepGastoListWidgetState extends State<DepGastoListWidget> {
  final formatCurrency = new NumberFormat.currency(locale: "pt_BR", symbol: "");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        itemCount: widget.despesas.length,
        itemBuilder: (context, i) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Documento: ${widget.despesas[i].numDocumento}"),
                          Spacer(),
                          Text("Data: ${widget.despesas[i].dataDocumento}"),
                        ],
                      ),
                      Divider(color: Colors.black),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * 0.4,
                            child: RichText(
                              text: TextSpan(
                                text:
                                    "Fornecedor: ${widget.despesas[i].nomeFornecedor}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text("Cnpj: ${widget.despesas[i].cnpjCpfFornecedor}"),
                        ],
                      ),
                      Divider(color: Colors.black),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "Valor Doc: ${formatCurrency.format(widget.despesas[i].valorDocumento)}"),
                          Spacer(),
                          Text(
                              "Valor Liquído: ${formatCurrency.format(widget.despesas[i].valorLiquido)}"),
                        ],
                      ),
                      Divider(color: Colors.black),
                      SelectableLinkify(
                        text: "Acesse Mais ${widget.despesas[i].urlDocumento}",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
