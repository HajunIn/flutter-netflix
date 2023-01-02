import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build( BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/65242621_2486830611381038_915899340625543168_n.jpg'),
              ),
            )
          ],
        ),
      ),
    );
  }

}