class News {
  final String source;
  final String author;
  final String title;
  final String description;
  final String publishedAt;

  News(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.publishedAt});

  Map<String, dynamic> toMap() {
    return {
      'source': source,
      'author': author,
      'title': title,
      'description': description,
      'publishedAt': publishedAt
    };
  }
}
