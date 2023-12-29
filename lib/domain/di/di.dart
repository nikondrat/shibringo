import 'package:get_it/get_it.dart';
import 'package:shibringo/domain/services/remote/dio_service.dart';
import 'package:shibringo/views/auth/providers/auth_store.dart';

class DI {
  static final i = GetIt.instance;

  static Future<void> init() async {
    i.registerLazySingleton(() => DioService());

    i.registerLazySingleton(() => AuthStore(),
        dispose: (param) => param.dispose());

    _dataSources();
    _repositories();
    _useCases();
  }

  static void _dataSources() {}

  static void _repositories() {}
  static void _useCases() {}
}
