import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:infrearn/model/model_movie.dart';
import 'package:infrearn/screen/detail_screen.dart';

class CarouselImeage extends StatefulWidget {
  final List<Movie> movies;

  const CarouselImeage({this.movies, movis});

  _CarouselImeageState createState() => _CarouselImeageState();
}

class _CarouselImeageState extends State<CarouselImeage> {
  List<Movie> movies;
  List<Widget> images;
  List<String> keywords;
  List<bool> likes;
  int _cureentPage = 0;
  String _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.asset('./images/' + m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(onPageChanged: (index, reason) {
              setState(() {
                _cureentPage = index;
                _currentKeyword = keywords[_cureentPage];
              });
            }),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      likes[_cureentPage]
                          ? IconButton(
                              onPressed: () {}, icon: Icon(Icons.check))
                          : IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      Text(
                        "내가 찜한 콘텐츠",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                        ),
                        Text(
                          "재생",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                              fullscreenDialog: true,
                              builder: (BuildContext context) {
                                return DetailScreen(
                                  movie: movies[_cureentPage], //파라미터로 영화 정보 넘김
                                );
                              }));
                        },
                      ),
                      Text(
                        "정보",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: makeIndicator(likes, _cureentPage),
          )),
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == 1
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4)),
    ));
  }
  return result;
}
