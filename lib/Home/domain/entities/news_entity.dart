import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final List<ArticleEntity> newsArticles;

  const NewsEntity({
    required this.newsArticles,
  });

  @override
  List<Object?> get props => [newsArticles];
}

class ArticleEntity extends Equatable {
  final String arTitle;
  final String arDescription;
  final String arAuthor;

  const ArticleEntity({
    required this.arTitle,
    required this.arDescription,
    required this.arAuthor,
  });

  @override
  List<Object?> get props => [
        arTitle,
        arDescription,
        arAuthor,
      ];
}
