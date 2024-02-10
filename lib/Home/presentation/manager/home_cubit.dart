import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../domain/entities/news_entity.dart';
import '../../domain/repositories/NewsRepo.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final NewsRepo _newsRepository;

  HomeCubit(this._newsRepository) : super(HomeInitial());

  Future<void> searchFirstList(String query) async {
    emit(FirstListLoading());
    final result = await _newsRepository.searchNews(query);
    result.fold(
      (failure) => emit(
        HomeError((failure as ServerFailure).error),
      ),
      (news) => emit(FirstListLoaded(news.newsArticles)),
    );
  }

  Future<void> searchSecondList(String query) async {
    emit(SecondListLoading());
    final result = await _newsRepository.searchNews(query);
    result.fold(
      (failure) => emit(
        HomeError((failure as ServerFailure).error),
      ),
      (news) => emit(SecondListLoaded(news.newsArticles)),
    );
  }
}
