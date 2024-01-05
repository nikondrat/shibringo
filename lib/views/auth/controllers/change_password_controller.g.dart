// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordController on _ChangePasswordController, Store {
  Computed<String?>? _$passwordComputed;

  @override
  String? get password =>
      (_$passwordComputed ??= Computed<String?>(() => super.password,
              name: '_ChangePasswordController.password'))
          .value;
  Computed<String?>? _$repeatComputed;

  @override
  String? get repeat =>
      (_$repeatComputed ??= Computed<String?>(() => super.repeat,
              name: '_ChangePasswordController.repeat'))
          .value;

  late final _$isShowPasswordAtom =
      Atom(name: '_ChangePasswordController.isShowPassword', context: context);

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

  late final _$isShowRepeatPasswordAtom = Atom(
      name: '_ChangePasswordController.isShowRepeatPassword', context: context);

  @override
  bool get isShowRepeatPassword {
    _$isShowRepeatPasswordAtom.reportRead();
    return super.isShowRepeatPassword;
  }

  @override
  set isShowRepeatPassword(bool value) {
    _$isShowRepeatPasswordAtom.reportWrite(value, super.isShowRepeatPassword,
        () {
      super.isShowRepeatPassword = value;
    });
  }

  late final _$changePasswordFutureAtom = Atom(
      name: '_ChangePasswordController.changePasswordFuture', context: context);

  @override
  ObservableFuture<dynamic>? get changePasswordFuture {
    _$changePasswordFutureAtom.reportRead();
    return super.changePasswordFuture;
  }

  @override
  set changePasswordFuture(ObservableFuture<dynamic>? value) {
    _$changePasswordFutureAtom.reportWrite(value, super.changePasswordFuture,
        () {
      super.changePasswordFuture = value;
    });
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('_ChangePasswordController.changePassword', context: context);

  @override
  Future<dynamic> changePassword() {
    return _$changePasswordAsyncAction.run(() => super.changePassword());
  }

  late final _$_ChangePasswordControllerActionController =
      ActionController(name: '_ChangePasswordController', context: context);

  @override
  void togglePasswordForm() {
    final _$actionInfo = _$_ChangePasswordControllerActionController
        .startAction(name: '_ChangePasswordController.togglePasswordForm');
    try {
      return super.togglePasswordForm();
    } finally {
      _$_ChangePasswordControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordRepeatForm() {
    final _$actionInfo =
        _$_ChangePasswordControllerActionController.startAction(
            name: '_ChangePasswordController.togglePasswordRepeatForm');
    try {
      return super.togglePasswordRepeatForm();
    } finally {
      _$_ChangePasswordControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowPassword: ${isShowPassword},
isShowRepeatPassword: ${isShowRepeatPassword},
changePasswordFuture: ${changePasswordFuture},
password: ${password},
repeat: ${repeat}
    ''';
  }
}
