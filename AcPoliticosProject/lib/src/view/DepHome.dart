import 'package:AcPoliticos/src/controller/InitDatabase.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DepSearch.dart';

class DepHome extends StatefulWidget {
  @override
  _DepHomeState createState() => _DepHomeState();
}

class _DepHomeState extends State<DepHome> {
  InitDatabase initDatabase = InitDatabase();
  bool isActive;
  bool isLoading = false;

  _onTap() {
    setState(() {
      isLoading = !isLoading;
      isActive = true;
    });
  }

  Widget animation() {
    if (isActive) {
      return Container(
        width: double.infinity,
        child: FlareActor(
          "assets/Cade_Meu_dinheiro.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: "Saida",
        ),
      );
    }
    return Container(
      width: double.infinity,
      child: FlareActor(
        "assets/Cade_Meu_dinheiro.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    isActive = false;
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
          animation(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.4),
                  Text(
                    "Consulte a análise de gastos",
                    style: TextStyle(color: Color(0XFF8F8F8F)),
                  ),
                  SizedBox(height: size.height * 0.002),
                  Text(
                    "por deputado",
                    style: TextStyle(color: Color(0XFF8F8F8F)),
                  ),
                  SizedBox(height: size.height * 0.03),
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
                        return GestureDetector(
                          onTap: () {
                            _onTap();
                            Future.delayed(Duration(seconds: 2)).then((_) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DepSearch()));
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: Color(0XFF013421),
                              border: Border.all(color: Color(0XFF707070)),
                              borderRadius:
                                  BorderRadius.circular(isLoading ? 40 : 10),
                            ),
                            width: isLoading ? 50 : size.width * 0.55,
                            height: size.height * 0.07,
                            alignment: Alignment.center,
                            child: AnimatedCrossFade(
                              duration: Duration(milliseconds: 200),
                              firstChild: Center(
                                child: Text(
                                  "Prosseguir",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              secondChild: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                              crossFadeState: isLoading
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                            ),
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
                              child: Text(
                                "Aguarde",
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
