part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}


class FirstListLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class FirstListLoaded extends HomeState {
  final List<ArticleEntity> newsArticles;

  const FirstListLoaded(this.newsArticles);

  @override
  List<Object> get props => [newsArticles];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}

class SecondListLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class SecondListLoaded extends HomeState {
  final List<ArticleEntity> newsArticles;

  const SecondListLoaded(this.newsArticles);

  @override
  List<Object> get props => [newsArticles];
}






