import 'package:AcPoliticos/src/models/despesa_deputado.dart';
import 'package:flutter/material.dart';

class DepSumGastos extends StatefulWidget {
  @override
  _DepSumGastosState createState() => _DepSumGastosState();
}

class _DepSumGastosState extends State<DepSumGastos> {
  final _buscaController = TextEditingController();

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
          Column(
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
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: size.width * 0.85,
                  height: size.height * 0.07,
                  child: TextFormField(
                      controller: _buscaController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        //border: OutlineInputBorder(),
                        labelText: 'Digite aqui a sua busca',
                        suffixIcon: Icon(Icons.supervised_user_circle),
                      ),
                      keyboardType: TextInputType.number),
                ),
              ),
              DepSumDataWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class DepSumDataWidget extends StatefulWidget {
  @override
  _DepSumDataWidgetState createState() => _DepSumDataWidgetState();
}

class _DepSumDataWidgetState extends State<DepSumDataWidget> {
  String labelNomeDep = "Fodeodr do cu",
      labelLegis = '56',
      labelAno = '2020',
      labelUF = "Sp",
      labelPartido = "Comedores de Cu",
      labelTotal = "5000";

  // List<Objetfodace> listSumDep = List<Objetfodace>();
  List<DespesasDeputado> listSumDep = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: new BoxDecoration(
            color: Color(0xFF013421),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        width: size.width,
        height: size.height * 0.65,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: size.height * 0.1,
                decoration: new BoxDecoration(
                    color: Color(0XFF004A2F),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Tabela comparativa em ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                              text: '$labelAno',
                              style: TextStyle(
                                  color: Color(0XFF707070),
                                  fontWeight: FontWeight.bold)),
                          TextSpan(text: ', na Legislatura '),
                          TextSpan(
                              text: '$labelLegis',
                              style: TextStyle(
                                  color: Color(0XFF707070),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Ordernar Por:", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 5),
                  Container(
                    height: size.height * 0.03,
                    width: size.width * 0.225,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0XFF707070))),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nome: $labelNomeDep",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Partido: $labelPartido",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "UF: $labelUF",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "Total: $labelTotal",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.36,
              child: ListView.builder(
                itemCount: listSumDep.length,
                itemBuilder: (context, index) {
                  return Container(
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
                                    text: listSumDep[index].tipoDespesa,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "R\$: ${listSumDep[index].valorDocumento}",
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
