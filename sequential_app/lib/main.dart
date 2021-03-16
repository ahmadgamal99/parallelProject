import 'package:flutter/material.dart';
import 'screens/sequential.dart';
import 'screens/view_data.dart';
import 'package:flutter/widgets.dart';

void main() async {
  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: "/sequential",
      routes: {
        "/sequential": (context) => Sequential(),
        "/view-data": (context) => ViewData(),
      },
    );
  }
}
