import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final String source;
  final String author;
  final String title;
  final String description;
  final String publishedAt;

  NewsWidget(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Material(
        elevation: 20,
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text("source : $source",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 15,
              ),
              Text("author : $author",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 15,
              ),
              Text("date : $publishedAt",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 15,
              ),
              Text("$title",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 15,
              ),
              Text("$description",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
