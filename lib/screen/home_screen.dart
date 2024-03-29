import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infrearn/model/model_movie.dart';
import 'package:infrearn/widget/circle_slider.dart';
import 'package:infrearn/widget/box_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widget/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  _HomeScrennState createState() => _HomeScrennState();

}
class _HomeScrennState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> streamData;

    void asyncMethod() async {
      streamData = await FirebaseFirestore.instance.collection('movie').snapshots();
      }


  @override
  void initState() {
    super.initState();
    // Firebase.initializeApp();
    WidgetsBinding.instance.addPostFrameCallback((_){
      asyncMethod();
    });


    // await for (var snapshot in streamData) {
    //   for (var messege in snapshot.docs) {
    //     print(messege.data);
    //   }
    // }
    // Stream<DocumentSnapshot<Map<String, dynamic>>> test = firestore.collection('movie').doc("").snapshots();
    //
    //
    // CollectionReference<Map<String,dynamic>> coll = FirebaseFirestore.instance.collection("movie");
    // QuerySnapshot<Map<String, dynamic>> snapshots = await coll.get();
    //
    // print("============");
    // print(streamData);
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselImage(movies: movies),
            TopBar(),
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Container(
      padding: EdgeInsets.fromLTRB(20,7,20,7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/65242621_2486830611381038_915899340625543168_n.jpg',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}