import 'package:flutter/material.dart';
import 'package:infrearn/model/model_movie.dart';
import 'package:infrearn/screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;
  BoxSlider({this.movies});
  @override
  Widget build (BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("지금 뜨는 콘텐츠"),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, movies),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(BuildContext context ,List<Movie> movies) {
  List<Widget> result = [];
  for (var i=0; i<movies.length; i++) {
    result.add(
        InkWell(
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
            padding: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.network(movies[i].poster),
            ),
          ),
        )
    );
  }
  return result;
}