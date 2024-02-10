import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:unittoni_tasks/Home/domain/entities/news_entity.dart';
import 'package:unittoni_tasks/core/error/exceptions.dart';
import 'package:unittoni_tasks/core/error/failures.dart';

import '../../domain/repositories/NewsRepo.dart';
import '../data_sources/news_remote_data_source.dart';

@LazySingleton(as: NewsRepo)
class NewsRepoImpl implements NewsRepo {
  final NewsRemoteDataSource _newsRemoteDataSource;

  @override
  Future<Either<Failure, NewsEntity>> searchNews(String query) async {
    try {
      final result = await _newsRemoteDataSource.searchNews(query);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          statusCode: e.statusCode,
          error: e.error,
        ),
      );
    }
  }

  const NewsRepoImpl({
    required NewsRemoteDataSource newsRemoteDataSource,
  }) : _newsRemoteDataSource = newsRemoteDataSource;
}
