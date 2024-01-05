import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/domain/router.dart';
import 'package:shibringo/domain/utils/utils.dart';
import 'package:user_repository/repository.dart';

import '../../../domain/di/di.dart';

part 'account_setup_controller.g.dart';

class AccountSetupController extends _AccountSetupController
    with _$AccountSetupController {}

abstract class _AccountSetupController with Store {
  final UserRepository _userRepository = DI.i.get();

  FormGroup? formGroup;

  void initFormGroup() => formGroup = FormGroup({
        'nickname': FormControl(validators: [Validators.required])
      });

  void dispose() => formGroup?.dispose();

  @computed
  String? get nickname => formGroup?.control('nickname').value;

  @observable
  String? imageUrl;

  @observable
  Color? errorColor;

  @observable
  ObservableFuture? changeAvatarFuture;

  @action
  Future changeAvatar() async {
    changeAvatarFuture = ObservableFuture(_userRepository.changeAvatar(
      onDone: (url) {
        imageUrl = url;
      },
      onError: (exception) {
        errorColor = Colors.red;
        ExceptionUtil.showToast(exception);
      },
    ));
    await changeAvatarFuture;
  }

  @observable
  ObservableFuture? updateUserDataFuture;

  @action
  Future updateUserData() async {
    if (formGroup != null && formGroup!.valid) {
      updateUserDataFuture = ObservableFuture(_userRepository.updateUserData(
          {'nickname': nickname},
          avatarUrl: imageUrl,
          onDone: () => router.goNamed(AppViews.home),
          onError: (e) => ExceptionUtil.showToast(e)));
      await updateUserDataFuture;
    }
  }
}
