import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_app/database_helper.dart';
import 'package:reactive_app/widgets/news_wiget.dart';


class ViewData extends StatelessWidget {

  final dbHelper = DatabaseHelper.instance;

  Stream <List<dynamic>> getNews(BuildContext context) async* {
    final rows = await dbHelper.queryAllRows();
    yield rows;
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  StreamBuilder(
          stream: getNews(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot.data);
            if(snapshot.data == null){
              return Container(
                  child: Center(
                      child: Text("Loading...")
                  )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int i) {
                  return  NewsWidget(
              title: snapshot.data[i]['title'],
              author: snapshot.data[i]['author'],
              description: snapshot.data[i]['description'],
              publishedAt: snapshot.data[i]['publishedAt'],
              source: snapshot.data[i]['source'],
            );
                },
              );
            }
          },
        ),
    );
  }
}



//
//
//
//
//
// class ViewData extends StatelessWidget {
//   final rows;
//
//   ViewData({this.rows});
//
//   @override
//   Widget build(BuildContext context) {
//     print(rows.length);
//     return Scaffold(
//       body: Visibility(
//         visible: rows.length > 0 ,
//         child: ListView.builder(
//           itemCount: rows.length,
//           itemBuilder: (context, i) {
//             return NewsWidget(
//               title: rows[i]['title'],
//               author: rows[i]['author'],
//               description: rows[i]['description'],
//               publishedAt: rows[i]['publishedAt'],
//               source: rows[i]['source'],
//             );
//           },
//         ),
//         replacement: Center(
//           child: Text("There is No Data Yet"),
//         ),
//       )
//     );
//   }
// }
