import 'package:AcPoliticos/main.dart';
import 'package:AcPoliticos/src/view/DepHome.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DepDevs.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
      // BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Busca")),
      BottomNavigationBarItem(
          icon: Icon(Icons.accessibility), title: Text("Devs")),
    ];
  }

  List<Widget> pages() {
    return [
      DepHome(),
      DepDevs(),
    ];
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                  pages: pages(),
                  buildBottomNavBarItems: buildBottomNavBarItems())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Color(0XFF004A2F)),
          Container(
              child: FlareActor(
            "assets/Cade_Meu_dinheiro.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "Entrada",
          )),
        ],
      ),
    );
  }
}
