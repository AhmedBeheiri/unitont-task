import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env') // Customize path if needed
abstract class Env {
  @EnviedField(varName: 'NEWS_API_KEY')
  static const String apiKey = _Env.apiKey;

// Define other environment variables with @EnviedField
}
