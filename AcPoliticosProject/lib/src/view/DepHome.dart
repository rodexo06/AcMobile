import 'package:AcPoliticos/src/controller/InitDatabase.dart';
import 'package:flutter/material.dart';

import 'DepSearch.dart';

class DepHome extends StatefulWidget {
  @override
  _DepHomeState createState() => _DepHomeState();
}

class _DepHomeState extends State<DepHome> {
  InitDatabase initDatabase = InitDatabase();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0XFF004A2F),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: 400,
                  child: Image.asset("assets/logoCadeMeuDinheiro.png"),
                ),
                // SizedBox(height: size.height * 0.03),
                // Text(
                //   "Cadê Meu Dinheiro?",
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 28,
                //       fontWeight: FontWeight.w600),
                // ),

                // SizedBox(height: size.height * 0.01),
                // Divider(color: Colors.grey, height: 10),
                // SizedBox(height: size.height * 0.20),
                Text(
                  "Consulte a analise de gastos",
                  style: TextStyle(color: Color(0XFF8F8F8F)),
                ),
                SizedBox(height: size.height * 0.003),
                Text(
                  "por deputado",
                  style: TextStyle(color: Color(0XFF8F8F8F)),
                ),
                SizedBox(height: size.height * 0.05),
                FutureBuilder(
                    future: initDatabase.funcaoInit(),
                    builder:
                        (BuildContext context, AsyncSnapshot<void> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                              "Something wrong with message: ${snapshot.error.toString()}"),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Material(
                          color: Color(0XFF013421),
                          // border: Border.all(color: Color(0XFF707070)),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DepSearch()),
                              );
                            },
                            child: Container(
                                decoration: new BoxDecoration(
                                    color: Color(0XFF013421),
                                    border:
                                        Border.all(color: Color(0XFF707070)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                height: size.height * 0.08,
                                width: size.width * 0.6,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text("Consultar",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.underline,
                                          ))),
                                )),
                          ),
                        );
                      } else {
                        return Container(
                            decoration: new BoxDecoration(
                                color: Color(0XFF013421),
                                border: Border.all(color: Color(0XFF707070)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            height: size.height * 0.06,
                            width: size.width * 0.4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text("Aguarde",
                                      style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                      ))),
                            ));
                      }
                    }),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
