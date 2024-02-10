// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$NetworkService extends NetworkService {
  _$NetworkService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = NetworkService;

  @override
  Future<Response<dynamic>> searchNews(
    String query, {
    String apiKey = Env.apiKey,
  }) {
    final Uri $url = Uri.parse('v2/everything');
    final Map<String, dynamic> $params = <String, dynamic>{
      'q': query,
      'apiKey': apiKey,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
