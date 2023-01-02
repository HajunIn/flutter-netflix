import 'package:flutter/material.dart';
import 'package:infrearn/model/model_movie.dart';
import 'package:infrearn/screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;
  CircleSlider({this.movies});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("미리보기"),
          Container(
            height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal, //좌우 스크롤
               // scrollDirection: Axis.vertical, //상하 스크롤
                children: makeCirCleImages(context, movies),
              ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeCirCleImages(BuildContext context, List<Movie> movies) {
  List<Widget> result = [];
  for (var i=0; i<movies.length; i++) {
    result.add(
      InkWell( //클릭 가능하게 하는것
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<Null>(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(
                  movie: movies[i], //파라미터로 영화 정보 넘김
                );
              }));
        },
        child: Container(
          padding: EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage('images/' + movies[i].poster),
              radius: 48,
            ),
          ),
        ),
      )
    );
  }
  return result;
}