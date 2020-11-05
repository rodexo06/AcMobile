import 'package:flutter/material.dart';

import 'widget/CustomCircleImage.dart';

class DepDevs extends StatefulWidget {
  @override
  _DepDevsState createState() => _DepDevsState();
}

class _DepDevsState extends State<DepDevs> {
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
          padding: const EdgeInsets.only(top: 35),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.02),

                // Logo do Grupo
                Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(60.0))),
                    height: 75,
                    width: 75,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "assets/logoMiaus.jpeg",
                        ))),
                SizedBox(height: size.height * 0.01),
                Text(
                  "Grupo Astronomiaus",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.005),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(color: Colors.grey, height: 10),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  decoration: new BoxDecoration(
                      color: Color(0XFF013421),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  height: size.height * 0.635,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Cadê Meu Dinheiro",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 5),
                          child: Container(
                            child: Row(
                              children: [
                                CustomCircleImageWidget(
                                    width: 70,
                                    height: 70,
                                    caminhoImagem: "assets/Fortinho.jpeg"),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Leonardo Andrade Fortes',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text('RA: 1901002',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            child: Row(
                              children: [
                                CustomCircleImageWidget(
                                    width: 70,
                                    height: 70,
                                    caminhoImagem: "assets/Leozinho.jpeg"),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Leonardo de Lima Oliveira',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text('RA: 1900164',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            child: Row(
                              children: [
                                CustomCircleImageWidget(
                                    width: 70,
                                    height: 70,
                                    caminhoImagem: "assets/Rafinha.jpg"),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Rafael Ferreira de Lima',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text('RA: 1901750',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            child: Row(
                              children: [
                                CustomCircleImageWidget(
                                    width: 70,
                                    height: 70,
                                    caminhoImagem: "assets/Charrinho.jpeg"),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Thiago Charro Melo da Silva',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text('RA: 1901089',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            child: Row(
                              children: [
                                CustomCircleImageWidget(
                                    width: 70,
                                    height: 70,
                                    caminhoImagem: "assets/PereiraFunk.jpeg"),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Thiago Pereira da Silva',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text('RA: 1900949',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
