import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/models/connection_state_exception.dart';
import 'package:user_repository/models/models.dart';
import 'package:user_repository/repository/auth_repository.dart';

class FirebaseAuthImpl extends AuthRepository {
  @override
  Future resetPassword(String email,
      {required Function onDone,
      required Function(ConnectionStateException exception) onError}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future signIn(String email, String password,
      {required Function onDone,
      required Function(ConnectionStateException exception) onError}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (_) {
      onError(ConnectionStateException.unknown);
    } catch (e) {
      onError(ConnectionStateException.unknown);
    }
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
      required Function(ConnectionStateException exception) onError}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future changePassword(String password,
      {required Function onDone,
      required Function(ConnectionStateException exception) onError}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
}
