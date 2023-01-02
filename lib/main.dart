import 'package:flutter/material.dart';
import 'package:infrearn/screen/home_screen.dart';
import 'package:infrearn/screen/more_screen.dart';
import 'package:infrearn/widget/Bommtom_bar.dart';

void main() => runApp(MyApp());

  class MyApp extends StatefulWidget {
    _MyAppState createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {
    TabController controller;
    @override
    Widget build(BuildContext context) {
     return MaterialApp(
          title: "HAJUN",
          theme: ThemeData (
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white,
      ),
     home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView (
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                HomeScreen(),
                Container(child: const Center(
                  child: Text('search'),
                ),),
                Container(child: const Center(
                  child: Text('save'),
                ),),
              MoreScreen(),
                ],
            ),
            bottomNavigationBar: Bottom(),
          ),
       ),
      );
    }
  }