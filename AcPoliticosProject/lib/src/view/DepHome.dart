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
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
          child: Container(
            child: Column(
              children: [
                // Logo do Grupo
                Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(60.0))),
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "assets/logoMiaus.jpeg",
                        ))),
                SizedBox(height: size.height * 0.01),
                Text(
                  "TRANSPARÊNCIA",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.005),
                Text("Copyright 2020",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: size.height * 0.01),
                Divider(color: Colors.grey, height: 10),
                SizedBox(height: size.height * 0.20),
                Text(
                  "Consulte a analise de gastos",
                  style: TextStyle(color: Color(0XFF8F8F8F)),
                ),
                SizedBox(height: size.height * 0.003),
                Text(
                  "por deputado",
                  style: TextStyle(color: Color(0XFF8F8F8F)),
                ),
                SizedBox(height: size.height * 0.02),
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
                                height: size.height * 0.06,
                                width: size.width * 0.4,
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
