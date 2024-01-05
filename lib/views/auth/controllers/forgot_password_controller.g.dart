// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordController on _ForgotPasswordController, Store {
  Computed<String?>? _$emailComputed;

  @override
  String? get email => (_$emailComputed ??= Computed<String?>(() => super.email,
          name: '_ForgotPasswordController.email'))
      .value;

  late final _$resetFutureAtom =
      Atom(name: '_ForgotPasswordController.resetFuture', context: context);

  @override
  ObservableFuture<dynamic>? get resetFuture {
    _$resetFutureAtom.reportRead();
    return super.resetFuture;
  }

  @override
  set resetFuture(ObservableFuture<dynamic>? value) {
    _$resetFutureAtom.reportWrite(value, super.resetFuture, () {
      super.resetFuture = value;
    });
  }

  late final _$resetPasswordAsyncAction =
      AsyncAction('_ForgotPasswordController.resetPassword', context: context);

  @override
  Future<dynamic> resetPassword() {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword());
  }

  @override
  String toString() {
    return '''
resetFuture: ${resetFuture},
email: ${email}
    ''';
  }
}
