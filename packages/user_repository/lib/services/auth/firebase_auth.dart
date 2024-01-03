import 'package:user_repository/repository/auth_repository.dart';
import 'package:user_repository/models/authentication/authentication_state.dart';

class FirebaseAuth extends AuthRepository {
  @override
  Future signIn(String email, String password,
      {required Function onDone,
      required Function(AuthStateException exception) onError}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future signUp(String email, String password,
      {Map<String, dynamic>? data,
      required Function onDone,
      required Function(AuthStateException exception) onError}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
