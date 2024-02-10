import 'package:chopper/chopper.dart';
import 'package:unittoni_tasks/env/env.dart';

part 'service.chopper.dart';

@ChopperApi()
abstract class NetworkService extends ChopperService {
  static NetworkService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://newsapi.org/'),
      services: [_$NetworkService()],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
    );
    return _$NetworkService(client);
  }

  @Get(path: 'v2/everything')
  Future<Response> searchNews(@Query('q') String query,
      {@Query('apiKey') String apiKey = Env.apiKey});
}
