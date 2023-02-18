import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:infrearn/screen/home_screen.dart';
import 'package:infrearn/screen/more_screen.dart';
import 'package:infrearn/widget/Bommtom_bar.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

  class MyApp extends StatefulWidget {
    _MyAppState createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {
    TabController controller;
    @override
    Widget build(BuildContext context) {
     return MaterialApp(
          title: "HA-JUN",
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