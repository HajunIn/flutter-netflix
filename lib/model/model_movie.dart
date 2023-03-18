import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool like;
  final DocumentReference reference;

  Movie.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'] ?? '애마부인',
        keyword = map['keyword'] ?? '액션',
        poster = map['poster'] ?? 'https://mblogthumb-phinf.pstatic.net/MjAyMDAyMjlfOTAg/MDAxNTgyOTU0NzYxMDk3.mH0-Z0fqnFnv_6XzHnBW2GmarwHM52_tuWb-X5HbO-8g.XNS0xkumSTu47rS_1XMnZraYUG2jfEd1c__HUyXL5jog.JPEG.hdhdd/DPK004990_01.jpg?type=w2',
        like = map['like'] ?? false;

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Movie<$title:$keyword>";
}
