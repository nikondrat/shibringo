// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on _SignUpController, Store {
  Computed<String?>? _$nameComputed;

  @override
  String? get name => (_$nameComputed ??=
          Computed<String?>(() => super.name, name: '_SignUpController.name'))
      .value;
  Computed<String?>? _$emailComputed;

  @override
  String? get email => (_$emailComputed ??=
          Computed<String?>(() => super.email, name: '_SignUpController.email'))
      .value;
  Computed<String?>? _$passwordComputed;

  @override
  String? get password =>
      (_$passwordComputed ??= Computed<String?>(() => super.password,
              name: '_SignUpController.password'))
          .value;

  late final _$isShowPasswordAtom =
      Atom(name: '_SignUpController.isShowPassword', context: context);

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

  late final _$signUpFutureAtom =
      Atom(name: '_SignUpController.signUpFuture', context: context);

  @override
  ObservableFuture<dynamic>? get signUpFuture {
    _$signUpFutureAtom.reportRead();
    return super.signUpFuture;
  }

  @override
  set signUpFuture(ObservableFuture<dynamic>? value) {
    _$signUpFutureAtom.reportWrite(value, super.signUpFuture, () {
      super.signUpFuture = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('_SignUpController.signUp', context: context);

  @override
  Future<dynamic> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$_SignUpControllerActionController =
      ActionController(name: '_SignUpController', context: context);

  @override
  void togglePasswordForm() {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.togglePasswordForm');
    try {
      return super.togglePasswordForm();
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowPassword: ${isShowPassword},
signUpFuture: ${signUpFuture},
name: ${name},
email: ${email},
password: ${password}
    ''';
  }
}
