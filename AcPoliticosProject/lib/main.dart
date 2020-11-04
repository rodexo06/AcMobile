import 'package:AcPoliticos/src/view/DepDevs.dart';
import 'package:AcPoliticos/src/view/DepHome.dart';
import 'package:AcPoliticos/src/view/DepSearch.dart';
import 'package:AcPoliticos/src/view/DepSumGastos.dart';
import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
      BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Busca")),
      BottomNavigationBarItem(
          icon: Icon(Icons.accessibility), title: Text("Deputado")),
    ];
  }

  List<Widget> pages() {
    return [
      DepHome(),
      DepSearch(),
      DepSumGastos(),
      DepDevs(),
    ];
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(
          pages: pages(), buildBottomNavBarItems: buildBottomNavBarItems()),
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

class ExampleForm extends StatefulWidget {
  ExampleForm();

  @override
  _ExampleFormState createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData;
  List<String> cities = [
    'Bangalore',
    'Chennai',
    'Chennay',
    'New York',
    'Mumbai',
    'Delhi',
    'Tokyo',
  ];
  List<String> countries = [
    'INDIA',
    'USA',
    'JAPAN',
  ];

  _ExampleFormState() {
    formData = {
      'City': 'Bangalore',
      'Country': 'INDIA',
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: buildFutures(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            default:
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                if (snapshot.data != null)
                  return Scaffold(
                      body: Container(
                    color: Colors.white,
                    constraints: BoxConstraints.expand(),
                    child: Form(
                      key: _formKey,
                      autovalidate: false,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Divider(
                                height: 10.0,
                                color: Theme.of(context).primaryColor),
                            DropDownField(
                              value: formData['City'],
                              icon: Icon(Icons.location_city),
                              required: true,
                              hintText: 'Choose a city',
                              labelText: 'City *',
                              items: cities,
                              strict: false,
                              setter: (dynamic newValue) {
                                formData['City'] = newValue;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
                else
                  return LinearProgressIndicator();
              }
          }
        });
  }

  Future<bool> buildFutures() async {
    return true;
  }
}
