import 'dart:convert';

class Article {
  final String? author;
  final String title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;
  final String? sourceName;

  Article({
    required this.title,
    this.author,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.sourceName,
  });

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] ?? '(Không có tiêu đề)',
      author: map['author'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'] != null
          ? DateTime.tryParse(map['publishedAt'])
          : null,
      content: map['content'],
      sourceName: (map['source'] != null) ? map['source']['name'] : null,
    );
  }

  static List<Article> listFromResponse(String body) {
    final jsonMap = json.decode(body) as Map<String, dynamic>;
    final List list = jsonMap['articles'] ?? [];
    return list.map((e) => Article.fromMap(e)).toList();
  }
}