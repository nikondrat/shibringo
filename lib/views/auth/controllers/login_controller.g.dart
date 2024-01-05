// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginController, Store {
  Computed<String?>? _$emailComputed;

  @override
  String? get email => (_$emailComputed ??=
          Computed<String?>(() => super.email, name: '_LoginController.email'))
      .value;
  Computed<String?>? _$passwordComputed;

  @override
  String? get password =>
      (_$passwordComputed ??= Computed<String?>(() => super.password,
              name: '_LoginController.password'))
          .value;

  late final _$isShowPasswordAtom =
      Atom(name: '_LoginController.isShowPassword', context: context);

  @override
  bool get isShowPassword {
    _$isShowPasswordAtom.reportRead();
    return super.isShowPassword;
  }

  @override
  set isShowPassword(bool value) {
    _$isShowPasswordAtom.reportWrite(value, super.isShowPassword, () {
      super.isShowPassword = value;
    });
  }

  late final _$loginFutureAtom =
      Atom(name: '_LoginController.loginFuture', context: context);

  @override
  ObservableFuture<dynamic>? get loginFuture {
    _$loginFutureAtom.reportRead();
    return super.loginFuture;
  }

  @override
  set loginFuture(ObservableFuture<dynamic>? value) {
    _$loginFutureAtom.reportWrite(value, super.loginFuture, () {
      super.loginFuture = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginController.login', context: context);

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_LoginControllerActionController =
      ActionController(name: '_LoginController', context: context);

  @override
  void togglePasswordForm() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.togglePasswordForm');
    try {
      return super.togglePasswordForm();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowPassword: ${isShowPassword},
loginFuture: ${loginFuture},
email: ${email},
password: ${password}
    ''';
  }
}
