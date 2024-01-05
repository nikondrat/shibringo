import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:user_repository/repository.dart';

import '../../../domain/di/di.dart';
import '../../../domain/utils/utils.dart';

part 'change_password_controller.g.dart';

class ChangePasswordController extends _ChangePasswordController
    with _$ChangePasswordController {}

abstract class _ChangePasswordController with Store {
  FormGroup? formGroup;

  void initFormGroup() => formGroup = FormGroup({
        'password': FormControl(
            validators: [Validators.required, Validators.minLength(8)]),
        'repeat': FormControl(validators: [Validators.required])
      }, validators: [
        const MustMatchValidator('password', 'repeat', true)
      ]);

  void dispose() => formGroup?.dispose();

  @computed
  String? get password => formGroup?.control('password').value;

  @computed
  String? get repeat => formGroup?.control('repeat').value;

  @observable
  bool isShowPassword = false;

  @action
  void togglePasswordForm() => isShowPassword = !isShowPassword;

  @observable
  bool isShowRepeatPassword = false;

  @action
  void togglePasswordRepeatForm() =>
      isShowRepeatPassword = !isShowRepeatPassword;

  @observable
  ObservableFuture? changePasswordFuture;

  @action
  Future changePassword() async {
    final AuthRepository authRepository = DI.i.get();

    if (formGroup != null && formGroup!.valid) {
      changePasswordFuture =
          ObservableFuture(authRepository.changePassword(password!,
              onDone: () {
                // TODO
              },
              onError: (e) => ExceptionUtil.showToast(e)));

      await changePasswordFuture;
    }
  }
}
