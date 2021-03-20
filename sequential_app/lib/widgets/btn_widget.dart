import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color background;
  final String title;
  final Function function;

  ButtonWidget({this.background, this.title, this.function});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(20.0),
      height: 60,
      elevation: 35,
      onPressed: function,
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            bottomLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(0.0)),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
