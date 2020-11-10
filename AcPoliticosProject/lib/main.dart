import 'package:flutter/material.dart';

import 'src/view/SplashWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}

class Home extends StatefulWidget {
  final List<Widget> pages;
  final List<BottomNavigationBarItem> buildBottomNavBarItems;

  const Home({Key key, this.pages, this.buildBottomNavBarItems})
      : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller;
  int bottomSelectedIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: widget.pages,
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          setState(
            () {
              bottomSelectedIndex = index;
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
          );
        },
        backgroundColor: Color(0XFF013421),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: widget.buildBottomNavBarItems,
      ),
    );
  }
}
