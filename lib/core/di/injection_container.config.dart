// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:unittoni_tasks/Home/data/data_sources/news_remote_data_source.dart'
    as _i3;
import 'package:unittoni_tasks/Home/data/repositories/news_repo_impl.dart'
    as _i5;
import 'package:unittoni_tasks/Home/domain/repositories/news_repo.dart' as _i4;
import 'package:unittoni_tasks/Home/presentation/manager/home_cubit.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.NewsRemoteDataSource>(
        () => _i3.NewsRemoteDataSourceImpl());
    gh.lazySingleton<_i4.NewsRepo>(() =>
        _i5.NewsRepoImpl(newsRemoteDataSource: gh<_i3.NewsRemoteDataSource>()));
    gh.factory<_i6.HomeCubit>(() => _i6.HomeCubit(gh<_i4.NewsRepo>()));
    return this;
  }
}
