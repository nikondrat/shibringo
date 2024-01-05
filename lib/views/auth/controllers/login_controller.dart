import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/domain/utils/utils.dart';
import 'package:user_repository/repository.dart';

import '../../../domain/di/di.dart';
import '../../../domain/router.dart';

part 'login_controller.g.dart';

class LoginController extends _LoginController with _$LoginController {}

abstract class _LoginController with Store {
  FormGroup? formGroup;

  void initFormGroup() => formGroup = FormGroup({
        'email':
            FormControl(validators: [Validators.email, Validators.required]),
        'password': FormControl(
            validators: [Validators.required, Validators.minLength(8)]),
      });

  void dispose() => formGroup?.dispose();

  @computed
  String? get email => formGroup?.control('email').value;

  @computed
  String? get password => formGroup?.control('password').value;

  @observable
  bool isShowPassword = false;

  @action
  void togglePasswordForm() => isShowPassword = !isShowPassword;

  @observable
  ObservableFuture? loginFuture;

  @action
  Future login() async {
    final AuthRepository authRepository = DI.i.get();

    if (formGroup != null && formGroup!.valid) {
      loginFuture = ObservableFuture(authRepository.signIn(email!, password!,
          onDone: () => router.goNamed(AppViews.home),
          onError: (e) => ExceptionUtil.showToast(e)));

      await loginFuture;
    }
  }
}
