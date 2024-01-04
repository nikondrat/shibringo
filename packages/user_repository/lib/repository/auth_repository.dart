import '../models/models.dart';

abstract class AuthRepository {
  Future signUp(String email, String password,
      {Map<String, dynamic>? data,
      required Function onDone,
      required Function(ConnectionStateException exception) onError});
  Future signIn(String email, String password,
      {required Function onDone,
      required Function(ConnectionStateException exception) onError});

  Future resetPassword(String email,
      {required Function(ConnectionStateException exception) onError});

  Future signOut();
}
