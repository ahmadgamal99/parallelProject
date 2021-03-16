import 'package:flutter/material.dart';
import 'package:reactive_app/models/news.dart';
import 'package:reactive_app/networking.dart';
import 'package:reactive_app/screens/view_data.dart';
import 'package:reactive_app/widgets/btn_widget.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:reactive_app/database_helper.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

final Networking _networking = Networking();
final dbHelper = DatabaseHelper.instance;

class Reactive extends StatefulWidget {
  @override
  _ReactiveState createState() => _ReactiveState();
}

class _ReactiveState extends State<Reactive> {
  var responses = [];

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      backgroundColor: Colors.red,
      barrierColor: Color.fromRGBO(255, 255, 255, 0.3),
      child: Builder(
        builder: (context) => Scaffold(
          body: Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Reactive",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 25,
                ),
                ButtonWidget(
                  title: "Get Api",
                  background: Colors.red,
                  function: () async {
                    final progress = ProgressHUD.of(context);
                    progress.show();

                    responses = await _networking.getApi();

                    // print(responses);

                    for (var response in responses) {

                      if (response['status'] != "ok") {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          title: "Failed !!",
                          text: "لم يتم تحميل جميع الاخبار",
                        );
                        progress.dismiss();
                        return;
                      }

                    }

                    progress.dismiss();

                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: "Done !!",
                      text: "You Got The Data Successfully",
                    );

                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                  title: "Insert Into DB",
                  background: Colors.amber,
                  function: () {

                    for (var response in responses) {

                      News news = News(
                          author: response['articles'][0]['author'],
                          source: response['articles'][0]['source']['name'],
                          title: response['articles'][0]['title'],
                          description: response['articles'][0]['description'],
                          publishedAt: response['articles'][0]['publishedAt'],
                      );

                      _insert(news);
                    }

                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: "Done !!",
                      text: "You Inserted The Data Successfully",
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                  title: "Get From DB",
                  background: Colors.green,
                  function: () {
                    final progress = ProgressHUD.of(context);
                    progress.show();
                    _query(context);
                    progress.dismiss();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _insert(News news) async {
    // row to insert
    Map<String, dynamic> row = news.toMap();
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query(BuildContext context) async {
    final allRows = await dbHelper.queryAllRows();
    print(allRows);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewData(rows: allRows)));
  }
}
