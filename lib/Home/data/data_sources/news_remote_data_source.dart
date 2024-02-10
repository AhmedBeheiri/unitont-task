import 'package:injectable/injectable.dart';
import 'package:unittoni_tasks/Home/data/models/news_model.dart';
import 'package:unittoni_tasks/core/network/service.dart';

import '../../../core/error/exceptions.dart';

abstract class NewsRemoteDataSource {
  Future<NewsModel> searchNews(String query);
}

@LazySingleton(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  late NetworkService _networkService;

  NewsRemoteDataSourceImpl() {
    _networkService = NetworkService.create();
  }

  @override
  Future<NewsModel> searchNews(String query) async {
    final result = await _networkService.searchNews(query);
    if (result.isSuccessful) {
      return NewsModel.fromMap(result.body);
    } else {
      throw ServerException(result.statusCode, result.error.toString());
    }
  }
}
