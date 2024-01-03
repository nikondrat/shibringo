import 'package:get_it/get_it.dart';
import 'package:shibringo/domain/services/remote/dio_service.dart';
import 'package:user_repository/repository.dart';

import '../../views/auth/stores/stores.dart';

class DI {
  static final i = GetIt.instance;

  static Future<void> init() async {
    i.registerLazySingleton(() => DioService());

    _dataSources();
    _repositories();
    _useCases();

    _stores();
  }

  static void _dataSources() {}

  static void _repositories() {
    i.registerLazySingleton<AuthRepository>(() => SupabaseAuth());
    i.registerLazySingleton<UserRepository>(() => SupabaseUser());
  }

  static void _useCases() {}

  static void _stores() {
    i.registerLazySingleton(() => AuthStore());

    i.registerLazySingleton(() => LoginStore());
    i.registerLazySingleton(() => SignUpStore());
  }
}
