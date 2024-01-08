import 'package:get_it/get_it.dart';
import 'package:shibringo/domain/services/remote/dio_service.dart';
import 'package:user_repository/repository.dart';
import 'package:user_repository/services/user/firebase_user.dart';

import '../../views/auth/controllers/controllers.dart';

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
    i.registerLazySingleton<AuthRepository>(() => FirebaseAuthImpl());
    i.registerLazySingleton<UserRepository>(() => FirebaseUser());
  }

  static void _useCases() {}

  static void _stores() {
    i.registerLazySingleton(() => AuthController());

    i.registerLazySingleton(() => LoginController());
    i.registerLazySingleton(() => SignUpController());
    i.registerLazySingleton(() => ForgotPasswordController());
    i.registerLazySingleton(() => AccountSetupController());
    i.registerLazySingleton(() => ChangePasswordController());
  }
}
