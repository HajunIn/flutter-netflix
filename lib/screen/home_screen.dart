import 'package:flutter/material.dart';
import 'package:infrearn/model/model_movie.dart';
import 'package:infrearn/widget/circle_slider.dart';
import 'package:infrearn/widget/box_slider.dart';

import '../widget/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  _HomeScrennState createState() => _HomeScrennState();

}
class _HomeScrennState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title' : "사랑의 불시착",
      'keyword' : "사랑/로맥틱/판타지",
      'poster' : "test_movie_1.png",
      'like' : false,
    }),
    Movie.fromMap({
      'title' : "사랑의 불시착",
      'keyword' : "사랑/로맥틱/판타지",
      'poster' : "test_movie_1.png",
      'like' : false,
    }),
    Movie.fromMap({
      'title' : "사랑의 불시착",
      'keyword' : "사랑/로맥틱/판타지",
      'poster' : "test_movie_1.png",
      'like' : false,
    }),
    Movie.fromMap({
      'title' : "사랑의 불시착",
      'keyword' : "사랑/로맥틱/판타지",
      'poster' : "test_movie_1.png",
      'like' : false,
    })
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselImeage(movies: movies),
            TopBar(),
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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