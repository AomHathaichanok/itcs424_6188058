import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Book Store",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 4, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.green));
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          indicator: UnderlineTabIndicator(
              insets:
                  EdgeInsets.symmetric(horizontal: 16.0)), //underlineindicator
          controller: controller,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.person_add)),
            Tab(icon: Icon(Icons.notifications)),
            Tab(icon: Icon(Icons.clear_all)),
          ], //widget
        ), //tabbar
      ), // AppBar
      body: TabBarView(controller: controller, children: <Widget>[
        HomePage(),
        HomePage(),
        HomePage(),
        HomePage(),
      ]),
    ); // Scaffold
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List names = [
    'Neozone C',
    'NeoZone N',
    'NeoZone T',
    'Punch 1st Player',
    'Punch 2nd Player',
    'Cherry Bomb',
    'Nct2020 Part.1',
    'NCT2020 Part.2',
    'SuperHuman',
    'NCT 2018'
  ];
  List descriptions = [
    '550',
    '550',
    '650',
    '570',
    '570',
    '600',
    '620',
    '620',
    '580',
    '490'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green[100],
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ), //rounded
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 55.0,
                          height: 55.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.green,
                            Image.asset('pic1.jpg'),
                          ), //circleava
                        ), //container
                        
                        SizedBox(width: 6.0),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(names[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 5.0),
                              Text(descriptions[index],
                                  style: TextStyle(color: Colors.grey)),
                            ] //widget
                            ), //column
                      ], //widet
                    ), //row
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.red[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ), //rounded border
                        child: Text("Buy now",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
