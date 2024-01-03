import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:user_repository/repository/auth_repository.dart';

import '../../models/models.dart';

class SupabaseAuth extends AuthRepository {
  final _supabase = Supabase.instance.client.auth;

  @override
  Future signIn(String email, String password,
      {required Function onDone,
      required Function(AuthStateException exception) onError}) async {
    try {
      return await _supabase
          .signInWithPassword(email: email, password: password)
          .then((value) {
        if (value.session != null) return onDone();
      });
    } on AuthException catch (e) {
      if (e.statusCode != null) {
        switch (int.parse(e.statusCode!)) {
          case 429:
            return onError(AuthStateException.tryLater);
        }
      }

      return onError(AuthStateException.unknown);
    }
  }

  @override
  Future signOut() async {
    return _supabase.signOut();
  }

  @override
  Future signUp(String email, String password,
      {Map<String, dynamic>? data,
      required Function onDone,
      required Function(AuthStateException exception) onError}) async {
    try {
      return await _supabase
          .signUp(email: email, password: password, data: data)
          .then((value) {
        if (value.user != null) return onDone();
      });
    } on AuthException catch (e) {
      if (e.statusCode != null) {
        switch (int.parse(e.statusCode!)) {
          case 429:
            return onError(AuthStateException.tryLater);
        }
      }

      return onError(AuthStateException.unknown);
    }
  }
}
