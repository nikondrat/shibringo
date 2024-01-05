// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_setup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountSetupController on _AccountSetupController, Store {
  Computed<String?>? _$nicknameComputed;

  @override
  String? get nickname =>
      (_$nicknameComputed ??= Computed<String?>(() => super.nickname,
              name: '_AccountSetupController.nickname'))
          .value;

  late final _$imageUrlAtom =
      Atom(name: '_AccountSetupController.imageUrl', context: context);

  @override
  String? get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String? value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$errorColorAtom =
      Atom(name: '_AccountSetupController.errorColor', context: context);

  @override
  Color? get errorColor {
    _$errorColorAtom.reportRead();
    return super.errorColor;
  }

  @override
  set errorColor(Color? value) {
    _$errorColorAtom.reportWrite(value, super.errorColor, () {
      super.errorColor = value;
    });
  }

  late final _$changeAvatarFutureAtom = Atom(
      name: '_AccountSetupController.changeAvatarFuture', context: context);

  @override
  ObservableFuture<dynamic>? get changeAvatarFuture {
    _$changeAvatarFutureAtom.reportRead();
    return super.changeAvatarFuture;
  }

  @override
  set changeAvatarFuture(ObservableFuture<dynamic>? value) {
    _$changeAvatarFutureAtom.reportWrite(value, super.changeAvatarFuture, () {
      super.changeAvatarFuture = value;
    });
  }

  late final _$updateUserDataFutureAtom = Atom(
      name: '_AccountSetupController.updateUserDataFuture', context: context);

  @override
  ObservableFuture<dynamic>? get updateUserDataFuture {
    _$updateUserDataFutureAtom.reportRead();
    return super.updateUserDataFuture;
  }

  @override
  set updateUserDataFuture(ObservableFuture<dynamic>? value) {
    _$updateUserDataFutureAtom.reportWrite(value, super.updateUserDataFuture,
        () {
      super.updateUserDataFuture = value;
    });
  }

  late final _$changeAvatarAsyncAction =
      AsyncAction('_AccountSetupController.changeAvatar', context: context);

  @override
  Future<dynamic> changeAvatar() {
    return _$changeAvatarAsyncAction.run(() => super.changeAvatar());
  }

  late final _$updateUserDataAsyncAction =
      AsyncAction('_AccountSetupController.updateUserData', context: context);

  @override
  Future<dynamic> updateUserData() {
    return _$updateUserDataAsyncAction.run(() => super.updateUserData());
  }

  @override
  String toString() {
    return '''
imageUrl: ${imageUrl},
errorColor: ${errorColor},
changeAvatarFuture: ${changeAvatarFuture},
updateUserDataFuture: ${updateUserDataFuture},
nickname: ${nickname}
    ''';
  }
}
