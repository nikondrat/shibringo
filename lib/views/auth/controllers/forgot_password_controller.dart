import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/gen/i18n/strings.g.dart';
import 'package:user_repository/repository.dart';

import '../../../domain/di/di.dart';
import '../../../domain/utils/utils.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController extends _ForgotPasswordController
    with _$ForgotPasswordController {}

abstract class _ForgotPasswordController with Store {
  FormGroup? formGroup;

  void initFormGroup() => formGroup = FormGroup({
        'email':
            FormControl(validators: [Validators.email, Validators.required]),
      });

  void dispose() => formGroup?.dispose();

  @computed
  String? get email => formGroup?.control('email').value;

  @observable
  ObservableFuture? resetFuture;

  @action
  Future resetPassword() async {
    final AuthRepository authRepository = DI.i.get();

    if (formGroup != null && formGroup!.valid) {
      resetFuture = ObservableFuture(authRepository.resetPassword(email!,
          onDone: () {
            ToastUtil.showToast(
                title: t.auth.recovery_password_hint, type: ToastType.success);
          },
          onError: (e) => ExceptionUtil.showToast(e)));

      await resetFuture;
    }
  }
}
