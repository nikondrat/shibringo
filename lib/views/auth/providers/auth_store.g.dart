// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$isShowPasswordAtom =
      Atom(name: '_AuthStore.isShowPassword', context: context);

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

  late final _$isShowResetPasswordAtom =
      Atom(name: '_AuthStore.isShowResetPassword', context: context);

  @override
  bool get isShowResetPassword {
    _$isShowResetPasswordAtom.reportRead();
    return super.isShowResetPassword;
  }

  @override
  set isShowResetPassword(bool value) {
    _$isShowResetPasswordAtom.reportWrite(value, super.isShowResetPassword, () {
      super.isShowResetPassword = value;
    });
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  void setIsShowPassword(bool v) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setIsShowPassword');
    try {
      return super.setIsShowPassword(v);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsShowResetPassword(bool v) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setIsShowResetPassword');
    try {
      return super.setIsShowResetPassword(v);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShowPassword: ${isShowPassword},
isShowResetPassword: ${isShowResetPassword}
    ''';
  }
}
