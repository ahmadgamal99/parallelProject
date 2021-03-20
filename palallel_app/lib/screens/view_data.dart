import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palallel_app/widgets/news_wiget.dart';

class ViewData extends StatelessWidget {
  final rows;

  ViewData({this.rows});

  @override
  Widget build(BuildContext context) {
    print(rows.length);
    return Scaffold(
      body: Visibility(
        visible: rows.length > 0 ,
        child: ListView.builder(
          itemCount: rows.length,
          itemBuilder: (context, i) {
            return NewsWidget(
              title: rows[i]['title'],
              author: rows[i]['author'],
              description: rows[i]['description'],
              publishedAt: rows[i]['publishedAt'],
              source: rows[i]['source'],
            );
          },
        ),
        replacement: Center(
          child: Text("There is No Data Yet"),
        ),
      )
    );
  }
}
