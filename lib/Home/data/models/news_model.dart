import 'package:unittoni_tasks/Home/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  final List<Articles> articles;

  const NewsModel({
    required this.articles,
  }) : super(newsArticles: articles);

  Map<String, dynamic> toMap() {
    return {
      'articles': articles,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      articles:
          (map['articles'] as List).map((e) => Articles.fromMap(e)).toList(),
    );
  }
}

class Articles extends ArticleEntity {
  final String title;
  final String description;
  final String author;

  const Articles({
    required this.title,
    required this.description,
    required this.author,
  }) : super(arTitle: title, arDescription: description, arAuthor: author);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'author': author,
    };
  }

  factory Articles.fromMap(Map<String, dynamic> map) {
    return Articles(
      title: map['title'],
      description: map['description'] ??'No description',
      author: map['author'] ??'Unknown'
    );
  }
}
