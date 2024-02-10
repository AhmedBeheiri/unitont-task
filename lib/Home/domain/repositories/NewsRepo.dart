import 'package:dartz/dartz.dart';
import 'package:unittoni_tasks/Home/domain/entities/news_entity.dart';
import 'package:unittoni_tasks/core/error/failures.dart';

abstract class NewsRepo {
  Future<Either<Failure,NewsEntity>> searchNews(String query);
}